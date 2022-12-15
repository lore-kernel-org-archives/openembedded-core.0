Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB2EC7113E
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.144496.1671136351301435968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Jc1TTAxA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010185177d0fd0-49e83422-559b-4b02-b5d9-0852f83b8344-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vA2XbvY/RG0FQSiR7YUDM1DVC4Z13qd33g1dQWGJ5/w=;
	b=Jc1TTAxATChVOTa+4e2r63RX9vpxtmuaeCdIMa+Z+wSS8zpzLMlAlO4S8qmRbRsJ
	cZ8y7N7pxtKDoeixIeE0gS8s/QsowrAPo151qLmYoE53sVaDTZTp+iFa550DYixga2g
	ZSjjoLvUoev1wG7tGjQ/0iEU3C5kNXbRhb8SFc0w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vA2XbvY/RG0FQSiR7YUDM1DVC4Z13qd33g1dQWGJ5/w=;
	b=Wcoy2Y8Jehr8pjTK4BsbAbKec0m6+zRFDUypjxeq0B3zOvKn3AIXAkEq+lXnW6CW
	27q6lMaqkslYIxevEcVUmzwR84pO9egg86VKHmloFe5SBgkj6YdQXsbQ93nLNSn6SOM
	yH1PsxFoOHRREcWZUkTfXKmiwkdR8naETH/pGkxU=
Content-Type: multipart/mixed; boundary="===============4528967329106855037=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.39.0 SUCCEEDED
Message-ID: <01010185177d0fd0-49e83422-559b-4b02-b5d9-0852f83b8344-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174636

--===============4528967329106855037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *git* to *2.39.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.38.1-2.39.0.patch
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
--===============4528967329106855037==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.38.1-2.39.0.patch"

RnJvbSA3YzkyOTI0MjJiMDliMjdmYWFiNWJmNGNjMGM1NzNkY2I0MjI4YmY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMDk6MTQ6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aXQ6IHVwZ3JhZGUgMi4zOC4xIC0+IDIuMzkuMAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Z2l0L3tnaXRfMi4zOC4xLmJiID0+IGdpdF8yLjM5LjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dpdC97Z2l0XzIuMzguMS5iYiA9PiBnaXRfMi4zOS4wLmJifSAoOTglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuMzguMS5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuMzkuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjM4LjEuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuMzkuMC5iYgppbmRleCBlZjY0ZGJhN2Fj
Li4zNjIyYjk3MDlkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8y
LjM4LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi4zOS4wLmJiCkBA
IC0xNjYsNCArMTY2LDQgQEAgRVhUUkFfT0VDT05GICs9ICJhY19jdl9zbnByaW50Zl9yZXR1cm5z
X2JvZ3VzPW5vIFwKICAgICAgICAgICAgICAgICAgIgogRVhUUkFfT0VNQUtFICs9ICJOT19HRVRU
RVhUPTEiCiAKLVNSQ19VUklbdGFyYmFsbC5zaGEyNTZzdW1dID0gIjYyMGVkM2RmNTcyYTM0ZTc4
MmEyYmU0YzdkOTU4ZDQ0MzQ2OWIyNjY1ZWFjNGFlMzNmMjdkYTU1NGQ4OGIyNzAiCitTUkNfVVJJ
W3RhcmJhbGwuc2hhMjU2c3VtXSA9ICJkOTI5ZmU2N2NlZjdhYzNjYTcwOWQyYjU2YTk5MjBmMTcx
MTJkNWE1MjRiZjgxMTJhZjM3ZWMwNDVhN2E1MTA5IgotLSAKMi4zNy4zCgo=

