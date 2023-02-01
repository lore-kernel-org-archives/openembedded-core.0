Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5E9C7EE2C
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.30004.1675272854805528539
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=D8yB4dxA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101860e0b1e8f-c2ccaf3b-6a5e-4748-a2f6-d09e9c454b5b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vL3HABwchI4WZUtOc35HkmHeFxJILH58opt4g7AnSUg=;
	b=D8yB4dxABoP4q4cjlGS8RpIE0sdXMclcXGFD5+LSFYxxOyGUzrmvsG4vPWFBveud
	gmH3sjXgcsQFiMpZOrv0sv2CYGVwCnF2b0ppfhap9FL/ifx6bMTu6/GX1zZVM22exjO
	w/dg+VBAJgCCxHGLKwmOGuSjM/myulTDWOnrKK3Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vL3HABwchI4WZUtOc35HkmHeFxJILH58opt4g7AnSUg=;
	b=MF3/0hLc6TzpQ4cKivi8rOI5GZn0NjbVr7eljtGSwkAtqP7uyeZ6jrSGdIMcyPL6
	jrKe1CtFT9tiboL03dFFgEZmTmGZ+bAIauZhT57jD63D2i72+l8uGxUxo6oa8ds2KYL
	fEyTv7xWVJxR3krQsZ6enwMLWtk2sj9avU7VnK/M=
Content-Type: multipart/mixed; boundary="===============6610350334397786560=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 67.0.0 FAILED
Message-ID: <010101860e0b1e8f-c2ccaf3b-6a5e-4748-a2f6-d09e9c454b5b-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176604

--===============6610350334397786560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *67.0.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-65.7.0-67.0.0.patch
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
--===============6610350334397786560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1697 targets, 41 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:fe0aaf5be59c86e74fb6202927220b4d00aae2ad"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 90 Local 81 Mirrors 0 Missed 9 Current 207 (90% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 937 of 1129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.0.0.bb:do_fetch)
NOTE: Running task 939 of 1129 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.0.0.bb:do_fetch)
NOTE: recipe python3-setuptools-67.0.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-67.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1108 of 1129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.0.0.bb:do_unpack)
NOTE: recipe python3-setuptools-native-67.0.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-67.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1109 of 1129 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.0.0.bb:do_unpack)
NOTE: Running task 1110 of 1129 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-67.0.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-67.0.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-67.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-67.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1111 of 1129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.0.0.bb:do_patch)
NOTE: recipe python3-setuptools-native-67.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1112 of 1129 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.0.0.bb:do_patch)
NOTE: recipe python3-setuptools-67.0.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-67.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-native-67.0.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-67.0.0-r0: task do_patch: Failed
NOTE: recipe python3-setuptools-native-67.0.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1112 tasks of which 1105 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.0.0.bb:do_patch
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.0.0.bb:do_patch
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-67.0.0-r0 do_patch: Applying patch '0001-change-shebang-to-python3.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools/67.0.0-r0/setuptools-67.0.0'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools/67.0.0-r0/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch 0001-change-shebang-to-python3.patch
can't find file to patch at input line 17
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From c39d0896930e25c224cc897660fc8511ccae30c8 Mon Sep 17 00:00:00 2001
|From: Changqing Li <changqing.li@windriver.com>
|Date: Thu, 23 Apr 2020 10:01:12 +0000
|Subject: [PATCH] change shebang to python3
|
|Upstream-Status: Pending
|
|Signed-off-by: Changqing Li <changqing.li@windriver.com>
|---
| pkg_resources/_vendor/appdirs.py   | 2 +-
| 1 files changed, 1 insertions(+), 1 deletions(-)
|
|diff --git a/pkg_resources/_vendor/appdirs.py b/pkg_resources/_vendor/appdirs.py
|index ae67001..933e398 100644
|--- a/pkg_resources/_vendor/appdirs.py
|+++ b/pkg_resources/_vendor/appdirs.py
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch 0001-change-shebang-to-python3.patch does not apply (enforce with -f)

