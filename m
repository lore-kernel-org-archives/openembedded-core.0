Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 357F5C7EE26
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:51 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.107428.1682976350305943889
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CqtMt4/f;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010187d9351db2-8e1b8a35-a429-40ad-adb1-7e2c25247bdc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KGsFM25KwfBJdcWr29I1cvTjtbMmf6UFL3RtOKWpwt8=;
	b=CqtMt4/fw29vGKuBYlZmbKP+0fCQD4ucfIFnwZ4UK4VOOImnOJ446omSS/xexXqG
	Ch1MeZEWBjuAIP36+185wQIseRietNCerLcQdax1pHuk8tn6Zut/5AcpQLiaLd3GVbw
	V3XEDKKXIIlLH6VAgnyqUPUBsJowMLV2tt6RGm84=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KGsFM25KwfBJdcWr29I1cvTjtbMmf6UFL3RtOKWpwt8=;
	b=GdvIfW3iNa06A7tRRchOnz4YPCjPEychOmxr6RJoEGIf2O28uYu6JfcGMbNO1wG9
	a84/stwgFveOChPwC0K5i4eo/e5/A33Qm1AaOLUyDS4apsOWi2MsRVHXzbmCToJujGl
	IIhZpyfwiulsqFByZURdcVCtm3CzgoYaXM/27QQg=
Content-Type: multipart/mixed; boundary="===============8334183807827972090=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] patchelf: upgrading to 0.18.0 FAILED
Message-ID: <01010187d9351db2-8e1b8a35-a429-40ad-adb1-7e2c25247bdc-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180615

--===============8334183807827972090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *patchelf* to *0.18.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-patchelf-upgrade-0.17.2-0.18.0.patch
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
--===============8334183807827972090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1798 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e7880df3d7de64b04af0800be4c8340320c7de08"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 15 Mirrors 0 Missed 7 Current 134 (68% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 608 of 647 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb:do_fetch)
NOTE: recipe patchelf-0.18.0-r0: task do_fetch: Started
NOTE: recipe patchelf-0.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 634 of 647 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb:do_unpack)
NOTE: Running task 635 of 647 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe patchelf-0.18.0-r0: task do_unpack: Started
NOTE: recipe patchelf-0.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe patchelf-0.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe patchelf-0.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 636 of 647 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb:do_patch)
NOTE: recipe patchelf-0.18.0-r0: task do_patch: Started
NOTE: recipe patchelf-0.18.0-r0: task do_patch: Succeeded
NOTE: Running task 637 of 647 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 638 of 647 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb:do_populate_lic)
NOTE: recipe patchelf-0.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe patchelf-0.18.0-r0: task do_populate_lic: Started
NOTE: recipe patchelf-0.18.0-r0: task do_populate_lic: Succeeded
NOTE: recipe patchelf-0.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 639 of 647 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb:do_configure)
NOTE: recipe patchelf-0.18.0-r0: task do_configure: Started
NOTE: recipe patchelf-0.18.0-r0: task do_configure: Succeeded
NOTE: Running task 640 of 647 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb:do_compile)
NOTE: recipe patchelf-0.18.0-r0: task do_compile: Started
NOTE: recipe patchelf-0.18.0-r0: task do_compile: Succeeded
NOTE: Running task 641 of 647 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb:do_install)
NOTE: recipe patchelf-0.18.0-r0: task do_install: Started
NOTE: recipe patchelf-0.18.0-r0: task do_install: Succeeded
NOTE: Running task 642 of 647 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb:do_package)
NOTE: Running task 643 of 647 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb:do_populate_sysroot)
NOTE: recipe patchelf-0.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe patchelf-0.18.0-r0: task do_package: Started
NOTE: recipe patchelf-0.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe patchelf-0.18.0-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 643 tasks of which 632 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb:do_package
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: patchelf-0.18.0-r0 do_package: QA Issue: patchelf: Files/directories were installed but not shipped in any package:
  /usr/share/zsh
  /usr/share/zsh/site-functions
  /usr/share/zsh/site-functions/_patchelf
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
patchelf: 3 installed and not shipped files. [installed-vs-shipped]
ERROR: patchelf-0.18.0-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/patchelf/0.18.0-r0/temp/log.do_package.235102
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb:do_package) failed with exit code '1'

--===============8334183807827972090==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-patchelf-upgrade-0.17.2-0.18.0.patch"

RnJvbSAwMzBhY2FiMWU1NzIzMDlhYWNlMmEyNTZlZDkzMzU2N2U4N2Q1ZDI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAwOToyMTozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBh
dGNoZWxmOiB1cGdyYWRlIDAuMTcuMiAtPiAwLjE4LjAKCi0tLQogLi4uL3BhdGNoZWxmL3twYXRj
aGVsZl8wLjE3LjIuYmIgPT4gcGF0Y2hlbGZfMC4xOC4wLmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3BhdGNoZWxmL3twYXRjaGVsZl8wLjE3LjIuYmIgPT4gcGF0Y2hlbGZf
MC4xOC4wLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wYXRj
aGVsZi9wYXRjaGVsZl8wLjE3LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGF0Y2hlbGYv
cGF0Y2hlbGZfMC4xOC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9wYXRjaGVsZi9wYXRjaGVsZl8wLjE3LjIuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9wYXRjaGVsZi9wYXRjaGVsZl8wLjE4LjAuYmIKaW5kZXggYTk1
ODM0MTllOC4uZjA5ZDlhOTMwMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bh
dGNoZWxmL3BhdGNoZWxmXzAuMTcuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGF0
Y2hlbGYvcGF0Y2hlbGZfMC4xOC4wLmJiCkBAIC01LDcgKzUsNyBAQCBIT01FUEFHRSA9ICJodHRw
czovL2dpdGh1Yi5jb20vTml4T1MvcGF0Y2hlbGYiCiBMSUNFTlNFID0gIkdQTC0zLjAtb25seSIK
IAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL05peE9TL3BhdGNoZWxmO3Byb3RvY29sPWh0
dHBzO2JyYW5jaD1tYXN0ZXIiCi1TUkNSRVYgPSAiNTkwOGUxNmNkNTYyYmNiMTkwOWJlNGRlMDQw
OWM0OTEyYThhZmM1MiIKK1NSQ1JFViA9ICI5OWMyNDIzODk4MWI3YjEwODQzMTNhY2E4ZjVjNDkz
YmI0NmYzMDJjIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM5LjIKCg==

--===============8334183807827972090==--