--===============4528967329106855037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 71 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0e79d31d4ba8c953077b23f70a9492f5129c864b"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 4 Mirrors 0 Missed 18 Current 217 (18% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 228 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene)
NOTE: Running setscene task 229 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_populate_sysroot_setscene)
NOTE: Running task 716 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 717 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_fetch)
NOTE: Running task 778 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_fetch)
NOTE: Running task 832 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.8-r0: task do_fetch: Started
NOTE: recipe git-2.39.0-r0: task do_fetch: Started
NOTE: recipe perl-5.36.0-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe grep-3.8-r0: task do_fetch: Succeeded
NOTE: recipe git-2.39.0-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 870 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_unpack)
NOTE: Running task 871 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 872 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 873 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 874 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_unpack)
NOTE: Running task 875 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 876 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libxcrypt/4.4.30-r0/temp/log.do_packagedata_setscene.3793364
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 238 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_package_setscene)
NOTE: recipe grep-3.8-r0: task do_unpack: Started
NOTE: recipe grep-3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.39.0-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.39.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.36.0-r0: task do_unpack: Started
NOTE: recipe grep-3.8-r0: task do_unpack: Succeeded
NOTE: Running task 877 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: recipe grep-3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 878 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe grep-3.8-r0: task do_patch: Started
NOTE: recipe git-2.39.0-r0: task do_unpack: Succeeded
NOTE: Running task 879 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe grep-3.8-r0: task do_patch: Succeeded
NOTE: recipe git-2.39.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 880 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_deploy_source_date_epoch)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: Running task 881 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe git-2.39.0-r0: task do_patch: Started
NOTE: recipe grep-3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.39.0-r0: task do_patch: Succeeded
NOTE: Running task 882 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 883 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_populate_lic)
NOTE: recipe grep-3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 884 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_configure)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 885 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: recipe git-2.39.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.39.0-r0: task do_populate_lic: Started
NOTE: recipe perl-5.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 886 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_patch)
NOTE: recipe grep-3.8-r0: task do_configure: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: recipe git-2.39.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_populate_lic unihash changed to e599d25f3b5599155e371b488671dbabbf9b7928d91ebd38899b3da7b724c100
NOTE: recipe perl-5.36.0-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Started
NOTE: recipe git-2.39.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 887 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_configure)
NOTE: recipe git-2.39.0-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 897 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 899 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Started
NOTE: recipe perl-5.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.36.0-r0: task do_patch: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 900 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 901 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_configure)
NOTE: recipe perl-5.36.0-r0: task do_configure: Started
NOTE: recipe git-2.39.0-r0: task do_configure: Succeeded
NOTE: Running task 902 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_compile)
NOTE: recipe git-2.39.0-r0: task do_compile: Started
NOTE: recipe git-2.39.0-r0: task do_compile: Succeeded
NOTE: Running task 903 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_install)
NOTE: recipe git-2.39.0-r0: task do_install: Started
NOTE: recipe git-2.39.0-r0: task do_install: Succeeded
NOTE: Running task 904 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_package)
NOTE: Running task 905 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_populate_sysroot)
NOTE: recipe git-2.39.0-r0: task do_populate_sysroot: Started
NOTE: recipe git-2.39.0-r0: task do_package: Started
NOTE: recipe git-2.39.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.39.0-r0: task do_package: Succeeded
NOTE: Running task 906 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_packagedata)
NOTE: recipe git-2.39.0-r0: task do_packagedata: Started
NOTE: recipe git-2.39.0-r0: task do_packagedata: Succeeded
NOTE: recipe grep-3.8-r0: task do_configure: Succeeded
NOTE: Running task 907 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_compile)
NOTE: recipe grep-3.8-r0: task do_compile: Started
NOTE: recipe grep-3.8-r0: task do_compile: Succeeded
NOTE: Running task 908 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_install)
NOTE: recipe grep-3.8-r0: task do_install: Started
NOTE: recipe grep-3.8-r0: task do_install: Succeeded
NOTE: Running task 909 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_package)
NOTE: recipe grep-3.8-r0: task do_package: Started
NOTE: recipe grep-3.8-r0: task do_package: Succeeded
NOTE: Running task 910 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_packagedata)
NOTE: recipe grep-3.8-r0: task do_packagedata: Started
NOTE: recipe grep-3.8-r0: task do_packagedata: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Running task 911 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 912 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile)
NOTE: recipe findutils-4.9.0-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile: Succeeded
NOTE: Running task 913 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 914 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_install: Started
NOTE: recipe findutils-4.9.0-r0: task do_install: Succeeded
NOTE: Running task 915 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 916 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: Running task 917 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 918 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package_write_rpm)
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_configure: Succeeded
NOTE: Running task 919 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_configure_ptest_base)
NOTE: recipe perl-5.36.0-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.36.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 920 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_compile)
NOTE: recipe perl-5.36.0-r0: task do_compile: Started
NOTE: recipe perl-5.36.0-r0: task do_compile: Succeeded
NOTE: Running task 921 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_compile_ptest_base)
NOTE: recipe perl-5.36.0-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.36.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 922 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_install)
NOTE: recipe perl-5.36.0-r0: task do_install: Started
NOTE: recipe perl-5.36.0-r0: task do_install: Succeeded
NOTE: Running task 923 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_install_ptest_base)
NOTE: recipe perl-5.36.0-r0: task do_install_ptest_base: Started
NOTE: recipe perl-5.36.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 924 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package)
NOTE: recipe perl-5.36.0-r0: task do_package: Started
NOTE: recipe perl-5.36.0-r0: task do_package: Succeeded
NOTE: Running task 925 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata)
NOTE: recipe perl-5.36.0-r0: task do_packagedata: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 926 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package_write_rpm)
NOTE: Running task 927 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_package_write_rpm)
NOTE: Running task 928 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_package_qa)
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe git-2.39.0-r0: task do_package_write_rpm: Started
NOTE: recipe git-2.39.0-r0: task do_package_qa: Started
NOTE: recipe git-2.39.0-r0: task do_package_qa: Succeeded
NOTE: recipe git-2.39.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 929 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_build)
NOTE: Tasks Summary: Attempted 929 tasks of which 875 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4528967329106855037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1672 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1672 targets, 36 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0e79d31d4ba8c953077b23f70a9492f5129c864b"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 4 Mirrors 0 Missed 18 Current 217 (18% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 228 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene)
NOTE: Running setscene task 229 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_populate_sysroot_setscene)
NOTE: Running task 716 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_fetch)
NOTE: Running task 717 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 778 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_fetch)
NOTE: Running task 832 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.39.0-r0: task do_fetch: Started
NOTE: recipe grep-3.8-r0: task do_fetch: Started
NOTE: recipe perl-5.36.0-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe grep-3.8-r0: task do_fetch: Succeeded
NOTE: recipe git-2.39.0-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 870 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_unpack)
NOTE: Running task 871 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 872 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 873 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 874 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_unpack)
NOTE: Running task 875 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_unpack)
NOTE: Running task 876 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.39.0-r0: task do_unpack: Started
NOTE: recipe git-2.39.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.36.0-r0: task do_unpack: Started
NOTE: recipe grep-3.8-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxcrypt/4.4.30-r0/temp/log.do_packagedata_setscene.3205785
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 238 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_package_setscene)
NOTE: recipe grep-3.8-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 877 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.39.0-r0: task do_unpack: Succeeded
NOTE: Running task 878 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_patch)
NOTE: recipe grep-3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: Running task 879 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe git-2.39.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.39.0-r0: task do_patch: Started
NOTE: recipe grep-3.8-r0: task do_unpack: Succeeded
NOTE: Running task 880 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe grep-3.8-r0: task do_patch: Started
NOTE: recipe git-2.39.0-r0: task do_patch: Succeeded
NOTE: Running task 881 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 882 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_populate_lic)
NOTE: recipe grep-3.8-r0: task do_patch: Succeeded
NOTE: Running task 883 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_deploy_source_date_epoch)
NOTE: recipe git-2.39.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.39.0-r0: task do_populate_lic: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe grep-3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 884 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: recipe perl-5.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 885 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_patch)
NOTE: recipe git-2.39.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_populate_lic unihash changed to e599d25f3b5599155e371b488671dbabbf9b7928d91ebd38899b3da7b724c100
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: recipe perl-5.36.0-r0: task do_patch: Started
NOTE: recipe git-2.39.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe grep-3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 886 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_configure)
NOTE: Running task 887 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_configure)
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Started
NOTE: recipe git-2.39.0-r0: task do_configure: Started
NOTE: recipe grep-3.8-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 897 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 899 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Started
NOTE: recipe perl-5.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.36.0-r0: task do_patch: Succeeded
NOTE: Running task 900 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe perl-5.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 901 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_configure)
NOTE: recipe perl-5.36.0-r0: task do_configure: Started
NOTE: recipe git-2.39.0-r0: task do_configure: Succeeded
NOTE: Running task 902 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_compile)
NOTE: recipe git-2.39.0-r0: task do_compile: Started
NOTE: recipe git-2.39.0-r0: task do_compile: Succeeded
NOTE: Running task 903 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_install)
NOTE: recipe git-2.39.0-r0: task do_install: Started
NOTE: recipe git-2.39.0-r0: task do_install: Succeeded
NOTE: Running task 904 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_package)
NOTE: Running task 905 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_populate_sysroot)
NOTE: recipe git-2.39.0-r0: task do_populate_sysroot: Started
NOTE: recipe git-2.39.0-r0: task do_package: Started
NOTE: recipe git-2.39.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.39.0-r0: task do_package: Succeeded
NOTE: Running task 906 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_packagedata)
NOTE: recipe git-2.39.0-r0: task do_packagedata: Started
NOTE: recipe git-2.39.0-r0: task do_packagedata: Succeeded
NOTE: recipe grep-3.8-r0: task do_configure: Succeeded
NOTE: Running task 907 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_compile)
NOTE: recipe grep-3.8-r0: task do_compile: Started
NOTE: recipe grep-3.8-r0: task do_compile: Succeeded
NOTE: Running task 908 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_install)
NOTE: recipe grep-3.8-r0: task do_install: Started
NOTE: recipe grep-3.8-r0: task do_install: Succeeded
NOTE: Running task 909 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_package)
NOTE: recipe grep-3.8-r0: task do_package: Started
NOTE: recipe grep-3.8-r0: task do_package: Succeeded
NOTE: Running task 910 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_packagedata)
NOTE: recipe grep-3.8-r0: task do_packagedata: Started
NOTE: recipe grep-3.8-r0: task do_packagedata: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Running task 911 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 912 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile)
NOTE: recipe findutils-4.9.0-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile: Succeeded
NOTE: Running task 913 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 914 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_install: Started
NOTE: recipe findutils-4.9.0-r0: task do_install: Succeeded
NOTE: Running task 915 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 916 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: Running task 917 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 918 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package_write_rpm)
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_configure: Succeeded
NOTE: Running task 919 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_configure_ptest_base)
NOTE: recipe perl-5.36.0-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.36.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 920 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_compile)
NOTE: recipe perl-5.36.0-r0: task do_compile: Started
NOTE: recipe perl-5.36.0-r0: task do_compile: Succeeded
NOTE: Running task 921 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_compile_ptest_base)
NOTE: recipe perl-5.36.0-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.36.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 922 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_install)
NOTE: recipe perl-5.36.0-r0: task do_install: Started
NOTE: recipe perl-5.36.0-r0: task do_install: Succeeded
NOTE: Running task 923 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_install_ptest_base)
NOTE: recipe perl-5.36.0-r0: task do_install_ptest_base: Started
NOTE: recipe perl-5.36.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 924 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package)
NOTE: recipe perl-5.36.0-r0: task do_package: Started
NOTE: recipe perl-5.36.0-r0: task do_package: Succeeded
NOTE: Running task 925 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata)
NOTE: recipe perl-5.36.0-r0: task do_packagedata: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 926 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package_write_rpm)
NOTE: Running task 927 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_package_write_rpm)
NOTE: Running task 928 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_package_qa)
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe git-2.39.0-r0: task do_package_write_rpm: Started
NOTE: recipe git-2.39.0-r0: task do_package_qa: Started
NOTE: recipe git-2.39.0-r0: task do_package_qa: Succeeded
NOTE: recipe git-2.39.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 929 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_build)
NOTE: Tasks Summary: Attempted 929 tasks of which 875 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4528967329106855037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0e79d31d4ba8c953077b23f70a9492f5129c864b"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 4 Mirrors 0 Missed 18 Current 217 (18% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 228 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene)
NOTE: Running setscene task 229 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_populate_sysroot_setscene)
NOTE: Running task 716 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 717 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_fetch)
NOTE: Running task 778 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_fetch)
NOTE: Running task 832 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.8-r0: task do_fetch: Started
NOTE: recipe git-2.39.0-r0: task do_fetch: Started
NOTE: recipe perl-5.36.0-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe grep-3.8-r0: task do_fetch: Succeeded
NOTE: recipe git-2.39.0-r0: task do_fetch: Succeeded
NOTE: Running task 870 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_unpack)
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 871 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 872 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 873 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 874 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_unpack)
NOTE: Running task 875 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 876 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_unpack)
NOTE: recipe grep-3.8-r0: task do_unpack: Started
NOTE: recipe grep-3.8-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libxcrypt/4.4.30-r0/temp/log.do_packagedata_setscene.3608633
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 238 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_package_setscene)
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe git-2.39.0-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.39.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.36.0-r0: task do_unpack: Started
NOTE: recipe grep-3.8-r0: task do_unpack: Succeeded
NOTE: Running task 877 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: recipe grep-3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 878 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.39.0-r0: task do_unpack: Succeeded
NOTE: Running task 879 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_patch)
NOTE: recipe grep-3.8-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe git-2.39.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe grep-3.8-r0: task do_patch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: Running task 880 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 881 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe git-2.39.0-r0: task do_patch: Started
NOTE: recipe grep-3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.39.0-r0: task do_patch: Succeeded
NOTE: Running task 882 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 883 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_populate_lic)
NOTE: recipe grep-3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 884 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_configure)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 885 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: recipe perl-5.36.0-r0: task do_unpack: Succeeded
NOTE: recipe git-2.39.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.39.0-r0: task do_populate_lic: Started
NOTE: Running task 886 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_patch)
NOTE: recipe grep-3.8-r0: task do_configure: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: recipe perl-5.36.0-r0: task do_patch: Started
NOTE: recipe git-2.39.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_populate_lic unihash changed to e599d25f3b5599155e371b488671dbabbf9b7928d91ebd38899b3da7b724c100
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Started
NOTE: recipe git-2.39.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 887 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_configure)
NOTE: recipe git-2.39.0-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 897 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 899 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Started
NOTE: recipe perl-5.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.36.0-r0: task do_patch: Succeeded
NOTE: Running task 900 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe perl-5.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 901 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_configure)
NOTE: recipe perl-5.36.0-r0: task do_configure: Started
NOTE: recipe git-2.39.0-r0: task do_configure: Succeeded
NOTE: Running task 902 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_compile)
NOTE: recipe git-2.39.0-r0: task do_compile: Started
NOTE: recipe git-2.39.0-r0: task do_compile: Succeeded
NOTE: Running task 903 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_install)
NOTE: recipe git-2.39.0-r0: task do_install: Started
NOTE: recipe git-2.39.0-r0: task do_install: Succeeded
NOTE: Running task 904 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_package)
NOTE: Running task 905 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_populate_sysroot)
NOTE: recipe git-2.39.0-r0: task do_populate_sysroot: Started
NOTE: recipe git-2.39.0-r0: task do_package: Started
NOTE: recipe git-2.39.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.39.0-r0: task do_package: Succeeded
NOTE: Running task 906 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_packagedata)
NOTE: recipe git-2.39.0-r0: task do_packagedata: Started
NOTE: recipe grep-3.8-r0: task do_configure: Succeeded
NOTE: Running task 907 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_compile)
NOTE: recipe git-2.39.0-r0: task do_packagedata: Succeeded
NOTE: recipe grep-3.8-r0: task do_compile: Started
NOTE: recipe grep-3.8-r0: task do_compile: Succeeded
NOTE: Running task 908 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_install)
NOTE: recipe grep-3.8-r0: task do_install: Started
NOTE: recipe grep-3.8-r0: task do_install: Succeeded
NOTE: Running task 909 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_package)
NOTE: recipe grep-3.8-r0: task do_package: Started
NOTE: recipe grep-3.8-r0: task do_package: Succeeded
NOTE: Running task 910 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_packagedata)
NOTE: recipe grep-3.8-r0: task do_packagedata: Started
NOTE: recipe grep-3.8-r0: task do_packagedata: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Running task 911 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 912 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile)
NOTE: recipe findutils-4.9.0-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile: Succeeded
NOTE: Running task 913 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 914 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_install: Started
NOTE: recipe findutils-4.9.0-r0: task do_install: Succeeded
NOTE: Running task 915 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 916 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: Running task 917 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 918 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package_write_rpm)
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_configure: Succeeded
NOTE: Running task 919 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_configure_ptest_base)
NOTE: recipe perl-5.36.0-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.36.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 920 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_compile)
NOTE: recipe perl-5.36.0-r0: task do_compile: Started
NOTE: recipe perl-5.36.0-r0: task do_compile: Succeeded
NOTE: Running task 921 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_compile_ptest_base)
NOTE: recipe perl-5.36.0-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.36.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 922 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_install)
NOTE: recipe perl-5.36.0-r0: task do_install: Started
NOTE: recipe perl-5.36.0-r0: task do_install: Succeeded
NOTE: Running task 923 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_install_ptest_base)
NOTE: recipe perl-5.36.0-r0: task do_install_ptest_base: Started
NOTE: recipe perl-5.36.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 924 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package)
NOTE: recipe perl-5.36.0-r0: task do_package: Started
NOTE: recipe perl-5.36.0-r0: task do_package: Succeeded
NOTE: Running task 925 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata)
NOTE: recipe perl-5.36.0-r0: task do_packagedata: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 926 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package_write_rpm)
NOTE: Running task 927 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_package_write_rpm)
NOTE: Running task 928 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_package_qa)
NOTE: recipe git-2.39.0-r0: task do_package_write_rpm: Started
NOTE: recipe git-2.39.0-r0: task do_package_qa: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe git-2.39.0-r0: task do_package_qa: Succeeded
NOTE: recipe git-2.39.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 929 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_build)
NOTE: Tasks Summary: Attempted 929 tasks of which 875 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4528967329106855037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/git/git-bash-completion: PV changed from "2.38.1" to "2.39.0"
packages/core2-32-poky-linux/git/git-bash-completion: PKGV changed from 2.38.1 [default] to 2.39.0 [default]
packages/core2-32-poky-linux/git/git-dbg: PV changed from "2.38.1" to "2.39.0"
packages/core2-32-poky-linux/git/git-dbg: PKGV changed from 2.38.1 [default] to 2.39.0 [default]
packages/core2-32-poky-linux/git/git-dbg: PKGSIZE changed from 77636284 to 77916920 (+0%)
packages/core2-32-poky-linux/git/git-dev: PV changed from "2.38.1" to "2.39.0"
packages/core2-32-poky-linux/git/git-dev: PKGV changed from 2.38.1 [default] to 2.39.0 [default]
packages/core2-32-poky-linux/git/git-doc: PV changed from "2.38.1" to "2.39.0"
packages/core2-32-poky-linux/git/git-doc: PKGV changed from 2.38.1 [default] to 2.39.0 [default]
packages/core2-32-poky-linux/git/git-locale: PV changed from "2.38.1" to "2.39.0"
packages/core2-32-poky-linux/git/git-locale: PKGV changed from 2.38.1 [default] to 2.39.0 [default]
packages/core2-32-poky-linux/git/git-perltools: PV changed from "2.38.1" to "2.39.0"
packages/core2-32-poky-linux/git/git-perltools: PKGV changed from 2.38.1 [default] to 2.39.0 [default]
packages/core2-32-poky-linux/git/git-perltools: PKGSIZE changed from 317876 to 317897 (+0%)
packages/core2-32-poky-linux/git/git-src: PV changed from "2.38.1" to "2.39.0"
packages/core2-32-poky-linux/git/git-src: PKGV changed from 2.38.1 [default] to 2.39.0 [default]
packages/core2-32-poky-linux/git/git-src: FILELIST: directory renamed /usr/src/debug/git/2.38.1-r0/negotiator -> /usr/src/debug/git/2.39.0-r0/negotiator, directory renamed /usr/src/debug/git/2.38.1-r0/sha1dc -> /usr/src/debug/git/2.39.0-r0/sha1dc, directory renamed /usr/src/debug/git/2.38.1-r0/compat/linux -> /usr/src/debug/git/2.39.0-r0/compat/linux, directory renamed /usr/src/debug/git/2.38.1-r0/compat -> /usr/src/debug/git/2.39.0-r0/compat, directory renamed /usr/src/debug/git/2.38.1-r0/builtin -> /usr/src/debug/git/2.39.0-r0/builtin, directory renamed /usr/src/debug/git/2.38.1-r0/refs -> /usr/src/debug/git/2.39.0-r0/refs, directory renamed /usr/src/debug/git/2.38.1-r0 -> /usr/src/debug/git/2.39.0-r0, directory renamed /usr/src/debug/git/2.38.1-r0/ewah -> /usr/src/debug/git/2.39.0-r0/ewah, directory renamed /usr/src/debug/git/2.38.1-r0/xdiff -> /usr/src/debug/git/2.39.0-r0/xdiff, directory renamed /usr/src/debug/git/2.38.1-r0/sha256/block -> /usr/src/debug/git/2.39.0-r0/sha256/blo
 ck, removed "/usr/src/debug/git/2.38.1-r0/trace2/tr2_tls.c /usr/src/debug/git/2.38.1-r0/trace2/tr2_tgt.h /usr/src/debug/git/2.38.1-r0/trace2/tr2_cfg.c /usr/src/debug/git/2.38.1-r0/trace2/tr2_dst.c /usr/src/debug/git/2.38.1-r0/trace2/tr2_sysenv.c /usr/src/debug/git/2.38.1-r0/trace2/tr2_tgt_normal.c /usr/src/debug/git/2.38.1-r0/trace2/tr2_cfg.h /usr/src/debug/git/2.38.1-r0/trace2/tr2_tgt_event.c /usr/src/debug/git/2.38.1-r0/trace2/tr2_tls.h /usr/src/debug/git/2.38.1-r0/trace2/tr2_sysenv.h /usr/src/debug/git/2.38.1-r0/trace2/tr2_tgt_perf.c /usr/src/debug/git/2.38.1-r0/trace2/tr2_dst.h /usr/src/debug/git/2.38.1-r0/trace2/tr2_sid.h /usr/src/debug/git/2.38.1-r0/trace2/tr2_cmd_name.c /usr/src/debug/git/2.38.1-r0/trace2/tr2_tbuf.c /usr/src/debug/git/2.38.1-r0/trace2/tr2_sid.c /usr/src/debug/git/2.38.1-r0/trace2/tr2_tbuf.h /usr/src/debug/git/2.38.1-r0/trace2/tr2_cmd_name.h", added "/usr/src/debug/git/2.39.0-r0/trace2/tr2_tls.h /usr/src/debug/git/2.39.0-r0/trace2/tr2_tls.c /usr/src/debug/git/
 2.39.0-r0/trace2/tr2_cmd_name.h /usr/src/debug/git/2.39.0-r0/trace2/tr2_cmd_name.c /usr/src/debug/git/2.39.0-r0/trace2/tr2_sid.c /usr/src/debug/git/2.39.0-r0/trace2/tr2_ctr.c /usr/src/debug/git/2.39.0-r0/trace2/tr2_dst.c /usr/src/debug/git/2.39.0-r0/trace2/tr2_tbuf.h /usr/src/debug/git/2.39.0-r0/trace2/tr2_ctr.h /usr/src/debug/git/2.39.0-r0/trace2/tr2_dst.h /usr/src/debug/git/2.39.0-r0/trace2/tr2_sid.h /usr/src/debug/git/2.39.0-r0/trace2/tr2_tbuf.c /usr/src/debug/git/2.39.0-r0/trace2/tr2_cfg.c /usr/src/debug/git/2.39.0-r0/trace2/tr2_cfg.h /usr/src/debug/git/2.39.0-r0/trace2/tr2_sysenv.c /usr/src/debug/git/2.39.0-r0/trace2/tr2_tmr.h /usr/src/debug/git/2.39.0-r0/trace2/tr2_tmr.c /usr/src/debug/git/2.39.0-r0/trace2/tr2_sysenv.h /usr/src/debug/git/2.39.0-r0/trace2/tr2_tgt_perf.c /usr/src/debug/git/2.39.0-r0/trace2/tr2_tgt.h /usr/src/debug/git/2.39.0-r0/trace2/tr2_tgt_event.c /usr/src/debug/git/2.39.0-r0/trace2/tr2_tgt_normal.c"
