Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D74DC6FD1C
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.10731.1663251513253842752
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Jud2JY1T;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101834183ff36-25bcea68-2158-4d57-80e1-ec186b8ca91f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LWXZARycu1PcI1W7ycEcYQmnMiZ0U0rh2DaPAfmZ2DU=;
	b=Jud2JY1Trll/tMRVdXStYWvq2wrkE+t9EhX4ZNizuFOjD7z93uAoIMhRR/Vw9EBG
	cmFrMzVeqsWzfMspaaPNGIoyUaG2YGXL9CC7Ch3HWz06FkSJFJJra8usSuURxP2+pti
	r81am1u+6OnVNAcx55tzzbTplSZXpOhfEJ+iYvC4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LWXZARycu1PcI1W7ycEcYQmnMiZ0U0rh2DaPAfmZ2DU=;
	b=KzJHcO9aIHUoowH1APdMYQ4BojXyWExo6rG+c4Ddb914elrpDGn1kWSjaw8/zLHC
	u+X/uPldnNYS6bOd8zulxrbf68Vn4B7qOd6yapGUjD/YKPAiF1gU/gdrTcjI/SUKW44
	DIVkburI7Hoj8hteZKrnlCtXRym9n8BQZ0N/liek=
Content-Type: multipart/mixed; boundary="===============6209833546105653806=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.29.2 SUCCEEDED
Message-ID: 
 <010101834183ff36-25bcea68-2158-4d57-80e1-ec186b8ca91f-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:33 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170757

--===============6209833546105653806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.29.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.29.1-2.29.2.patch
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
--===============6209833546105653806==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.29.1-2.29.2.patch"

RnJvbSBhNWE0YmI3YjkyMzE3MGE5NGIzZTU3Zjk5ZmU5ZTMyNGI5MmM3MTk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMTA6NDI6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuMjkuMSAtPiAyLjI5LjIKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3JlcG8ve3JlcG9fMi4yOS4xLmJiID0+IHJlcG9fMi4yOS4yLmJifSB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9yZXBvL3tyZXBvXzIuMjkuMS5iYiA9PiByZXBvXzIuMjkuMi5iYn0gKDk1JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuMjkuMS5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4yOS4yLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4yOS4x
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuMjkuMi5iYgpp
bmRleCA3NDAxMzJjMmY2Li40MmZkMThhYzI0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcmVwby9yZXBvXzIuMjkuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVw
by9yZXBvXzIuMjkuMi5iYgpAQCAtMTIsNyArMTIsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9MSUNFTlNFO21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNvdXJjZS5jb20vZ2l0LXJlcG8uZ2l0O3Byb3RvY29s
PWh0dHBzO2JyYW5jaD1tYWluIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtcHl0aG9uMy1zaGVi
YW5nLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjQxMTJjMDc2ODhkMGUwZTU2ODQ3
OGU5ZjQyYmUzNDliZGQ1MTFkNDUiCitTUkNSRVYgPSAiODkxZThmNzJjZTM1NTFhMTljMzc3NDU2
NTc0YmJmYmVhYzVjOGI4ZSIKIAogTUlSUk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNvdXJj
ZS5jb20vZ2l0LXJlcG8uZ2l0IGdpdDovL2dpdGh1Yi5jb20vR2Vycml0Q29kZVJldmlldy9naXQt
cmVwby5naXQiCiAKLS0gCjIuMzEuMQoK

