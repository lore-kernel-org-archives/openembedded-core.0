Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E54EC678DA
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.144504.1671136351826711372
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JWvlgBbk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010185177d16a8-21298be9-b354-4839-a57e-0d09c67af324-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2Ka+dsLzK4AaGzaSZxlnJYSiPLl4+wdc6LCjfzpBdS8=;
	b=JWvlgBbkm4FdgWiG/PoWsqNXBwH0CN9Y4dgZ7sfnXrupKYayXW7u4UTmqiZ6Ucf4
	GQqHvrKrHss8TKBBrUDkNTeJ0SvcTfB7g8xkgh/l8ioteCkFJyZjFmdU2oj1jNql74m
	+1Uf3a2o9/MjO966q+rtqC/6BlWSJgSnkGB1GHQo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2Ka+dsLzK4AaGzaSZxlnJYSiPLl4+wdc6LCjfzpBdS8=;
	b=DRE5AEYN+rYB92m3B5WjVxvd1tQw9H6kZQC8YLgg0Ajk5efJpq6kU/k/m2oMhlHn
	sZc3nTCP/3/2n0cNFW0cz6V3i4F5B4irDObU7nj7okNFkA48G2eGNklKIP2b9Grqk2n
	xz/dx1QRw9kUu6amvlypFzO0/mZcnKUt7iosWgwE=
Content-Type: multipart/mixed; boundary="===============2426321387358646209=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.31 SUCCEEDED
Message-ID: <01010185177d16a8-21298be9-b354-4839-a57e-0d09c67af324-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174663

--===============2426321387358646209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.31* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.29.9-2.31.patch
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
--===============2426321387358646209==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.29.9-2.31.patch"

RnJvbSBjMTMxOTI2NjQwNGI4ZDliMTkyNTZjOWNlNjI0ZDliMjU3MDJkNDExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTI6MTc6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuMjkuOSAtPiAyLjMxCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9y
ZXBvL3tyZXBvXzIuMjkuOS5iYiA9PiByZXBvXzIuMzEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3JlcG8ve3JlcG9fMi4yOS45LmJiID0+IHJlcG9fMi4zMS5iYn0gKDk1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuMjkuOS5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4zMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuMjkuOS5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjMxLmJiCmluZGV4IGE1YTVj
NWNlODcuLjI3YmI1ZDE2M2UgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3JlcG9fMi4yOS45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4z
MS5iYgpAQCAtMTIsNyArMTIsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIFNSQ19VUkkgPSAiZ2l0Oi8v
Z2Vycml0Lmdvb2dsZXNvdXJjZS5jb20vZ2l0LXJlcG8uZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5j
aD1tYWluIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtcHl0aG9uMy1zaGViYW5nLnBhdGNoIFwK
ICAgICAgICAgICAgIgotU1JDUkVWID0gIjQ3MDIwYmEyNDljMzk3ODNhNjZjMDAzMWZkOTIwMGNh
ZWNmYmJkYzgiCitTUkNSRVYgPSAiYTYyMTI1NGIyNjM2NjRlZmEzMDhhNjQ1MjE0ZDNkMTQwZTA2
ODY3NiIKIAogTUlSUk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNvdXJjZS5jb20vZ2l0LXJl
cG8uZ2l0IGdpdDovL2dpdGh1Yi5jb20vR2Vycml0Q29kZVJldmlldy9naXQtcmVwby5naXQiCiAK
LS0gCjIuMzcuMwoK

