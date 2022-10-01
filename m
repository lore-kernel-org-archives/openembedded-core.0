Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DEDC3A59E
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.478.1664643226300245194
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jHf33p1X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 010101839477e665-ca0dff93-2841-472e-89d6-8455d1afa6c5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2zP0UoEYB5d0qgXBZCVmL9qkvcaMOECAyMDRl3RIoZg=;
	b=jHf33p1XTi51TpivojtEq6tRXA3LxA0Ul9Xm+l+qCeTJ10GRjt5ergCfRXpnxPsN
	5Ie2djO5QLMvBTI2vQJDGguo23DYbpC0WNC31/TVgotqYyVYGxymjOxAAUQ67iICkjj
	kDIXu8/Y6Q5r5f9p+eMxZGHd7AEYpRJrV1STKyIs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2zP0UoEYB5d0qgXBZCVmL9qkvcaMOECAyMDRl3RIoZg=;
	b=JtsOKdQenEdThRlQVQDjWuHWMgZVcUqUEH8s2oBTuD4XJ5mpn3Ym2u/c/xLMIcbU
	9RnCQ7rvG7YRCXnJ5B1qoV/PkFgMiJgxPZbQ6tqA+6ZgHHAbNvCZ9ptu5o8RizaigMn
	Z7ja7+vPKoy/SBZxvQ24eGcZW0xxz/C18fnDV8+c=
Content-Type: multipart/mixed; boundary="===============4945054316761736872=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nghttp2: upgrading to 1.50.0 SUCCEEDED
Message-ID: 
 <010101839477e665-ca0dff93-2841-472e-89d6-8455d1afa6c5-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:49 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171318

--===============4945054316761736872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *nghttp2* to *1.50.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-nghttp2-upgrade-1.49.0-1.50.0.patch
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
--===============4945054316761736872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/nghttp2/libnghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.23.0", added "/usr/lib/libnghttp2.so.14.24.0"
Changes to packages/core2-32-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.23.0 to libnghttp2.so.14.24.0
  /usr/lib/libnghttp2.so.14.23.0 moved to /usr/lib/libnghttp2.so.14.24.0

--===============4945054316761736872==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nghttp2-upgrade-1.49.0-1.50.0.patch"

RnJvbSA1ZWNiNDJmYjgzMDc2MjY2YzhiZjRiZTJjNWI3YTI5MmRjZTBkYTUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAxNjoxODowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5n
aHR0cDI6IHVwZ3JhZGUgMS40OS4wIC0+IDEuNTAuMAoKLS0tCiAuLi4vbmdodHRwMi97bmdodHRw
Ml8xLjQ5LjAuYmIgPT4gbmdodHRwMl8xLjUwLjAuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9uZ2h0dHAyL3tuZ2h0dHAyXzEuNDkuMC5iYiA9PiBuZ2h0dHAyXzEuNTAu
MC5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25n
aHR0cDJfMS40OS4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEu
NTAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9uZ2h0dHAyL25naHR0cDJfMS40OS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9uZ2h0dHAyL25naHR0cDJfMS41MC4wLmJiCmluZGV4IDZjM2Q1NDMwODMuLjY2MzExYjJl
ZGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjQ5
LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNTAuMC5i
YgpAQCAtOCw3ICs4LDcgQEAgU1JDX1VSSSA9ICJcCiAgICAgJHtHSVRIVUJfQkFTRV9VUkl9L2Rv
d25sb2FkL3Yke1BWfS9uZ2h0dHAyLSR7UFZ9LnRhci54eiBcCiAgICAgZmlsZTovLzAwMDEtZmV0
Y2gtb2NzcC1yZXNwb25zZS11c2UtcHl0aG9uMy5wYXRjaCBcCiAiCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYjBjZmQ0OTJiYmYwYjEzMWM0NzJlOGY2NTAxYzlmNGVlODJiNTFiNjgxMzBmNDdiMjc4
YzBiN2M5ODQ4YTY2ZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhZjI0MDA3ZTM0YzE4Yzc4MjM5
M2ExZGMzNjg1ZjhmZDViNTAyODNlOTBhOTE5MWQyNTQ4OGViNTBhYTJjODI1IgogCiBpbmhlcml0
IGNtYWtlIG1hbnBhZ2VzIHB5dGhvbjNuYXRpdmUgZ2l0aHViLXJlbGVhc2VzCiBQQUNLQUdFQ09O
RklHW21hbnBhZ2VzXSA9ICIiCi0tIAoyLjMxLjEKCg==