--===============6209833546105653806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/repo: PKGV changed from 2.29.1 [default] to 2.29.2 [default]
packages/core2-32-poky-linux/repo: PV changed from "2.29.1" to "2.29.2"
packages/core2-32-poky-linux/repo/repo-dbg: PKGV changed from 2.29.1 [default] to 2.29.2 [default]
packages/core2-32-poky-linux/repo/repo-dbg: PV changed from "2.29.1" to "2.29.2"
packages/core2-32-poky-linux/repo/repo-dev: PKGV changed from 2.29.1 [default] to 2.29.2 [default]
packages/core2-32-poky-linux/repo/repo-dev: PV changed from "2.29.1" to "2.29.2"
packages/core2-32-poky-linux/repo/repo-doc: PKGV changed from 2.29.1 [default] to 2.29.2 [default]
packages/core2-32-poky-linux/repo/repo-doc: PV changed from "2.29.1" to "2.29.2"
packages/core2-32-poky-linux/repo/repo-locale: PKGV changed from 2.29.1 [default] to 2.29.2 [default]
packages/core2-32-poky-linux/repo/repo-locale: PV changed from "2.29.1" to "2.29.2"
packages/core2-32-poky-linux/repo/repo-src: PKGV changed from 2.29.1 [default] to 2.29.2 [default]
packages/core2-32-poky-linux/repo/repo-src: PV changed from "2.29.1" to "2.29.2"
packages/core2-32-poky-linux/repo/repo-staticdev: PKGV changed from 2.29.1 [default] to 2.29.2 [default]
packages/core2-32-poky-linux/repo/repo-staticdev: PV changed from "2.29.1" to "2.29.2"
packages/core2-32-poky-linux/repo/repo: PKGV changed from 2.29.1 [default] to 2.29.2 [default]
packages/core2-32-poky-linux/repo/repo: PV changed from "2.29.1" to "2.29.2"

--===============6209833546105653806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1663 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7a23dbce34e7d1d31e7fbf538845ce70d054853a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7a23dbce34e7d1d31e7fbf538845ce70d054853a"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 19 Local 8 Mirrors 0 Missed 11 Current 296 (42% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 942 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_fetch)
NOTE: Running task 955 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_fetch)
NOTE: recipe repo-2.29.2-r0: task do_fetch: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Succeeded
NOTE: Running task 1158 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_unpack)
NOTE: Running task 1159 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.29.2-r0: task do_fetch: Succeeded
NOTE: Running task 1160 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_unpack)
NOTE: Running task 1161 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.37.2-r0: task do_unpack: Started
NOTE: recipe repo-2.29.2-r0: task do_unpack: Started
NOTE: recipe repo-2.29.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.29.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.37.2-r0: task do_unpack: Succeeded
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1162 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_patch)
NOTE: recipe repo-2.29.2-r0: task do_unpack: Succeeded
NOTE: Running task 1163 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_patch)
NOTE: recipe repo-2.29.2-r0: task do_patch: Started
NOTE: recipe git-2.37.2-r0: task do_patch: Started
NOTE: recipe repo-2.29.2-r0: task do_patch: Succeeded
NOTE: Running task 1164 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1165 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_populate_lic)
NOTE: recipe git-2.37.2-r0: task do_patch: Succeeded
NOTE: Running task 1166 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.29.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.29.2-r0: task do_populate_lic: Started
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.29.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_populate_lic unihash changed to 1411ddf2c7f1b747a2c105c49c0b79dd8a13a43e98fbfe9cfb53bc2fd4375115
NOTE: recipe repo-2.29.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1167 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_configure)
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1168 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_configure)
NOTE: recipe repo-2.29.2-r0: task do_configure: Started
NOTE: recipe repo-2.29.2-r0: task do_configure: Succeeded
NOTE: Running task 1169 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_compile)
NOTE: recipe git-2.37.2-r0: task do_configure: Started
NOTE: recipe repo-2.29.2-r0: task do_compile: Started
NOTE: recipe repo-2.29.2-r0: task do_compile: Succeeded
NOTE: Running task 1170 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_install)
NOTE: recipe repo-2.29.2-r0: task do_install: Started
NOTE: recipe repo-2.29.2-r0: task do_install: Succeeded
NOTE: Running task 1171 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_package)
NOTE: Running task 1172 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_populate_sysroot)
NOTE: recipe repo-2.29.2-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.29.2-r0: task do_package: Started
NOTE: recipe repo-2.29.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.29.2-r0: task do_package: Succeeded
NOTE: Running task 1173 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_packagedata)
NOTE: recipe repo-2.29.2-r0: task do_packagedata: Started
NOTE: recipe repo-2.29.2-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.37.2-r0: task do_configure: Succeeded
NOTE: Running task 1174 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_compile)
NOTE: recipe git-2.37.2-r0: task do_compile: Started
NOTE: recipe git-2.37.2-r0: task do_compile: Succeeded
NOTE: Running task 1175 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_install)
NOTE: recipe git-2.37.2-r0: task do_install: Started
NOTE: recipe git-2.37.2-r0: task do_install: Succeeded
NOTE: Running task 1176 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_package)
NOTE: recipe git-2.37.2-r0: task do_package: Started
NOTE: recipe git-2.37.2-r0: task do_package: Succeeded
NOTE: Running task 1177 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata)
NOTE: recipe git-2.37.2-r0: task do_packagedata: Started
NOTE: recipe git-2.37.2-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1177 tasks of which 1155 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/git/2.37.2-r0/temp/log.do_packagedata.777199
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata) failed with exit code '1'

