Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EB1C6377C
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.46769.1669908626753096648
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YyvzJFLw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010184ce4f7dc1-c1beab9a-62d8-4f63-942e-2683860f4be4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yp82ePxry1PKyAQqxWeherBg0HWfqMZZXWPT8IHH/pY=;
	b=YyvzJFLwQQ8mZjDBvzJ5EnVwWTSzWAdc5luGaXp6sbMCzeSbAvkShtnZknQzW1pn
	b/BLkOihDTprVY+VkVSllyU68Y15RD85J2YTh3JbeAcZhp9C+gz1AyttiML9XRahPRw
	3uIzjDTn2MoIG4Zo64rmUwp8OgS1h+2YcUWcJlwA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yp82ePxry1PKyAQqxWeherBg0HWfqMZZXWPT8IHH/pY=;
	b=XayTkG1bb+BWSM5BrA3LuEle9VmxezxdFiSsyNaLkXs5X4VHzI4umC/nJcmhctar
	hiYUXlOBXuAdTcpuxttb54NEW/ybhvN+rdbBbWLleH0yUfn8dTgCgxCRlVgWofI7jDG
	53quYl4OUBowv5amkLsnweoIYmvlLVud8MZpIIgU=
Content-Type: multipart/mixed; boundary="===============8537915531547091486=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 3.1.3 FAILED
Message-ID: <01010184ce4f7dc1-c1beab9a-62d8-4f63-942e-2683860f4be4-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174160

--===============8537915531547091486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ruby* to *3.1.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ruby-upgrade-3.1.2-3.1.3.patch
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
--===============8537915531547091486==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-3.1.2-3.1.3.patch"

