Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F56C6FA8A
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:55 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.12465.1662040787922000714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XRCjAJp8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 01010182f959c99b-46323536-6d71-4477-8321-faf7432b7a01-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7/XyOFbtjcZ4SZiRkjjVSIedTE9tqGTr10ClNk9GVtM=;
	b=XRCjAJp83dJDKtX0By3LTw1NbjuGLAbmKkCmCK3Ogv9P34sb9R/avrIC/L9wX81Y
	pqzRzYRupnaC+2q6JaA5K/A9IrJrBio2h/TZHxLbtRgvKsEKg5PJYoW7KQ8fRMg70Sb
	rKWdPJ9qmnsGFO5gaO0aELhtJ2hhP76l5uTZlbQQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7/XyOFbtjcZ4SZiRkjjVSIedTE9tqGTr10ClNk9GVtM=;
	b=FT548FUNbAlq4rOi64V7qgIH0MH+SWLM066xnyo6XkxXjxWu+lAduQcPd245ZHBH
	hZgfENOiBMZNCklXl8PoP82TxUa+322lzak+tQL0i84yNeDfaLYlembCxVw3zV55QDF
	7gXJkmeVZIT4NRiPOeDEJ2Sn57Heyy2yX1B9p/Ag=
Content-Type: multipart/mixed; boundary="===============1519104181404645160=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxslt: upgrading to 1.1.37 FAILED
Message-ID: 
 <01010182f959c99b-46323536-6d71-4477-8321-faf7432b7a01-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170205

--===============1519104181404645160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxslt* to *1.1.37* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libxslt-upgrade-1.1.35-1.1.37.patch
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
--===============1519104181404645160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1658 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-e11764c35e83369bfef8bbab171fb92cb378eef9"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e11764c35e83369bfef8bbab171fb92cb378eef9"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 50 Mirrors 0 Missed 7 Current 164 (87% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 215 of 221 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 653 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-1.1.37-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.37-r0: task do_fetch: Succeeded
NOTE: Running task 654 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_unpack)
NOTE: recipe libxslt-1.1.37-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 218 of 221 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-1.1.37-r0: task do_unpack: Succeeded
NOTE: Running task 659 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_patch)
NOTE: recipe libxslt-1.1.37-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.37-r0: task do_patch: Succeeded
NOTE: Running task 660 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_deploy_source_date_epoch)
NOTE: Running task 661 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_populate_lic)
NOTE: recipe libxslt-1.1.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.37-r0: task do_populate_lic: Started
NOTE: recipe libxslt-1.1.37-r0: task do_populate_lic: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 837 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxslt-1.1.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 841 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_configure)
NOTE: recipe libxslt-1.1.37-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.37-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 841 tasks of which 834 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libxslt-1.1.37-r0 do_configure: QA Issue: libxslt: configure was passed unrecognised options: --with-html-subdir [unknown-configure-option]
ERROR: libxslt-1.1.37-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libxslt/1.1.37-r0/temp/log.do_configure.3598197
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_configure) failed with exit code '1'

--===============1519104181404645160==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxslt-upgrade-1.1.35-1.1.37.patch"

RnJvbSBlZDY4ODRhZTQ2NmQzODY0OWQyMGNmMWEyNGYwNWJjN2E5OWUzNTE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAxMzo0Njo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhzbHQ6IHVwZ3JhZGUgMS4xLjM1IC0+IDEuMS4zNwoKLS0tCiAuLi4vbGlieHNsdC97bGlieHNs
dF8xLjEuMzUuYmIgPT4gbGlieHNsdF8xLjEuMzcuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJ4c2x0L3tsaWJ4c2x0XzEuMS4zNS5iYiA9PiBsaWJ4c2x0XzEuMS4z
Ny5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ4c2x0L2xp
YnhzbHRfMS4xLjM1LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEu
MS4zNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJ4c2x0L2xpYnhzbHRfMS4xLjM1LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJ4c2x0L2xpYnhzbHRfMS4xLjM3LmJiCmluZGV4IDJmZDc3Nzc2NmMuLjAwN2U0OWEw
M2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnhzbHQvbGlieHNsdF8xLjEu
MzUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEuMS4zNy5i
YgpAQCAtMTUsNyArMTUsNyBAQCBERVBFTkRTID0gImxpYnhtbDIiCiAKIFNSQ19VUkkgPSAiaHR0
cHM6Ly9kb3dubG9hZC5nbm9tZS5vcmcvc291cmNlcy9saWJ4c2x0LzEuMS9saWJ4c2x0LSR7UFZ9
LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgyNDdmMzNlOWE4NzJjNmFjODU5YWE0
NTAxOGJjNGM0ZDAwYjk3ZTJmZWFjOWVlYmMxMGM5M2NlMWYzNGRkNzkiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiM2E0YjI3ZGM4MDI3Y2NkNjE0NjcyNTk1MDMzNmYxZWM1MjA5MjhmMzIwZjE0NGVi
NWZhNzk5MGFlNjEyM2FiNCIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAibGlieHNsdC0oP1A8
cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAotLSAKMi4zMS4xCgo=

--===============1519104181404645160==--