--===============6209833546105653806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7a23dbce34e7d1d31e7fbf538845ce70d054853a"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7a23dbce34e7d1d31e7fbf538845ce70d054853a"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 19 Local 8 Mirrors 0 Missed 11 Current 296 (42% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 942 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_fetch)
NOTE: Running task 955 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_fetch)
NOTE: recipe repo-2.29.2-r0: task do_fetch: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Succeeded
NOTE: Running task 1158 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_unpack)
NOTE: Running task 1159 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.29.2-r0: task do_fetch: Succeeded
NOTE: Running task 1160 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_unpack)
NOTE: Running task 1161 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.29.2-r0: task do_unpack: Started
NOTE: recipe git-2.37.2-r0: task do_unpack: Started
NOTE: recipe repo-2.29.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.29.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.37.2-r0: task do_unpack: Succeeded
NOTE: recipe repo-2.29.2-r0: task do_unpack: Succeeded
NOTE: Running task 1162 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_patch)
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1163 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_patch)
NOTE: recipe repo-2.29.2-r0: task do_patch: Started
NOTE: recipe git-2.37.2-r0: task do_patch: Started
NOTE: recipe repo-2.29.2-r0: task do_patch: Succeeded
NOTE: Running task 1164 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1165 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_populate_lic)
NOTE: recipe git-2.37.2-r0: task do_patch: Succeeded
NOTE: Running task 1166 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.29.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.29.2-r0: task do_populate_lic: Started
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.29.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_populate_lic unihash changed to 1411ddf2c7f1b747a2c105c49c0b79dd8a13a43e98fbfe9cfb53bc2fd4375115
NOTE: recipe repo-2.29.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1167 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_configure)
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1168 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_configure)
NOTE: recipe repo-2.29.2-r0: task do_configure: Started
NOTE: recipe repo-2.29.2-r0: task do_configure: Succeeded
NOTE: Running task 1169 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_compile)
NOTE: recipe git-2.37.2-r0: task do_configure: Started
NOTE: recipe repo-2.29.2-r0: task do_compile: Started
NOTE: recipe repo-2.29.2-r0: task do_compile: Succeeded
NOTE: Running task 1170 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_install)
NOTE: recipe repo-2.29.2-r0: task do_install: Started
NOTE: recipe repo-2.29.2-r0: task do_install: Succeeded
NOTE: Running task 1171 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_package)
NOTE: Running task 1172 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_populate_sysroot)
NOTE: recipe repo-2.29.2-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.29.2-r0: task do_package: Started
NOTE: recipe repo-2.29.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.29.2-r0: task do_package: Succeeded
NOTE: Running task 1173 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_packagedata)
NOTE: recipe repo-2.29.2-r0: task do_packagedata: Started
NOTE: recipe repo-2.29.2-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.37.2-r0: task do_configure: Succeeded
NOTE: Running task 1174 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_compile)
NOTE: recipe git-2.37.2-r0: task do_compile: Started
NOTE: recipe git-2.37.2-r0: task do_compile: Succeeded
NOTE: Running task 1175 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_install)
NOTE: recipe git-2.37.2-r0: task do_install: Started
NOTE: recipe git-2.37.2-r0: task do_install: Succeeded
NOTE: Running task 1176 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_package)
NOTE: recipe git-2.37.2-r0: task do_package: Started
NOTE: recipe git-2.37.2-r0: task do_package: Succeeded
NOTE: Running task 1177 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata)
NOTE: recipe git-2.37.2-r0: task do_packagedata: Started
NOTE: recipe git-2.37.2-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1177 tasks of which 1155 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/git/2.37.2-r0/temp/log.do_packagedata.786279
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata) failed with exit code '1'

