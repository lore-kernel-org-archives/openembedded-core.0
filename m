Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0953C47088
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:45 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web09.5195.1668517535979857617
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=k1Yh4gCO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101847b651d4f-faac5eba-8480-4f95-8b05-617517510f00-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BnL/CIf29oUkj+7OeodI5Fe0kG3YvJAeKgdYGMl2BF4=;
	b=k1Yh4gCO/mc2jsb9cXZ76/xmV+ZZSeU3CAylvXzFh0LGtxdNUDP5RpP+iLPhc36B
	Zn9ZNFJHH2G5AL7X9+XBW9Gu54uXXkMPdu7pfDZJWcinYwdJFGOY+QsuPsR99QqkzQ/
	jnC4NeMwWiQMrICGkkCdEiB5dB6fjV1kLHQGGSTM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BnL/CIf29oUkj+7OeodI5Fe0kG3YvJAeKgdYGMl2BF4=;
	b=k2hkZBkkgV2/uyW4hIavByDEO1PjpE9hClikHjuN7hsqytJaGF0hNSe5KNqXiYAB
	RboYpo2Wq6f4Bm3tDSsmGh1cLRDGCUu8Gr+e8LzTDNxLdLGJtlL5jhLrFvabKEPvQ86
	Mawbs90QiHnPq2tmAWRcY1yctuY6PwJU+iaZa1EQ=
Content-Type: multipart/mixed; boundary="===============7365074628469147214=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.0.1 SUCCEEDED
Message-ID: <010101847b651d4f-faac5eba-8480-4f95-8b05-617517510f00-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173294

--===============7365074628469147214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.0-6.0.1.patch
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
--===============7365074628469147214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (0 cached, 887 parsed). 1665 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:5ce6bc97d9caba8eb66fe918397b925b8f750236"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 18 Local 6 Mirrors 0 Missed 12 Current 296 (33% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 297 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_populate_sysroot_setscene)
NOTE: Running task 790 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 926 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_fetch)
NOTE: Running task 1088 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_package_write_rpm)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libxcrypt/4.4.30-r0/temp/log.do_packagedata_setscene.2115457
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 313 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_package_setscene)
NOTE: Running task 1089 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: Running task 1090 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_unpack)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1118 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1122 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1139 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_patch)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 1151 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1152 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1153 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_populate_lic)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_populate_lic unihash changed to 1bd5f298e0e8e9e0955cb00c49034cf57b26e0f314e630c8ae436c350e763660
NOTE: recipe btrfs-tools-6.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 1154 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1155 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1156 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1157 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 1158 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1159 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 1160 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1161 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: Running task 1162 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1163 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1164 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_configure)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1165 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_compile)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 1166 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1167 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_install)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_install: Succeeded
NOTE: Running task 1168 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_package)
NOTE: Running task 1169 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package: Succeeded
NOTE: Running task 1170 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1171 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_package_write_rpm)
NOTE: Running task 1172 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_package_qa)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package_qa: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1173 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1173 tasks of which 1142 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7365074628469147214==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.0-6.0.1.patch"

RnJvbSBhN2I0N2UyMTVkZmQ2ODVhNTJjYTdmMmM4MDRhNmE0MDg0ZDQxODQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMDc6MTY6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA2LjAgLT4gNi4wLjEKCi0tLQogLi4uL2J0cmZzLXRvb2xzL3ti
dHJmcy10b29sc182LjAuYmIgPT4gYnRyZnMtdG9vbHNfNi4wLjEuYmJ9ICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL3tidHJmcy10b29sc182LjAuYmIgPT4gYnRyZnMt
dG9vbHNfNi4wLjEuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9i
dHJmcy10b29scy9idHJmcy10b29sc182LjAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9v
bHNfNi4wLjEuYmIKaW5kZXggODg3YTUzMGE1Mi4uNzE0NDA4N2ExMSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4wLjEuYmIKQEAg
LTE4LDcgKzE4LDcgQEAgREVQRU5EUyA9ICJ1dGlsLWxpbnV4IHpsaWIiCiBTUkNfVVJJID0gImdp
dDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9rZGF2ZS9idHJmcy1w
cm9ncy5naXQ7YnJhbmNoPW1hc3RlciBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUFkZC1hLXBv
c3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2ggXAogICAg
ICAgICAgICAiCi1TUkNSRVYgPSAiM2RiNzU2MzUyNjg1ZjM4YzFkZTBhYTg4NmQzODBjNzMzZTBm
NTNlNyIKK1NSQ1JFViA9ICI0NDFkMDE1NTY4NzMzODVkNTVmZDQ5NDBmNTBlZTdhZTFmY2ZiMTNk
IgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiBcCi0tIAoyLjMx
LjEKCg==

