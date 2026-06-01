Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FFFCD8C93
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:45 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1571.1780328137954552047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Liu1DKBe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WI+iIPnr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019e83d398cc-26f2a2d2-c3fe-48cc-97a2-05534ee1b34c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N1CE2HyMdaQ+qr9FepvGw/iLptN3ShRkQ+Ze3JnZHyc=;
	b=Liu1DKBecXA9uCxgj11T+dy/g9DKL1mUDV1CcSiFdkS8EtTe7mmzlVTopAvTb8Al
	e/IUcckK/9H+0lV/C1vPzY6N/arvHUxVtMN8joEgaNM+pjPnPDPUhVaJQB1dEjlSf2C
	xVinX0wkfdgj4HwAq4c3FmMuJuqorL14rKks+CO4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N1CE2HyMdaQ+qr9FepvGw/iLptN3ShRkQ+Ze3JnZHyc=;
	b=WI+iIPnrHkH5vusXBT2HxYotyKhQFctPzvyRGrSMwG1m3LMDtjAsBWjfxAmbFFzE
	g6pdtNK50dAJ60r7NNFvMkpKcdDwYGhzp91g92h8g5HlNfYvK1YaVt4cgvtFJ8S2Mdd
	xwVJJ3pPgYqrfur3wiNF1zYnlTZZ45n/OXt9aQfM=
Content-Type: multipart/mixed; boundary="===============0475902895516406234=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <marta.rybczynska@ygreky.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uritools: upgrading to 6.1.2 FAILED
Message-ID: <0101019e83d398cc-26f2a2d2-c3fe-48cc-97a2-05534ee1b34c-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237896

--===============0475902895516406234==
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
From dd526ea16168fb0d2f019037ba730ba8d7e4fe9b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 09:36:44 +0000
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


--===============0475902895516406234==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uritools-upgrade-6.1.0-6.1.2.patch"

RnJvbSBkZDUyNmVhMTYxNjhmYjBkMmYwMTkwMzdiYTczMGJhOGQ3ZTRmZTliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwOTozNjo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXJpdG9vbHM6IHVwZ3JhZGUgNi4xLjAgLT4gNi4xLjIKCi0tLQogLi4ub2xzXzYuMS4w
LmJiID0+IHB5dGhvbjMtdXJpdG9vbHNfNi4xLjIuYmJ9IHwgMjUgKysrKysrKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cml0b29sc182LjEuMC5i
YiA9PiBweXRob24zLXVyaXRvb2xzXzYuMS4yLmJifSAoMjAlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cml0b29sc182LjEuMC5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cml0b29sc182LjEuMi5iYgpzaW1pbGFy
aXR5IGluZGV4IDIwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdXJpdG9vbHNfNi4xLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy11cml0b29sc182LjEuMi5iYgppbmRleCBlZWVjYTU5ZTIxLi40MWYyZjU4
NDM3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJp
dG9vbHNfNi4xLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXVyaXRvb2xzXzYuMS4yLmJiCkBAIC0xLDEwICsxLDMxIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJ
TEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScu
CisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0
aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBp
ZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNz
YWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRh
dGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAt
LS0gTElDRU5TRQorIyArKysgTElDRU5TRQorIyBAQCAtMSw2ICsxLDYgQEAKKyMgIFRoZSBNSVQg
TGljZW5zZSAoTUlUKQorIyAgCisjIC1Db3B5cmlnaHQgKGMpIDIwMTQtMjAyNSBUaG9tYXMgS2Vt
bWVyCisjICtDb3B5cmlnaHQgKGMpIDIwMTQtMjAyNiBUaG9tYXMgS2VtbWVyCisjICAKKyMgIFBl
cm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29u
IG9idGFpbmluZyBhIGNvcHkgb2YKKyMgIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9j
dW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsIGluCisjIAorIworCiBT
VU1NQVJZID0gIlVSSSBwYXJzaW5nLCBjbGFzc2lmaWNhdGlvbiBhbmQgY29tcG9zaXRpb24iCiBI
T01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vdGtlbS91cml0b29scy8iCiAKIExJQ0VOU0Ug
PSAiTUlUIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZTIxYmJlNTNi
MjczMGJmZTE5MTFjZjM4MWI4MTgyMWUiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFO21kNT0wNzk5MzNkZmJhMzZlYjYwYjVlMzUxMmNhMGFiNjFhZSIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImJlOTdlNDUyNTI4ZTdhNDJlZjBhNGRmNjgzNjRkZGQ3NzgzM2U5ODJjNWJhYzVj
ZGNmZWUxNWM4MWY2NWU5NmIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmE2MDAyODg0M2E4YmU2
NTE2OTlhMWVlMmIzOTkwNjZlZWFlZjM0OTIyNGIzMmExNzdlZmE0YWViYTQ2M2YwMCIKIAogaW5o
ZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgcHRlc3QtcHl0aG9uLXB5dGVz
dAogCi0tIAoyLjQ3LjEKCg==

--===============0475902895516406234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-b0f0f57f8ea261ee10223c88f174a7b22cae8fee"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:b0f0f57f8ea261ee10223c88f174a7b22cae8fee"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 150 Local 136 Mirrors 0 Missed 14 Current 691 (90% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1402 of 2104 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_recipe_qa)
NOTE: Running task 2043 of 2104 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_create_recipe_spdx)
NOTE: recipe python3-uritools-6.1.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-uritools-6.1.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-uritools-6.1.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2083 of 2104 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_fetch)
NOTE: recipe python3-uritools-6.1.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-uritools-6.1.2-r0: task do_fetch: Started
NOTE: recipe python3-uritools-6.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 2084 of 2104 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_unpack)
NOTE: Running task 2085 of 2104 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-uritools-6.1.2-r0: task do_unpack: Started
NOTE: recipe python3-uritools-6.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-uritools-6.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2086 of 2104 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_patch)
NOTE: recipe python3-uritools-6.1.2-r0: task do_patch: Started
NOTE: recipe python3-uritools-6.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-uritools-6.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2087 of 2104 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2088 of 2104 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_populate_lic)
NOTE: recipe python3-uritools-6.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-uritools-6.1.2-r0: task do_populate_lic: Started
NOTE: recipe python3-uritools-6.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2089 of 2104 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_configure)
NOTE: recipe python3-uritools-6.1.2-r0: task do_configure: Started
NOTE: recipe python3-uritools-6.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2090 of 2104 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-uritools-6.1.2-r0: task do_populate_lic: Succeeded
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-uritools/6.1.2/temp/run.do_compile.2280520:151 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-uritools/6.1.2/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-uritools/6.1.2/sources/uritools-6.1.2'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-uritools/6.1.2/temp/run.do_compile.2280520, line 151
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-uritools/6.1.2/temp/run.do_compile.2280520, line 146
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-uritools/6.1.2/temp/run.do_compile.2280520, line 163
NOTE: recipe python3-uritools-6.1.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2091 tasks of which 2080 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601093629.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601093629.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-uritools/6.1.2/temp/log.do_compile.2280520
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-uritools-6.1.2-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-uritools/6.1.2/temp/run.do_compile.2280520' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-uritools/6.1.2/temp/log.do_compile.2280520
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uritools_6.1.2.bb:do_compile) failed with exit code '1'

--===============0475902895516406234==--

