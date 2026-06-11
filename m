Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6464CCD98D8
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:48 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50604.1781195495673993552
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MULfq/a5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YCinSw40;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019eb7868769-73c8d0be-ad77-433a-9529-8a36fcdcf3fc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195507;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=570yLiG/W6yrpDQi+KXlUyF9nHcJ7yZzeadws1OcYJw=;
	b=MULfq/a591jU0zO8yn+3KuqcjeSyde7Cn4LnRGzTP1cxM7946SUVuZMumSE7fgRz
	k5WyIEiaqseWeRoDkLsA84ElZ1KxTYyopaXYRNsIszUJnzfm2NdOjNmijyAvqLw+T9p
	reyON0+mr/j76AHa9QkwTsbeMUhQ0W+6Pc7rwZio=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195507;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=570yLiG/W6yrpDQi+KXlUyF9nHcJ7yZzeadws1OcYJw=;
	b=YCinSw403YZVJDaTlVannNLX7vu6dBAycTF2Iw0t3S9n8vhzGQjhgbHkJJ/zHmke
	qne9TYmz3meBEtYK83cpee2Pd3s3pYok2HyGV01H+YwskxH46QZUGVrDoxmmnO8GfoQ
	oDF6a8oS6jupckgqUoRX4vEM/il4Ucqpu9Om+RO4=
Content-Type: multipart/mixed; boundary="===============1646401399715532174=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <marta.rybczynska@ygreky.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uritools: upgrading to 6.1.2 FAILED
Message-ID: <0101019eb7868769-73c8d0be-ad77-433a-9529-8a36fcdcf3fc-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238502

--===============1646401399715532174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uritools* to *6.1.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-uritools-upgrade-6.1.0-6.1.2.patch
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
From 080e3098f1abdfb35bf4f31ebab14cc093d6fbd2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 10:19:23 +0000
Subject: [PATCH] python3-uritools: upgrade 6.1.0 -> 6.1.2

---
 ...ols_6.1.0.bb => python3-uritools_6.1.2.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-uritools_6.1.0.bb => python3-uritools_6.1.2.bb} (20%)

diff --git a/meta/recipes-devtools/python/python3-uritools_6.1.0.bb b/meta/recipes-devtools/python/python3-uritools_6.1.2.bb
similarity index 20%
rename from meta/recipes-devtools/python/python3-uritools_6.1.0.bb
rename to meta/recipes-devtools/python/python3-uritools_6.1.2.bb
index eeeca59e21..41f2f58437 100644
--- a/meta/recipes-devtools/python/python3-uritools_6.1.0.bb
+++ b/meta/recipes-devtools/python/python3-uritools_6.1.2.bb
@@ -1,10 +1,31 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,6 +1,6 @@
+#  The MIT License (MIT)
+#  
+# -Copyright (c) 2014-2025 Thomas Kemmer
+# +Copyright (c) 2014-2026 Thomas Kemmer
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy of
+#  this software and associated documentation files (the "Software"), to deal in
+# 
+#
+
 SUMMARY = "URI parsing, classification and composition"
 HOMEPAGE = "https://github.com/tkem/uritools/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e21bbe53b2730bfe1911cf381b81821e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=079933dfba36eb60b5e3512ca0ab61ae"
 
-SRC_URI[sha256sum] = "be97e452528e7a42ef0a4df68364ddd77833e982c5bac5cdcfee15c81f65e96b"
+SRC_URI[sha256sum] = "fa60028843a8be651699a1ee2b399066eeaef349224b32a177efa4aeba463f00"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============1646401399715532174==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uritools-upgrade-6.1.0-6.1.2.patch"