--===============6209833546105653806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7a23dbce34e7d1d31e7fbf538845ce70d054853a"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7a23dbce34e7d1d31e7fbf538845ce70d054853a"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 19 Local 8 Mirrors 0 Missed 11 Current 296 (42% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 942 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_fetch)
NOTE: Running task 955 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_fetch)
NOTE: recipe repo-2.29.2-r0: task do_fetch: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Succeeded
NOTE: Running task 1158 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_unpack)
NOTE: Running task 1159 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.29.2-r0: task do_fetch: Succeeded
NOTE: Running task 1160 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_unpack)
NOTE: Running task 1161 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.37.2-r0: task do_unpack: Started
NOTE: recipe repo-2.29.2-r0: task do_unpack: Started
NOTE: recipe repo-2.29.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.29.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.37.2-r0: task do_unpack: Succeeded
NOTE: Running task 1162 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_patch)
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.29.2-r0: task do_unpack: Succeeded
NOTE: Running task 1163 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_patch)
NOTE: recipe git-2.37.2-r0: task do_patch: Started
NOTE: recipe repo-2.29.2-r0: task do_patch: Started
NOTE: recipe repo-2.29.2-r0: task do_patch: Succeeded
NOTE: Running task 1164 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1165 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_populate_lic)
NOTE: recipe git-2.37.2-r0: task do_patch: Succeeded
NOTE: Running task 1166 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.29.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.29.2-r0: task do_populate_lic: Started
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.29.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_populate_lic unihash changed to 1411ddf2c7f1b747a2c105c49c0b79dd8a13a43e98fbfe9cfb53bc2fd4375115
NOTE: recipe repo-2.29.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1167 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_configure)
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1168 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_configure)
NOTE: recipe repo-2.29.2-r0: task do_configure: Started
NOTE: recipe git-2.37.2-r0: task do_configure: Started
NOTE: recipe repo-2.29.2-r0: task do_configure: Succeeded
NOTE: Running task 1169 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_compile)
NOTE: recipe repo-2.29.2-r0: task do_compile: Started
NOTE: recipe repo-2.29.2-r0: task do_compile: Succeeded
NOTE: Running task 1170 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_install)
NOTE: recipe repo-2.29.2-r0: task do_install: Started
NOTE: recipe repo-2.29.2-r0: task do_install: Succeeded
NOTE: Running task 1171 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_package)
NOTE: Running task 1172 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_populate_sysroot)
NOTE: recipe repo-2.29.2-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.29.2-r0: task do_package: Started
NOTE: recipe repo-2.29.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.29.2-r0: task do_package: Succeeded
NOTE: Running task 1173 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_packagedata)
NOTE: recipe repo-2.29.2-r0: task do_packagedata: Started
NOTE: recipe repo-2.29.2-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.37.2-r0: task do_configure: Succeeded
NOTE: Running task 1174 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_compile)
NOTE: recipe git-2.37.2-r0: task do_compile: Started
NOTE: recipe git-2.37.2-r0: task do_compile: Succeeded
NOTE: Running task 1175 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_install)
NOTE: recipe git-2.37.2-r0: task do_install: Started
NOTE: recipe git-2.37.2-r0: task do_install: Succeeded
NOTE: Running task 1176 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_package)
NOTE: recipe git-2.37.2-r0: task do_package: Started
NOTE: recipe git-2.37.2-r0: task do_package: Succeeded
NOTE: Running task 1177 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata)
NOTE: recipe git-2.37.2-r0: task do_packagedata: Started
NOTE: recipe git-2.37.2-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1177 tasks of which 1155 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/git/2.37.2-r0/temp/log.do_packagedata.795403
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata) failed with exit code '1'