--===============7365074628469147214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (0 cached, 887 parsed). 1665 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:5ce6bc97d9caba8eb66fe918397b925b8f750236"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 18 Local 6 Mirrors 0 Missed 12 Current 296 (33% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 297 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_populate_sysroot_setscene)
NOTE: Running task 790 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 926 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_fetch)
NOTE: Running task 1088 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_package_write_rpm)
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libxcrypt/4.4.30-r0/temp/log.do_packagedata_setscene.2096568
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 313 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_package_setscene)
NOTE: Running task 1089 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: Running task 1090 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_unpack)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1118 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1122 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1139 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_patch)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 1151 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1152 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1153 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_populate_lic)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_populate_lic unihash changed to 1bd5f298e0e8e9e0955cb00c49034cf57b26e0f314e630c8ae436c350e763660
NOTE: recipe btrfs-tools-6.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 1154 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1155 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1156 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1157 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 1158 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1159 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 1160 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1161 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: Running task 1162 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1163 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1164 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_configure)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1165 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_compile)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 1166 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1167 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_install)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_install: Succeeded
NOTE: Running task 1168 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_package)
NOTE: Running task 1169 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package: Succeeded
NOTE: Running task 1170 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1171 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_package_write_rpm)
NOTE: Running task 1172 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_package_qa)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package_qa: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1173 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1173 tasks of which 1142 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7365074628469147214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1667 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (886 cached, 1 parsed). 1665 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:5ce6bc97d9caba8eb66fe918397b925b8f750236"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 18 Local 6 Mirrors 0 Missed 12 Current 296 (33% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 297 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_populate_sysroot_setscene)
NOTE: Running task 790 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 926 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_fetch)
NOTE: Running task 1088 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_package_write_rpm)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxcrypt/4.4.30-r0/temp/log.do_packagedata_setscene.2077626
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 313 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_package_setscene)
NOTE: Running task 1089 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: Running task 1090 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_unpack)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1118 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1122 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1139 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_patch)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 1151 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1152 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1153 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_populate_lic)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_populate_lic unihash changed to 1bd5f298e0e8e9e0955cb00c49034cf57b26e0f314e630c8ae436c350e763660
NOTE: recipe btrfs-tools-6.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 1154 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1155 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1156 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1157 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 1158 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1159 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 1160 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1161 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: Running task 1162 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1163 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1164 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_configure)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1165 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_compile)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 1166 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1167 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_install)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_install: Succeeded
NOTE: Running task 1168 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_package)
NOTE: Running task 1169 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package: Succeeded
NOTE: Running task 1170 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1171 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_package_write_rpm)
NOTE: Running task 1172 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_package_qa)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package_qa: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1173 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1173 tasks of which 1142 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7365074628469147214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.1-py3.11.egg-info was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.1-py3.11.egg-info/dependency_links.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.1-py3.11.egg-info/PKG-INFO was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.1-py3.11.egg-info/SOURCES.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.1-py3.11.egg-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.0-py3.11.egg-info was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.0-py3.11.egg-info/dependency_links.txt was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.0-py3.11.egg-info/PKG-INFO was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.0-py3.11.egg-info/SOURCES.txt was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.0-py3.11.egg-info/top_level.txt was removed

--===============7365074628469147214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (0 cached, 887 parsed). 1665 targets, 71 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:5ce6bc97d9caba8eb66fe918397b925b8f750236"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 18 Local 6 Mirrors 0 Missed 12 Current 296 (33% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 297 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_populate_sysroot_setscene)
NOTE: Running task 790 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 926 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_fetch)
NOTE: Running task 1088 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_package_write_rpm)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libxcrypt/4.4.30-r0/temp/log.do_packagedata_setscene.2134622
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxcrypt-4.4.30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 313 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_package_setscene)
NOTE: Running task 1089 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: Running task 1090 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_unpack: Started
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1118 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1122 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb:do_packagedata)
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1139 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_patch)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.30-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 1151 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1152 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1153 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_populate_lic)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_populate_lic: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_populate_lic unihash changed to 1bd5f298e0e8e9e0955cb00c49034cf57b26e0f314e630c8ae436c350e763660
NOTE: recipe btrfs-tools-6.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 1154 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1155 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe libgcc-12.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1156 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1157 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 1158 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1159 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 1160 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1161 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: Running task 1162 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1163 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1164 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_configure)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1165 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_compile)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 1166 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1167 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_install)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_install: Succeeded
NOTE: Running task 1168 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_package)
NOTE: Running task 1169 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package: Succeeded
NOTE: Running task 1170 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1171 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_package_write_rpm)
NOTE: Running task 1172 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_package_qa)
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package_qa: Started
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-6.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1173 of 1173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1173 tasks of which 1142 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.31-r0 to 0:4.4.30-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.30-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7365074628469147214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 17275724 to 17282872 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.0 [default] to 6.0.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.0" to "6.0.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 208431 to 208575 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.0 [default] to 6.0.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.0" to "6.0.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.0 [default] to 6.0.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.0" to "6.0.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.0 [default] to 6.0.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.0" to "6.0.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 3649748 to 3656541 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.0 [default] to 6.0.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.0" to "6.0.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.0 [default] to 6.0.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.0" to "6.0.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6102812 to 6119474 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.0 [default] to 6.0.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.0" to "6.0.1"
packages/core2-32-poky-linux/btrfs-tools: PV changed from "6.0" to "6.0.1"
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 6.0 [default] to 6.0.1 [default]
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.1-py3.11.egg-info was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.1-py3.11.egg-info/dependency_links.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.1-py3.11.egg-info/PKG-INFO was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.1-py3.11.egg-info/SOURCES.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.1-py3.11.egg-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.0-py3.11.egg-info was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.0-py3.11.egg-info/dependency_links.txt was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.0-py3.11.egg-info/PKG-INFO was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.0-py3.11.egg-info/SOURCES.txt was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.0-py3.11.egg-info/top_level.txt was removed

--===============7365074628469147214==--

