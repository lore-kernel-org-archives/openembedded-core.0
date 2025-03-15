Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB0BC369B4
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:32 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.10333.1742048296258035835
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Ev0itS/A;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Llfi1IQS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101959a2b93fc-df38bf68-e081-4b8a-8456-1ca6ae709420-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RqUx96LzuLiQmsTOs6220L+jftRe7XqnuA5rW7SO0Jo=;
	b=Ev0itS/Aze7owzwcFtbbDJvFk+yUI4TSSnf1iTBHQGms7SL08MXS9eyw8XNOmeu2
	x1PZKuCvS3KwuUL7a/dR35E53HqjY7cixzat9paQptYXvu51FIEgr1IdUCvJgMPp+72
	f+bPIzb4NdtWW7VuCY1WJjx3mt/jNKURjXxpYnhA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RqUx96LzuLiQmsTOs6220L+jftRe7XqnuA5rW7SO0Jo=;
	b=Llfi1IQS2QkYjftmJyDr86xJXrpd1aYWrbSyvv4IVU9zkbeK2CF12vh9gpV+21+f
	MO0UglFFM7+wAcUWEr7ICMPBF95gvjgNQkCBbRim2a+eFbkiHGwRK9i8dxvT5wUIVY/
	oCd6ealcEO3avhbFiYAvDcMNlBZMQjwm7h/YiaYU=
Content-Type: multipart/mixed; boundary="===============8548410531432355865=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 8.3.0 FAILED
Message-ID: <010101959a2b93fc-df38bf68-e081-4b8a-8456-1ca6ae709420-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212920

--===============8548410531432355865==
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
From f02e61b6954740027dbdca0a684dbbf65c11b1a9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 09:46:44 +0000
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
2.44.1


--===============8548410531432355865==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-8.2.1-8.3.0.patch"

RnJvbSBmMDJlNjFiNjk1NDc0MDAyN2RiZGNhMGE2ODRkYmJmNjVjMTFiMWE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDk6NDY6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueDogdXBncmFkZSA4LjIuMSAtPiA4LjMuMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXNwaGlueF84LjIuMS5iYiA9PiBweXRob24zLXNwaGlueF84LjMuMC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNwaGlueF84LjIuMS5iYiA9PiBw
eXRob24zLXNwaGlueF84LjMuMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzguMi4xLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF84LjMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkx
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54
XzguMi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c3BoaW54XzguMy4wLmJiCmluZGV4IDYxNDU2NmI4ZjQuLjI1YmJjMWJmZjggMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhfOC4yLjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF84LjMuMC5iYgpA
QCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIkJTRC0y
LUNsYXVzZSAmIE1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UucnN0O21k
NT1lMzBjMzdhMmI3ZmIwYWZhM2FkYzBkNzJiODVlOGIwNCIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImU0YjkzMjk1MWI5YzE4YjAzOWY3M2I3MmU0ZTYzYWZlOTY3ZDkwNDA4NzAwZWMyMjJiOTgx
YWMyNDY0N2MwMWUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2JhZDQzMTRhN2ZhNzJjZTkyMzQ0
ZWFhYTE0YzQyZGRmMzE3N2VlNmE3OWMyMjdlNGZmOGFlMDdkNDE2ZjU4NCIKIAogaW5oZXJpdCBw
eXRob25fZmxpdF9jb3JlIHB5cGkKIAotLSAKMi40NC4xCgo=

--===============8548410531432355865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1886 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (922 cached, 1 parsed). 1884 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fa0a525e204a502acc6e8d6027739eb0c71c4fcc"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 334 Local 322 Mirrors 0 Missed 12 Current 570 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1635 of 2438 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_recipe_qa)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2081 of 2438 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_fetch)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2268 of 2438 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_unpack)
NOTE: Running task 2269 of 2438 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2422 of 2438 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_patch)
NOTE: Running task 2423 of 2438 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_patch: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2424 of 2438 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2425 of 2438 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_populate_lic)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_populate_lic: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 2426 of 2438 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_configure)
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sphinx/8.3.0/temp/run.do_compile.3252736:158 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sphinx/8.3.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sphinx/8.3.0/sphinx-8.3.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sphinx/8.3.0/temp/run.do_compile.3252736, line 158
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sphinx/8.3.0/temp/run.do_compile.3252736, line 153
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sphinx/8.3.0/temp/run.do_compile.3252736, line 169
NOTE: recipe python3-sphinx-8.3.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2427 tasks of which 2417 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315094628.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315094628.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sphinx/8.3.0/temp/log.do_compile.3252736
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-sphinx-8.3.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sphinx/8.3.0/temp/run.do_compile.3252736' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sphinx/8.3.0/temp/log.do_compile.3252736
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_compile) failed with exit code '1'

--===============8548410531432355865==--

