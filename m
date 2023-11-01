Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BC7C25B4A
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:16 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.8647.1698848703568689614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FavlVLgj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IaU6/3Vi;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b8b4600eb-9f66467f-f597-462b-a2be-16f8ced60df1-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848702;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XugLRmC7WDzF4i+df8DDE6vKpDlNh6r7mHrAq55FXSw=;
	b=FavlVLgjYczjg2rVQK0pEQSL5lam59DoZ8mfcmvu6B9Tol2hTxj6l3P3PtQaPZ/L
	KqjBsxknnVGgOcTdU0sW+Y2IumwYNdshUBYOCUaaD7L9LTikm+a//FqShJUJyyZ1MPf
	VNPFtcg1480Hz9o2TEn5OnLZFqe8aQhYEdl5E5ms=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848702;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XugLRmC7WDzF4i+df8DDE6vKpDlNh6r7mHrAq55FXSw=;
	b=IaU6/3Vin6KmPtLig9yX7pFvU0t2TZYV3/jjOKBwR/itC+6XLc55aKIHLuiBsAh4
	4UMI6tdsroF00ZlpFxz16v+iXOdFbQcET9ZHqkDK4ZVW/fNX3Q/7yWYX8uHvIGsgXly
	9xYshTs4JkSdbM/ELx02b4f15qsJdZiDVaeqM1t8=
Content-Type: multipart/mixed; boundary="===============2220049898079785883=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] desktop-file-utils: upgrading to 0.27 FAILED
Message-ID: <0101018b8b4600eb-9f66467f-f597-462b-a2be-16f8ced60df1-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189932

--===============2220049898079785883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *desktop-file-utils* to *0.27* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-desktop-file-utils-upgrade-0.26-0.27.patch
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

-- >8 --
From b9bb4eae44ee05c77fc33d36a9ad1dbac39dee20 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 06:33:58 +0000
Subject: [PATCH] desktop-file-utils: upgrade 0.26 -> 0.27

---
 .../{desktop-file-utils_0.26.bb => desktop-file-utils_0.27.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/desktop-file-utils/{desktop-file-utils_0.26.bb => desktop-file-utils_0.27.bb} (84%)

diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb
similarity index 84%
rename from meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb
rename to meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb
index f6d1146e89..6c3f8b1921 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/validator.c;beginline=4;endline=27;md5=281e1114ee6c486a1a0a4295986b9416"
 
 SRC_URI = "http://freedesktop.org/software/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[md5sum] = "29739e005f5887cf41639b8450f3c23f"
-SRC_URI[sha256sum] = "b26dbde79ea72c8c84fb7f9d870ffd857381d049a86d25e0038c4cef4c747309"
+SRC_URI[sha256sum] = "a0817df39ce385b6621880407c56f1f298168c040c2032cedf88d5b76affe836"
 
 DEPENDS = "glib-2.0"
 
-- 
2.39.2


--===============2220049898079785883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-1005a6ba39b0ffb3d0cbd580df718e216cf7ebe5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1005a6ba39b0ffb3d0cbd580df718e216cf7ebe5"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 63 Local 53 Mirrors 0 Missed 10 Current 377 (84% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1174 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_recipe_qa)
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1252 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Succeeded
NOTE: Running task 1253 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_unpack)
NOTE: Running task 1254 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Succeeded
NOTE: Running task 1255 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_patch)
NOTE: Running task 1256 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Succeeded
NOTE: Running task 1257 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 1258 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_populate_lic)
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_lic: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_lic: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1259 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_configure)
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Succeeded
NOTE: Running task 1260 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_compile)
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56
| make: *** No targets specified and no makefile found.  Stop.
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.2250403:182 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.2250403, line 182
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.2250403, line 166
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.2250403, line 161
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.2250403, line 156
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.2250403, line 151
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.2250403, line 195
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1260 tasks of which 1250 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: desktop-file-utils-0.27-r0 do_compile: oe_runmake failed
ERROR: desktop-file-utils-0.27-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.2250403', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/desktop-file-utils/0.27/temp/log.do_compile.2250403
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_compile) failed with exit code '1'

--===============2220049898079785883==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-desktop-file-utils-upgrade-0.26-0.27.patch"

RnJvbSBiOWJiNGVhZTQ0ZWUwNWM3N2ZjMzNkMzZhOWFkMWRiYWMzOWRlZTIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwNjozMzo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRl
c2t0b3AtZmlsZS11dGlsczogdXBncmFkZSAwLjI2IC0+IDAuMjcKCi0tLQogLi4uL3tkZXNrdG9w
LWZpbGUtdXRpbHNfMC4yNi5iYiA9PiBkZXNrdG9wLWZpbGUtdXRpbHNfMC4yNy5iYn0gfCAzICst
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kZXNrdG9wLWZpbGUtdXRpbHMve2Rlc2t0b3AtZmlsZS11
dGlsc18wLjI2LmJiID0+IGRlc2t0b3AtZmlsZS11dGlsc18wLjI3LmJifSAoODQlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kZXNrdG9wLWZpbGUtdXRpbHMvZGVza3RvcC1m
aWxlLXV0aWxzXzAuMjYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVza3RvcC1maWxlLXV0
aWxzL2Rlc2t0b3AtZmlsZS11dGlsc18wLjI3LmJiCnNpbWlsYXJpdHkgaW5kZXggODQlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kZXNrdG9wLWZpbGUtdXRpbHMvZGVza3RvcC1m
aWxlLXV0aWxzXzAuMjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kZXNrdG9w
LWZpbGUtdXRpbHMvZGVza3RvcC1maWxlLXV0aWxzXzAuMjcuYmIKaW5kZXggZjZkMTE0NmU4OS4u
NmMzZjhiMTkyMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rlc2t0b3AtZmls
ZS11dGlscy9kZXNrdG9wLWZpbGUtdXRpbHNfMC4yNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZGVza3RvcC1maWxlLXV0aWxzL2Rlc2t0b3AtZmlsZS11dGlsc18wLjI3LmJiCkBAIC04
LDggKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0
ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9z
cmMvdmFsaWRhdG9yLmM7YmVnaW5saW5lPTQ7ZW5kbGluZT0yNzttZDU9MjgxZTExMTRlZTZjNDg2
YTFhMGE0Mjk1OTg2Yjk0MTYiCiAKIFNSQ19VUkkgPSAiaHR0cDovL2ZyZWVkZXNrdG9wLm9yZy9z
b2Z0d2FyZS8ke0JQTn0vcmVsZWFzZXMvJHtCUH0udGFyLnh6IgotU1JDX1VSSVttZDVzdW1dID0g
IjI5NzM5ZTAwNWY1ODg3Y2Y0MTYzOWI4NDUwZjNjMjNmIgotU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImIyNmRiZGU3OWVhNzJjOGM4NGZiN2Y5ZDg3MGZmZDg1NzM4MWQwNDlhODZkMjVlMDAzOGM0Y2Vm
NGM3NDczMDkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTA4MTdkZjM5Y2UzODViNjYyMTg4MDQw
N2M1NmYxZjI5ODE2OGMwNDBjMjAzMmNlZGY4OGQ1Yjc2YWZmZTgzNiIKIAogREVQRU5EUyA9ICJn
bGliLTIuMCIKIAotLSAKMi4zOS4yCgo=

--===============2220049898079785883==--

