Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57064C7EE21
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.30357.1675272855166222111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gyWIAySL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101860e0b18e7-4cf9e2c4-f64c-44e2-9b12-fde46a582d0c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=E3N2HNxx2g0gfRO+1WR7H0SLnu4zcLdKNqsbWVyWmNg=;
	b=gyWIAySL4af1LeXIMN7sgiDdj2Oz2MEL0Rjrnu+/ueJulhqfZOlhv9HQlquHInpq
	J88MSSUOEl9YUoiPDeDn1IOxLt7YGllC3QKOEY+es4eCHc3kVCyvZqArdOl7nJSPStQ
	cFEn1BJRAtI8WyCTXeq89C/2yBNDIoEr4W6JJMiQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=E3N2HNxx2g0gfRO+1WR7H0SLnu4zcLdKNqsbWVyWmNg=;
	b=DDuodMG7Tab5VtPJJ2hcVTh9sZpRn9hHcUnz3jY+kiL+fbOK5Sywkqz2qmLBcQly
	azJkiDj3ZmqCn1psGjf+Ez3MwV8pz7hDOnnGjdWk5zUG8GSem9Xiw96T5bKVpzWjF5g
	ElrbUzI9dcWGp4/MIzEf4tW8z7icEqAzQQK3TeWY=
Content-Type: multipart/mixed; boundary="===============6851211992370549617=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.25.2 FAILED
Message-ID: <010101860e0b18e7-4cf9e2c4-f64c-44e2-9b12-fde46a582d0c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176587

--===============6851211992370549617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.25.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.25.1-3.25.2.patch
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
--===============6851211992370549617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (896 cached, 2 parsed). 1697 targets, 41 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:6959cc1741b1b5dcb74ea6f5bf270b0a5057036d"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 60 Local 48 Mirrors 0 Missed 12 Current 168 (80% match, 94% complete)
Removing 1 stale sstate objects for arch qemux86...done.
Removing 2 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Running setscene task 188 of 228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 681 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.25.1.bb:do_fetch)
NOTE: Running task 774 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.25.2.bb:do_fetch)
NOTE: recipe cmake-native-3.25.1-r0: task do_fetch: Started
WARNING: cmake-native-3.25.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.25.1.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.25.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.25.1.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.25.1.tar.gz_bad-checksum_1c511d09516af493694ed9baf13c55947a36389674d657a2d5e0ccedc6b291d8
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-3.25.2-r0: task do_fetch: Started
NOTE: recipe cmake-3.25.2-r0: task do_fetch: Succeeded
NOTE: Running task 848 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.25.2.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 849 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: recipe cmake-3.25.2-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 850 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 851 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: Running task 852 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cmake-3.25.2-r0: task do_unpack: Succeeded
NOTE: Running task 854 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.25.2.bb:do_patch)
NOTE: recipe cmake-3.25.2-r0: task do_patch: Started
NOTE: recipe cmake-3.25.2-r0: task do_patch: Succeeded
NOTE: Running task 855 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.25.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 856 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.25.2.bb:do_generate_toolchain_file)
NOTE: Running task 857 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.25.2.bb:do_populate_lic)
WARNING: cmake-native-3.25.1-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.25/cmake-3.25.1.tar.gz - will attempt other sources if available
NOTE: recipe cmake-3.25.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cmake-3.25.2-r0: task do_populate_lic: Started
NOTE: recipe cmake-3.25.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe cmake-3.25.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cmake-3.25.2-r0: task do_populate_lic: Succeeded
NOTE: recipe cmake-3.25.2-r0: task do_deploy_source_date_epoch: Succeeded
WARNING: cmake-native-3.25.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.25.1.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.25.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.25.1.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.25.1.tar.gz_bad-checksum_1c511d09516af493694ed9baf13c55947a36389674d657a2d5e0ccedc6b291d8
NOTE: recipe cmake-native-3.25.1-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 857 tasks of which 846 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.25.1.bb:do_fetch
Summary: There were 6 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cmake-native-3.25.1-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.25/cmake-3.25.1.tar.gz
ERROR: cmake-native-3.25.1-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.25.1.tar.gz\' has sha256 checksum \'1c511d09516af493694ed9baf13c55947a36389674d657a2d5e0ccedc6b291d8\' when \'c026f22cb931dd532f648f087d587f07a1843c6e66a3dfca4fb0ea21944ed33c\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "1c511d09516af493694ed9baf13c55947a36389674d657a2d5e0ccedc6b291d8"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cmake.org/files/v3.25/cmake-3.25.1.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/cmake-native/3.25.1-r0/temp/log.do_fetch.1397760
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.25.1.bb:do_fetch) failed with exit code '1'