--===============6209833546105653806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7a23dbce34e7d1d31e7fbf538845ce70d054853a"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7a23dbce34e7d1d31e7fbf538845ce70d054853a"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 19 Local 8 Mirrors 0 Missed 11 Current 296 (42% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 942 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_fetch)
NOTE: Running task 955 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_fetch)
NOTE: recipe repo-2.29.2-r0: task do_fetch: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Succeeded
NOTE: Running task 1158 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_unpack)
NOTE: Running task 1159 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.29.2-r0: task do_fetch: Succeeded
NOTE: Running task 1160 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_unpack)
NOTE: Running task 1161 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.37.2-r0: task do_unpack: Started
NOTE: recipe repo-2.29.2-r0: task do_unpack: Started
NOTE: recipe repo-2.29.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.29.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.37.2-r0: task do_unpack: Succeeded
NOTE: Running task 1162 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_patch)
NOTE: recipe repo-2.29.2-r0: task do_unpack: Succeeded
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1163 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_patch)
NOTE: recipe git-2.37.2-r0: task do_patch: Started
NOTE: recipe repo-2.29.2-r0: task do_patch: Started
NOTE: recipe git-2.37.2-r0: task do_patch: Succeeded
NOTE: recipe repo-2.29.2-r0: task do_patch: Succeeded
NOTE: Running task 1164 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1165 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1166 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_populate_lic)
NOTE: recipe repo-2.29.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.29.2-r0: task do_populate_lic: Started
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.29.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_populate_lic unihash changed to 1411ddf2c7f1b747a2c105c49c0b79dd8a13a43e98fbfe9cfb53bc2fd4375115
NOTE: recipe repo-2.29.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1167 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_configure)
NOTE: Running task 1168 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_configure)
NOTE: recipe repo-2.29.2-r0: task do_configure: Started
NOTE: recipe git-2.37.2-r0: task do_configure: Started
NOTE: recipe repo-2.29.2-r0: task do_configure: Succeeded
NOTE: Running task 1169 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_compile)
NOTE: recipe repo-2.29.2-r0: task do_compile: Started
NOTE: recipe repo-2.29.2-r0: task do_compile: Succeeded
NOTE: Running task 1170 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_install)
NOTE: recipe repo-2.29.2-r0: task do_install: Started
NOTE: recipe repo-2.29.2-r0: task do_install: Succeeded
NOTE: Running task 1171 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_package)
NOTE: Running task 1172 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_populate_sysroot)
NOTE: recipe repo-2.29.2-r0: task do_package: Started
NOTE: recipe repo-2.29.2-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.29.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.29.2-r0: task do_package: Succeeded
NOTE: Running task 1173 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_packagedata)
NOTE: recipe repo-2.29.2-r0: task do_packagedata: Started
NOTE: recipe repo-2.29.2-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.37.2-r0: task do_configure: Succeeded
NOTE: Running task 1174 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_compile)
NOTE: recipe git-2.37.2-r0: task do_compile: Started
NOTE: recipe git-2.37.2-r0: task do_compile: Succeeded
NOTE: Running task 1175 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_install)
NOTE: recipe git-2.37.2-r0: task do_install: Started
NOTE: recipe git-2.37.2-r0: task do_install: Succeeded
NOTE: Running task 1176 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_package)
NOTE: recipe git-2.37.2-r0: task do_package: Started
NOTE: recipe git-2.37.2-r0: task do_package: Succeeded
NOTE: Running task 1177 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata)
NOTE: recipe git-2.37.2-r0: task do_packagedata: Started
NOTE: recipe git-2.37.2-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1177 tasks of which 1155 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/git/2.37.2-r0/temp/log.do_packagedata.804505
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata) failed with exit code '1'

