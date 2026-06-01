Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDDFCD6E66
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:39 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1570.1780328138065403402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ApEnRumE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tYrKE9KV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019e83d382c2-665b0b45-fdcd-4408-a711-bd10758ceae0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328137;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dtZuP6NYgFHG+seZxgrIgIKFQwnxmg0lTKn6C2Urjz0=;
	b=ApEnRumE5BR32UAbM3Vxe68wcqyzcRJzf+Vh5syKLom4zk/UwkcjGZtEWNUflHZ8
	KRncwXgJ0CycN3MNCF/mt+c7sovzrS72g9t89uENi4cqgppvHvVNZefOW2x68lq1mx5
	ABxSUHPPAMTVsUh84snoLH2nIOzoXO8bQRHDcj5U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328137;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dtZuP6NYgFHG+seZxgrIgIKFQwnxmg0lTKn6C2Urjz0=;
	b=tYrKE9KVpXjcHHflL6gW6JYP9LVdZ0ZorpXi0KZD857doIVdnbjqgLN7LITNfCK6
	bu1k6MgzFuNnDWpN5gPczMkvZxX+UhfvY48IRMsaEgUCd9VSrjS/VRNJ80MwijdGWSG
	4LD+15fxnPrRkZ/r0OyD7IFm+kpbExZ3dhp/KM7k=
Content-Type: multipart/mixed; boundary="===============2973790415783635248=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtc: upgrading to 1.8.1 FAILED
Message-ID: <0101019e83d382c2-665b0b45-fdcd-4408-a711-bd10758ceae0-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237880

--===============2973790415783635248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dtc* to *1.8.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-dtc-upgrade-1.7.2-1.8.1.patch
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
From bed6644940f4c402ff4832bacc48f47381f385e1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 08:24:21 +0000
Subject: [PATCH] python3-dtc: upgrade 1.7.2 -> 1.8.1

---
 .../python/{python3-dtc_1.7.2.bb => python3-dtc_1.8.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtc_1.7.2.bb => python3-dtc_1.8.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-dtc_1.7.2.bb b/meta/recipes-devtools/python/python3-dtc_1.8.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-dtc_1.7.2.bb
rename to meta/recipes-devtools/python/python3-dtc_1.8.1.bb
index 9525c340cd..d1e44b163c 100644
--- a/meta/recipes-devtools/python/python3-dtc_1.7.2.bb
+++ b/meta/recipes-devtools/python/python3-dtc_1.8.1.bb
@@ -13,7 +13,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 LIC_FILES_CHKSUM = "file://pylibfdt/libfdt.i;beginline=1;endline=6;md5=afda088c974174a29108c8d80b5dce90"
 
-SRCREV = "2d10aa2afe35527728db30b35ec491ecb6959e5c"
+SRCREV = "8f48565e5cfedc74d3f7512f1e0188e9d85dc1de"
 
 PYPA_WHEEL = "${S}/dist/libfdt-1.6.2*.whl"
 
-- 
2.47.1


--===============2973790415783635248==
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
DISTRO_VERSION       = "6.0.99+snapshot-4d1e7bd47aec7ca36df2023c9e567eac849bb747"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:4d1e7bd47aec7ca36df2023c9e567eac849bb747"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 239 Local 225 Mirrors 0 Missed 14 Current 527 (94% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 710 of 766 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: Running task 1303 of 1942 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.8.1.bb:do_recipe_qa)
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dtc-1.8.1-r0: task do_recipe_qa: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 765 of 766 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1922 of 1942 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.8.1.bb:do_create_recipe_spdx)
NOTE: recipe python3-dtc-1.8.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-dtc-1.8.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1923 of 1942 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.8.1.bb:do_fetch)
NOTE: recipe python3-dtc-1.8.1-r0: task do_fetch: Started
NOTE: recipe python3-dtc-1.8.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-dtc-1.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1924 of 1942 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.8.1.bb:do_unpack)
NOTE: Running task 1925 of 1942 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dtc-1.8.1-r0: task do_unpack: Started
NOTE: recipe python3-dtc-1.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dtc-1.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtc-1.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1926 of 1942 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.8.1.bb:do_patch)
NOTE: recipe python3-dtc-1.8.1-r0: task do_patch: Started
NOTE: recipe python3-dtc-1.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1927 of 1942 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1928 of 1942 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.8.1.bb:do_check_backend)
NOTE: Running task 1929 of 1942 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.8.1.bb:do_populate_lic)
NOTE: recipe python3-dtc-1.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dtc-1.8.1-r0: task do_check_backend: Started
WARNING: python3-dtc-1.8.1-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with mesonpy, use the correct class [pep517-backend]
NOTE: recipe python3-dtc-1.8.1-r0: task do_populate_lic: Started
NOTE: recipe python3-dtc-1.8.1-r0: task do_check_backend: Succeeded
NOTE: recipe python3-dtc-1.8.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-dtc-1.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1930 of 1942 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.8.1.bb:do_configure)
NOTE: recipe python3-dtc-1.8.1-r0: task do_configure: Started
NOTE: recipe python3-dtc-1.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1931 of 1942 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.8.1.bb:do_compile)
NOTE: recipe python3-dtc-1.8.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| nativepython3: can't open file '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-dtc/1.8.1/sources/python3-dtc-1.8.1/setup.py': [Errno 2] No such file or directory
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-dtc/1.8.1/temp/run.do_compile.644510:170 exit 2 from 'nativepython3 setup.py --verbose build -j 16 bdist_wheel --dist-dir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-dtc/1.8.1/dist'
| WARNING: Backtrace (BB generated script):
| 	#1: setuptools3_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-dtc/1.8.1/temp/run.do_compile.644510, line 170
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-dtc/1.8.1/temp/run.do_compile.644510, line 152
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-dtc/1.8.1/temp/run.do_compile.644510, line 177
NOTE: recipe python3-dtc-1.8.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1931 tasks of which 1920 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601082407.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601082407.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.8.1.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-dtc/1.8.1/temp/log.do_compile.644510
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-dtc-1.8.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-dtc/1.8.1/temp/run.do_compile.644510' failed with exit code 2
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-dtc/1.8.1/temp/log.do_compile.644510
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.8.1.bb:do_compile) failed with exit code '1'