packages/core2-32-poky-linux/git/git-src: PKGSIZE changed from 8877859 to 8946625 (+1%)
packages/core2-32-poky-linux/git/git-staticdev: PV changed from "2.38.1" to "2.39.0"
packages/core2-32-poky-linux/git/git-staticdev: PKGV changed from 2.38.1 [default] to 2.39.0 [default]
packages/core2-32-poky-linux/git/git-tk: PV changed from "2.38.1" to "2.39.0"
packages/core2-32-poky-linux/git/git-tk: PKGV changed from 2.38.1 [default] to 2.39.0 [default]
packages/core2-32-poky-linux/git/git: PV changed from "2.38.1" to "2.39.0"
packages/core2-32-poky-linux/git/git: PKGV changed from 2.38.1 [default] to 2.39.0 [default]
packages/core2-32-poky-linux/git/git: PKGSIZE changed from 27067920 to 27179056 (+0%)
packages/core2-32-poky-linux/git/gitweb: PV changed from "2.38.1" to "2.39.0"
packages/core2-32-poky-linux/git/gitweb: PKGV changed from 2.38.1 [default] to 2.39.0 [default]
packages/core2-32-poky-linux/git: PV changed from "2.38.1" to "2.39.0"
packages/core2-32-poky-linux/git: PKGV changed from 2.38.1 [default] to 2.39.0 [default]
packages/core2-32-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.38.1.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.39.0.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"

