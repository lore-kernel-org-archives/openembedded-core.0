Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FE3CA9ECB
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:45 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.7638.1685693433507997356
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DprzCA4q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101887b28846e-39b622a1-9e32-4ba6-b211-c871833cc60f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7rktd6AhSDAzYU9N1sWXEAu0pkOSmU9XzabozDQqZ3c=;
	b=DprzCA4qhCaoviICY8x5YNCmV+kbnIdUX7qqpwkaf6Cwav4YrIM3qYF9fuZJK1Zh
	OEN+rJ5mQGvuxopPf2vm2C57JtqO8hxhpZgMRNWG5vxJVFgEN0ZLUv2CkVbrhSS8XZU
	J3QYkoockl8hj0rwbh40m6L+IR5fZnThRUOQa/hA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7rktd6AhSDAzYU9N1sWXEAu0pkOSmU9XzabozDQqZ3c=;
	b=An09kHFuShLf8aVH1WeUtS3TLuLrTUWlfIDDfTbJ/gkVBCB+rgW5UMoomBlWEGjB
	bLR++iZVeQ/dM2bOpvIjFfoNhfGnC8rP/1eWfepas1LNp8KGTuxZf+x/9InlQ0ZUeKh
	osx1YjqepcOWt5Gvj+eELOcIwsf9Vcj8cVlxvYsA=
Content-Type: multipart/mixed; boundary="===============3462945767777399355=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 67.8.0 FAILED
Message-ID: <010101887b28846e-39b622a1-9e32-4ba6-b211-c871833cc60f-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182203

--===============3462945767777399355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *67.8.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-67.6.1-67.8.0.patch
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
--===============3462945767777399355==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-67.6.1-67.8.0.patch"

RnJvbSA1MTE2M2Q4MWUyNmE0NTVlYmMzOWQyYjY1MmQ5NzJmOGMzZGU0Mzk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNjo0NTo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29sczogdXBncmFkZSA2Ny42LjEgLT4gNjcuOC4wCgotLS0KIC4uLi8wMDAx
LWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoICB8
IDIgKy0KIC4uLnl0aG9uMy1zZXR1cHRvb2xzXzY3LjYuMS5iYiA9PiBweXRob24zLXNldHVwdG9v
bHNfNjcuOC4wLmJifSB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhv
bjMtc2V0dXB0b29sc182Ny42LjEuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzXzY3LjguMC5iYn0g
KDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9p
bnN0YWxsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFs
bC5wYXRjaAppbmRleCA0ZDU2ZGM4OWJhLi5mNzUzMzE0NWJhIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFs
bHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxs
eS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDJiMDZjYTc5N2QzY2NjNWIxOTVhYWEwNGEwODVjNDRiZjYxZDRkZTMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDNhMDViNmExNWRmZmFlNTBhY2Y0M2E1ODRiYjM4MzUxYTEy
ZDA1ODEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUu
amlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE3IEp1bCAyMDE4IDEwOjEzOjM4ICswODAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmRpdGlvbmFsbHkgZG8gbm90IGZldGNoIGNvZGUgYnkgZWFz
eV9pbnN0YWxsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc2V0dXB0b29sc182Ny42LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29sc182Ny44LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNjcuNi4x
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29sc182Ny44LjAuYmIKaW5kZXggYWQwZDdjYzUyNy4uZjlhODE0OTFiMiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNjcuNi4xLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY3
LjguMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAi
IGZpbGU6Ly8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZQogU1JDX1VS
SSArPSAiIFwKICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5
LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2giCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICIyNTdkZTkyYTlkNTBhNjBiOGUyMmFiZmNiYjc3MTU3MWZkZTBkYmYzZWMyMzQ0NjMyMTIw
MjdhNGVlZWNiZTlhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjYyNjQyMzU4YWRjNzdmZmE4NzIz
M2JjNGQyMzU0YzRiMjY4MmQyMTQwNDhmNTAwOTY0ZGJlNzYwY2NlZGYxMDIiCiAKIERFUEVORFMg
Kz0gIiR7UFlUSE9OX1BOfSIKIAotLSAKMi4zOS4yCgo=

--===============3462945767777399355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1800 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1800 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:97c0b4404c104d685351b8889d1088db14e4eee4"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 102 Local 93 Mirrors 0 Missed 9 Current 223 (91% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 993 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_fetch)
NOTE: Running task 995 of 1236 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_fetch)
NOTE: recipe python3-setuptools-67.8.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-67.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1215 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_unpack)
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1216 of 1236 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_unpack)
NOTE: Running task 1217 of 1236 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-67.8.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-67.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1218 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_patch)
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1219 of 1236 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_patch)
NOTE: recipe python3-setuptools-67.8.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-67.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1220 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1221 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_populate_lic)
NOTE: recipe python3-setuptools-67.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-67.8.0-r0: task do_populate_lic: Started
NOTE: recipe python3-setuptools-67.8.0-r0: task do_populate_lic: Failed
NOTE: recipe python3-setuptools-native-67.8.0-r0: task do_patch: Failed
NOTE: recipe python3-setuptools-67.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Tasks Summary: Attempted 1221 tasks of which 1212 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_populate_lic
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_patch
Summary: There was 1 WARNING message.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-67.8.0-r0 do_populate_lic: QA Issue: python3-setuptools: The LIC_FILES_CHKSUM does not match for file://LICENSE;beginline=1;endline=19;md5=7a7126e068206290f3fe9f8d6c713ea6
python3-setuptools: The new md5 checksum is 141643e11c48898150daa83802dbc65f
python3-setuptools: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvv beginline=1 vvvvvvvvvvvvvvvvvvvvvvvvvvvvv
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to
deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=19 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
python3-setuptools: Check if the license information has changed in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools/67.8.0-r0/setuptools-67.8.0/LICENSE (lines 1 through to 19) to verify that the LICENSE value "MIT" remains valid [license-checksum]
ERROR: python3-setuptools-67.8.0-r0 do_populate_lic: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools/67.8.0-r0/temp/log.do_populate_lic.3149513
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_populate_lic) failed with exit code '1'
ERROR: python3-setuptools-native-67.8.0-r0 do_patch: QA Issue: Fuzz detected:

Applying patch 0001-conditionally-do-not-fetch-code-by-easy_install.patch
patching file setuptools/command/easy_install.py
Hunk #1 succeeded at 644 with fuzz 1 (offset -4 lines).


The context lines in the patches can be updated with devtool:

    devtool modify python3-setuptools-native
    devtool finish --force-patch-refresh python3-setuptools-native <layer_path>

Don't forget to review changes done by devtool!

Patch log indicates that patches do not apply cleanly. [patch-fuzz]
ERROR: python3-setuptools-native-67.8.0-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-setuptools-native/67.8.0-r0/temp/log.do_patch.3149228
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.8.0.bb:do_patch) failed with exit code '1'

--===============3462945767777399355==--

