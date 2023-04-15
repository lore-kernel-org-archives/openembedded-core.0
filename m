Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5439C87FE1
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:29 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.13814.1681581686437134855
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=himj8ifk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018786143874-29a934c2-5ba3-469b-8336-f807765406e1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gMRXFX+i3BCsb2YmOgbUp/fGZzmfzgqBcDZWcKqu0VM=;
	b=himj8ifkgdrcRFD0A9GoNISkNXtFJXSZnhAJCYLFgqsSW3Cu8Z5TJa528ZQNJcV/
	PL1howcb8R21QTHqCcDL0egSt7Bln9KYSDolRkqpfuSOqcBYEmx/UtjUyZ+ApjXeUXI
	un1AkK74JYCHGYWeKhql2Q4Uvabt6sK+SiBBRQpc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gMRXFX+i3BCsb2YmOgbUp/fGZzmfzgqBcDZWcKqu0VM=;
	b=lnDcOI9RW0cZEJkhaJ7I5hU4MyJYFyyW51zC/nTLEjCWEN9RQKVmtLqR6XBRufpk
	62AOvs2vzcA2mX27KrhsdOnIOxD1kEMidcqxDoKwrx7gR8yogQwmKj3Ov4sFTXsFZnB
	kvX5Zcxn2LyRqYeI6GjQ3Ix7I0raVnA/zgccq10I=
Content-Type: multipart/mixed; boundary="===============1490478423119927238=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.14.0 FAILED
Message-ID: <0101018786143874-29a934c2-5ba3-469b-8336-f807765406e1-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180072

--===============1490478423119927238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.14.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.13.0-1.14.0.patch
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
--===============1490478423119927238==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.13.0-1.14.0.patch"

RnJvbSA2ZjQ1Y2I5ODYwYzY5Y2FiYzVmYWQ3ZmVhMjNiMmM5MGIxNzIxYzYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTA6MjM6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNobGluZzogdXBncmFkZSAxLjEzLjAgLT4gMS4xNC4wCgotLS0KIC4uLntweXRo
b24zLWhhdGNobGluZ18xLjEzLjAuYmIgPT4gcHl0aG9uMy1oYXRjaGxpbmdfMS4xNC4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTMu
MC5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjE0LjAuYmJ9ICg4NCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjEzLjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTQuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDg0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjE0LjAuYmIKaW5kZXggMTdlN2Y4
NmJhNi4uYzkyZGRmZGQ3NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWhhdGNobGluZ18xLjEzLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjE0LjAuYmIKQEAgLTgsNyArOCw3IEBAIGluaGVy
aXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiBERVBFTkRTICs9ICJweXRob24zLXBsdWdneS1uYXRp
dmUgcHl0aG9uMy1wYXRoc3BlYy1uYXRpdmUgcHl0aG9uMy1wYWNrYWdpbmctbmF0aXZlIHB5dGhv
bjMtZWRpdGFibGVzLW5hdGl2ZSIKIERFUEVORFM6cmVtb3ZlOmNsYXNzLW5hdGl2ZSA9ICJweXRo
b24zLWhhdGNobGluZy1uYXRpdmUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmOGQyNzVhMmNj
NzIwNzM1Mjg2YjdjMmUyYmMzNWRhMDU3NjFlNmQzNjk1YzJmYTQxNjU1MDM5NWYxMGM1M2M3Igor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ2MmVhOTFkZjAzZmY1ZDUyODEzYjU2MTNmZWMxMzEzYTFh
MjA1OWQyZTM3MzQzZTU3MmIzZjk3OTg2N2M1ZGEiCiAKIGRvX2NvbXBpbGU6cHJlcGVuZCgpIHsK
ICAgICBleHBvcnQgUFlUSE9OUEFUSD1zcmMKLS0gCjIuMzkuMgoK

--===============1490478423119927238==
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
meta-yocto-bsp       = "tmp-auh-upgrades:4c83d0192ae5c5814b91d46ba202e2faefbf8b2a"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 96 Local 87 Mirrors 0 Missed 9 Current 243 (90% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1024 of 1301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.0.bb:do_fetch)
NOTE: Running task 1026 of 1301 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.0.bb:do_fetch)
NOTE: recipe python3-hatchling-1.14.0-r0: task do_fetch: Started
NOTE: recipe python3-hatchling-1.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-hatchling-native-1.14.0-r0: task do_fetch: Started
NOTE: Running task 1280 of 1301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.0.bb:do_unpack)
NOTE: recipe python3-hatchling-native-1.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 1281 of 1301 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.0.bb:do_unpack)
NOTE: Running task 1282 of 1301 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hatchling-1.14.0-r0: task do_unpack: Started
NOTE: recipe python3-hatchling-1.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1283 of 1301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.0.bb:do_patch)
NOTE: recipe python3-hatchling-native-1.14.0-r0: task do_unpack: Started
NOTE: recipe python3-hatchling-native-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hatchling-native-1.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1284 of 1301 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.0.bb:do_patch)
NOTE: recipe python3-hatchling-1.14.0-r0: task do_patch: Started
NOTE: recipe python3-hatchling-native-1.14.0-r0: task do_patch: Started
NOTE: recipe python3-hatchling-1.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1285 of 1301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1286 of 1301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.0.bb:do_populate_lic)
NOTE: recipe python3-hatchling-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hatchling-1.14.0-r0: task do_populate_lic: Started
NOTE: recipe python3-hatchling-native-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hatchling-native-1.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1287 of 1301 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hatchling-1.14.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-hatchling-native-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hatchling-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hatchling-native-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1288 of 1301 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.0.bb:do_configure)
NOTE: recipe python3-hatchling-native-1.14.0-r0: task do_configure: Started
NOTE: recipe python3-hatchling-native-1.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1289 of 1301 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.0.bb:do_compile)
NOTE: recipe python3-hatchling-native-1.14.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| ERROR Missing dependencies:
| 	trove-classifiers
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.14.0-r0/temp/run.do_compile.1012308:159 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.14.0-r0/dist /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.14.0-r0/hatchling-1.14.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.14.0-r0/temp/run.do_compile.1012308, line 159
| 	#2: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.14.0-r0/temp/run.do_compile.1012308, line 154
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.14.0-r0/temp/run.do_compile.1012308, line 163
NOTE: recipe python3-hatchling-native-1.14.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1289 tasks of which 1277 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.0.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-hatchling-native-1.14.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.14.0-r0/temp/run.do_compile.1012308', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.14.0-r0/temp/log.do_compile.1012308
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.0.bb:do_compile) failed with exit code '1'

--===============1490478423119927238==--

