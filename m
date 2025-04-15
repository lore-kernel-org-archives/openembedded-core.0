Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BC1C3ABA2
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:06 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.20175.1744723976811210279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MHLN/1fE;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=j6c+uvx9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019639a71f90-be8858ef-5c7f-4b78-b037-4c65a773ecd4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723976;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9p3XlItwrzRCyVvFupVPVCh+DtXTWAQgLX5oXfv6OaM=;
	b=MHLN/1fEANyIw198tA8SFDgwFR2iyaHGehTvJz5JlAykbjQB39j06ULIs807rwtf
	0qhmsfcmAyagwhoEHPGVzAOfYwQ+kRMVQF+d1i1janarw6U/JJRx9DrHzpgBjzwcftS
	aZp2Pivz3B7BSF11lybWo5Z4VVTeIu2HgcqPQcdk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723976;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9p3XlItwrzRCyVvFupVPVCh+DtXTWAQgLX5oXfv6OaM=;
	b=j6c+uvx9TRWkIpTbdIUhjOk0IUYkB77NHgLHcthnoC3Hpts2F5oT7wXskmnM3gOC
	hBAwXE1eCmAN/qFXuSUW+BwjtLnf1RE7f/QOIbtTTmcXj3KbNEn8WgUAB5MKP7pbfm8
	0x75bNASepLXiA5xLN5uAepzP6QWeoxa8xmq0GZk=
Content-Type: multipart/mixed; boundary="===============6171220296602609281=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.131.0 FAILED
Message-ID: <0101019639a71f90-be8858ef-5c7f-4b78-b037-4c65a773ecd4-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:32:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214878

--===============6171220296602609281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.131.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.129.2-6.131.0.patch
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
From 8cc2aa4a62cc6856a9e4535b52c1977bcf39e311 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 07:26:12 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.129.2 -> 6.131.0

---
 ...hon3-hypothesis_6.129.2.bb => python3-hypothesis_6.131.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.129.2.bb => python3-hypothesis_6.131.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.129.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.129.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb
index df9bd6b7c7..c3fce59021 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.129.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "23f180782dbbbcb6e59051794295d75783ad59241e6629a5bf700936c28a995b"
+SRC_URI[sha256sum] = "4b807daeeee47852edfd9818ba0e33df14902f1b78a5524f1a3fb71f80c7cec3"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============6171220296602609281==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.129.2-6.131.0.patch"

RnJvbSA4Y2MyYWE0YTYyY2M2ODU2YTllNDUzNWI1MmMxOTc3YmNmMzllMzExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDc6MjY6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xMjkuMiAtPiA2LjEzMS4wCgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjEyOS4yLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjEzMS4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjEyOS4yLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjEzMS4wLmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTI5LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjEzMS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTI5LjIuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTMxLjAu
YmIKaW5kZXggZGY5YmQ2YjdjNy4uYzNmY2U1OTAyMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xMjkuMi5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjEzMS4wLmJiCkBA
IC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyM2YxODA3ODJkYmJiY2I2ZTU5MDUxNzk0
Mjk1ZDc1NzgzYWQ1OTI0MWU2NjI5YTViZjcwMDkzNmMyOGE5OTViIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjRiODA3ZGFlZWVlNDc4NTJlZGZkOTgxOGJhMGUzM2RmMTQ5MDJmMWI3OGE1NTI0ZjFh
M2ZiNzFmODBjN2NlYzMiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40Ny4xCgo=

--===============6171220296602609281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1899 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (927 cached, 1 parsed). 1897 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:ee9cb3cb1f140c1a842ce0a78ff6e919d3183349"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 291 Local 275 Mirrors 0 Missed 16 Current 488 (94% match, 97% complete)
Removing 4 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1436 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb:do_recipe_qa)
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1960 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb:do_fetch)
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_fetch: Succeeded
NOTE: Running task 2153 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb:do_unpack)
NOTE: Running task 2154 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_unpack: Succeeded
NOTE: Running task 2157 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb:do_patch)
NOTE: Running task 2158 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_patch: Succeeded
NOTE: Running task 2159 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2160 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb:do_check_backend)
NOTE: Running task 2161 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb:do_populate_lic)
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_check_backend: Started
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_populate_lic: Started
WARNING: python3-hypothesis-6.131.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_check_backend: Succeeded
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2162 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_configure: Succeeded
NOTE: Running task 2163 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2164 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.131.0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.131.0/hypothesis-6.131.0/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.131.0/temp/run.do_compile.1894005:181 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.131.0/temp/run.do_compile.1894005, line 181
| 	#2: setuptools3_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.131.0/temp/run.do_compile.1894005, line 171
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.131.0/temp/run.do_compile.1894005, line 153
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.131.0/temp/run.do_compile.1894005, line 185
NOTE: recipe python3-hypothesis-6.131.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2164 tasks of which 2152 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250415072558.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250415072558.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.131.0/temp/log.do_compile.1894005
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.131.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-hypothesis-6.131.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.131.0/temp/run.do_compile.1894005' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.131.0/temp/log.do_compile.1894005
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb:do_compile) failed with exit code '1'

--===============6171220296602609281==--