RnJvbSA0ZTUxMjY0OTdjMTZjZTkyM2FmMzdhMTRhMGI1NmIxNGZhMzIwZGRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAxMDozNjoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJ1
Ynk6IHVwZ3JhZGUgMy4xLjIgLT4gMy4xLjMKCi0tLQogLi4uMDAxLVJlbW92ZS1kZXBlbmRlbmN5
LW9uLWxpYmNhcHN0b25lLnBhdGNoIHwgMzYgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL3J1Ynkv
e3J1YnlfMy4xLjIuYmIgPT4gcnVieV8zLjEuMy5iYn0gICAgIHwgIDcgKystLQogMiBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDM5IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1SZW1vdmUtZGVwZW5kZW5j
eS1vbi1saWJjYXBzdG9uZS5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3tydWJ5XzMuMS4yLmJiID0+IHJ1YnlfMy4xLjMuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLVJlbW92ZS1kZXBlbmRlbmN5LW9uLWxp
YmNhcHN0b25lLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLVJl
bW92ZS1kZXBlbmRlbmN5LW9uLWxpYmNhcHN0b25lLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCA1ZDBmOGZjYzA5Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9ydWJ5L3J1YnkvMDAwMS1SZW1vdmUtZGVwZW5kZW5jeS1vbi1saWJjYXBzdG9uZS5wYXRj
aAorKysgL2Rldi9udWxsCkBAIC0xLDM2ICswLDAgQEAKLUZyb20gMjIyMjAzMjk3OTY2ZjMxMjEw
OWU4ZWFhMjUyMGYyY2YyZjU5YzA5ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEFs
YW4gV3UgPFhyWHJAdXNlcnMubm9yZXBseS5naXRodWIuY29tPgotRGF0ZTogVGh1LCAzMSBNYXIg
MjAyMiAxNzoyNjoyOCAtMDQwMAotU3ViamVjdDogW1BBVENIXSBSZW1vdmUgZGVwZW5kZW5jeSBv
biBsaWJjYXBzdG9uZQotCi1XZSBoYXZlIHJlY2VpdmVkIHJlcG9ydHMgb2YgYnVpbGQgZmFpbHVy
ZXMgZHVlIHRvIHRoaXMgY29uZmlndXJhdGlvbgotY2hlY2sgbW9kaWZ5aW5nIGNvbXBpbGUgZmxh
Z3MuIFNpbmNlIG9ubHkgWUpJVCBkZXZzIHVzZSB0aGlzIGxpYnJhcnkKLXdlIGNhbiByZW1vdmUg
aXQgdG8gbWFrZSBSdWJ5IGVhc2llciB0byBidWlsZCBmb3IgdXNlcnMuCi0KLVNlZTogaHR0cHM6
Ly9naXRodWIuY29tL3JiZW52L3J1YnktYnVpbGQvZGlzY3Vzc2lvbnMvMTkzMwotCi1VcHN0cmVh
bS1TdGF0dXM6IEJhY2twb3J0Ci0tLS0KLSBjb25maWd1cmUuYWMgfCA5IC0tLS0tLS0tLQotIDEg
ZmlsZSBjaGFuZ2VkLCA5IGRlbGV0aW9ucygtKQotCi1JbmRleDogcnVieS0zLjEuMi9jb25maWd1
cmUuYWMKLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0KLS0tLSBydWJ5LTMuMS4yLm9yaWcvY29uZmlndXJlLmFjCi0rKysg
cnVieS0zLjEuMi9jb25maWd1cmUuYWMKLUBAIC0xMjQ0LDE1ICsxMjQ0LDYgQEAgQUNfQ0hFQ0tf
TElCKGRsLCBkbG9wZW4pCSMgRHluYW1pYyBsaW5raQotIEFDX0NIRUNLX0xJQihkbGQsIHNobF9s
b2FkKQkjIER5bmFtaWMgbGlua2luZyBmb3IgSFAtVVgKLSBBQ19DSEVDS19MSUIoc29ja2V0LCBz
aHV0ZG93bikgICMgU3VuT1MvU29sYXJpcwotIAotLWlmIHBrZy1jb25maWcgLS1leGlzdHMgY2Fw
c3RvbmU7IHRoZW4KLS0gICBDQVBTVE9ORV9DRkxBR1M9YHBrZy1jb25maWcgLS1jZmxhZ3MgY2Fw
c3RvbmVgCi0tICAgQ0FQU1RPTkVfTElCX0w9YHBrZy1jb25maWcgLS1saWJzLW9ubHktTCBjYXBz
dG9uZWAKLS0gICBMREZMQUdTPSIkTERGTEFHUyAkQ0FQU1RPTkVfTElCX0wiCi0tICAgQ0ZMQUdT
PSIkQ0ZMQUdTICRDQVBTVE9ORV9DRkxBR1MiCi0tZmkKLS0KLS1BQ19DSEVDS19MSUIoY2Fwc3Rv
bmUsIGNzX29wZW4pICMgQ2Fwc3RvbmUgZGlzYXNzZW1ibGVyIGZvciBkZWJ1Z2dpbmcgWUpJVAot
LQotIGRubCBDaGVja3MgZm9yIGhlYWRlciBmaWxlcy4KLSBBQ19IRUFERVJfRElSRU5UCi0gZG5s
IEFDX0hFQURFUl9TVERDIGhhcyBiZWVuIGNoZWNrZWQgaW4gQUNfVVNFX1NZU1RFTV9FWFRFTlNJ
T05TCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuMS4yLmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjEuMy5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuMS4y
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuMS4zLmJiCmlu
ZGV4IDM4N2JmYTliNDQuLmFjMzdkYmFhODkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9ydWJ5L3J1YnlfMy4xLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkv
cnVieV8zLjEuMy5iYgpAQCAtMiw3ICsyLDkgQEAgcmVxdWlyZSBydWJ5LmluYwogCiBERVBFTkRT
OmFwcGVuZDpsaWJjLW11c2wgPSAiIGxpYnVjb250ZXh0IgogCi1TUkNfVVJJICs9ICIgXAorU1JD
X1VSSSArPSAiaHR0cDovL2NhY2hlLnJ1YnktbGFuZy5vcmcvcHViL3J1YnkvJHtTSFJUX1ZFUn0v
cnVieS0ke1BWfS50YXIuZ3ogXAorICAgICAgICAgICBmaWxlOi8vMDAwMS1leHRtay1maXgtY3Jv
c3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6
Ly8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaCBcCiAgICAg
ICAgICAgIGZpbGU6Ly9yZW1vdmVfaGFzX2luY2x1ZGVfbWFjcm9zLnBhdGNoIFwKICAgICAgICAg
ICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXRlbXBsYXRlLU1h
a2VmaWxlLmluLWRvLW5vdC13cml0ZS1ob3N0LWNyb3NzLWNjLWl0ZW0ucGF0Y2ggXApAQCAtMTIs
MTAgKzE0LDkgQEAgU1JDX1VSSSArPSAiIFwKICAgICAgICAgICAgZmlsZTovLzAwMDUtTWFyay1H
ZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2ggXAogICAg
ICAgICAgICBmaWxlOi8vMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaCBcCiAg
ICAgICAgICAgIGZpbGU6Ly8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1MxLWFuZC1SRUdfUzIt
Zm9yLW11c2wtcmlzY3YucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1SZW1vdmUtZGVw
ZW5kZW5jeS1vbi1saWJjYXBzdG9uZS5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjYxODQzMTEyMzg5ZjAyYjczNTQyOGI1M2JiNjRjZjk4OGFkOWZiODE4NThi
ODI0OGUyMmU1NzMzNmYyNGE4M2UiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWVhNDk4YTM1ZjRj
ZDE1ODc1MjAwYTUyZGRlNDJiNmViMTc5ZTEyNjRlMTdkNzg3MzJjM2E1N2NkMWM2YWI5ZSIKIAog
UEFDS0FHRUNPTkZJRyA/Pz0gIiIKIFBBQ0tBR0VDT05GSUcgKz0gIiR7QGJiLnV0aWxzLmZpbHRl
cignRElTVFJPX0ZFQVRVUkVTJywgJ2lwdjYnLCBkKX0iCi0tIAoyLjMxLjEKCg==

