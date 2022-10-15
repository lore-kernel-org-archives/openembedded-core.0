Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D38C43219
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:13:01 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web09.24674.1665871975922145832
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nfDsaxjy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010183ddb512a5-f6824f5d-4f0c-4e97-9cb1-9f231d224c3c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871975;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=J6QtlNxQ5LvUJmJ9lVfm99B3veLjPAs+pZSPvL94Syk=;
	b=nfDsaxjy3/aGh9NXCPha8d+2I3b0y+Kw/w03BRZxI+eI61zn7A4czGJefYeq4R+/
	20lK9ncWgAlTEP7B7HFSDD6qCjjsev1Z7s+EjIGpvIutgfTSlnMHbW5ZLTzf8XYTg/A
	pXi2vS5Grwbp2zf/H37cb5fknqmta2uRBvNm/1wI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871975;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=J6QtlNxQ5LvUJmJ9lVfm99B3veLjPAs+pZSPvL94Syk=;
	b=AbRARXEXmUV6L2X4Tge2sSyM6S5a/8s8ZmUga4hafEnPs/WxtXVzseNyBeGBogst
	asW2AfMQ/GmINdWcz5ybQOc1R5jLGxBcWVJNW1tbMeuHmrgJ9Mm0UdtBNAFiJuYEKPE
	3nIqjNWHVjYTTMmItKijONV6C2wZjL9qfYN/QpMM=
Content-Type: multipart/mixed; boundary="===============2359403363183161639=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxslt: upgrading to 1.1.37 FAILED
Message-ID: <01010183ddb512a5-f6824f5d-4f0c-4e97-9cb1-9f231d224c3c-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:12:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171879

--===============2359403363183161639==
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
--===============2359403363183161639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:667c4a69d07b901f829959db09d5799e9eba691c"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 74 Local 67 Mirrors 0 Missed 7 Current 147 (90% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 200 of 221 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 719 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-1.1.37-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.37-r0: task do_fetch: Succeeded
NOTE: Running task 724 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_unpack)
NOTE: recipe libxslt-1.1.37-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 834 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxslt-1.1.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.37-r0: task do_unpack: Succeeded
NOTE: Running task 838 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_patch)
NOTE: recipe libxslt-1.1.37-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_patch: Succeeded
NOTE: Running task 839 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_deploy_source_date_epoch)
NOTE: Running task 840 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_populate_lic)
NOTE: recipe libxslt-1.1.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.37-r0: task do_populate_lic: Started
NOTE: recipe libxslt-1.1.37-r0: task do_populate_lic: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_deploy_source_date_epoch: Succeeded
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libxslt/1.1.37-r0/temp/log.do_configure.2882597
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_configure) failed with exit code '1'

--===============2359403363183161639==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxslt-upgrade-1.1.35-1.1.37.patch"

RnJvbSAwYmM2MTBiYzRiNzUyMjNhYTRhODA3NmJkYWVhMDYwMjkzYjdhMjk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMjE6MTg6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4c2x0OiB1cGdyYWRlIDEuMS4zNSAtPiAxLjEuMzcKCi0tLQogLi4uL2xpYnhzbHQve2xpYnhz
bHRfMS4xLjM1LmJiID0+IGxpYnhzbHRfMS4xLjM3LmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGlieHNsdC97bGlieHNsdF8xLjEuMzUuYmIgPT4gbGlieHNsdF8xLjEu
MzcuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9s
aWJ4c2x0XzEuMS4zNS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnhzbHQvbGlieHNsdF8x
LjEuMzcuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEuMS4zNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEuMS4zNy5iYgppbmRleCAyZmQ3Nzc3NjZjLi4wMDdlNDlh
MDNkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ4c2x0L2xpYnhzbHRfMS4x
LjM1LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnhzbHQvbGlieHNsdF8xLjEuMzcu
YmIKQEAgLTE1LDcgKzE1LDcgQEAgREVQRU5EUyA9ICJsaWJ4bWwyIgogCiBTUkNfVVJJID0gImh0
dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJjZXMvbGlieHNsdC8xLjEvbGlieHNsdC0ke1BW
fS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4MjQ3ZjMzZTlhODcyYzZhYzg1OWFh
NDUwMThiYzRjNGQwMGI5N2UyZmVhYzllZWJjMTBjOTNjZTFmMzRkZDc5IgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjNhNGIyN2RjODAyN2NjZDYxNDY3MjU5NTAzMzZmMWVjNTIwOTI4ZjMyMGYxNDRl
YjVmYTc5OTBhZTYxMjNhYjQiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImxpYnhzbHQtKD9Q
PHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKLS0gCjIuMzEuMQoK

--===============2359403363183161639==--

