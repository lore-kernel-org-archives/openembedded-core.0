Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCB2CA9EBB
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:44 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.7538.1685693434031709240
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PnvaB/iS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101887b2885eb-754fcdb7-a3f1-44ed-9e5b-d54037f3f9e2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WfrcayKJ4i4q0WFVOhpfkFUysq8hTAaLlwKUszyHkVw=;
	b=PnvaB/iSFA80EMQWcj0i/if9BjiK5kk+tDdi76IaPBjHPPA5MHrft8morhz1/KFC
	a1d5zQRMJQ74x0FSUVuwl5oJ5BAT3Gd2FO2ECtMkIzVG9ljuNBUQQw4ZHES+Os+lqk1
	EMr4w3MbwsYsEKAAIOWk5izy5N8BY/9EkVgQzRdY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WfrcayKJ4i4q0WFVOhpfkFUysq8hTAaLlwKUszyHkVw=;
	b=kJcNCfY6zW2gmb7IrJzdB2IrHYCYMLrx1Zg53EzoLsMJnqwGwAGY1kzhVzZdXZwH
	vvKegWlm3eD42qaoF98u1Ybr2rJKQmVIPC58/uKqO852bH5bUGuoW97WsWLBBICqwWt
	nkpemTjbQ3bSi0zG2Rjq2E7N5s3cEZLCZxapg3Qs=
Content-Type: multipart/mixed; boundary="===============0278505684994279350=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-webcolors: upgrading to 1.13 FAILED
Message-ID: <010101887b2885eb-754fcdb7-a3f1-44ed-9e5b-d54037f3f9e2-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182218

--===============0278505684994279350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-webcolors* to *1.13* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-webcolors-upgrade-1.12-1.13.patch
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
--===============0278505684994279350==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-webcolors-upgrade-1.12-1.13.patch"

RnJvbSAxNzkwZGMyMjU5MGRmOWEzNDAzMzNlYTM2YWNlNmQ1Y2U0ODQzOGE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNzoxMToyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2ViY29sb3JzOiB1cGdyYWRlIDEuMTIgLT4gMS4xMwoKLS0tCiAuLi5sb3JzXzEuMTIu
YmIgPT4gcHl0aG9uMy13ZWJjb2xvcnNfMS4xMy5iYn0gfCAyMyArKysrKysrKysrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXdlYmNvbG9yc18xLjEyLmJi
ID0+IHB5dGhvbjMtd2ViY29sb3JzXzEuMTMuYmJ9ICg0MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYmNvbG9yc18xLjEyLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYmNvbG9yc18xLjEzLmJiCnNpbWlsYXJp
dHkgaW5kZXggNDIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy13ZWJjb2xvcnNfMS4xMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXdlYmNvbG9yc18xLjEzLmJiCmluZGV4IDAyZjZjOWZlZDguLmY2MzkyN2Vl
YzUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJj
b2xvcnNfMS4xMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
d2ViY29sb3JzXzEuMTMuYmIKQEAgLTEsOSArMSwyOCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxF
U19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgor
IyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYg
bmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2Fn
ZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRl
OiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0t
IExJQ0VOU0UKKyMgKysrIExJQ0VOU0UKKyMgQEAgLTEsNCArMSw0IEBACisjIC1Db3B5cmlnaHQg
KGMpIDIwMDgtMjAyMiwgSmFtZXMgQmVubmV0dAorIyArQ29weXJpZ2h0IChjKSAyMDA4LCBKYW1l
cyBCZW5uZXR0CisjICBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAgCisjICBSZWRpc3RyaWJ1dGlv
biBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMg
CisjCisKIFNVTU1BUlkgPSAiU2ltcGxlIFB5dGhvbiBtb2R1bGUgZm9yIHdvcmtpbmcgd2l0aCBI
VE1ML0NTUyBjb2xvciBkZWZpbml0aW9ucy4iCiBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3Jn
L3Byb2plY3Qvd2ViY29sb3JzLyIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgotTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YmNmNzM3NDc4ZDJmYThhZjViYzk1NDIzMWRm
MDU2YzYiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT03MDJiMWVmMTJj
ZjY2ODMyYTg4ZjI0YzhmMmVlOWMxOSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE2ZDA0M2Qz
YTA4ZmQ2YTFiMWI3ZTNlOWU2MjY0MGQwOTc5MGRjZTgwZDJiZGQ0NzkyYTE3NWIzNWZlNzk0YTki
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzIyNWI2NzRjODNmYTkyM2JlOTNkMjM1MzMwY2UwMzAw
MzczZDAyODg1Y2VmMjMyMzg4MTNiMGQ1NjY4MzA0YSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9v
bHMzIHB0ZXN0CiAKLS0gCjIuMzkuMgoK

--===============0278505684994279350==
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
meta-yocto-bsp       = "tmp-auh-upgrades:5a641dca7ca4ef7f14b31f5db44829681aa62220"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 139 Local 132 Mirrors 0 Missed 7 Current 272 (94% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 984 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_fetch)
NOTE: recipe python3-webcolors-1.13-r0: task do_fetch: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_fetch: Succeeded
NOTE: Running task 1559 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_unpack)
NOTE: Running task 1560 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-webcolors-1.13-r0: task do_unpack: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_unpack: Succeeded
NOTE: Running task 1561 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_patch)
NOTE: recipe python3-webcolors-1.13-r0: task do_patch: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_patch: Succeeded
NOTE: Running task 1562 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1563 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_populate_lic)
NOTE: recipe python3-webcolors-1.13-r0: task do_populate_lic: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1564 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_configure)
NOTE: recipe python3-webcolors-1.13-r0: task do_configure: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_configure: Succeeded
NOTE: Running task 1565 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_configure_ptest_base)
NOTE: recipe python3-webcolors-1.13-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1566 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_compile)
NOTE: recipe python3-webcolors-1.13-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-webcolors/1.13-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-webcolors/1.13-r0/webcolors-1.13/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-webcolors/1.13-r0/temp/run.do_compile.1618437:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-webcolors/1.13-r0/temp/run.do_compile.1618437, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-webcolors/1.13-r0/temp/run.do_compile.1618437, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-webcolors/1.13-r0/temp/run.do_compile.1618437, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-webcolors/1.13-r0/temp/run.do_compile.1618437, line 184
NOTE: recipe python3-webcolors-1.13-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1566 tasks of which 1557 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-webcolors-1.13-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-webcolors-1.13-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-webcolors/1.13-r0/temp/run.do_compile.1618437', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-webcolors/1.13-r0/temp/log.do_compile.1618437
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_compile) failed with exit code '1'

--===============0278505684994279350==--

