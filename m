Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B2ACA9ED6
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.3760.1684186747292497654
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aydYFEkw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188215a4df0-2c9b4d27-ad55-4e0f-bda0-0df044237d00-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3LSWDOBoWpvFzIlNFF+66FPsL0f4vNtYXlnBYln2ZUY=;
	b=aydYFEkwvlRNwCHME45yw8pV4STpYkbh8ljGXWhoYDD/p0KYlnTlVjscYGAjtef0
	qmfIwtNJo9dTNbso6k0+y8Hq0DTY7RaDEEfEDL6abCNAbfN6MEqLvBhnHBPnWiUfsi1
	wLR/ha5vizbruRwHS85pDMICFxGTnOqNaffrZ8JE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3LSWDOBoWpvFzIlNFF+66FPsL0f4vNtYXlnBYln2ZUY=;
	b=j0vtvushdJZiJ/CQ4FaRwKx9OZI9UMMEt6pCurG2estb4C5okL8HY7zOuiyqtjJN
	TcwCVOYxMlbUrmrv79NpkSOckMM+K1uZIRRgWBM3CuHDMubtZ5kbY78UwApo3YZlwkU
	UeANObVf0YjqKQJAJL9lDZC4Exq8mPr2fBsweifM=
Content-Type: multipart/mixed; boundary="===============1374944540395975771=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 0.21.1 SUCCEEDED
Message-ID: <01010188215a4df0-2c9b4d27-ad55-4e0f-bda0-0df044237d00-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181294

--===============1374944540395975771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *createrepo-c* to *0.21.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-0.20.1-0.21.1.patch
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
--===============1374944540395975771==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-0.20.1-0.21.1.patch"