--===============4945054316761736872==
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
meta-yocto-bsp       = "tmp-auh-upgrades:54e903fed7c845f2dffcd5762df1577a96e8b0e6"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 30 Mirrors 0 Missed 8 Current 251 (78% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 258 of 289 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 289 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running task 854 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_fetch)
NOTE: Running task 1041 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_package_write_rpm)
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_fetch: Succeeded
NOTE: Running task 1042 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libcap/2.65-r0/temp/log.do_packagedata_setscene.3757995
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libffi/3.4.2-r0/temp/log.do_packagedata_setscene.3757996
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 286 of 289 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_package_setscene)
NOTE: Running setscene task 287 of 289 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_package_setscene)
NOTE: Running task 1043 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.50.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.65-r0: task do_package_setscene: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.2-r0: task do_package_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_package_write_rpm: Started
NOTE: recipe libffi-3.4.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libcap-2.65-r0: task do_package_setscene: Succeeded
NOTE: Running task 1060 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata)
NOTE: Setscene tasks completed
NOTE: Running task 1078 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata: Started
NOTE: recipe libcap-2.65-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_unpack: Succeeded
NOTE: Running task 1080 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_patch)
NOTE: recipe nghttp2-1.50.0-r0: task do_patch: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe libcap-2.65-r0: task do_packagedata: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_patch: Succeeded
NOTE: Running task 1081 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1082 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_generate_toolchain_file)
NOTE: Running task 1088 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_populate_lic)
NOTE: recipe nghttp2-1.50.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_lic: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_populate_lic unihash changed to 73df1f8fd8149b5e565beee575b79b4e4d6af98d513cb4143359a890668a7ae0
NOTE: recipe nghttp2-1.50.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1089 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_configure)
NOTE: recipe nghttp2-1.50.0-r0: task do_configure: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_configure: Succeeded
NOTE: Running task 1090 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_compile)
NOTE: recipe nghttp2-1.50.0-r0: task do_compile: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_compile: Succeeded
NOTE: Running task 1091 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_install)
NOTE: recipe nghttp2-1.50.0-r0: task do_install: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_install: Succeeded
NOTE: Running task 1092 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_package)
NOTE: Running task 1093 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_populate_sysroot)
NOTE: recipe nghttp2-1.50.0-r0: task do_package: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_package: Succeeded
NOTE: Running task 1094 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_packagedata)
NOTE: recipe nghttp2-1.50.0-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1095 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_package_write_rpm)
NOTE: Running task 1096 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_package_qa)
NOTE: recipe nghttp2-1.50.0-r0: task do_package_write_rpm: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_package_qa: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_package_qa: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1097 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1097 tasks of which 1078 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-src went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dbg went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-staticdev went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-src went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dev went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-dbg went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-doc went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-staticdev went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-locale went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-dev went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-bin went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-doc went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-locale went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4945054316761736872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/nghttp2: PV changed from "1.49.0" to "1.50.0"
packages/core2-32-poky-linux/nghttp2: PKGV changed from 1.49.0 [default] to 1.50.0 [default]
packages/core2-32-poky-linux/nghttp2: SRC_URI changed from "https://github.com/nghttp2/nghttp2/releases//download/v1.49.0/nghttp2-1.49.0.tar.xz file://0001-fetch-ocsp-response-use-python3.patch" to "https://github.com/nghttp2/nghttp2/releases//download/v1.50.0/nghttp2-1.50.0.tar.xz file://0001-fetch-ocsp-response-use-python3.patch"
packages/core2-32-poky-linux/nghttp2/libnghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.23.0", added "/usr/lib/libnghttp2.so.14.24.0"
packages/core2-32-poky-linux/nghttp2/libnghttp2: PV changed from "1.49.0" to "1.50.0"
packages/core2-32-poky-linux/nghttp2/libnghttp2: PKGV changed from 1.49.0 [default] to 1.50.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-client: PV changed from "1.49.0" to "1.50.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-client: PKGV changed from 1.49.0 [default] to 1.50.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-dbg: FILELIST: removed "/usr/lib/.debug/libnghttp2.so.14.23.0", added "/usr/lib/.debug/libnghttp2.so.14.24.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-dbg: PV changed from "1.49.0" to "1.50.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-dbg: PKGSIZE changed from 463624 to 464512 (+0%)
packages/core2-32-poky-linux/nghttp2/nghttp2-dbg: PKGV changed from 1.49.0 [default] to 1.50.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-dev: PV changed from "1.49.0" to "1.50.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-dev: PKGSIZE changed from 207176 to 207588 (+0%)
packages/core2-32-poky-linux/nghttp2/nghttp2-dev: PKGV changed from 1.49.0 [default] to 1.50.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-doc: PV changed from "1.49.0" to "1.50.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-doc: PKGV changed from 1.49.0 [default] to 1.50.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-locale: PV changed from "1.49.0" to "1.50.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-locale: PKGV changed from 1.49.0 [default] to 1.50.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-proxy: PV changed from "1.49.0" to "1.50.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-proxy: PKGV changed from 1.49.0 [default] to 1.50.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-server: PV changed from "1.49.0" to "1.50.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-server: PKGV changed from 1.49.0 [default] to 1.50.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-src: PV changed from "1.49.0" to "1.50.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-src: PKGSIZE changed from 1006030 to 1008607 (+0%)
packages/core2-32-poky-linux/nghttp2/nghttp2-src: PKGV changed from 1.49.0 [default] to 1.50.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-staticdev: PV changed from "1.49.0" to "1.50.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-staticdev: PKGV changed from 1.49.0 [default] to 1.50.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2: PV changed from "1.49.0" to "1.50.0"
packages/core2-32-poky-linux/nghttp2/nghttp2: PKGV changed from 1.49.0 [default] to 1.50.0 [default]
Changes to packages/core2-32-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.23.0 to libnghttp2.so.14.24.0
  /usr/lib/libnghttp2.so.14.23.0 moved to /usr/lib/libnghttp2.so.14.24.0