--===============2426321387358646209==
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
meta-yocto-bsp       = "tmp-auh-upgrades:5671081576118d182e2b621d0ff603a567d51853"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 13 Local 2 Mirrors 0 Missed 11 Current 303 (15% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 943 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_fetch)
NOTE: Running task 956 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_fetch)
NOTE: recipe repo-2.31-r0: task do_fetch: Started
NOTE: recipe git-2.38.1-r0: task do_fetch: Started
NOTE: recipe git-2.38.1-r0: task do_fetch: Succeeded
NOTE: Running task 1159 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_unpack)
NOTE: Running task 1160 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.31-r0: task do_fetch: Succeeded
NOTE: Running task 1161 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_unpack)
NOTE: Running task 1162 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.38.1-r0: task do_unpack: Started
NOTE: recipe repo-2.31-r0: task do_unpack: Started
NOTE: recipe git-2.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 1163 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_patch)
NOTE: recipe git-2.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.31-r0: task do_unpack: Succeeded
NOTE: Running task 1164 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_patch)
NOTE: recipe git-2.38.1-r0: task do_patch: Started
NOTE: recipe repo-2.31-r0: task do_patch: Started
NOTE: recipe repo-2.31-r0: task do_patch: Succeeded
NOTE: Running task 1165 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_deploy_source_date_epoch)
NOTE: Running task 1166 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_populate_lic)
NOTE: recipe git-2.38.1-r0: task do_patch: Succeeded
NOTE: Running task 1167 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.31-r0: task do_populate_lic: Started
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.31-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_populate_lic unihash changed to 8a82d916ac095f4e9d52ca378bd74dacfdfd9ba757145eae2086525c236c24b0
NOTE: recipe repo-2.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1168 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_configure)
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1169 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_configure)
NOTE: recipe repo-2.31-r0: task do_configure: Started
NOTE: recipe repo-2.31-r0: task do_configure: Succeeded
NOTE: recipe git-2.38.1-r0: task do_configure: Started
NOTE: Running task 1170 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_compile)
NOTE: recipe repo-2.31-r0: task do_compile: Started
NOTE: recipe repo-2.31-r0: task do_compile: Succeeded
NOTE: Running task 1171 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_install)
NOTE: recipe repo-2.31-r0: task do_install: Started
NOTE: recipe repo-2.31-r0: task do_install: Succeeded
NOTE: Running task 1172 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_package)
NOTE: Running task 1173 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_populate_sysroot)
NOTE: recipe repo-2.31-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.31-r0: task do_package: Started
NOTE: recipe repo-2.31-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.31-r0: task do_package: Succeeded
NOTE: Running task 1174 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_packagedata)
NOTE: recipe repo-2.31-r0: task do_packagedata: Started
NOTE: recipe repo-2.31-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.38.1-r0: task do_configure: Succeeded
NOTE: Running task 1175 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_compile)
NOTE: recipe git-2.38.1-r0: task do_compile: Started
NOTE: recipe git-2.38.1-r0: task do_compile: Succeeded
NOTE: Running task 1176 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_install)
NOTE: recipe git-2.38.1-r0: task do_install: Started
NOTE: recipe git-2.38.1-r0: task do_install: Succeeded
NOTE: Running task 1177 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_package)
NOTE: recipe git-2.38.1-r0: task do_package: Started
NOTE: recipe git-2.38.1-r0: task do_package: Succeeded
NOTE: Running task 1178 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_packagedata)
NOTE: recipe git-2.38.1-r0: task do_packagedata: Started
NOTE: recipe git-2.38.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1178 tasks of which 1156 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/git/2.38.1-r0/temp/log.do_packagedata.1878407
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_packagedata) failed with exit code '1'

