Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D06CCA9ED0
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:45 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.7635.1685693433277971739
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=deVJcFHW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101887b288378-15e81a91-060d-4855-abc3-9763136d93eb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=z6wQNYaIWaY7qnaNAb89KOca7gzUy2osaZmaZ9RUdOM=;
	b=deVJcFHWVwp8+mLYlK0zGwc04UZiDAtf1Oo7o1/FTyuQvG2a0/HFEBB7QIOeKTGp
	+e2G+CFTvam0qNSHAq0Hei2sWyINrMT7n1Q5DwYBHEUJziPae193KCdlgV1x3QiXmiX
	7r71dFIgYflkU79s75IKwtqDLhPJ4sHCZ5f1nxug=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=z6wQNYaIWaY7qnaNAb89KOca7gzUy2osaZmaZ9RUdOM=;
	b=ZmChhHyHOrKPvbxVefChP5gs5r4CGdh2fu5p17ta//queoQrvzEJN4bA1rlGbZWU
	dgds5/U7eaSqdTjtwFzN4L1L7JnkE+auMPx9m/pAgRX8pOQojfZeEee3SzAEEHuI+Aq
	yWbvCISWGphH0meF3rXTcxYdTpcQj9H5KixtrHtY=
Content-Type: multipart/mixed; boundary="===============5067347682700043253=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygments: upgrading to 2.15.1 FAILED
Message-ID: <010101887b288378-15e81a91-060d-4855-abc3-9763136d93eb-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182197

--===============5067347682700043253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pygments* to *2.15.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-pygments-upgrade-2.14.0-2.15.1.patch
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
--===============5067347682700043253==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygments-upgrade-2.14.0-2.15.1.patch"

RnJvbSBhMzg5OGJkNDM3MDcxMmM2YzAzMjMwNGRlZTUxZGI1NTZiYWFlYjZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNjoyMzoxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlnbWVudHM6IHVwZ3JhZGUgMi4xNC4wIC0+IDIuMTUuMQoKLS0tCiAuLi4ve3B5dGhv
bjMtcHlnbWVudHNfMi4xNC4wLmJiID0+IHB5dGhvbjMtcHlnbWVudHNfMi4xNS4xLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5Z21lbnRzXzIuMTQuMC5i
YiA9PiBweXRob24zLXB5Z21lbnRzXzIuMTUuMS5iYn0gKDgzJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnbWVudHNfMi4xNC4wLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z21lbnRzXzIuMTUuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlnbWVudHNfMi4xNC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHlnbWVudHNfMi4xNS4xLmJiCmluZGV4IDE2NzY5ZTkyNjMuLmNj
NmU3YjRjZmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1weWdtZW50c18yLjE0LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5Z21lbnRzXzIuMTUuMS5iYgpAQCAtNSw3ICs1LDcgQEAgTElDRU5TRSA9ICJCU0Qt
Mi1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zNmExM2M5
MDUxNGUyODk5ZjFlYmE3ZjQxYzNlZTU5MiIKIAogaW5oZXJpdCBzZXR1cHRvb2xzMwotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImIzZWQwNmE5ZThhYzlhOWFhZTVhNmY1ZGJlNzhhOGE1ODY1NWQxN2I0
M2I5M2MwNzhmMDk0ZGRjNDc2YWUyOTciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGFjZTRkM2Mx
ZGQ0ODE4OTRiMjAwNWY1NjBlYWQwZjlmMTllZTY0ZmU5ODMzNjZiZTFhMjFlMTcxZDEyNzc1YyIK
IAogREVQRU5EUyArPSAiXAogICAgICAgICAgICAgJHtQWVRIT05fUE59IFwKLS0gCjIuMzkuMgoK

--===============5067347682700043253==
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
meta-yocto-bsp       = "tmp-auh-upgrades:d4c92845c508a69d624cbdfbb2121c7c378cb481"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 100 Local 93 Mirrors 0 Missed 7 Current 225 (93% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 993 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_fetch)
NOTE: recipe python3-pygments-2.15.1-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 1223 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_unpack)
NOTE: Running task 1224 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygments-2.15.1-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1225 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_patch)
NOTE: recipe python3-pygments-2.15.1-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1226 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1227 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_populate_lic)
NOTE: recipe python3-pygments-2.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_populate_lic: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pygments-2.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1228 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_configure)
NOTE: recipe python3-pygments-2.15.1-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1229 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_compile)
NOTE: recipe python3-pygments-2.15.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.1-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.1-r0/Pygments-2.15.1/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.1-r0/temp/run.do_compile.2313075:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.1-r0/temp/run.do_compile.2313075, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.1-r0/temp/run.do_compile.2313075, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.1-r0/temp/run.do_compile.2313075, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.1-r0/temp/run.do_compile.2313075, line 184
NOTE: recipe python3-pygments-2.15.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1229 tasks of which 1221 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-pygments-2.15.1-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-pygments-2.15.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.1-r0/temp/run.do_compile.2313075', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.1-r0/temp/log.do_compile.2313075
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_compile) failed with exit code '1'

--===============5067347682700043253==--

