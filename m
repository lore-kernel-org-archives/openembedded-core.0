Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6000D73EBB
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:55 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29062.1769951573731433471
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xH1XFT6X;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=f9p8ZsrN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019c1955b45a-13f9971f-15ba-44e2-a53d-082fe4260e82-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=njWej7UbtCm9OnhuKwe9hwf78K6dFjAUkcA+u7mYDk8=;
	b=xH1XFT6XJ4Xr3OipGrkkSReq+rZD41ZG/tVgq90OHG6mrgWnQ3avoOsCLfpaTmFu
	er9kFuP5FElAnS22R6k3ZoPe8TYnESSvCxsmT4XHVbADkxnp+ru7ZWSQNqXaHiNzM1r
	L9XMhLuT7VpUmVmPd183MuD1sWbt7iilJrW7Nmm4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=njWej7UbtCm9OnhuKwe9hwf78K6dFjAUkcA+u7mYDk8=;
	b=f9p8ZsrNE95NPE1BktyxiidiUEc5ENKVlAADdpyN0YX157iAPVNyAdN1E0puyYoK
	pOCFZIcAmlijXUl+O1hIOYkAX8SG6BtZyDU93SngISoMKyB3m5pQNAw5n9vj2eLYhsp
	+2bND61mmrvwURLtpJwcYp5HTH0qMhKCodXd0jf4=
Content-Type: multipart/mixed; boundary="===============7722761473901831284=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wheel: upgrading to 0.46.3 FAILED
Message-ID: <0101019c1955b45a-13f9971f-15ba-44e2-a53d-082fe4260e82-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230299

--===============7722761473901831284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-wheel* to *0.46.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-wheel-upgrade-0.46.1-0.46.3.patch
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
From 6b61e48bef8bca9e95d0fea554196dc23df4c368 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 09:41:37 +0000
Subject: [PATCH] python3-wheel: upgrade 0.46.1 -> 0.46.3

