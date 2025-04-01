Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5960FC369A6
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:23 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.18039.1743511388019161033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=HyleyVKr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FJb9BkBy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010195f160abd4-5f26702a-022e-4b9d-8fe2-9dbe1f3587cf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511399;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PWBK4neQClg9Ev6Q08AZLP8jEubELUzfZh3BS3ex3JY=;
	b=HyleyVKrgq67+S9660YamjxwC8kgmkM5U/Ofr4T3hQRxkj3ZAMq9d/SmAoJX7vQ8
	L6YDmomsybRjI/w0sI6d5XO1aktlEqVU1cLZ3c6kCpUdTFqK+mBpWrehyzxUu0RPagT
	tZDfdQC+UdEodoyMewpBasxm4S4FbBBbFlA+zf6M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511399;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PWBK4neQClg9Ev6Q08AZLP8jEubELUzfZh3BS3ex3JY=;
	b=FJb9BkByPG1k8AqgIK8YX3EQjh1+HS2AHRKbXPCsccrk4NlNHkuwdkmEe8C0t2tJ
	ZOEFszjfaHO5LGpiVxulbVv8odQHCfrAyO0F0vXkIo8g9W2O2ztLIcHK+sifhFFW9M5
	wXyYm43O8gOI7jpwTXieb4h3q2KeXEZs1Y2YmDhI=
Content-Type: multipart/mixed; boundary="===============7995347020169041759=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 8.3.0 FAILED
Message-ID: <01010195f160abd4-5f26702a-022e-4b9d-8fe2-9dbe1f3587cf-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214067

--===============7995347020169041759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sphinx* to *8.3.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-8.2.1-8.3.0.patch
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
From e373c19e095294c63ef72d4a0908c289650eefb7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 09:34:28 +0000
Subject: [PATCH] python3-sphinx: upgrade 8.2.1 -> 8.3.0

---
 .../python/{python3-sphinx_8.2.1.bb => python3-sphinx_8.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_8.2.1.bb => python3-sphinx_8.3.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb b/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
rename to meta/recipes-devtools/python/python3-sphinx_8.3.0.bb
index 614566b8f4..25bbc1bff8 100644
--- a/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=e30c37a2b7fb0afa3adc0d72b85e8b04"
 
-SRC_URI[sha256sum] = "e4b932951b9c18b039f73b72e4e63afe967d90408700ec222b981ac24647c01e"
+SRC_URI[sha256sum] = "3bad4314a7fa72ce92344eaaa14c42ddf3177ee6a79c227e4ff8ae07d416f584"
 
 inherit python_flit_core pypi
 
-- 
2.47.1


--===============7995347020169041759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1888 entries from dependency cache.
Parsing recipes...done.
Parsing of 924 .bb files complete (923 cached, 1 parsed). 1886 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0c877ae28913a0f8d884bcc4fd8edb4983600c2c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 324 Local 315 Mirrors 0 Missed 9 Current 580 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 625 of 904 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 888 of 904 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 904 of 904 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1636 of 2438 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_fetch)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1778 of 2438 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_unpack)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_unpack: Started
NOTE: Running task 1916 of 2438 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2250 of 2438 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_patch)
NOTE: Running task 2291 of 2438 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_patch: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2425 of 2438 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_configure)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_configure: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2427 of 2438 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_compile)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| ERROR Missing dependencies:
| 	sphinxcontrib-serializinghtml>=1.1.9
| 	Jinja2>=3.1
| 	sphinxcontrib-devhelp>=1.0.6
| 	sphinxcontrib-qthelp>=1.0.6
| 	snowballstemmer>=2.2
| 	Pygments>=2.17
| 	alabaster>=0.7.14
| 	sphinxcontrib-htmlhelp>=2.0.6
| 	docutils<0.22,>=0.20
| 	roman-numerals-py>=1.0.0
| 	imagesize>=1.3
| 	sphinxcontrib-jsmath>=1.0.1
| 	sphinxcontrib-applehelp>=1.0.7
| 	babel>=2.13
| 	requests>=2.30.0
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sphinx/8.3.0/temp/run.do_compile.4008750:158 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sphinx/8.3.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sphinx/8.3.0/sphinx-8.3.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sphinx/8.3.0/temp/run.do_compile.4008750, line 158
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sphinx/8.3.0/temp/run.do_compile.4008750, line 153
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sphinx/8.3.0/temp/run.do_compile.4008750, line 169
NOTE: recipe python3-sphinx-8.3.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2427 tasks of which 2420 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401093414.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401093414.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sphinx/8.3.0/temp/log.do_compile.4008750
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-sphinx-8.3.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sphinx/8.3.0/temp/run.do_compile.4008750' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sphinx/8.3.0/temp/log.do_compile.4008750
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_compile) failed with exit code '1'

--===============7995347020169041759==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-8.2.1-8.3.0.patch"

RnJvbSBlMzczYzE5ZTA5NTI5NGM2M2VmNzJkNGEwOTA4YzI4OTY1MGVlZmI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwOTozNDoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3BoaW54OiB1cGdyYWRlIDguMi4xIC0+IDguMy4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtc3BoaW54XzguMi4xLmJiID0+IHB5dGhvbjMtc3BoaW54XzguMy4wLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc3BoaW54XzguMi4xLmJiID0+IHB5
dGhvbjMtc3BoaW54XzguMy4wLmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhfOC4yLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzguMy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTEl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhf
OC4yLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
cGhpbnhfOC4zLjAuYmIKaW5kZXggNjE0NTY2YjhmNC4uMjViYmMxYmZmOCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF84LjIuMS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzguMy4wLmJiCkBA
IC00LDcgKzQsNyBAQCBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ0VOU0UgPSAiQlNELTIt
Q2xhdXNlICYgTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5yc3Q7bWQ1
PWUzMGMzN2EyYjdmYjBhZmEzYWRjMGQ3MmI4NWU4YjA0IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZTRiOTMyOTUxYjljMThiMDM5ZjczYjcyZTRlNjNhZmU5NjdkOTA0MDg3MDBlYzIyMmI5ODFh
YzI0NjQ3YzAxZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzYmFkNDMxNGE3ZmE3MmNlOTIzNDRl
YWFhMTRjNDJkZGYzMTc3ZWU2YTc5YzIyN2U0ZmY4YWUwN2Q0MTZmNTg0IgogCiBpbmhlcml0IHB5
dGhvbl9mbGl0X2NvcmUgcHlwaQogCi0tIAoyLjQ3LjEKCg==

--===============7995347020169041759==--

