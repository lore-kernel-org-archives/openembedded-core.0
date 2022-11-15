Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B30C43219
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:45 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web08.5164.1668517536423112675
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=T5srahv+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101847b65247d-c4a41205-aad6-4e70-856e-0f1f6cc887ca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517537;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yGLBm+0nFv7OiIMRVy80SZkz619mPybEHE04p+WP9lg=;
	b=T5srahv+jsiLgnEaND8w8WvjnKav5Nm44b8qZPRQwKxdNWtyOROnzLMl07uUzVn4
	QRzzT5mSnIvzrlXjviUrh7Af8a66FtH8ptJbnZI62Xf5yZ72O5pDw6jo8xjwiQjF0vG
	2KIENxfZ41VWt8S01KrbQjI9cEti5Rnp7L1oJeBY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517537;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yGLBm+0nFv7OiIMRVy80SZkz619mPybEHE04p+WP9lg=;
	b=Rh1RyLOKrhq4udwUXw6sB4NKk5RFwOqbMkZ+nkQ5d4GY3C45nok4T8/9BmlZc8eo
	LjW1V58qySP849Eu8AR3k4OS8768XXtrj2G8KyzfWN1ci4iVhCy/jtPWBn7u0wH3pBH
	TrA1/OS+F8C4tHW6c/z/aEICV12tiFLGV3t6AjyY=
Content-Type: multipart/mixed; boundary="===============1831719348673159355=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] at-spi2-core: upgrading to 2.46.0 FAILED
Message-ID: <010101847b65247d-c4a41205-aad6-4e70-856e-0f1f6cc887ca-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173343

--===============1831719348673159355==
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
--===============1831719348673159355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1665 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (886 cached, 1 parsed). 1665 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:bea53ab800f953d65f03cdf5c14d82b9123e434f"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 161 Local 154 Mirrors 0 Missed 7 Current 287 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 421 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1096 of 1615 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 1115 of 1615 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: Running task 1116 of 1615 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: Running task 1117 of 1615 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: Running task 1118 of 1615 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1119 of 1615 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_lic)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_lic: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_lic: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1598 of 1615 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1607 of 1615 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: Running task 1608 of 1615 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 1609 of 1615 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 1610 of 1615 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: Running task 1611 of 1615 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 1611 tasks of which 1599 didn't need to be rerun and 1 failed.
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
  /usr/lib/gtk-2.0/modules/libatk-bridge.so
  /usr/lib/gnome-settings-daemon-3.0/gtk-modules
  /usr/lib/gnome-settings-daemon-3.0/gtk-modules/at-spi2-atk.desktop
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
at-spi2-core: 4 installed and not shipped files. [installed-vs-shipped]
ERROR: at-spi2-core-2.46.0-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/at-spi2-core/2.46.0-r0/temp/log.do_package.1241246
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package) failed with exit code '1'

--===============1831719348673159355==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-at-spi2-core-upgrade-2.44.1-2.46.0.patch"

RnJvbSAwYTRhOTVlNWY1NzM1ODg1MDFhZDFmNjViNzVjN2RhZjZhZjExZGMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMTI6MzE6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
dC1zcGkyLWNvcmU6IHVwZ3JhZGUgMi40NC4xIC0+IDIuNDYuMAoKLS0tCiAuLi4vYXRrL3thdC1z
cGkyLWNvcmVfMi40NC4xLmJiID0+IGF0LXNwaTItY29yZV8yLjQ2LjAuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsve2F0LXNwaTItY29yZV8yLjQ0LjEuYmIgPT4gYXQtc3Bp
Mi1jb3JlXzIuNDYuMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9hdGsvYXQtc3BpMi1jb3JlXzIuNDQuMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9h
dC1zcGkyLWNvcmVfMi40Ni4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9hdC1zcGkyLWNvcmVfMi40NC4xLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsvYXQtc3BpMi1jb3JlXzIuNDYuMC5iYgppbmRleCA5NWE2
YzYxOWYwLi4wZDcwZWJlMjE2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsv
YXQtc3BpMi1jb3JlXzIuNDQuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsvYXQt
c3BpMi1jb3JlXzIuNDYuMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBNQUpfVkVSID0gIiR7QG9lLnV0
aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0iLCAyKX0iCiAKIFNSQ19VUkkgPSAiJHtHTk9NRV9NSVJS
T1J9LyR7QlBOfS8ke01BSl9WRVJ9LyR7QlBOfS0ke1BWfS50YXIueHoiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI0YmViMjMyNzBiYTZjZjdjYWYyMGI1OTczNTRkNzUxOTRkODlhZmI2OWQyZWZj
ZjE1ZjQyNzE2ODhiYTZmNzQ2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImFhMGM4NmM3OWY3YThk
NjdiYWU0OWE1YjdhNWFiMDg0MzBjNjA4Y2ZmZTZlMzNiZjQ3YTcyZjQxYWIwM2MzZDAiCiAKIFgx
MURFUEVORFMgPSAidmlydHVhbC9saWJ4MTEgbGlieGkgbGlieHRzdCIKIAotLSAKMi4zMS4xCgo=

--===============1831719348673159355==--