---
 .../python/{python3-wheel_0.46.1.bb => python3-wheel_0.46.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.46.1.bb => python3-wheel_0.46.3.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.46.1.bb b/meta/recipes-devtools/python/python3-wheel_0.46.3.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-wheel_0.46.1.bb
rename to meta/recipes-devtools/python/python3-wheel_0.46.3.bb
index 058af2f0e7..2545e5496e 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.46.1.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.46.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "fd477efb5da0f7df1d3c76c73c14394002c844451bd63229d8570f376f5e6a38"
+SRC_URI[sha256sum] = "e3e79874b07d776c40bd6033f8ddf76a7dad46a7b8aa1b2787a83083519a1803"
 
 inherit python_flit_core pypi ptest-python-pytest
 
-- 
2.47.1


--===============7722761473901831284==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wheel-upgrade-0.46.1-0.46.3.patch"

RnJvbSA2YjYxZTQ4YmVmOGJjYTllOTVkMGZlYTU1NDE5NmRjMjNkZjRjMzY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwOTo0MTozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2hlZWw6IHVwZ3JhZGUgMC40Ni4xIC0+IDAuNDYuMwoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXdoZWVsXzAuNDYuMS5iYiA9PiBweXRob24zLXdoZWVsXzAuNDYuMy5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXdoZWVsXzAuNDYuMS5iYiA9PiBw
eXRob24zLXdoZWVsXzAuNDYuMy5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2hlZWxfMC40Ni4xLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVsXzAuNDYuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDg5
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2hlZWxf
MC40Ni4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
d2hlZWxfMC40Ni4zLmJiCmluZGV4IDA1OGFmMmYwZTcuLjI1NDVlNTQ5NmUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13aGVlbF8wLjQ2LjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVsXzAuNDYuMy5iYgpA
QCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIk1JVCIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT03ZmZiMGRiMDQ1Mjdj
ZmUzODBlNGYyNzI2YmQwNWViZiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImZkNDc3ZWZiNWRh
MGY3ZGYxZDNjNzZjNzNjMTQzOTQwMDJjODQ0NDUxYmQ2MzIyOWQ4NTcwZjM3NmY1ZTZhMzgiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZTNlNzk4NzRiMDdkNzc2YzQwYmQ2MDMzZjhkZGY3NmE3ZGFk
NDZhN2I4YWExYjI3ODdhODMwODM1MTlhMTgwMyIKIAogaW5oZXJpdCBweXRob25fZmxpdF9jb3Jl
IHB5cGkgcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============7722761473901831284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1957 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-30dff494ec9bae4bc94705f02c693f741cdafa5c"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:30dff494ec9bae4bc94705f02c693f741cdafa5c"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 342 Local 82 Mirrors 0 Missed 260 Current 410 (23% match, 65% complete)
done.
Removing 107 stale sstate objects for arch x86-64-v3...done.
Removing 5 stale sstate objects for arch x86_64...done.
Removing 60 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 578 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 590 of 752 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 596 of 752 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 638 of 752 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 747 of 752 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 447 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_recipe_qa)
NOTE: Running task 1104 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_recipe_qa)
NOTE: recipe python3-packaging-25.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-native-25.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-packaging-25.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-wheel-0.46.3-r0: task do_recipe_qa: Started
NOTE: Running task 1320 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_fetch)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1329 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_fetch)
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1382 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1383 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_fetch)
NOTE: Running setscene task 751 of 752 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-native-25.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_fetch: Started
NOTE: recipe python3-packaging-25.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: Running task 1413 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_unpack)
NOTE: Running task 1414 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_unpack)
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1415 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_fetch)
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_fetch: Started
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1416 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_unpack)
NOTE: recipe python3-wheel-0.46.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1417 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_fetch)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_unpack: Started
NOTE: recipe python3-packaging-25.0-r0: task do_unpack: Started
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1419 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb:do_fetch)
NOTE: recipe python3-packaging-25.0-r0: task do_unpack: Succeeded
NOTE: Running task 1420 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_patch)
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_fetch: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_unpack: Started
NOTE: Running task 1421 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_unpack)
NOTE: Running task 1422 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wheel-0.46.3-r0: task do_fetch: Started
NOTE: Running task 1423 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_patch)
NOTE: recipe python3-wheel-0.46.3-r0: task do_fetch: Succeeded
NOTE: Running task 1424 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_unpack)
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_fetch: Started
NOTE: recipe python3-packaging-25.0-r0: task do_patch: Started
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1425 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb:do_unpack)
NOTE: Running task 1426 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_patch: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_unpack: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wheel-0.46.3-r0: task do_unpack: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_unpack: Succeeded
NOTE: Running task 1427 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_patch)
NOTE: Running task 1428 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-wheel-0.46.3-r0: task do_unpack: Succeeded
NOTE: Running task 1429 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_patch)
NOTE: recipe python3-packaging-25.0-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_patch: Started
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_unpack: Started
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_unpack: Succeeded
NOTE: Running task 1431 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb:do_patch)
NOTE: recipe python3-wheel-0.46.3-r0: task do_patch: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_patch: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_patch: Succeeded
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_patch: Started
NOTE: recipe python3-wheel-0.46.3-r0: task do_patch: Succeeded
NOTE: Running task 1434 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1435 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_populate_lic)
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_patch: Succeeded
NOTE: recipe python3-wheel-0.46.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wheel-0.46.3-r0: task do_populate_lic: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_patch: Succeeded
NOTE: Running task 1437 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wheel-0.46.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-wheel-0.46.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_deploy_source_date_epoch unihash changed to a4b7d80f3728253f2fd208f79cfe0e879714992445ac3da6546eec99d9ba3fb9
NOTE: Setscene tasks completed
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_deploy_source_date_epoch unihash changed to d1586f4c1c8a5acbae1ac01aeb520c41347544423b1543608ed007a88770b9a9
NOTE: Setscene tasks completed
NOTE: Running task 1438 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_configure)
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_configure: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_configure: Succeeded
NOTE: Running task 1439 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_compile)
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_compile: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_compile: Succeeded
NOTE: Running task 1440 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_install)
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_install: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_install: Succeeded
NOTE: Running task 1441 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_populate_sysroot)
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1442 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1443 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.3.bb:do_create_spdx)
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_create_spdx: Started
NOTE: recipe python3-wheel-native-0.46.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1444 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1445 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_configure)
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_configure: Succeeded
NOTE: Running task 1446 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_compile)
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_compile: Succeeded
NOTE: Running task 1447 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_install)
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_install: Succeeded
NOTE: Running task 1448 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot)
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1449 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1450 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1451 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_create_spdx)
NOTE: Running task 1452 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1453 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_prepare_recipe_sysroot)
NOTE: recipe meson-native-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_create_spdx: Started
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-native-9.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe meson-native-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-native-9.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1454 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_configure)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1455 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_configure)
NOTE: Running task 1456 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb:do_configure)
NOTE: Running task 1457 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_configure)
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1458 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_collect_spdx_deps)
NOTE: Running task 1459 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb:do_collect_spdx_deps)
NOTE: recipe meson-native-1.10.1-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-native-9.2.2-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_configure: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-native-9.2.2-r0: task do_configure: Succeeded
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_configure: Succeeded
NOTE: recipe meson-native-1.10.1-r0: task do_configure: Succeeded
NOTE: recipe meson-native-1.10.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-setuptools-scm-native-9.2.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1460 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb:do_compile)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_configure: Succeeded
NOTE: Running task 1461 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_compile)
NOTE: Running task 1462 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_compile)
NOTE: Running task 1463 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_compile)
NOTE: recipe python3-setuptools-scm-native-9.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe meson-native-1.10.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-setuptools-scm-native-9.2.2-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_compile: Started
NOTE: recipe meson-native-1.10.1-r0: task do_compile: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_compile: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_compile: Succeeded
NOTE: Running task 1464 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_install)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_install: Started
NOTE: recipe python3-setuptools-scm-native-9.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1465 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb:do_install)
NOTE: recipe python3-setuptools-scm-native-9.2.2-r0: task do_install: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_install: Succeeded
NOTE: Running task 1466 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_populate_sysroot)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot: Started
NOTE: recipe python3-setuptools-scm-native-9.2.2-r0: task do_install: Succeeded
NOTE: Running task 1467 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb:do_populate_sysroot)
NOTE: recipe python3-setuptools-scm-native-9.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1468 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-native-9.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1469 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1470 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb:do_create_spdx)
NOTE: recipe python3-setuptools-scm-native-9.2.2-r0: task do_create_spdx: Started
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1471 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb:do_configure)
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_configure: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1472 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_configure)
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_configure: Succeeded
NOTE: Running task 1473 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb:do_compile)
NOTE: recipe python3-setuptools-scm-native-9.2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_configure: Started
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_compile: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 1474 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_compile)
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_compile: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_compile: Succeeded
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_compile: Succeeded
NOTE: Running task 1475 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_install)
NOTE: Running task 1476 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb:do_install)
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_install: Started
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_install: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 1477 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_populate_sysroot)
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_install: Succeeded
NOTE: Running task 1478 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb:do_populate_sysroot)
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-trove-classifiers-native-2025.12.1.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1479 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.28.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hatchling-native-1.28.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hatchling-native-1.28.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1480 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.28.0.bb:do_configure)
NOTE: recipe python3-hatchling-native-1.28.0-r0: task do_configure: Started
NOTE: recipe python3-hatchling-native-1.28.0-r0: task do_configure: Succeeded
NOTE: Running task 1481 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.28.0.bb:do_compile)
NOTE: recipe python3-hatchling-native-1.28.0-r0: task do_compile: Started
NOTE: recipe python3-hatchling-native-1.28.0-r0: task do_compile: Succeeded
NOTE: Running task 1482 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.28.0.bb:do_install)
NOTE: recipe python3-hatchling-native-1.28.0-r0: task do_install: Started
NOTE: recipe python3-hatchling-native-1.28.0-r0: task do_install: Succeeded
NOTE: Running task 1483 of 2105 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.28.0.bb:do_populate_sysroot)
NOTE: recipe python3-hatchling-native-1.28.0-r0: task do_populate_sysroot: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/config/setupcfg.py", line 285, in __setitem__
|     current_value = getattr(target_obj, option_name)
| AttributeError: 'MinimalDistribution' object has no attribute 'entry_points'
| 
| The above exception was the direct cause of the following exception:
| 
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
|     main()
|     ~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
|     json_out["return_val"] = hook(**hook_input["kwargs"])
|                              ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
|     return hook(config_settings)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 331, in get_requires_for_build_wheel
|     return self._get_build_requires(config_settings, requirements=[])
|            ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
|     self.run_setup()
|     ~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 317, in run_setup
|     exec(code, locals())
|     ~~~~^^^^^^^^^^^^^^^^
|   File "<string>", line 34, in <module>
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/__init__.py", line 114, in setup
|     _install_setup_requires(attrs)
|     ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/__init__.py", line 85, in _install_setup_requires
|     dist.parse_config_files(ignore_option_errors=True)
|     ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/dist.py", line 752, in parse_config_files
|     setupcfg.parse_configuration(
|     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
|         self, self.command_options, ignore_option_errors=ignore_option_errors
|         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|     )
|     ^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/config/setupcfg.py", line 176, in parse_configuration
|     options.parse()
|     ~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/config/setupcfg.py", line 502, in parse
|     section_parser_method(section_options)
|     ~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/config/setupcfg.py", line 717, in parse_section_entry_points
|     self['entry_points'] = parsed
|     ~~~~^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/config/setupcfg.py", line 287, in __setitem__
|     raise KeyError(option_name) from e
| KeyError: 'entry_points'
| 
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/temp/run.do_compile.1696722:159 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/sources/meson-1.10.1'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/temp/run.do_compile.1696722, line 159
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/temp/run.do_compile.1696722, line 154
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/temp/run.do_compile.1696722, line 163
NOTE: recipe meson-native-1.10.1-r0: task do_compile: Failed
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| usage: _in_process.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]
|    or: _in_process.py --help [cmd1 cmd2 ...]
|    or: _in_process.py --help-commands
|    or: _in_process.py cmd --help
| 
| error: invalid command 'egg_info'
| 
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.3/temp/run.do_compile.1696721:159 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.3/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.3/sources/markupsafe-3.0.3'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.3/temp/run.do_compile.1696721, line 159
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.3/temp/run.do_compile.1696721, line 154
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.3/temp/run.do_compile.1696721, line 163
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_compile: Failed
NOTE: recipe python3-hatchling-native-1.28.0-r0: task do_populate_sysroot: Succeeded
NOTE: Tasks Summary: Attempted 1483 tasks of which 1411 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201094114.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201094114.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/temp/log.do_compile.1696722
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.3/temp/log.do_compile.1696721
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: meson-native-1.10.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/temp/run.do_compile.1696722' failed with exit code 1
ERROR: python3-markupsafe-native-3.0.3-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.3/temp/run.do_compile.1696721' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/meson-native/1.10.1/temp/log.do_compile.1696722
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_compile) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.3/temp/log.do_compile.1696721
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_compile) failed with exit code '1'

--===============7722761473901831284==--

