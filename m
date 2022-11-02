Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DAAC6FD1A
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:41 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.876.1667349633334240739
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mWvxh1QO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018435c865ed-e3f696c9-3730-4141-a49b-f4c274bbd326-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tVRKyXGFZhmu0kYlySJY9yVOAY8bvS4cSW+HSGhaVVg=;
	b=mWvxh1QO4t0tbvDX2mvdsdpGdHvpAbtZxLQvq1SuWiwrtIt2hxSjOjTkenSAb3y9
	YFPj6n2kt1RAhKn9HTkMaTqBoJCL14fPNCXH1xx3T92vjEAAFVh0sVaS03DPe705He9
	7t82/aut1SGDOSjAk19TS1q9OkZNHAACftz4lwbY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tVRKyXGFZhmu0kYlySJY9yVOAY8bvS4cSW+HSGhaVVg=;
	b=djjCliZsyZ+HHrYMyYYT4uC0q78352tXn46sYcLKfmLOmhcwChW8e58zB4sVLr55
	+z+Dn1IGKDfx5PBSMegXaJawUAUxj/CsGGyGuuDSKPckFEdYxVdhnI/sTi1Y71Oq184
	Zd+GyDGkW4XtLaCRG8zqVXwaVqRxXCfJNal5LG7o=
Content-Type: multipart/mixed; boundary="===============0615337990797535461=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] at-spi2-core: upgrading to 2.46.0 FAILED
Message-ID: <0101018435c865ed-e3f696c9-3730-4141-a49b-f4c274bbd326-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172518

--===============0615337990797535461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *at-spi2-core* to *2.46.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-at-spi2-core-upgrade-2.44.1-2.46.0.patch
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
--===============0615337990797535461==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-at-spi2-core-upgrade-2.44.1-2.46.0.patch"

RnJvbSBhZWNlNTUyYjFkMTFhMjJjMDRiMmU1M2MyMDE0ZTAxYmMxMDY2MGMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAyMjoyNDoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGF0
LXNwaTItY29yZTogdXBncmFkZSAyLjQ0LjEgLT4gMi40Ni4wCgotLS0KIC4uLi9hdGsve2F0LXNw
aTItY29yZV8yLjQ0LjEuYmIgPT4gYXQtc3BpMi1jb3JlXzIuNDYuMC5iYn0gICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2F0ay97YXQtc3BpMi1jb3JlXzIuNDQuMS5iYiA9PiBhdC1zcGky
LWNvcmVfMi40Ni4wLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2F0ay9hdC1zcGkyLWNvcmVfMi40NC4xLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXRrL2F0
LXNwaTItY29yZV8yLjQ2LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLXN1cHBvcnQvYXRrL2F0LXNwaTItY29yZV8yLjQ0LjEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9hdC1zcGkyLWNvcmVfMi40Ni4wLmJiCmluZGV4IDk1YTZj
NjE5ZjAuLjBkNzBlYmUyMTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9h
dC1zcGkyLWNvcmVfMi40NC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9hdC1z
cGkyLWNvcmVfMi40Ni4wLmJiCkBAIC0xMSw3ICsxMSw3IEBAIE1BSl9WRVIgPSAiJHtAb2UudXRp
bHMudHJpbV92ZXJzaW9uKCIke1BWfSIsIDIpfSIKIAogU1JDX1VSSSA9ICIke0dOT01FX01JUlJP
Un0vJHtCUE59LyR7TUFKX1ZFUn0vJHtCUE59LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjRiZWIyMzI3MGJhNmNmN2NhZjIwYjU5NzM1NGQ3NTE5NGQ4OWFmYjY5ZDJlZmNm
MTVmNDI3MTY4OGJhNmY3NDYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWEwYzg2Yzc5ZjdhOGQ2
N2JhZTQ5YTViN2E1YWIwODQzMGM2MDhjZmZlNmUzM2JmNDdhNzJmNDFhYjAzYzNkMCIKIAogWDEx
REVQRU5EUyA9ICJ2aXJ0dWFsL2xpYngxMSBsaWJ4aSBsaWJ4dHN0IgogCi0tIAoyLjMxLjEKCg==

--===============0615337990797535461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1664 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:9c9285d8a995f00b1771b3ad77378956accc155a"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 148 Local 141 Mirrors 0 Missed 7 Current 299 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 432 of 447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1099 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 1118 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: Running task 1119 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: Running task 1120 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: Running task 1121 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1122 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_lic)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_lic: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1597 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1606 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: Running task 1607 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 1608 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 1609 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: Running task 1610 of 1614 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 1610 tasks of which 1598 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: at-spi2-core-2.46.0-r0 do_package: QA Issue: at-spi2-core: Files/directories were installed but not shipped in any package:
  /usr/lib/gnome-settings-daemon-3.0
  /usr/lib/gnome-settings-daemon-3.0/gtk-modules
  /usr/lib/gnome-settings-daemon-3.0/gtk-modules/at-spi2-atk.desktop
  /usr/lib/gtk-2.0/modules/libatk-bridge.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
at-spi2-core: 4 installed and not shipped files. [installed-vs-shipped]
ERROR: at-spi2-core-2.46.0-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/at-spi2-core/2.46.0-r0/temp/log.do_package.1094936
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package) failed with exit code '1'

--===============0615337990797535461==--