--===============8537915531547091486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1668 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1668 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:49efbc84f3522cfaf6062ccac1f07387439c97c1"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 43 Local 34 Mirrors 0 Missed 9 Current 158 (79% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 676 of 795 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ruby/ruby_3.1.3.bb:do_fetch)
NOTE: Running task 677 of 795 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ruby/ruby_3.1.3.bb:do_fetch)
NOTE: recipe ruby-3.1.3-r0: task do_fetch: Started
NOTE: recipe ruby-native-3.1.3-r0: task do_fetch: Started
NOTE: recipe ruby-3.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 771 of 795 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ruby/ruby_3.1.3.bb:do_unpack)
NOTE: recipe ruby-native-3.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 772 of 795 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ruby/ruby_3.1.3.bb:do_unpack)
NOTE: Running task 773 of 795 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ruby/ruby_3.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe ruby-3.1.3-r0: task do_unpack: Started
NOTE: recipe ruby-native-3.1.3-r0: task do_unpack: Started
NOTE: recipe ruby-native-3.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ruby-native-3.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ruby-3.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 774 of 795 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ruby/ruby_3.1.3.bb:do_patch)
NOTE: recipe ruby-3.1.3-r0: task do_patch: Started
NOTE: recipe ruby-3.1.3-r0: task do_patch: Failed
NOTE: recipe ruby-native-3.1.3-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 774 tasks of which 768 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ruby/ruby_3.1.3.bb:do_patch
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: ruby-3.1.3-r0 do_patch: Applying patch '0001-extmk-fix-cross-compilation-of-external-gems.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ruby/3.1.3-r0/ruby-3.1.3'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ruby/3.1.3-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch 0001-extmk-fix-cross-compilation-of-external-gems.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ruby/3.1.3-r0/temp/log.do_patch.2363774
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ruby/ruby_3.1.3.bb:do_patch) failed with exit code '1'

--===============8537915531547091486==--