RnJvbSAwODBlMzA5OGYxYWJkZmIzNWJmNGYzMWViYWIxNGNjMDkzZDZmYmQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTA6MTk6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXVyaXRvb2xzOiB1cGdyYWRlIDYuMS4wIC0+IDYuMS4yCgotLS0KIC4uLm9sc182LjEu
MC5iYiA9PiBweXRob24zLXVyaXRvb2xzXzYuMS4yLmJifSB8IDI1ICsrKysrKysrKysrKysrKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdXJpdG9vbHNfNi4xLjAu
YmIgPT4gcHl0aG9uMy11cml0b29sc182LjEuMi5iYn0gKDIwJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJpdG9vbHNfNi4xLjAuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJpdG9vbHNfNi4xLjIuYmIKc2ltaWxh
cml0eSBpbmRleCAyMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXVyaXRvb2xzXzYuMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtdXJpdG9vbHNfNi4xLjIuYmIKaW5kZXggZWVlY2E1OWUyMS4uNDFmMmY1
ODQzNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVy
aXRvb2xzXzYuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My11cml0b29sc182LjEuMi5iYgpAQCAtMSwxMCArMSwzMSBAQAorIyBGSVhNRTogdGhlIExJQ19G
SUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUn
LgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQg
dGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUg
aWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVz
c2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBk
YXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMg
LS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UKKyMgQEAgLTEsNiArMSw2IEBACisjICBUaGUgTUlU
IExpY2Vuc2UgKE1JVCkKKyMgIAorIyAtQ29weXJpZ2h0IChjKSAyMDE0LTIwMjUgVGhvbWFzIEtl
bW1lcgorIyArQ29weXJpZ2h0IChjKSAyMDE0LTIwMjYgVGhvbWFzIEtlbW1lcgorIyAgCisjICBQ
ZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNv
biBvYnRhaW5pbmcgYSBjb3B5IG9mCisjICB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRv
Y3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8gZGVhbCBpbgorIyAKKyMKKwog
U1VNTUFSWSA9ICJVUkkgcGFyc2luZywgY2xhc3NpZmljYXRpb24gYW5kIGNvbXBvc2l0aW9uIgog
SE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3RrZW0vdXJpdG9vbHMvIgogCiBMSUNFTlNF
ID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWUyMWJiZTUz
YjI3MzBiZmUxOTExY2YzODFiODE4MjFlIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRTttZDU9MDc5OTMzZGZiYTM2ZWI2MGI1ZTM1MTJjYTBhYjYxYWUiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJiZTk3ZTQ1MjUyOGU3YTQyZWYwYTRkZjY4MzY0ZGRkNzc4MzNlOTgyYzViYWM1
Y2RjZmVlMTVjODFmNjVlOTZiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImZhNjAwMjg4NDNhOGJl
NjUxNjk5YTFlZTJiMzk5MDY2ZWVhZWYzNDkyMjRiMzJhMTc3ZWZhNGFlYmE0NjNmMDAiCiAKIGlu
aGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhIHB0ZXN0LXB5dGhvbi1weXRl
c3QKIAotLSAKMi40Ny4xCgo=

--===============1646401399715532174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-8e9a292d3a21907104c20bb6fdeec05e3eef55cf"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:8e9a292d3a21907104c20bb6fdeec05e3eef55cf"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 266 Local 254 Mirrors 0 Missed 12 Current 575 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 654 of 841 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 839 of 841 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-uritools-6.1.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-uritools-6.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-uritools-6.1.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-uritools-6.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 841 of 841 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-uritools-6.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-uritools-6.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1931 of 2104 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_fetch)
NOTE: Running task 2044 of 2104 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_create_recipe_spdx)
NOTE: recipe python3-uritools-6.1.2-r0: task do_fetch: Started
NOTE: recipe python3-uritools-6.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 2084 of 2104 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_unpack)
NOTE: Running task 2085 of 2104 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-uritools-6.1.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-uritools-6.1.2-r0: task do_unpack: Started
NOTE: recipe python3-uritools-6.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-uritools-6.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2086 of 2104 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_patch)
NOTE: recipe python3-uritools-6.1.2-r0: task do_patch: Started
NOTE: recipe python3-uritools-6.1.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-uritools-6.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-uritools-6.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2088 of 2104 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_configure)
NOTE: recipe python3-uritools-6.1.2-r0: task do_configure: Started
NOTE: recipe python3-uritools-6.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2090 of 2104 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-uritools-6.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-uritools-6.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2091 of 2104 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_compile)
NOTE: recipe python3-uritools-6.1.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| running egg_info
| writing src/uritools.egg-info/PKG-INFO
| writing dependency_links to src/uritools.egg-info/dependency_links.txt
| writing top-level names to src/uritools.egg-info/top_level.txt
| reading manifest file 'src/uritools.egg-info/SOURCES.txt'
| reading manifest template 'MANIFEST.in'
| no previously-included directories found matching '.github'
| warning: no previously-included files found matching '.gitignore'
| warning: no previously-included files found matching '.readthedocs.yaml'
| adding license file 'LICENSE'
| writing manifest file 'src/uritools.egg-info/SOURCES.txt'
| 
| ERROR Missing dependencies:
| 	setuptools-scm>=8.2
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-uritools/6.1.2/temp/run.do_compile.962926:151 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-uritools/6.1.2/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-uritools/6.1.2/sources/uritools-6.1.2'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-uritools/6.1.2/temp/run.do_compile.962926, line 151
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-uritools/6.1.2/temp/run.do_compile.962926, line 146
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-uritools/6.1.2/temp/run.do_compile.962926, line 163
NOTE: recipe python3-uritools-6.1.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2091 tasks of which 2083 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611101907.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611101907.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-uritools/6.1.2/temp/log.do_compile.962926
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-uritools-6.1.2-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-uritools/6.1.2/temp/run.do_compile.962926' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-uritools/6.1.2/temp/log.do_compile.962926
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_compile) failed with exit code '1'

--===============1646401399715532174==--

