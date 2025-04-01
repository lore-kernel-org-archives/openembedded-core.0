Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B632AC369AF
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:23 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.18044.1743511392254306889
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BDEVTIAJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dvSur6/c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010195f1609f6f-4219214f-2f94-4df0-9fd2-4603ecd96830-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=i1EWQ91Ulylb/NBgGqJ7HgiIHv8AUC7cymHQQ3CEHPI=;
	b=BDEVTIAJ6Q7ThFpv1OEIDLZnyVBVFxLnukeLESypxA65FO6NkiJLE0Hy7vKoQuGh
	ryr5rT/aePPYskOVVVNz/qAFF6fX16HdxfKqmR9b9C4pQe6BgeFsvcnsVM2nw50VfcS
	YSXhSeB3RzkOGHptBw5QKkK2qNwNIi+2AyN9pwns=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=i1EWQ91Ulylb/NBgGqJ7HgiIHv8AUC7cymHQQ3CEHPI=;
	b=dvSur6/c6bDNbUfarMSz7V8bmpqYygJo5KsWUat3lCApMk1Sm4q6sFYqarAg+kK1
	xE8/3ns/k9Aqewo5oVJm0WUSmt1X3+ywge+ZwnMEKNMsu+0mKrJp+scTURX2V3VJWU1
	ghZEiOqVBId9pgdgp0NgptF+mI8lTqlqvywqPWng=
Content-Type: multipart/mixed; boundary="===============1941311734931084718=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.130.6 FAILED
Message-ID: <01010195f1609f6f-4219214f-2f94-4df0-9fd2-4603ecd96830-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214057

--===============1941311734931084718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.130.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.129.2-6.130.6.patch
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
From 0a2e4191d1703831efc3f5ec16ae4b71975aee32 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 08:52:57 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.129.2 -> 6.130.6

---
 ...hon3-hypothesis_6.129.2.bb => python3-hypothesis_6.130.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.129.2.bb => python3-hypothesis_6.130.6.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.129.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.130.6.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.129.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.130.6.bb
index df9bd6b7c7..71fe79ab6e 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.129.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.130.6.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "23f180782dbbbcb6e59051794295d75783ad59241e6629a5bf700936c28a995b"
+SRC_URI[sha256sum] = "994abd048924e365dbb8c21e3ea44c2ac576e02fa3d34b04288281768ae83b53"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============1941311734931084718==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.129.2-6.130.6.patch"

RnJvbSAwYTJlNDE5MWQxNzAzODMxZWZjM2Y1ZWMxNmFlNGI3MTk3NWFlZTMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwODo1Mjo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2LjEyOS4yIC0+IDYuMTMwLjYKCi0tLQogLi4uaG9u
My1oeXBvdGhlc2lzXzYuMTI5LjIuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTMwLjYuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTI5LjIuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTMwLjYuYmJ9ICg5MSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4x
MjkuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lz
XzYuMTMwLjYuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xMjkuMi5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xMzAuNi5i
YgppbmRleCBkZjliZDZiN2M3Li43MWZlNzlhYjZlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjEyOS4yLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTMwLjYuYmIKQEAg
LTEzLDcgKzEzLDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUucHkgXAog
ICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIzZjE4MDc4MmRiYmJjYjZlNTkwNTE3OTQy
OTVkNzU3ODNhZDU5MjQxZTY2MjlhNWJmNzAwOTM2YzI4YTk5NWIiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiOTk0YWJkMDQ4OTI0ZTM2NWRiYjhjMjFlM2VhNDRjMmFjNTc2ZTAyZmEzZDM0YjA0Mjg4
MjgxNzY4YWU4M2I1MyIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9uMy1hdHRy
cyBcCi0tIAoyLjQ3LjEKCg==

--===============1941311734931084718==
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
workspace            = "tmp-auh-upgrades:cc322f32661c8b0826920e3e77ce3d4d4b8d61ad"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 251 Local 235 Mirrors 0 Missed 16 Current 528 (93% match, 97% complete)
Removing 4 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1436 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.130.6.bb:do_recipe_qa)
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_recipe_qa: Started
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1895 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.130.6.bb:do_fetch)
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_fetch: Succeeded
NOTE: Running task 2087 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.130.6.bb:do_unpack)
NOTE: Running task 2088 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.130.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_unpack: Succeeded
NOTE: Running task 2157 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.130.6.bb:do_patch)
NOTE: Running task 2158 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.130.6.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_patch: Succeeded
NOTE: Running task 2159 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.130.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2160 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.130.6.bb:do_check_backend)
NOTE: Running task 2161 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.130.6.bb:do_populate_lic)
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_check_backend: Started
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_populate_lic: Started
WARNING: python3-hypothesis-6.130.6-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_check_backend: Succeeded
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2162 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.130.6.bb:do_configure)
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_configure: Succeeded
NOTE: Running task 2163 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.130.6.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2164 of 2181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.130.6.bb:do_compile)
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.130.6/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.130.6/hypothesis-6.130.6/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.130.6/temp/run.do_compile.3605435:181 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.130.6/temp/run.do_compile.3605435, line 181
| 	#2: setuptools3_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.130.6/temp/run.do_compile.3605435, line 171
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.130.6/temp/run.do_compile.3605435, line 153
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.130.6/temp/run.do_compile.3605435, line 185
NOTE: recipe python3-hypothesis-6.130.6-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2164 tasks of which 2152 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401085244.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401085244.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.130.6.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.130.6/temp/log.do_compile.3605435
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.130.6-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-hypothesis-6.130.6-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.130.6/temp/run.do_compile.3605435' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.130.6/temp/log.do_compile.3605435
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.130.6.bb:do_compile) failed with exit code '1'

--===============1941311734931084718==--