--===============6209833546105653806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1662 targets, 49 skipped, 0 masked, 0 errors.
Removing 46 recipes from the core2-32 sysroot...done.
Removing 49 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7a23dbce34e7d1d31e7fbf538845ce70d054853a"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7a23dbce34e7d1d31e7fbf538845ce70d054853a"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 177 Local 166 Mirrors 0 Missed 11 Current 134 (93% match, 96% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 136 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 137 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 142 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 143 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 150 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 152 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 153 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 155 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 156 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 586 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_fetch)
NOTE: Running task 587 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_fetch)
NOTE: recipe repo-2.29.2-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Started
NOTE: recipe curl-7.85.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.10.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 626 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_unpack)
NOTE: recipe repo-2.29.2-r0: task do_fetch: Succeeded
NOTE: Running task 627 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_unpack)
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.29.2-r0: task do_unpack: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 167 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_packagedata_setscene)
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe git-2.37.2-r0: task do_unpack: Started
NOTE: Running setscene task 168 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 170 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 171 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 172 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 173 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 174 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 175 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.37.2-r0: task do_unpack: Succeeded
NOTE: Running task 657 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_patch)
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 186 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 187 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe repo-2.29.2-r0: task do_unpack: Succeeded
NOTE: Running task 662 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_patch)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe repo-2.29.2-r0: task do_patch: Started
NOTE: recipe git-2.37.2-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 192 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 194 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 199 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 201 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 203 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 208 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 212 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.29.2-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.37.2-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 679 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 680 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_populate_lic)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 681 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 219 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.29.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.29.2-r0: task do_populate_lic: Started
NOTE: Running setscene task 226 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 233 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.29.2-r0: task do_populate_lic: Succeeded
NOTE: recipe repo-2.29.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_populate_lic unihash changed to 1411ddf2c7f1b747a2c105c49c0b79dd8a13a43e98fbfe9cfb53bc2fd4375115
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 255 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 266 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 278 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 281 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 284 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 286 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 288 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 290 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 293 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 298 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 305 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 308 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 309 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1058 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1096 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.29.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.29.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1152 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_configure)
NOTE: recipe repo-2.29.2-r0: task do_configure: Started
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.29.2-r0: task do_configure: Succeeded
NOTE: Running task 1153 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_configure)
NOTE: Running task 1154 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_compile)
NOTE: recipe git-2.37.2-r0: task do_configure: Started
NOTE: recipe repo-2.29.2-r0: task do_compile: Started
NOTE: recipe repo-2.29.2-r0: task do_compile: Succeeded
NOTE: Running task 1155 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_install)
NOTE: recipe repo-2.29.2-r0: task do_install: Started
NOTE: recipe repo-2.29.2-r0: task do_install: Succeeded
NOTE: Running task 1156 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_package)
NOTE: Running task 1157 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_populate_sysroot)
NOTE: recipe repo-2.29.2-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.29.2-r0: task do_package: Started
NOTE: recipe repo-2.29.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.29.2-r0: task do_package: Succeeded
NOTE: Running task 1158 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.2.bb:do_packagedata)
NOTE: recipe repo-2.29.2-r0: task do_packagedata: Started
NOTE: recipe repo-2.29.2-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.37.2-r0: task do_configure: Succeeded
NOTE: Running task 1159 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_compile)
NOTE: recipe git-2.37.2-r0: task do_compile: Started
NOTE: recipe git-2.37.2-r0: task do_compile: Succeeded
NOTE: Running task 1160 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_install)
NOTE: recipe git-2.37.2-r0: task do_install: Started
NOTE: recipe git-2.37.2-r0: task do_install: Succeeded
NOTE: Running task 1161 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_package)
NOTE: recipe git-2.37.2-r0: task do_package: Started
NOTE: recipe git-2.37.2-r0: task do_package: Succeeded
NOTE: Running task 1162 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata)
NOTE: recipe git-2.37.2-r0: task do_packagedata: Started
NOTE: recipe git-2.37.2-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1162 tasks of which 1140 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/git/2.37.2-r0/temp/log.do_packagedata.817825
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata) failed with exit code '1'

--===============6209833546105653806==--