--===============2426321387358646209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1673 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:5671081576118d182e2b621d0ff603a567d51853"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 13 Local 2 Mirrors 0 Missed 11 Current 303 (15% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 943 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_fetch)
NOTE: Running task 956 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_fetch)
NOTE: recipe repo-2.31-r0: task do_fetch: Started
NOTE: recipe git-2.38.1-r0: task do_fetch: Started
NOTE: recipe git-2.38.1-r0: task do_fetch: Succeeded
NOTE: Running task 1159 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_unpack)
NOTE: Running task 1160 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.31-r0: task do_fetch: Succeeded
NOTE: Running task 1161 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_unpack)
NOTE: Running task 1162 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.38.1-r0: task do_unpack: Started
NOTE: recipe repo-2.31-r0: task do_unpack: Started
NOTE: recipe git-2.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 1163 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_patch)
NOTE: recipe git-2.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.31-r0: task do_unpack: Succeeded
NOTE: Running task 1164 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_patch)
NOTE: recipe git-2.38.1-r0: task do_patch: Started
NOTE: recipe repo-2.31-r0: task do_patch: Started
NOTE: recipe repo-2.31-r0: task do_patch: Succeeded
NOTE: Running task 1165 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_deploy_source_date_epoch)
NOTE: Running task 1166 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_populate_lic)
NOTE: recipe git-2.38.1-r0: task do_patch: Succeeded
NOTE: Running task 1167 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.31-r0: task do_populate_lic: Started
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.31-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_populate_lic unihash changed to 8a82d916ac095f4e9d52ca378bd74dacfdfd9ba757145eae2086525c236c24b0
NOTE: recipe repo-2.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1168 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_configure)
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1169 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_configure)
NOTE: recipe repo-2.31-r0: task do_configure: Started
NOTE: recipe git-2.38.1-r0: task do_configure: Started
NOTE: recipe repo-2.31-r0: task do_configure: Succeeded
NOTE: Running task 1170 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_compile)
NOTE: recipe repo-2.31-r0: task do_compile: Started
NOTE: recipe repo-2.31-r0: task do_compile: Succeeded
NOTE: Running task 1171 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_install)
NOTE: recipe repo-2.31-r0: task do_install: Started
NOTE: recipe repo-2.31-r0: task do_install: Succeeded
NOTE: Running task 1172 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_package)
NOTE: Running task 1173 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_populate_sysroot)
NOTE: recipe repo-2.31-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.31-r0: task do_package: Started
NOTE: recipe repo-2.31-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.31-r0: task do_package: Succeeded
NOTE: Running task 1174 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_packagedata)
NOTE: recipe repo-2.31-r0: task do_packagedata: Started
NOTE: recipe repo-2.31-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.38.1-r0: task do_configure: Succeeded
NOTE: Running task 1175 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_compile)
NOTE: recipe git-2.38.1-r0: task do_compile: Started
NOTE: recipe git-2.38.1-r0: task do_compile: Succeeded
NOTE: Running task 1176 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_install)
NOTE: recipe git-2.38.1-r0: task do_install: Started
NOTE: recipe git-2.38.1-r0: task do_install: Succeeded
NOTE: Running task 1177 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_package)
NOTE: recipe git-2.38.1-r0: task do_package: Started
NOTE: recipe git-2.38.1-r0: task do_package: Succeeded
NOTE: Running task 1178 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_packagedata)
NOTE: recipe git-2.38.1-r0: task do_packagedata: Started
NOTE: recipe git-2.38.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1178 tasks of which 1156 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/git/2.38.1-r0/temp/log.do_packagedata.1849974
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_packagedata) failed with exit code '1'

