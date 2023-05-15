Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D20CA9ED7
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:18 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.3757.1684186747226145534
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bGC11NED;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010188215a534f-fb929d8e-5ae5-432a-8778-6a968c6400c2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lInR0Ip6hxsGhJNH8U0E0KAVb/VN+BBj63jcr1vMSJ0=;
	b=bGC11NEDjIBFNmKm/DvZURZ2RlaRcg5UAbW5Eow3oJvxORDNLA9ZciJ9QxRBIUFI
	Snxgkiz1kr5s5TnvVMW3C7K1tD5UA0Pm8TjGXTV1hspXbWyTY3VFPG9NyG5z+4nPw82
	EUeoAhwzSYQTakiWiUbxzLuxHOhw+5jSJRT+nHs4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lInR0Ip6hxsGhJNH8U0E0KAVb/VN+BBj63jcr1vMSJ0=;
	b=WCGtflvv0EJyCifXNF5ccCT/K05cgjTkyysQ8Bq9m2SDrM9yV9Y1k/veW42LJJNm
	l6UcWa7+0gp2d4+of7mg2p85mptuX8+7+VuHEEdM08ty+fGjKQXdEQnmmVauxHq0cOM
	P1i21+DS6ke580oBBY+iGZ13UFUzuQTMpTuvc8tQ=
Content-Type: multipart/mixed; boundary="===============8552617627241958435=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 67.7.2 FAILED
Message-ID: <01010188215a534f-fb929d8e-5ae5-432a-8778-6a968c6400c2-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181315

--===============8552617627241958435==
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
--===============8552617627241958435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (899 cached, 1 parsed). 1803 targets, 40 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:facce1dadc42e7a5cf27ab15341d7f49b0cb1867"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 100 Local 91 Mirrors 0 Missed 9 Current 223 (91% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 984 of 1227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_fetch)
NOTE: Running task 986 of 1227 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_fetch)
NOTE: recipe python3-setuptools-67.7.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-67.7.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-native-67.7.2-r0: task do_fetch: Started
NOTE: Running task 1206 of 1227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_unpack)
NOTE: recipe python3-setuptools-native-67.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1207 of 1227 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_unpack)
NOTE: Running task 1208 of 1227 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-67.7.2-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-67.7.2-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-67.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-67.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1209 of 1227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_patch)
NOTE: recipe python3-setuptools-native-67.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1210 of 1227 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_patch)
NOTE: recipe python3-setuptools-67.7.2-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-67.7.2-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-67.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-67.7.2-r0: task do_patch: Succeeded
NOTE: Running task 1211 of 1227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1212 of 1227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_populate_lic)
NOTE: recipe python3-setuptools-67.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-67.7.2-r0: task do_populate_lic: Started
NOTE: recipe python3-setuptools-native-67.7.2-r0: task do_patch: Failed
NOTE: recipe python3-setuptools-67.7.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-setuptools-67.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Tasks Summary: Attempted 1212 tasks of which 1203 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-setuptools-native/67.7.2-r0/temp/log.do_patch.1668111
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.7.2.bb:do_patch) failed with exit code '1'

--===============8552617627241958435==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-67.6.1-67.7.2.patch"

RnJvbSBlMzI4YjRhOTU1YzM2MWFiYWI1ZjM1MWRmYzQyYmNiMTg0M2NhZjY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTI6MjI6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgNjcuNi4xIC0+IDY3LjcuMgoKLS0tCiAuLi4vMDAw
MS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaCAg
fCAyICstCiAuLi55dGhvbjMtc2V0dXB0b29sc182Ny42LjEuYmIgPT4gcHl0aG9uMy1zZXR1cHRv
b2xzXzY3LjcuMi5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRo
b24zLXNldHVwdG9vbHNfNjcuNi4xLmJiID0+IHB5dGhvbjMtc2V0dXB0b29sc182Ny43LjIuYmJ9
ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lf
aW5zdGFsbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3Rh
bGwucGF0Y2gKaW5kZXggNGQ1NmRjODliYS4uNjViODVjNjllYSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25h
bGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFs
bHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSAyYjA2Y2E3OTdkM2NjYzViMTk1YWFhMDRhMDg1YzQ0YmY2MWQ0ZGUzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhYjRlMTU3N2I3MWZhZjc1ZWUwM2Y2MTEzOWY5ZmI2ZWYx
ZmFiYjNkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1
LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNyBKdWwgMjAxOCAxMDoxMzozOCArMDgw
MAogU3ViamVjdDogW1BBVENIXSBjb25kaXRpb25hbGx5IGRvIG5vdCBmZXRjaCBjb2RlIGJ5IGVh
c3lfaW5zdGFsbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHNfNjcuNi4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXNldHVwdG9vbHNfNjcuNy4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY3LjYu
MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHNfNjcuNy4yLmJiCmluZGV4IGFkMGQ3Y2M1MjcuLjU5NzhkZWFlMGUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY3LjYuMS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc182
Ny43LjIuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0g
IiBmaWxlOi8vMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWUKIFNSQ19V
UkkgKz0gIiBcCiAgICAgICAgICAgICBmaWxlOi8vMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5w
eS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMjU3ZGU5MmE5ZDUwYTYwYjhlMjJhYmZjYmI3NzE1NzFmZGUwZGJmM2VjMjM0NDYzMjEy
MDI3YTRlZWVjYmU5YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmMTA0ZmEwMzY5MmEyNjAyZmEw
ZmVjNmM2YTllNjNiNmM4YTk2OGRlMTNlMTdjMDI2OTU3ZGQxZjUzZDgwOTkwIgogCiBERVBFTkRT
ICs9ICIke1BZVEhPTl9QTn0iCiAKLS0gCjIuMzkuMgoK

--===============8552617627241958435==--