stderr: ")
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools/67.0.0-r0/temp/log.do_patch.4137779
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.0.0.bb:do_patch) failed with exit code '1'
ERROR: python3-setuptools-native-67.0.0-r0 do_patch: Applying patch '0001-change-shebang-to-python3.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-setuptools-native/67.0.0-r0/setuptools-67.0.0'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-setuptools-native/67.0.0-r0/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch 0001-change-shebang-to-python3.patch
can't find file to patch at input line 17
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From c39d0896930e25c224cc897660fc8511ccae30c8 Mon Sep 17 00:00:00 2001
|From: Changqing Li <changqing.li@windriver.com>
|Date: Thu, 23 Apr 2020 10:01:12 +0000
|Subject: [PATCH] change shebang to python3
|
|Upstream-Status: Pending
|
|Signed-off-by: Changqing Li <changqing.li@windriver.com>
|---
| pkg_resources/_vendor/appdirs.py   | 2 +-
| 1 files changed, 1 insertions(+), 1 deletions(-)
|
|diff --git a/pkg_resources/_vendor/appdirs.py b/pkg_resources/_vendor/appdirs.py
|index ae67001..933e398 100644
|--- a/pkg_resources/_vendor/appdirs.py
|+++ b/pkg_resources/_vendor/appdirs.py
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch 0001-change-shebang-to-python3.patch does not apply (enforce with -f)

stderr: ")
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-setuptools-native/67.0.0-r0/temp/log.do_patch.4137787
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.0.0.bb:do_patch) failed with exit code '1'

--===============6610350334397786560==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-65.7.0-67.0.0.patch"

RnJvbSBiMjcxMWQyYzk2NTc0ZjdlMzc4Y2UzODhmNzMzYWMwYjc2NjQ3NmMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMjo1ODoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29sczogdXBncmFkZSA2NS43LjAgLT4gNjcuMC4wCgotLS0KIC4uLi8wMDAx
LWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoICB8
IDIgKy0KIC4uLnl0aG9uMy1zZXR1cHRvb2xzXzY1LjcuMC5iYiA9PiBweXRob24zLXNldHVwdG9v
bHNfNjcuMC4wLmJifSB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhv
bjMtc2V0dXB0b29sc182NS43LjAuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzXzY3LjAuMC5iYn0g
KDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9p
bnN0YWxsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFs
bC5wYXRjaAppbmRleCAyMTEwYzRhODc3Li40MWNkOWEyNWUzIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFs
bHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxs
eS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDJlNTczNjk1OTNlZGU1MzM2Zjk0N2U3Yjk5MDNlYmM2NzNmOThmZWYgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDZkM2I3OGJmYTRiNjEwYjhjMDVlZWE2MmYwOGE1MzYyZjBk
MGM5MzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUu
amlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE3IEp1bCAyMDE4IDEwOjEzOjM4ICswODAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmRpdGlvbmFsbHkgZG8gbm90IGZldGNoIGNvZGUgYnkgZWFz
eV9pbnN0YWxsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc2V0dXB0b29sc182NS43LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29sc182Ny4wLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNjUuNy4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29sc182Ny4wLjAuYmIKaW5kZXggNzg5ZDIxMjI4MS4uNzI4NmQ2OTFkNiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNjUuNy4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY3
LjAuMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAi
IGZpbGU6Ly8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZQogU1JDX1VS
SSArPSAiZmlsZTovLzAwMDEtY2hhbmdlLXNoZWJhbmctdG8tcHl0aG9uMy5wYXRjaCBcCiAgICAg
ICAgICAgICBmaWxlOi8vMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3Np
YmxlLXRvLXN1YnN0aXRlLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGQzYzkyZmFj
OGYxMTE4YmI3N2EyMjE4MTM1NWUyOWMyMzljYWJmZTJiOWVmZmRhYTY2NWM2NmI3MTExMzZkNyIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4ODMxMzFjNWI2ZWZhNzBiOTEwMWM3ZWYzMGIyYjdiNzgw
YTQyODNkNWZjMTYxNjM4M2NkZjIyYzgzY2JlZmU2IgogCiBERVBFTkRTICs9ICIke1BZVEhPTl9Q
Tn0iCiAKLS0gCjIuMzcuMwoK

--===============6610350334397786560==--