--===============2426321387358646209==
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
meta-yocto-bsp       = "tmp-auh-upgrades:5671081576118d182e2b621d0ff603a567d51853"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 13 Local 2 Mirrors 0 Missed 11 Current 303 (15% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 943 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_fetch)
NOTE: Running task 956 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_fetch)
NOTE: recipe repo-2.31-r0: task do_fetch: Started
NOTE: recipe git-2.38.1-r0: task do_fetch: Started
NOTE: recipe git-2.38.1-r0: task do_fetch: Succeeded
NOTE: Running task 1159 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_unpack)
NOTE: Running task 1160 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.31-r0: task do_fetch: Succeeded
NOTE: Running task 1161 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_unpack)
NOTE: Running task 1162 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.38.1-r0: task do_unpack: Started
NOTE: recipe git-2.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.31-r0: task do_unpack: Started
NOTE: recipe repo-2.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 1163 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_patch)
NOTE: recipe git-2.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.31-r0: task do_unpack: Succeeded
NOTE: Running task 1164 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_patch)
NOTE: recipe git-2.38.1-r0: task do_patch: Started
NOTE: recipe repo-2.31-r0: task do_patch: Started
NOTE: recipe repo-2.31-r0: task do_patch: Succeeded
NOTE: Running task 1165 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_deploy_source_date_epoch)
NOTE: Running task 1166 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_populate_lic)
NOTE: recipe git-2.38.1-r0: task do_patch: Succeeded
NOTE: Running task 1167 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.31-r0: task do_populate_lic: Started
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.31-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_populate_lic unihash changed to 8a82d916ac095f4e9d52ca378bd74dacfdfd9ba757145eae2086525c236c24b0
NOTE: recipe repo-2.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1168 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_configure)
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1169 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_configure)
NOTE: recipe repo-2.31-r0: task do_configure: Started
NOTE: recipe git-2.38.1-r0: task do_configure: Started
NOTE: recipe repo-2.31-r0: task do_configure: Succeeded
NOTE: Running task 1170 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_compile)
NOTE: recipe repo-2.31-r0: task do_compile: Started
NOTE: recipe repo-2.31-r0: task do_compile: Succeeded
NOTE: Running task 1171 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_install)
NOTE: recipe repo-2.31-r0: task do_install: Started
NOTE: recipe repo-2.31-r0: task do_install: Succeeded
NOTE: Running task 1172 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_package)
NOTE: Running task 1173 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_populate_sysroot)
NOTE: recipe repo-2.31-r0: task do_package: Started
NOTE: recipe repo-2.31-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.31-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.31-r0: task do_package: Succeeded
NOTE: Running task 1174 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_packagedata)
NOTE: recipe repo-2.31-r0: task do_packagedata: Started
NOTE: recipe repo-2.31-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.38.1-r0: task do_configure: Succeeded
NOTE: Running task 1175 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_compile)
NOTE: recipe git-2.38.1-r0: task do_compile: Started
NOTE: recipe git-2.38.1-r0: task do_compile: Succeeded
NOTE: Running task 1176 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_install)
NOTE: recipe git-2.38.1-r0: task do_install: Started
NOTE: recipe git-2.38.1-r0: task do_install: Succeeded
NOTE: Running task 1177 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_package)
NOTE: recipe git-2.38.1-r0: task do_package: Started
NOTE: recipe git-2.38.1-r0: task do_package: Succeeded
NOTE: Running task 1178 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_packagedata)
NOTE: recipe git-2.38.1-r0: task do_packagedata: Started
NOTE: recipe git-2.38.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1178 tasks of which 1156 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/git/2.38.1-r0/temp/log.do_packagedata.1868922
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_packagedata) failed with exit code '1'

--===============2426321387358646209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/repo: PV changed from "2.29.9" to "2.31"
packages/core2-32-poky-linux/repo: PKGV changed from 2.29.9 [default] to 2.31 [default]
packages/core2-32-poky-linux/repo/repo-dbg: PV changed from "2.29.9" to "2.31"
packages/core2-32-poky-linux/repo/repo-dbg: PKGV changed from 2.29.9 [default] to 2.31 [default]
packages/core2-32-poky-linux/repo/repo-dev: PV changed from "2.29.9" to "2.31"
packages/core2-32-poky-linux/repo/repo-dev: PKGV changed from 2.29.9 [default] to 2.31 [default]
packages/core2-32-poky-linux/repo/repo-doc: PV changed from "2.29.9" to "2.31"
packages/core2-32-poky-linux/repo/repo-doc: PKGV changed from 2.29.9 [default] to 2.31 [default]
packages/core2-32-poky-linux/repo/repo-locale: PV changed from "2.29.9" to "2.31"
packages/core2-32-poky-linux/repo/repo-locale: PKGV changed from 2.29.9 [default] to 2.31 [default]
packages/core2-32-poky-linux/repo/repo-src: PV changed from "2.29.9" to "2.31"
packages/core2-32-poky-linux/repo/repo-src: PKGV changed from 2.29.9 [default] to 2.31 [default]
packages/core2-32-poky-linux/repo/repo-staticdev: PV changed from "2.29.9" to "2.31"
packages/core2-32-poky-linux/repo/repo-staticdev: PKGV changed from 2.29.9 [default] to 2.31 [default]
packages/core2-32-poky-linux/repo/repo: PV changed from "2.29.9" to "2.31"
packages/core2-32-poky-linux/repo/repo: PKGV changed from 2.29.9 [default] to 2.31 [default]