--===============4528967329106855037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0e79d31d4ba8c953077b23f70a9492f5129c864b"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 4 Mirrors 0 Missed 18 Current 217 (18% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 228 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene)
NOTE: Running setscene task 229 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_populate_sysroot_setscene)
NOTE: Running task 716 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 717 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_fetch)
NOTE: Running task 778 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_fetch)
NOTE: Running task 832 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.8-r0: task do_fetch: Started
NOTE: recipe git-2.39.0-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe perl-5.36.0-r0: task do_fetch: Started
NOTE: recipe grep-3.8-r0: task do_fetch: Succeeded
NOTE: Running task 870 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_unpack)
NOTE: recipe git-2.39.0-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 871 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 872 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 873 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 874 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_unpack)
NOTE: Running task 875 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 876 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_unpack)
NOTE: recipe grep-3.8-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libxcrypt/4.4.30-r0/temp/log.do_packagedata_setscene.3423946
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 238 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_package_setscene)
NOTE: recipe grep-3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe git-2.39.0-r0: task do_unpack: Started
NOTE: recipe git-2.39.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.36.0-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.8-r0: task do_unpack: Succeeded
NOTE: Running task 877 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: recipe grep-3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 878 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe git-2.39.0-r0: task do_unpack: Succeeded
NOTE: Running task 879 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe git-2.39.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe grep-3.8-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: Running task 880 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe grep-3.8-r0: task do_patch: Succeeded
NOTE: Running task 881 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_deploy_source_date_epoch)
NOTE: recipe git-2.39.0-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe grep-3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.39.0-r0: task do_patch: Succeeded
NOTE: Running task 882 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 883 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_populate_lic)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_unpack: Succeeded
NOTE: recipe grep-3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.39.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.39.0-r0: task do_populate_lic: Started
NOTE: Running task 884 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: Running task 885 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_patch)
NOTE: Running task 886 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_configure)
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: recipe perl-5.36.0-r0: task do_patch: Started
NOTE: recipe grep-3.8-r0: task do_configure: Started
NOTE: recipe git-2.39.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_populate_lic unihash changed to e599d25f3b5599155e371b488671dbabbf9b7928d91ebd38899b3da7b724c100
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Started
NOTE: recipe git-2.39.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 887 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_configure)
NOTE: recipe git-2.39.0-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 897 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 899 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Started
NOTE: recipe perl-5.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.36.0-r0: task do_patch: Succeeded
NOTE: Running task 900 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe perl-5.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 901 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_configure)
NOTE: recipe perl-5.36.0-r0: task do_configure: Started
NOTE: recipe git-2.39.0-r0: task do_configure: Succeeded
NOTE: Running task 902 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_compile)
NOTE: recipe git-2.39.0-r0: task do_compile: Started
NOTE: recipe git-2.39.0-r0: task do_compile: Succeeded
NOTE: Running task 903 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_install)
NOTE: recipe git-2.39.0-r0: task do_install: Started
NOTE: recipe git-2.39.0-r0: task do_install: Succeeded
NOTE: Running task 904 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_package)
NOTE: Running task 905 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_populate_sysroot)
NOTE: recipe git-2.39.0-r0: task do_populate_sysroot: Started
NOTE: recipe git-2.39.0-r0: task do_package: Started
NOTE: recipe git-2.39.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.39.0-r0: task do_package: Succeeded
NOTE: Running task 906 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_packagedata)
NOTE: recipe git-2.39.0-r0: task do_packagedata: Started
NOTE: recipe git-2.39.0-r0: task do_packagedata: Succeeded
NOTE: recipe grep-3.8-r0: task do_configure: Succeeded
NOTE: Running task 907 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_compile)
NOTE: recipe grep-3.8-r0: task do_compile: Started
NOTE: recipe grep-3.8-r0: task do_compile: Succeeded
NOTE: Running task 908 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_install)
NOTE: recipe grep-3.8-r0: task do_install: Started
NOTE: recipe grep-3.8-r0: task do_install: Succeeded
NOTE: Running task 909 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_package)
NOTE: recipe grep-3.8-r0: task do_package: Started
NOTE: recipe grep-3.8-r0: task do_package: Succeeded
NOTE: Running task 910 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_packagedata)
NOTE: recipe grep-3.8-r0: task do_packagedata: Started
NOTE: recipe grep-3.8-r0: task do_packagedata: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Running task 911 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 912 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile)
NOTE: recipe findutils-4.9.0-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile: Succeeded
NOTE: Running task 913 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 914 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_install: Started
NOTE: recipe findutils-4.9.0-r0: task do_install: Succeeded
NOTE: Running task 915 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 916 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: Running task 917 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 918 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package_write_rpm)
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_configure: Succeeded
NOTE: Running task 919 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_configure_ptest_base)
NOTE: recipe perl-5.36.0-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.36.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 920 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_compile)
NOTE: recipe perl-5.36.0-r0: task do_compile: Started
NOTE: recipe perl-5.36.0-r0: task do_compile: Succeeded
NOTE: Running task 921 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_compile_ptest_base)
NOTE: recipe perl-5.36.0-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.36.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 922 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_install)
NOTE: recipe perl-5.36.0-r0: task do_install: Started
NOTE: recipe perl-5.36.0-r0: task do_install: Succeeded
NOTE: Running task 923 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_install_ptest_base)
NOTE: recipe perl-5.36.0-r0: task do_install_ptest_base: Started
NOTE: recipe perl-5.36.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 924 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package)
NOTE: recipe perl-5.36.0-r0: task do_package: Started
NOTE: recipe perl-5.36.0-r0: task do_package: Succeeded
NOTE: Running task 925 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata)
NOTE: recipe perl-5.36.0-r0: task do_packagedata: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 926 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package_write_rpm)
NOTE: Running task 927 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_package_write_rpm)
NOTE: Running task 928 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_package_qa)
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe git-2.39.0-r0: task do_package_write_rpm: Started
NOTE: recipe git-2.39.0-r0: task do_package_qa: Started
NOTE: recipe git-2.39.0-r0: task do_package_qa: Succeeded
NOTE: recipe git-2.39.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 929 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.0.bb:do_build)
NOTE: Tasks Summary: Attempted 929 tasks of which 875 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.33-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4528967329106855037==--