--===============4945054316761736872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1662 targets, 49 skipped, 0 masked, 0 errors.
Removing 37 recipes from the core2-32 sysroot...done.
Removing 64 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:54e903fed7c845f2dffcd5762df1577a96e8b0e6"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 162 Local 154 Mirrors 0 Missed 8 Current 123 (95% match, 97% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 125 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 126 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_package_write_rpm_setscene)
NOTE: Running task 568 of 1082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_fetch)
NOTE: recipe nghttp2-1.50.0-r0: task do_fetch: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_fetch: Succeeded
NOTE: Running task 634 of 1082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_unpack)
NOTE: recipe python3-3.10.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_unpack: Started
NOTE: recipe python3-3.10.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 153 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 154 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 155 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 156 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 157 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 158 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_unpack: Succeeded
NOTE: Running task 647 of 1082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_patch)
NOTE: recipe nghttp2-1.50.0-r0: task do_patch: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 169 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 171 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 173 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.50.0-r0: task do_patch: Succeeded
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 176 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 178 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 180 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 183 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 185 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 187 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 189 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 191 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_packagedata_setscene)
NOTE: Running task 660 of 1082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 661 of 1082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_generate_toolchain_file)
NOTE: Running task 662 of 1082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_populate_lic)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_lic: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libcap/2.65-r0/temp/log.do_packagedata_setscene.3763491
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 193 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_package_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.3-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libffi/3.4.2-r0/temp/log.do_packagedata_setscene.3763530
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_lic: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_populate_lic unihash changed to 73df1f8fd8149b5e565beee575b79b4e4d6af98d513cb4143359a890668a7ae0
NOTE: Running setscene task 195 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_package_setscene)
NOTE: Running setscene task 196 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 205 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 211 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_package_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.65-r0: task do_package_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_package_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_package_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libcap-2.65-r0: task do_package_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 225 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 229 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 231 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 236 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 241 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 250 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 251 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 254 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 258 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 260 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 262 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 263 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 266 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 269 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 270 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 279 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 282 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 283 of 285 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1004 of 1082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1016 of 1082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata)
NOTE: Running task 1059 of 1082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata)
NOTE: Running task 1068 of 1082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_package_write_rpm)
NOTE: recipe nghttp2-1.50.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata: Started
NOTE: recipe libcap-2.65-r0: task do_packagedata: Started
NOTE: recipe openssl-3.0.5-r0: task do_package_write_rpm: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe libcap-2.65-r0: task do_packagedata: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1074 of 1082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_configure)
NOTE: recipe nghttp2-1.50.0-r0: task do_configure: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_configure: Succeeded
NOTE: Running task 1075 of 1082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_compile)
NOTE: recipe nghttp2-1.50.0-r0: task do_compile: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_compile: Succeeded
NOTE: Running task 1076 of 1082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_install)
NOTE: recipe nghttp2-1.50.0-r0: task do_install: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_install: Succeeded
NOTE: Running task 1077 of 1082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_package)
NOTE: Running task 1078 of 1082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_populate_sysroot)
NOTE: recipe nghttp2-1.50.0-r0: task do_package: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_package: Succeeded
NOTE: Running task 1079 of 1082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_packagedata)
NOTE: recipe nghttp2-1.50.0-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1080 of 1082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_package_write_rpm)
NOTE: Running task 1081 of 1082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_package_qa)
NOTE: recipe nghttp2-1.50.0-r0: task do_package_write_rpm: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_package_qa: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_package_qa: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1082 of 1082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1082 tasks of which 1063 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-src went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dbg went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-staticdev went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dev went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-doc went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-locale went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-bin went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-src went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-dbg went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-staticdev went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-dev went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-doc went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-locale went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4945054316761736872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 51 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:54e903fed7c845f2dffcd5762df1577a96e8b0e6"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 30 Mirrors 0 Missed 8 Current 251 (78% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 258 of 289 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 289 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running task 854 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_fetch)
NOTE: Running task 1041 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_package_write_rpm)
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_fetch: Succeeded
NOTE: Running task 1042 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libcap/2.65-r0/temp/log.do_packagedata_setscene.3748354
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libffi/3.4.2-r0/temp/log.do_packagedata_setscene.3748355
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 286 of 289 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_package_setscene)
NOTE: Running setscene task 287 of 289 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_package_setscene)
NOTE: Running task 1043 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.50.0-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.65-r0: task do_package_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_package_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_package_write_rpm: Started
NOTE: recipe libffi-3.4.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libcap-2.65-r0: task do_package_setscene: Succeeded
NOTE: Running task 1060 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata)
NOTE: Setscene tasks completed
NOTE: Running task 1078 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata)
NOTE: recipe nghttp2-1.50.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata: Started
NOTE: recipe libcap-2.65-r0: task do_packagedata: Started
NOTE: Running task 1080 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_patch)
NOTE: recipe nghttp2-1.50.0-r0: task do_patch: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_patch: Succeeded
NOTE: Running task 1081 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1082 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_generate_toolchain_file)
NOTE: Running task 1083 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_populate_lic)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe libcap-2.65-r0: task do_packagedata: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_lic: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_populate_lic unihash changed to 73df1f8fd8149b5e565beee575b79b4e4d6af98d513cb4143359a890668a7ae0
NOTE: recipe nghttp2-1.50.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1089 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_configure)
NOTE: recipe nghttp2-1.50.0-r0: task do_configure: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_configure: Succeeded
NOTE: Running task 1090 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_compile)
NOTE: recipe nghttp2-1.50.0-r0: task do_compile: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_compile: Succeeded
NOTE: Running task 1091 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_install)
NOTE: recipe nghttp2-1.50.0-r0: task do_install: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_install: Succeeded
NOTE: Running task 1092 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_package)
NOTE: Running task 1093 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_populate_sysroot)
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_package: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_package: Succeeded
NOTE: Running task 1094 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_packagedata)
NOTE: recipe nghttp2-1.50.0-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1095 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_package_write_rpm)
NOTE: Running task 1096 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_package_qa)
NOTE: recipe nghttp2-1.50.0-r0: task do_package_write_rpm: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_package_qa: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_package_qa: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1097 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1097 tasks of which 1078 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-src went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dbg went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-src went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-staticdev went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-dbg went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dev went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-staticdev went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-doc went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-dev went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-locale went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-doc went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-bin went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-locale went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4945054316761736872==
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
meta-yocto-bsp       = "tmp-auh-upgrades:54e903fed7c845f2dffcd5762df1577a96e8b0e6"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 30 Mirrors 0 Missed 8 Current 251 (78% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 258 of 289 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 289 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running task 854 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_fetch)
NOTE: Running task 1041 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_package_write_rpm)
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_fetch: Succeeded
NOTE: Running task 1042 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libcap/2.65-r0/temp/log.do_packagedata_setscene.3743561
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libffi/3.4.2-r0/temp/log.do_packagedata_setscene.3743562
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 286 of 289 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_package_setscene)
NOTE: Running setscene task 287 of 289 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_package_setscene)
NOTE: Running task 1043 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.50.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.65-r0: task do_package_setscene: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.2-r0: task do_package_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_package_write_rpm: Started
NOTE: recipe libffi-3.4.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libcap-2.65-r0: task do_package_setscene: Succeeded
NOTE: Running task 1060 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata)
NOTE: Setscene tasks completed
NOTE: Running task 1078 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata: Started
NOTE: recipe libcap-2.65-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_unpack: Succeeded
NOTE: Running task 1080 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_patch)
NOTE: recipe nghttp2-1.50.0-r0: task do_patch: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_patch: Succeeded
NOTE: Running task 1081 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1082 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_generate_toolchain_file)
NOTE: Running task 1083 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_populate_lic)
NOTE: recipe libcap-2.65-r0: task do_packagedata: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_lic: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_populate_lic unihash changed to 73df1f8fd8149b5e565beee575b79b4e4d6af98d513cb4143359a890668a7ae0
NOTE: recipe nghttp2-1.50.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1089 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_configure)
NOTE: recipe nghttp2-1.50.0-r0: task do_configure: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_configure: Succeeded
NOTE: Running task 1090 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_compile)
NOTE: recipe nghttp2-1.50.0-r0: task do_compile: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_compile: Succeeded
NOTE: Running task 1091 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_install)
NOTE: recipe nghttp2-1.50.0-r0: task do_install: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_install: Succeeded
NOTE: Running task 1092 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_package)
NOTE: Running task 1093 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_populate_sysroot)
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_package: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_package: Succeeded
NOTE: Running task 1094 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_packagedata)
NOTE: recipe nghttp2-1.50.0-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1095 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_package_write_rpm)
NOTE: Running task 1096 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_package_qa)
NOTE: recipe nghttp2-1.50.0-r0: task do_package_write_rpm: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_package_qa: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_package_qa: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1097 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1097 tasks of which 1078 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-src went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dbg went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-staticdev went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-src went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dev went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-dbg went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-doc went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-staticdev went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-dev went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-locale went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-doc went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-bin went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-locale went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4945054316761736872==
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
meta-yocto-bsp       = "tmp-auh-upgrades:54e903fed7c845f2dffcd5762df1577a96e8b0e6"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 30 Mirrors 0 Missed 8 Current 251 (78% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 258 of 289 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 289 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running task 854 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_fetch)
NOTE: Running task 1041 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_package_write_rpm)
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_fetch: Succeeded
NOTE: Running task 1042 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libcap/2.65-r0/temp/log.do_packagedata_setscene.3753200
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libffi/3.4.2-r0/temp/log.do_packagedata_setscene.3753201
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 286 of 289 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_package_setscene)
NOTE: Running setscene task 287 of 289 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_package_setscene)
NOTE: Running task 1043 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.50.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.65-r0: task do_package_setscene: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.2-r0: task do_package_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_package_write_rpm: Started
NOTE: recipe libffi-3.4.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libcap-2.65-r0: task do_package_setscene: Succeeded
NOTE: Running task 1060 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata)
NOTE: Setscene tasks completed
NOTE: Running task 1078 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata: Started
NOTE: recipe libcap-2.65-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_unpack: Succeeded
NOTE: Running task 1080 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_patch)
NOTE: recipe nghttp2-1.50.0-r0: task do_patch: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1081 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.65-r0: task do_packagedata: Succeeded
NOTE: Running task 1082 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_generate_toolchain_file)
NOTE: Running task 1083 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_populate_lic)
NOTE: recipe nghttp2-1.50.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_lic: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_populate_lic unihash changed to 73df1f8fd8149b5e565beee575b79b4e4d6af98d513cb4143359a890668a7ae0
NOTE: recipe nghttp2-1.50.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1089 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_configure)
NOTE: recipe nghttp2-1.50.0-r0: task do_configure: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_configure: Succeeded
NOTE: Running task 1090 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_compile)
NOTE: recipe nghttp2-1.50.0-r0: task do_compile: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_compile: Succeeded
NOTE: Running task 1091 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_install)
NOTE: recipe nghttp2-1.50.0-r0: task do_install: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_install: Succeeded
NOTE: Running task 1092 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_package)
NOTE: Running task 1093 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_populate_sysroot)
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_package: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_package: Succeeded
NOTE: Running task 1094 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_packagedata)
NOTE: recipe nghttp2-1.50.0-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1095 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_package_write_rpm)
NOTE: Running task 1096 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_package_qa)
NOTE: recipe nghttp2-1.50.0-r0: task do_package_write_rpm: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_package_qa: Started
NOTE: recipe nghttp2-1.50.0-r0: task do_package_qa: Succeeded
NOTE: recipe nghttp2-1.50.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1097 of 1097 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1097 tasks of which 1078 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-src went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dbg went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-src went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-staticdev went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-dbg went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dev went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-staticdev went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-doc went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-dev went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-locale went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-doc went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-bin went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-locale went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: QA Issue: Package version for package libcap went backwards which would break package feeds (from 0:2.66-r0 to 0:2.65-r0) [version-going-backwards]
ERROR: libcap-2.65-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package libffi went backwards which would break package feeds (from 0:3.4.3-r0 to 0:3.4.2-r0) [version-going-backwards]
ERROR: libffi-3.4.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4945054316761736872==--