--===============2426321387358646209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1673 targets, 49 skipped, 0 masked, 0 errors.
Removing 108 recipes from the core2-32 sysroot...done.
Removing 114 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5671081576118d182e2b621d0ff603a567d51853"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 170 Local 159 Mirrors 0 Missed 11 Current 142 (93% match, 96% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 144 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 145 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 150 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 151 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 158 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 159 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 160 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 161 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 162 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 595 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_fetch)
NOTE: Running task 596 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_fetch)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe repo-2.31-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.38.1-r0: task do_fetch: Started
NOTE: recipe curl-7.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe git-2.38.1-r0: task do_fetch: Succeeded
NOTE: Running task 635 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_unpack)
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe repo-2.31-r0: task do_fetch: Succeeded
NOTE: Running task 636 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.38.1-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.31-r0: task do_unpack: Started
NOTE: Running setscene task 169 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe curl-7.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 170 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 172 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 173 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 174 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 175 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 176 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 177 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 662 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 186 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 187 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe repo-2.31-r0: task do_unpack: Succeeded
NOTE: Running task 667 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_patch)
NOTE: recipe git-2.38.1-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.31-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 194 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 201 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 202 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 203 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 205 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 208 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 212 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 216 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene)
NOTE: recipe repo-2.31-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 684 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: Running task 689 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_populate_lic)
NOTE: recipe git-2.38.1-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 690 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.31-r0: task do_populate_lic: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 221 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 228 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe repo-2.31-r0: task do_populate_lic: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_populate_lic unihash changed to 8a82d916ac095f4e9d52ca378bd74dacfdfd9ba757145eae2086525c236c24b0
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 231 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 257 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 267 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 269 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 272 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 279 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 282 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 285 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 287 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 289 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 291 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 294 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 299 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 300 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 306 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 309 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 310 of 312 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1059 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1097 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1153 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_configure)
NOTE: recipe repo-2.31-r0: task do_configure: Started
NOTE: recipe repo-2.31-r0: task do_configure: Succeeded
NOTE: Running task 1154 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_compile)
NOTE: recipe git-2.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1155 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_configure)
NOTE: recipe repo-2.31-r0: task do_compile: Started
NOTE: recipe repo-2.31-r0: task do_compile: Succeeded
NOTE: Running task 1156 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_install)
NOTE: recipe git-2.38.1-r0: task do_configure: Started
NOTE: recipe repo-2.31-r0: task do_install: Started
NOTE: recipe repo-2.31-r0: task do_install: Succeeded
NOTE: Running task 1157 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_package)
NOTE: Running task 1158 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_populate_sysroot)
NOTE: recipe repo-2.31-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.31-r0: task do_package: Started
NOTE: recipe repo-2.31-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.31-r0: task do_package: Succeeded
NOTE: Running task 1159 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_packagedata)
NOTE: recipe repo-2.31-r0: task do_packagedata: Started
NOTE: recipe repo-2.31-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.38.1-r0: task do_configure: Succeeded
NOTE: Running task 1160 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_compile)
NOTE: recipe git-2.38.1-r0: task do_compile: Started
NOTE: recipe git-2.38.1-r0: task do_compile: Succeeded
NOTE: Running task 1161 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_install)
NOTE: recipe git-2.38.1-r0: task do_install: Started
NOTE: recipe git-2.38.1-r0: task do_install: Succeeded
NOTE: Running task 1162 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_package)
NOTE: recipe git-2.38.1-r0: task do_package: Started
NOTE: recipe git-2.38.1-r0: task do_package: Succeeded
NOTE: Running task 1163 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_packagedata)
NOTE: recipe git-2.38.1-r0: task do_packagedata: Started
NOTE: recipe git-2.38.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1163 tasks of which 1141 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/git/2.38.1-r0/temp/log.do_packagedata.1892277
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_packagedata) failed with exit code '1'