RnJvbSBlNTUzOTlhMzhiNjg3MzZmYWM0ZWFlOGFkYjU2ZmY3NDc1YTVjMjU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMDg6NTA6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
cmVhdGVyZXBvLWM6IHVwZ3JhZGUgMC4yMC4xIC0+IDAuMjEuMQoKLS0tCiAuLi4vY3JlYXRlcmVw
by1jLzAwMDEtaW5jbHVkZS1ycG0tcnBtc3RyaW5nLmgucGF0Y2ggICAgICB8IDkgKysrKysrLS0t
CiAuLi4ve2NyZWF0ZXJlcG8tY18wLjIwLjEuYmIgPT4gY3JlYXRlcmVwby1jXzAuMjEuMS5iYn0g
ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMve2NyZWF0ZXJlcG8t
Y18wLjIwLjEuYmIgPT4gY3JlYXRlcmVwby1jXzAuMjEuMS5iYn0gKDk2JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAxLWlu
Y2x1ZGUtcnBtLXJwbXN0cmluZy5oLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0
ZXJlcG8tYy9jcmVhdGVyZXBvLWMvMDAwMS1pbmNsdWRlLXJwbS1ycG1zdHJpbmcuaC5wYXRjaApp
bmRleCBhMjQ5ZWFmNWExLi44NjIyNGQxOWU4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAxLWluY2x1ZGUtcnBtLXJwbXN0cmlu
Zy5oLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRl
cmVwby1jLzAwMDEtaW5jbHVkZS1ycG0tcnBtc3RyaW5nLmgucGF0Y2gKQEAgLTEsNyArMSw3IEBA
Ci1Gcm9tIDhkZWZlNmFhZjkxNjEzYzNmY2I1NDBkZjY1YTk0Y2Q1NmQzNzczNjcgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDA4ZWVmZjYxMWExN2NmMzFjNWVjZGE5ZTNlN2ZhMGJjNDc5
ODQ2MDEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPgogRGF0ZTogRnJpLCAxMyBKYW4gMjAyMyAxMzoyMTo1MSAtMDgwMAotU3ViamVj
dDogW1BBVENIIDEvMl0gaW5jbHVkZSBycG0vcnBtc3RyaW5nLmgKK1N1YmplY3Q6IFtQQVRDSF0g
aW5jbHVkZSBycG0vcnBtc3RyaW5nLmgKIAogSXRzIG5lZWRlZCBmb3IgcmFzcHJpbnRmIGRlY2xh
cmF0aW9uCiAKQEAgLTExLDEwICsxMSwxMyBAQCBvbiAncmFzcHJpbnRmJzsgSVNPIEM5OSBhbmQg
bGF0ZXIgZG8gbm90IHN1cHBvcnQgaW1wbGljaXQgZnVuY3Rpb24gZGVjbGFyYXRpb25zCiAKIFVw
c3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vcnBtLXNvZnR3YXJl
LW1hbmFnZW1lbnQvY3JlYXRlcmVwb19jL3B1bGwvMzQwXQogU2lnbmVkLW9mZi1ieTogS2hlbSBS
YWogPHJhai5raGVtQGdtYWlsLmNvbT4KKwogLS0tCiAgc3JjL3htbF9maWxlLmMgfCAxICsKICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAorZGlmZiAtLWdpdCBhL3NyYy94bWxfZmls
ZS5jIGIvc3JjL3htbF9maWxlLmMKK2luZGV4IGQyNDAwYjguLjg3MTEwOWMgMTAwNjQ0CiAtLS0g
YS9zcmMveG1sX2ZpbGUuYwogKysrIGIvc3JjL3htbF9maWxlLmMKIEBAIC0xOSw2ICsxOSw3IEBA
CkBAIC0yMyw1ICsyNiw1IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+CiAgI2luY2x1ZGUgPGdsaWIvZ3N0ZGlvLmg+CiArI2luY2x1ZGUgPHJwbS9ycG1zdHJp
bmcuaD4KICAjaW5jbHVkZSA8YXNzZXJ0Lmg+CisgI2luY2x1ZGUgPHJwbS9ycG1zdHJpbmcuaD4K
ICAjaW5jbHVkZSAieG1sX2ZpbGUuaCIKLSAjaW5jbHVkZSA8ZXJybm8uaD4KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzAuMjAuMS5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzAuMjEu
MS5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tY18wLjIwLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzAuMjEuMS5iYgppbmRleCAx
YzRjZGQ1ZTNjLi4wZjFmN2FhNmZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tY18wLjIwLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWNfMC4yMS4xLmJiCkBAIC05LDcgKzksNyBA
QCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vcnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQvY3Jl
YXRlcmVwb19jO2JyYW5jaD1tYXN0ZXI7cAogICAgICAgICAgICBmaWxlOi8vMDAwMS1pbmNsdWRl
LXJwbS1ycG1zdHJpbmcuaC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0gImFmMTRl
MTY0YTNlNGFiOWRmYWVmMTIxMmU4NTJiOWVjZWJjMzI2YTIiCitTUkNSRVYgPSAiMDY1MmQ3MzAz
Y2UyMzZlNTk2YzgzYzI5Y2NjOWJlZTc4NjhmY2U2ZSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIK
IAotLSAKMi4zOS4yCgo=

