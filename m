Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11922C7EE43
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:06 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.107437.1682976352354148522
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BV2WK8P8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010187d93521c3-606c9f16-241d-40e2-ba7d-bd84e33ce53f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kRm3E9nSjlCt5nvcnpIlZBhTg8ff3GSzGbXoxIUijNY=;
	b=BV2WK8P8uoky9LtYAMgpNcNIAh7Uo8hQ6q+Ww1Jg3YFDyRz70ATKVOawDfWJzvbp
	0OmYU3qlgK0dy0WB8XDhE9/WkHmsI5qYBBljjtzGA9XJa/IQ+wHGHQOTzP0EqG/otaD
	wJzD/ocFu4VItGEq6jBIkMZs9YkOy3iGHfsfARRY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kRm3E9nSjlCt5nvcnpIlZBhTg8ff3GSzGbXoxIUijNY=;
	b=bWkntzdjDL7c4UxQA2VyRb8PwM5j5CWKXJ7kNTEJEHCeoXxNtVabjTbaOIMfKwyN
	dZRsVCUClIRVU67dxw2UwvbMVvi7xILrpEmkTeWkYyWD37VbzQBYWfidVpzfl5m2pJF
	Beo8hKjFw128Qa4/YI9I9ssByLcwd58hR2PvlsAQ=
Content-Type: multipart/mixed; boundary="===============3387541820018180250=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 67.7.2 FAILED
Message-ID: <01010187d93521c3-606c9f16-241d-40e2-ba7d-bd84e33ce53f-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180646

--===============3387541820018180250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *67.7.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-67.6.1-67.7.2.patch
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
--===============3387541820018180250==
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
meta-yocto-bsp       = "tmp-auh-upgrades:8ce6056e66bbff150141b0a1cbccf96f6dd9a4e5"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 98 Local 89 Mirrors 0 Missed 9 Current 211 (90% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 925 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_fetch)
NOTE: Running task 927 of 1166 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_fetch)
NOTE: recipe python3-setuptools-67.7.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-67.7.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-native-67.7.2-r0: task do_fetch: Started
NOTE: Running task 1145 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_unpack)
NOTE: recipe python3-setuptools-native-67.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1146 of 1166 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_unpack)
NOTE: Running task 1147 of 1166 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-67.7.2-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-67.7.2-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-67.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-67.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1148 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_patch)
NOTE: recipe python3-setuptools-native-67.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1149 of 1166 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_patch)
NOTE: recipe python3-setuptools-67.7.2-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-67.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-native-67.7.2-r0: task do_patch: Started
NOTE: recipe python3-setuptools-67.7.2-r0: task do_patch: Succeeded
NOTE: Running task 1150 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1151 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_populate_lic)
NOTE: recipe python3-setuptools-67.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-native-67.7.2-r0: task do_patch: Failed
NOTE: recipe python3-setuptools-67.7.2-r0: task do_populate_lic: Started
NOTE: recipe python3-setuptools-67.7.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-setuptools-67.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Tasks Summary: Attempted 1151 tasks of which 1142 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_patch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-native-67.7.2-r0 do_patch: QA Issue: Fuzz detected:

Applying patch 0001-conditionally-do-not-fetch-code-by-easy_install.patch
patching file setuptools/command/easy_install.py
Hunk #1 succeeded at 644 with fuzz 1 (offset -4 lines).


The context lines in the patches can be updated with devtool:

    devtool modify python3-setuptools-native
    devtool finish --force-patch-refresh python3-setuptools-native <layer_path>

Don't forget to review changes done by devtool!

Patch log indicates that patches do not apply cleanly. [patch-fuzz]
ERROR: python3-setuptools-native-67.7.2-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-setuptools-native/67.7.2-r0/temp/log.do_patch.2651807
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_patch) failed with exit code '1'

--===============3387541820018180250==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-67.6.1-67.7.2.patch"

RnJvbSBlZGExMzUyZDA3MjYwZGQ2OTZlZTNhNzlkMGMyMGFlMWE3ZWJiMGY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxMTo0ODoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29sczogdXBncmFkZSA2Ny42LjEgLT4gNjcuNy4yCgotLS0KIC4uLi8wMDAx
LWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoICB8
IDIgKy0KIC4uLnl0aG9uMy1zZXR1cHRvb2xzXzY3LjYuMS5iYiA9PiBweXRob24zLXNldHVwdG9v
bHNfNjcuNy4yLmJifSB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhv
bjMtc2V0dXB0b29sc182Ny42LjEuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzXzY3LjcuMi5iYn0g
KDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9p
bnN0YWxsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFs
bC5wYXRjaAppbmRleCA0ZDU2ZGM4OWJhLi4xNjEzZTFmYzgxIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFs
bHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxs
eS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDJiMDZjYTc5N2QzY2NjNWIxOTVhYWEwNGEwODVjNDRiZjYxZDRkZTMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDA4MmE2ZTUwMDdhOWVkMWU2MDYxZWMyZGQ3ZGY3NGIzNGVk
NzAyN2QgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUu
amlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE3IEp1bCAyMDE4IDEwOjEzOjM4ICswODAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmRpdGlvbmFsbHkgZG8gbm90IGZldGNoIGNvZGUgYnkgZWFz
eV9pbnN0YWxsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc2V0dXB0b29sc182Ny42LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29sc182Ny43LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNjcuNi4x
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29sc182Ny43LjIuYmIKaW5kZXggYWQwZDdjYzUyNy4uNTk3OGRlYWUwZSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNjcuNi4xLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY3
LjcuMi5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAi
IGZpbGU6Ly8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZQogU1JDX1VS
SSArPSAiIFwKICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5
LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2giCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICIyNTdkZTkyYTlkNTBhNjBiOGUyMmFiZmNiYjc3MTU3MWZkZTBkYmYzZWMyMzQ0NjMyMTIw
MjdhNGVlZWNiZTlhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImYxMDRmYTAzNjkyYTI2MDJmYTBm
ZWM2YzZhOWU2M2I2YzhhOTY4ZGUxM2UxN2MwMjY5NTdkZDFmNTNkODA5OTAiCiAKIERFUEVORFMg
Kz0gIiR7UFlUSE9OX1BOfSIKIAotLSAKMi4zOS4yCgo=

--===============3387541820018180250==--