--===============2973790415783635248==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtc-upgrade-1.7.2-1.8.1.patch"

RnJvbSBiZWQ2NjQ0OTQwZjRjNDAyZmY0ODMyYmFjYzQ4ZjQ3MzgxZjM4NWUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwODoyNDoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZHRjOiB1cGdyYWRlIDEuNy4yIC0+IDEuOC4xCgotLS0KIC4uLi9weXRob24ve3B5dGhv
bjMtZHRjXzEuNy4yLmJiID0+IHB5dGhvbjMtZHRjXzEuOC4xLmJifSAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtZHRjXzEuNy4yLmJiID0+IHB5dGhvbjMt
ZHRjXzEuOC4xLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1kdGNfMS43LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtZHRjXzEuOC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdGNfMS43LjIuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdGNfMS44LjEuYmIKaW5kZXgg
OTUyNWMzNDBjZC4uZDFlNDRiMTYzYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWR0Y18xLjcuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtZHRjXzEuOC4xLmJiCkBAIC0xMyw3ICsxMyw3IEBAIFVQU1RSRUFNX0NI
RUNLX0dJVFRBR1JFR0VYID0gInYoP1A8cHZlcj5cZCsoXC5cZCspKykiCiAKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL3B5bGliZmR0L2xpYmZkdC5pO2JlZ2lubGluZT0xO2VuZGxpbmU9Njtt
ZDU9YWZkYTA4OGM5NzQxNzRhMjkxMDhjOGQ4MGI1ZGNlOTAiCiAKLVNSQ1JFViA9ICIyZDEwYWEy
YWZlMzU1Mjc3MjhkYjMwYjM1ZWM0OTFlY2I2OTU5ZTVjIgorU1JDUkVWID0gIjhmNDg1NjVlNWNm
ZWRjNzRkM2Y3NTEyZjFlMDE4OGU5ZDg1ZGMxZGUiCiAKIFBZUEFfV0hFRUwgPSAiJHtTfS9kaXN0
L2xpYmZkdC0xLjYuMioud2hsIgogCi0tIAoyLjQ3LjEKCg==

--===============2973790415783635248==--