--===============1374944540395975771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 73 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6e15ce7a672d11345bb66545edbd218527b3812a"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 29 Local 6 Mirrors 0 Missed 23 Current 493 (20% match, 95% complete)
Removing 2 stale sstate objects for arch ppc7400...done.
Removing 1 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 506 of 522 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 522 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_253.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1289 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1291 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/systemd/1_253.3-r0/temp/log.do_packagedata_setscene.2426677
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 521 of 522 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_package_setscene)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1427 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1429 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1543 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1546 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1583 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 1601 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 1795 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_fetch: Succeeded
NOTE: Running task 1796 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1797 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 1798 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: Running task 1799 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: Running task 1800 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_253.3-r0: task do_package_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1801 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1802 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe createrepo-c-0.21.1-r0: task do_unpack: Succeeded
NOTE: Running task 1803 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1804 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe createrepo-c-0.21.1-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1805 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1806 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe createrepo-c-0.21.1-r0: task do_patch: Succeeded
NOTE: Running task 1807 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1808 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_generate_toolchain_file)
NOTE: Running task 1809 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_lic)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1810 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe createrepo-c-0.21.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_lic unihash changed to bde4f3e55b3b56944657ca6d5149dec0e63d02c2ec29b7858934d640cb587ff0
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1811 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1823 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1825 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_packagedata)
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_253.3-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1826 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure)
NOTE: recipe systemd-1_253.3-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1827 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1828 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1829 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1830 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1831 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 1832 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 1833 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1834 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 1835 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1836 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 1837 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1838 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 1839 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 1840 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm unihash changed to 1055691b4e1b906090605ad3a18d5c1d4d25c3a177a85a641c4ffb2379acd553
NOTE: recipe dbus-1.14.6-r0: task do_configure: Succeeded
NOTE: Running task 1841 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1842 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_compile)
NOTE: recipe dbus-1.14.6-r0: task do_compile: Started
NOTE: recipe dbus-1.14.6-r0: task do_compile: Succeeded
NOTE: Running task 1843 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1844 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_install)
NOTE: recipe dbus-1.14.6-r0: task do_install: Started
NOTE: recipe dbus-1.14.6-r0: task do_install: Succeeded
NOTE: Running task 1845 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1846 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot)
NOTE: Running task 1847 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_package)
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.6-r0: task do_package: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1848 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1849 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe dbus-1.14.6-r0: task do_package: Succeeded
NOTE: Running task 1850 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata)
NOTE: recipe dbus-1.14.6-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 1851 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 1852 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 1853 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_populate_sysroot)
NOTE: Running task 1854 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1855 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1856 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_configure)
NOTE: recipe createrepo-c-0.21.1-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 1857 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_compile)
NOTE: recipe createrepo-c-0.21.1-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 1858 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_install)
NOTE: recipe createrepo-c-0.21.1-r0: task do_install: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 1859 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 1860 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1861 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package)
NOTE: recipe createrepo-c-0.21.1-r0: task do_package: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 1862 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_packagedata)
NOTE: recipe createrepo-c-0.21.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1863 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package_write_rpm)
NOTE: Running task 1864 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package_qa)
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1865 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1865 tasks of which 1798 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 68 ERROR messages, returning a non-zero exit code.
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-src went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dbg went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-staticdev went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dev went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-doc went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-gui went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-vconsole-setup went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-initramfs went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-analyze went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-kernel-install went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-rpm-macros went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-binfmt went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-zsh-completion went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-container went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-gatewayd went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-upload went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-remote went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-extra-utils went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-udev-rules went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd-shared went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package udev went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package udev-hwdb went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-bash-completion went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be+latin went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-bg went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ca went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-cs went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-da went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-de went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-el went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-es went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-et went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fi went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fr went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-gl went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hr went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hu went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-id went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-it went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ja went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ka went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-kab went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ko went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-lt went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-nl went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pa went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pl went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt-br went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ro went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ru went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-si went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sk went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sr went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sv went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-tr went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-uk went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-cn went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-tw went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-myhostname went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-mymachines went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-resolve went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-systemd went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libudev went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1374944540395975771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 57 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6e15ce7a672d11345bb66545edbd218527b3812a"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 29 Local 6 Mirrors 0 Missed 23 Current 493 (20% match, 95% complete)
Removing 2 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 1 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 506 of 522 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 522 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_253.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1289 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1290 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1579 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 1597 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1688 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1689 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1690 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1691 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1794 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_fetch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/systemd/1_253.3-r0/temp/log.do_packagedata_setscene.2309737
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 521 of 522 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_package_setscene)
NOTE: recipe createrepo-c-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 1795 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_unpack)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1796 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 1797 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 1798 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: recipe createrepo-c-0.21.1-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: Running task 1800 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_253.3-r0: task do_package_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1801 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1802 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe createrepo-c-0.21.1-r0: task do_unpack: Succeeded
NOTE: Running task 1803 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1804 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1805 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_patch: Succeeded
NOTE: Running task 1806 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1807 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_generate_toolchain_file)
NOTE: Running task 1808 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_lic)
NOTE: Running task 1809 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe createrepo-c-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_lic: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1810 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_lic unihash changed to bde4f3e55b3b56944657ca6d5149dec0e63d02c2ec29b7858934d640cb587ff0
NOTE: recipe createrepo-c-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1811 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1823 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1825 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_packagedata)
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_253.3-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1826 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure)
NOTE: recipe systemd-1_253.3-r0: task do_packagedata: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1827 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1828 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1829 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1830 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1831 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 1832 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 1833 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1834 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 1835 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1836 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 1837 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1838 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 1839 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 1840 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm unihash changed to 07869bf03880ff922179648f23c984315e4b8eaeb445f555170309b95157aa01
NOTE: recipe dbus-1.14.6-r0: task do_configure: Succeeded
NOTE: Running task 1841 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1842 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_compile)
NOTE: recipe dbus-1.14.6-r0: task do_compile: Started
NOTE: recipe dbus-1.14.6-r0: task do_compile: Succeeded
NOTE: Running task 1843 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1844 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_install)
NOTE: recipe dbus-1.14.6-r0: task do_install: Started
NOTE: recipe dbus-1.14.6-r0: task do_install: Succeeded
NOTE: Running task 1845 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1846 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot)
NOTE: Running task 1847 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_package)
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.6-r0: task do_package: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1848 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1849 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe dbus-1.14.6-r0: task do_package: Succeeded
NOTE: Running task 1850 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata)
NOTE: recipe dbus-1.14.6-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 1851 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 1852 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 1853 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_populate_sysroot)
NOTE: Running task 1854 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1855 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1856 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_configure)
NOTE: recipe createrepo-c-0.21.1-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 1857 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_compile)
NOTE: recipe createrepo-c-0.21.1-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 1858 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_install)
NOTE: recipe createrepo-c-0.21.1-r0: task do_install: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 1859 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 1860 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1861 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package)
NOTE: recipe createrepo-c-0.21.1-r0: task do_package: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 1862 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_packagedata)
NOTE: recipe createrepo-c-0.21.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1863 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package_write_rpm)
NOTE: Running task 1864 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package_qa)
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1865 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1865 tasks of which 1798 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 68 ERROR messages, returning a non-zero exit code.
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-src went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dbg went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-staticdev went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dev went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-doc went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-gui went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-vconsole-setup went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-initramfs went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-analyze went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-kernel-install went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-rpm-macros went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-binfmt went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-zsh-completion went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-container went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-gatewayd went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-upload went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-remote went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-extra-utils went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-udev-rules went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd-shared went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package udev went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package udev-hwdb went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-bash-completion went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be+latin went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-bg went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ca went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-cs went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-da went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-de went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-el went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-es went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-et went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fi went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fr went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-gl went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hr went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hu went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-id went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-it went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ja went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ka went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-kab went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ko went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-lt went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-nl went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pa went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pl went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt-br went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ro went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ru went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-si went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sk went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sr went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sv went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-tr went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-uk went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-cn went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-tw went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-myhostname went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-mymachines went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-resolve went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-systemd went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libudev went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1374944540395975771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.0.20.1", added "/usr/lib/.debug/libcreaterepo_c.so.0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1158848 to 1213820 (+5%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGSIZE changed from 142602 to 146318 (+3%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1222467 to 1271448 (+4%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0.20.1", added "/usr/lib/libcreaterepo_c.so.0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGSIZE changed from 526215 to 534884 (+2%)
packages/core2-32-poky-linux/createrepo-c: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.20.1 to libcreaterepo_c.so.0.21.1
  /usr/lib/libcreaterepo_c.so.0.20.1 moved to /usr/lib/libcreaterepo_c.so.0.21.1

--===============1374944540395975771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6e15ce7a672d11345bb66545edbd218527b3812a"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 29 Local 6 Mirrors 0 Missed 23 Current 493 (20% match, 95% complete)
Removing 2 stale sstate objects for arch mips32r2...done.
Removing 1 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 506 of 522 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 522 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_253.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1289 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1290 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1579 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: Running task 1597 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_fetch)
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1678 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1679 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1690 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1691 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1794 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 1796 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/systemd/1_253.3-r0/temp/log.do_packagedata_setscene.2368052
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 521 of 522 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_package_setscene)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1797 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 1798 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 1799 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: recipe createrepo-c-0.21.1-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: Running task 1800 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_253.3-r0: task do_package_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1801 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1802 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe createrepo-c-0.21.1-r0: task do_unpack: Succeeded
NOTE: Running task 1803 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: Running task 1804 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe createrepo-c-0.21.1-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1805 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1806 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe createrepo-c-0.21.1-r0: task do_patch: Succeeded
NOTE: Running task 1807 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1808 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_generate_toolchain_file)
NOTE: Running task 1809 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_lic)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1810 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe createrepo-c-0.21.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_lic unihash changed to bde4f3e55b3b56944657ca6d5149dec0e63d02c2ec29b7858934d640cb587ff0
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1811 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1823 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1825 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_packagedata)
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_253.3-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1826 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1827 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1828 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe systemd-1_253.3-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1829 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1830 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1831 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 1832 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 1833 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1834 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 1835 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1836 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 1837 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1838 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 1839 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 1840 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm unihash changed to c370157396ccba4c0a9cd12ce3b54c69b57bd742afaee6a721088e9039e546e1
NOTE: recipe dbus-1.14.6-r0: task do_configure: Succeeded
NOTE: Running task 1841 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1842 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_compile)
NOTE: recipe dbus-1.14.6-r0: task do_compile: Started
NOTE: recipe dbus-1.14.6-r0: task do_compile: Succeeded
NOTE: Running task 1843 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1844 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_install)
NOTE: recipe dbus-1.14.6-r0: task do_install: Started
NOTE: recipe dbus-1.14.6-r0: task do_install: Succeeded
NOTE: Running task 1845 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1846 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot)
NOTE: Running task 1847 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_package)
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.6-r0: task do_package: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1848 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1849 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe dbus-1.14.6-r0: task do_package: Succeeded
NOTE: Running task 1850 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata)
NOTE: recipe dbus-1.14.6-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 1851 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 1852 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 1853 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_populate_sysroot)
NOTE: Running task 1854 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1855 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1856 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_configure)
NOTE: recipe createrepo-c-0.21.1-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 1857 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_compile)
NOTE: recipe createrepo-c-0.21.1-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 1858 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_install)
NOTE: recipe createrepo-c-0.21.1-r0: task do_install: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 1859 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 1860 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1861 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package)
NOTE: recipe createrepo-c-0.21.1-r0: task do_package: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 1862 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_packagedata)
NOTE: recipe createrepo-c-0.21.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1863 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package_write_rpm)
NOTE: Running task 1864 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package_qa)
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1865 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1865 tasks of which 1798 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 68 ERROR messages, returning a non-zero exit code.
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-src went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dbg went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-staticdev went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dev went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-doc went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-gui went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-vconsole-setup went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-initramfs went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-analyze went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-kernel-install went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-rpm-macros went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-binfmt went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-zsh-completion went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-container went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-gatewayd went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-upload went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-remote went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-extra-utils went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-udev-rules went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd-shared went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package udev went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package udev-hwdb went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-bash-completion went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be+latin went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-bg went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ca went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-cs went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-da went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-de went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-el went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-es went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-et went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fi went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fr went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-gl went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hr went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hu went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-id went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-it went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ja went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ka went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-kab went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ko went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-lt went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-nl went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pa went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pl went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt-br went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ro went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ru went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-si went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sk went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sr went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sv went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-tr went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-uk went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-cn went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-tw went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-myhostname went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-mymachines went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-resolve went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-systemd went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libudev went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1374944540395975771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0.20.1", added "/usr/lib/libcreaterepo_c.so.0.21.1"
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.20.1 to libcreaterepo_c.so.0.21.1
  /usr/lib/libcreaterepo_c.so.0.20.1 moved to /usr/lib/libcreaterepo_c.so.0.21.1