--===============2426321387358646209==
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
meta-yocto-bsp       = "tmp-auh-upgrades:5671081576118d182e2b621d0ff603a567d51853"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 13 Local 2 Mirrors 0 Missed 11 Current 303 (15% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 943 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_fetch)
NOTE: Running task 956 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_fetch)
NOTE: recipe repo-2.31-r0: task do_fetch: Started
NOTE: recipe git-2.38.1-r0: task do_fetch: Started
NOTE: recipe git-2.38.1-r0: task do_fetch: Succeeded
NOTE: Running task 1159 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_unpack)
NOTE: Running task 1160 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.31-r0: task do_fetch: Succeeded
NOTE: Running task 1161 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_unpack)
NOTE: Running task 1162 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.38.1-r0: task do_unpack: Started
NOTE: recipe git-2.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.31-r0: task do_unpack: Started
NOTE: recipe repo-2.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 1163 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_patch)
NOTE: recipe repo-2.31-r0: task do_unpack: Succeeded
NOTE: recipe git-2.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1164 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_patch)
NOTE: recipe git-2.38.1-r0: task do_patch: Started
NOTE: recipe repo-2.31-r0: task do_patch: Started
NOTE: recipe repo-2.31-r0: task do_patch: Succeeded
NOTE: Running task 1165 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_deploy_source_date_epoch)
NOTE: Running task 1166 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_populate_lic)
NOTE: recipe git-2.38.1-r0: task do_patch: Succeeded
NOTE: Running task 1167 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.31-r0: task do_populate_lic: Started
NOTE: recipe repo-2.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.31-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_populate_lic unihash changed to 8a82d916ac095f4e9d52ca378bd74dacfdfd9ba757145eae2086525c236c24b0
NOTE: recipe repo-2.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1168 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_configure)
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1169 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_configure)
NOTE: recipe repo-2.31-r0: task do_configure: Started
NOTE: recipe git-2.38.1-r0: task do_configure: Started
NOTE: recipe repo-2.31-r0: task do_configure: Succeeded
NOTE: Running task 1170 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_compile)
NOTE: recipe repo-2.31-r0: task do_compile: Started
NOTE: recipe repo-2.31-r0: task do_compile: Succeeded
NOTE: Running task 1171 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_install)
NOTE: recipe repo-2.31-r0: task do_install: Started
NOTE: recipe repo-2.31-r0: task do_install: Succeeded
NOTE: Running task 1172 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_package)
NOTE: Running task 1173 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_populate_sysroot)
NOTE: recipe repo-2.31-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.31-r0: task do_package: Started
NOTE: recipe repo-2.31-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.31-r0: task do_package: Succeeded
NOTE: Running task 1174 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.31.bb:do_packagedata)
NOTE: recipe repo-2.31-r0: task do_packagedata: Started
NOTE: recipe repo-2.31-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.38.1-r0: task do_configure: Succeeded
NOTE: Running task 1175 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_compile)
NOTE: recipe git-2.38.1-r0: task do_compile: Started
NOTE: recipe git-2.38.1-r0: task do_compile: Succeeded
NOTE: Running task 1176 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_install)
NOTE: recipe git-2.38.1-r0: task do_install: Started
NOTE: recipe git-2.38.1-r0: task do_install: Succeeded
NOTE: Running task 1177 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_package)
NOTE: recipe git-2.38.1-r0: task do_package: Started
NOTE: recipe git-2.38.1-r0: task do_package: Succeeded
NOTE: Running task 1178 of 1182 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_packagedata)
NOTE: recipe git-2.38.1-r0: task do_packagedata: Started
NOTE: recipe git-2.38.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1178 tasks of which 1156 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.39.0-r0 to 0:2.38.1-r0) [version-going-backwards]
ERROR: git-2.38.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/git/2.38.1-r0/temp/log.do_packagedata.1859471
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_packagedata) failed with exit code '1'

--===============2426321387358646209==--