--===============6851211992370549617==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.25.1-3.25.2.patch"

RnJvbSA4M2ZjZGU3OGJlNWQyMDZhNzQxYjI2MDdmZDlkNTUzN2VkYjE3Y2FmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAwODoyMTo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlOiB1cGdyYWRlIDMuMjUuMSAtPiAzLjI1LjIKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlLmluYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uMS1D
TWFrZURldGVybWluZVN5c3RlbS11c2Utb2UtZW52aXJvbm1lbnQtdmFycy10by1sb2FkLnBhdGNo
IHwgMiArLQogLi4uL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzMuMjUuMS5iYiA9PiBj
bWFrZV8zLjI1LjIuYmJ9IHwgMAogMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZV8z
LjI1LjEuYmIgPT4gY21ha2VfMy4yNS4yLmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Nt
YWtlL2NtYWtlLmluYwppbmRleCA3ZGE5YTJmYjU1Li5iN2U2NzRjNGM0IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKQEAgLTE5LDcgKzE5LDcgQEAgQ01BS0VfTUFKT1JfVkVS
U0lPTiA9ICIke0AnLicuam9pbihkLmdldFZhcignUFYnKS5zcGxpdCgnLicpWzA6Ml0pfSIKIFNS
Q19VUkkgPSAiaHR0cHM6Ly9jbWFrZS5vcmcvZmlsZXMvdiR7Q01BS0VfTUFKT1JfVkVSU0lPTn0v
Y21ha2UtJHtQVn0udGFyLmd6IFwKICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFjNTExZDA5
NTE2YWY0OTM2OTRlZDliYWYxM2M1NTk0N2EzNjM4OTY3NGQ2NTdhMmQ1ZTBjY2VkYzZiMjkxZDgi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzAyNmYyMmNiOTMxZGQ1MzJmNjQ4ZjA4N2Q1ODdmMDdh
MTg0M2M2ZTY2YTNkZmNhNGZiMGVhMjE5NDRlZDMzYyIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVgg
PSAiY21ha2UtKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNNYWtlRGV0ZXJtaW5lU3lzdGVtLXVz
ZS1vZS1lbnZpcm9ubWVudC12YXJzLXRvLWxvYWQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZURldGVybWluZVN5c3RlbS11c2Utb2UtZW52aXJvbm1l
bnQtdmFycy10by1sb2FkLnBhdGNoCmluZGV4IDQ1MWI2ZWJmYWQuLmQxM2MzNjdlNzggMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNNYWtlRGV0ZXJt
aW5lU3lzdGVtLXVzZS1vZS1lbnZpcm9ubWVudC12YXJzLXRvLWxvYWQucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VEZXRlcm1pbmVTeXN0ZW0t
dXNlLW9lLWVudmlyb25tZW50LXZhcnMtdG8tbG9hZC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gOGU1M2RkN2Y2ZjUzNGFkOTMzZTdlOWM3ZmMyMGNjMWE2Y2RlZDNmNCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gNWFjZmNiMmFiYTFhNTY0MWQzOTA1NThmZGYyODgzNzNmNWUzOWNi
NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENvZHkgUCBTY2hhZmVyIDxkZXZAY29k
eXBzLmNvbT4KIERhdGU6IFRodSwgMjcgQXByIDIwMTcgMTE6MzU6MDUgLTA0MDAKIFN1YmplY3Q6
IFtQQVRDSF0gQ01ha2VEZXRlcm1pbmVTeXN0ZW06IHVzZSBvZSBlbnZpcm9ubWVudCB2YXJzIHRv
IGxvYWQgZGVmYXVsdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2Nt
YWtlXzMuMjUuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjI1LjIu
YmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jbWFrZS9jbWFrZV8zLjI1LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9j
bWFrZS9jbWFrZV8zLjI1LjIuYmIKLS0gCjIuMzcuMwoK

--===============6851211992370549617==--