--===============1374944540395975771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (899 cached, 1 parsed). 1804 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6e15ce7a672d11345bb66545edbd218527b3812a"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 29 Local 6 Mirrors 0 Missed 23 Current 493 (20% match, 95% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 2 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 506 of 522 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 522 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_253.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1289 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1290 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1579 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 1597 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1702 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1703 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1704 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1705 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/systemd/1_253.3-r0/temp/log.do_packagedata_setscene.2251464
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 521 of 522 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_package_setscene)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 1734 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1735 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 1736 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: Running task 1737 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_unpack)
NOTE: Running task 1799 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1800 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 1801 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.21.1-r0: task do_unpack: Succeeded
NOTE: Running task 1802 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_253.3-r0: task do_package_setscene: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_patch: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1803 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1804 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: Running task 1805 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: Running task 1806 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1807 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_generate_toolchain_file)
NOTE: Running task 1808 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_lic)
NOTE: recipe createrepo-c-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_lic: Started
NOTE: Running task 1809 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe createrepo-c-0.21.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_lic unihash changed to bde4f3e55b3b56944657ca6d5149dec0e63d02c2ec29b7858934d640cb587ff0
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1810 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe createrepo-c-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1811 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1823 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1825 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_packagedata)
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_253.3-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1826 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1827 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe dbus-1.14.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: Running task 1828 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure)
NOTE: recipe dbus-1.14.6-r0: task do_configure: Started
NOTE: recipe systemd-1_253.3-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1829 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1830 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1831 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 1832 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 1833 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1834 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 1835 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1836 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 1837 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1838 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 1839 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 1840 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm unihash changed to e4aa3e42b24bb6d8bcf3109297d70d976996c5f262fac092cacd5d1c3cb1d3e8
NOTE: recipe dbus-1.14.6-r0: task do_configure: Succeeded
NOTE: Running task 1841 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1842 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_compile)
NOTE: recipe dbus-1.14.6-r0: task do_compile: Started
NOTE: recipe dbus-1.14.6-r0: task do_compile: Succeeded
NOTE: Running task 1843 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1844 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_install)
NOTE: recipe dbus-1.14.6-r0: task do_install: Started
NOTE: recipe dbus-1.14.6-r0: task do_install: Succeeded
NOTE: Running task 1845 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.6-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1846 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot)
NOTE: Running task 1847 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_package)
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.6-r0: task do_package: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1848 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1849 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe dbus-1.14.6-r0: task do_package: Succeeded
NOTE: Running task 1850 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata)
NOTE: recipe dbus-1.14.6-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 1851 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 1852 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 1853 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_populate_sysroot)
NOTE: Running task 1854 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1855 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1856 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_configure)
NOTE: recipe createrepo-c-0.21.1-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 1857 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_compile)
NOTE: recipe createrepo-c-0.21.1-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 1858 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_install)
NOTE: recipe createrepo-c-0.21.1-r0: task do_install: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 1859 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 1860 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1861 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package)
NOTE: recipe createrepo-c-0.21.1-r0: task do_package: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 1862 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_packagedata)
NOTE: recipe createrepo-c-0.21.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1863 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package_write_rpm)
NOTE: Running task 1864 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package_qa)
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1865 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1865 tasks of which 1798 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 68 ERROR messages, returning a non-zero exit code.
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-src went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dbg went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-staticdev went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dev went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-doc went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-gui went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-vconsole-setup went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-initramfs went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-analyze went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-kernel-install went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-rpm-macros went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-binfmt went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-zsh-completion went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-container went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-gatewayd went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-upload went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-remote went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-extra-utils went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-udev-rules went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd-shared went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package udev went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package udev-hwdb went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-bash-completion went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be+latin went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-bg went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ca went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-cs went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-da went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-de went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-el went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-es went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-et went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fi went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fr went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-gl went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hr went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hu went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-id went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-it went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ja went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ka went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-kab went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ko went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-lt went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-nl went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pa went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pl went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt-br went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ro went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ru went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-si went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sk went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sr went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sv went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-tr went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-uk went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-cn went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-tw went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-myhostname went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-mymachines went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-resolve went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-systemd went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: QA Issue: Package version for package libudev went backwards which would break package feeds (from 1:253.4-r0 to 1:253.3-r0) [version-going-backwards]
ERROR: systemd-1_253.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1374944540395975771==--

