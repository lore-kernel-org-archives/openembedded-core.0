Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07E5CA1009
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:13 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.5664.1693650552114500609
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JY/7qxCh;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=owejRDM1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018a55708171-390cca4f-26c6-46cd-9a58-056fb92472f7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AWDW9Xx1EuAKVjHBomY++7WnntYdHc3Ie6h1lDt00/w=;
	b=JY/7qxCh2ic2SxuEBibrEl83IIfj8e3zI8e0XqP2uZdI6gqrQbmKY8OEwNuqNsCk
	N//yD8yoGtsB2SwtpRk0nRZIQUfBrUFsk+yJ0DpFGbar1x4UJLEicyxlXunAEW6RHjY
	nttRalLTxbkRWwoa1FOklv5UjUKFY/Ynap+ftd+I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AWDW9Xx1EuAKVjHBomY++7WnntYdHc3Ie6h1lDt00/w=;
	b=owejRDM1x0wAjrLVLZ2hQSUWSgqrWNsIYKPg5Idi7AEa1Q/j99zvlqajKy7tUVaZ
	HxavFqdL8xhS+8H0bz2CNUxfwjFeN3bFlQsw/UybwUiSReNtxfcggeU6pzBwKYG61fO
	uR2gwZVprzoMq9xhDOXzdGpDSlaoy9ZnG65wSgvM=
Content-Type: multipart/mixed; boundary="===============2514393974525331888=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] neard: upgrading to 0.19 SUCCEEDED
Message-ID: <0101018a55708171-390cca4f-26c6-46cd-9a58-056fb92472f7-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187034

--===============2514393974525331888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *neard* to *0.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-neard-upgrade-0.18-0.19.patch
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
From bcf70cbbcce617b712c20947f02b1f671ac2305a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 07:51:31 +0000
Subject: [PATCH] neard: upgrade 0.18 -> 0.19

---
 .../recipes-connectivity/neard/{neard_0.18.bb => neard_0.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/neard/{neard_0.18.bb => neard_0.19.bb} (97%)

diff --git a/meta/recipes-connectivity/neard/neard_0.18.bb b/meta/recipes-connectivity/neard/neard_0.19.bb
similarity index 97%
rename from meta/recipes-connectivity/neard/neard_0.18.bb
rename to meta/recipes-connectivity/neard/neard_0.19.bb
index 362a7615b6..a98f436b98 100644
--- a/meta/recipes-connectivity/neard/neard_0.18.bb
+++ b/meta/recipes-connectivity/neard/neard_0.19.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=https;bra
            file://0001-Add-header-dependency-to-nciattach.o.patch \
           "
 
-SRCREV = "c781008d3786e03173f0a0f5dfcc0545c787d7fc"
+SRCREV = "a1dc8a75cba999728e154a0f811ab9dd50c809f7"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============2514393974525331888==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-neard-upgrade-0.18-0.19.patch"

RnJvbSBiY2Y3MGNiYmNjZTYxN2I3MTJjMjA5NDdmMDJiMWY2NzFhYzIzMDVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAwNzo1MTozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5l
YXJkOiB1cGdyYWRlIDAuMTggLT4gMC4xOQoKLS0tCiAuLi4vcmVjaXBlcy1jb25uZWN0aXZpdHkv
bmVhcmQve25lYXJkXzAuMTguYmIgPT4gbmVhcmRfMC4xOS5iYn0gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L25lYXJkL3tuZWFyZF8wLjE4LmJiID0+IG5lYXJkXzAuMTkuYmJ9ICg5NyUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZWFyZC9uZWFyZF8wLjE4
LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZWFyZC9uZWFyZF8wLjE5LmJiCnNpbWls
YXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmVh
cmQvbmVhcmRfMC4xOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZWFy
ZC9uZWFyZF8wLjE5LmJiCmluZGV4IDM2MmE3NjE1YjYuLmE5OGY0MzZiOTggMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmVhcmQvbmVhcmRfMC4xOC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L25lYXJkL25lYXJkXzAuMTkuYmIKQEAgLTE1LDcgKzE1LDcg
QEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL25ldHdvcmsvbmZjL25l
YXJkLmdpdDtwcm90b2NvbD1odHRwczticmEKICAgICAgICAgICAgZmlsZTovLzAwMDEtQWRkLWhl
YWRlci1kZXBlbmRlbmN5LXRvLW5jaWF0dGFjaC5vLnBhdGNoIFwKICAgICAgICAgICAiCiAKLVNS
Q1JFViA9ICJjNzgxMDA4ZDM3ODZlMDMxNzNmMGEwZjVkZmNjMDU0NWM3ODdkN2ZjIgorU1JDUkVW
ID0gImExZGM4YTc1Y2JhOTk5NzI4ZTE1NGEwZjgxMWFiOWRkNTBjODA5ZjciCiAKIFMgPSAiJHtX
T1JLRElSfS9naXQiCiAKLS0gCjIuMzkuMgoK

--===============2514393974525331888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-78ebd60556f221ca88f7d8941ce1a67663b9eec2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:78ebd60556f221ca88f7d8941ce1a67663b9eec2"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 43 Local 5 Mirrors 0 Missed 38 Current 878 (11% match, 95% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1541 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1619 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa)
NOTE: Running task 1677 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_recipe_qa)
NOTE: Running task 1812 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Started
NOTE: Running task 1978 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_recipe_qa)
NOTE: recipe libnl-1_3.7.0-r0: task do_recipe_qa: Started
NOTE: Running task 2065 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_recipe_qa)
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Started
NOTE: recipe neard-0.19-r0: task do_recipe_qa: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_recipe_qa: Started
NOTE: Running task 2410 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: recipe libnl-1_3.7.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2411 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2412 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe neard-0.19-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2413 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_fetch)
NOTE: recipe wpa-supplicant-2.10-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2414 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 2415 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 2416 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 2417 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: recipe bluez5-5.68-r0: task do_fetch: Started
NOTE: recipe neard-0.19-r0: task do_fetch: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_fetch: Started
NOTE: recipe bluez5-5.68-r0: task do_fetch: Succeeded
NOTE: Running task 2418 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_unpack)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 2419 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: recipe neard-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 2420 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2421 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 2422 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_unpack)
NOTE: Running task 2423 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: Running task 2424 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_collect_spdx_deps)
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_unpack: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_unpack: Started
NOTE: Running task 2425 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe neard-0.19-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2426 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_patch)
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2427 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe wpa-supplicant-2.10-r0: task do_patch: Started
NOTE: recipe bluez5-5.68-r0: task do_unpack: Succeeded
NOTE: Running task 2428 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 2429 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 7568d355d9c9c8ce2f4df915a11aa6dcfb33f13fac4dcb464666b2b9b9ba02ef
NOTE: Running task 2443 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.68-r0: task do_patch: Started
NOTE: recipe neard-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 2456 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_patch)
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_patch: Succeeded
NOTE: Running task 2457 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe neard-0.19-r0: task do_patch: Started
NOTE: Running task 2458 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe wpa-supplicant-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe bluez5-5.68-r0: task do_patch: Succeeded
NOTE: Running task 2459 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_deploy_source_date_epoch)
NOTE: recipe wpa-supplicant-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe neard-0.19-r0: task do_patch: Succeeded
NOTE: Running task 2460 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2461 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 2462 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe neard-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe neard-0.19-r0: task do_populate_lic: Started
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe neard-0.19-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_populate_lic unihash changed to d18cdc7b89e40451c781550b7dc660d7171daeaccf73082689a2042671b15d3e
NOTE: recipe neard-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9817e6a4efa6dd3c576432bcaa0a5cf193db4cf18a5504b969245390a17b5548
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 83dda103786a4c4107199221b59116db273cf3031f0be4a88b8504ba0bb82ca0 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '00745539d3b1d711db999d7a0dc8de0492d96ab27b51b34b34f9c90bbb451e5b', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '83dda103786a4c4107199221b59116db273cf3031f0be4a88b8504ba0bb82ca0'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 00745539d3b1d711db999d7a0dc8de0492d96ab27b51b34b34f9c90bbb451e5b -> 83dda103786a4c4107199221b59116db273cf3031f0be4a88b8504ba0bb82ca0 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 2476 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.68-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2477 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_configure)
NOTE: recipe bluez5-5.68-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.68-r0: task do_configure: Started
NOTE: recipe bluez5-5.68-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_configure: Succeeded
NOTE: Running task 2481 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.68-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.68-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2482 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_compile)
NOTE: recipe bluez5-5.68-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2483 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2484 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2485 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2486 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2487 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2488 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2489 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe bluez5-5.68-r0: task do_compile: Succeeded
NOTE: Running task 2490 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_compile_ptest_base)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.68-r0: task do_compile_ptest_base: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2491 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx)
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2492 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_collect_spdx_deps)
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2493 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2494 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2495 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2496 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install)
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Succeeded
NOTE: Running task 2497 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2498 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_package)
NOTE: Running task 2499 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_populate_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2500 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2501 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe neard-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2502 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_configure)
NOTE: recipe neard-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2503 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_configure)
NOTE: recipe wpa-supplicant-2.10-r0: task do_configure: Started
NOTE: recipe neard-0.19-r0: task do_configure: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2504 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_compile)
NOTE: recipe wpa-supplicant-2.10-r0: task do_compile: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Succeeded
NOTE: Running task 2505 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2506 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_create_spdx)
NOTE: recipe libnl-1_3.7.0-r0: task do_create_spdx: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2507 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_install)
NOTE: recipe wpa-supplicant-2.10-r0: task do_install: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_install: Succeeded
NOTE: Running task 2508 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_collect_spdx_deps)
NOTE: Running task 2509 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_package)
NOTE: Running task 2510 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_collect_spdx_deps)
NOTE: recipe neard-0.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_package: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe neard-0.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2511 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_install)
NOTE: recipe wpa-supplicant-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_install: Started
NOTE: recipe bluez5-5.68-r0: task do_install: Succeeded
NOTE: Running task 2512 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.68-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.68-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2513 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_package)
NOTE: recipe bluez5-5.68-r0: task do_package: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_package: Succeeded
NOTE: Running task 2514 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_packagedata)
NOTE: recipe wpa-supplicant-2.10-r0: task do_packagedata: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2515 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_create_spdx)
NOTE: Running task 2516 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_package_write_rpm)
NOTE: recipe wpa-supplicant-2.10-r0: task do_create_spdx: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_create_spdx: Succeeded
NOTE: recipe neard-0.19-r0: task do_configure: Succeeded
NOTE: Running task 2517 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_compile)
NOTE: recipe neard-0.19-r0: task do_compile: Started
NOTE: recipe neard-0.19-r0: task do_compile: Succeeded
NOTE: Running task 2518 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_install)
NOTE: recipe neard-0.19-r0: task do_install: Started
NOTE: recipe neard-0.19-r0: task do_install: Succeeded
NOTE: Running task 2519 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_package)
NOTE: Running task 2520 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_populate_sysroot)
NOTE: recipe neard-0.19-r0: task do_package: Started
NOTE: recipe neard-0.19-r0: task do_populate_sysroot: Started
NOTE: recipe neard-0.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_package: Succeeded
NOTE: Running task 2521 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata)
NOTE: recipe bluez5-5.68-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.68-r0: task do_packagedata: Failed
NOTE: recipe wpa-supplicant-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe neard-0.19-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 2521 tasks of which 2444 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/bluez5/5.68/temp/log.do_packagedata.4078587
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata) failed with exit code '1'

--===============2514393974525331888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/neard: PKGV changed from 0.18 [default] to 0.19 [default]
packages/core2-32-poky-linux/neard: PV changed from "0.18" to "0.19"
packages/core2-32-poky-linux/neard/neard-dbg: PKGV changed from 0.18 [default] to 0.19 [default]
packages/core2-32-poky-linux/neard/neard-dbg: PV changed from "0.18" to "0.19"
packages/core2-32-poky-linux/neard/neard-dbg: PKGSIZE changed from 864456 to 866928 (+0%)
packages/core2-32-poky-linux/neard/neard-dev: PKGV changed from 0.18 [default] to 0.19 [default]
packages/core2-32-poky-linux/neard/neard-dev: PV changed from "0.18" to "0.19"
packages/core2-32-poky-linux/neard/neard-dev: PKGSIZE changed from 36740 to 36767 (+0%)
packages/core2-32-poky-linux/neard/neard-doc: PKGV changed from 0.18 [default] to 0.19 [default]
packages/core2-32-poky-linux/neard/neard-doc: PV changed from "0.18" to "0.19"
packages/core2-32-poky-linux/neard/neard-locale: PKGV changed from 0.18 [default] to 0.19 [default]
packages/core2-32-poky-linux/neard/neard-locale: PV changed from "0.18" to "0.19"
packages/core2-32-poky-linux/neard/neard-src: PKGV changed from 0.18 [default] to 0.19 [default]
packages/core2-32-poky-linux/neard/neard-src: PV changed from "0.18" to "0.19"
packages/core2-32-poky-linux/neard/neard-src: PKGSIZE changed from 763565 to 764729 (+0%)
packages/core2-32-poky-linux/neard/neard-staticdev: PKGV changed from 0.18 [default] to 0.19 [default]
packages/core2-32-poky-linux/neard/neard-staticdev: PV changed from "0.18" to "0.19"
packages/core2-32-poky-linux/neard/neard: PKGV changed from 0.18 [default] to 0.19 [default]
packages/core2-32-poky-linux/neard/neard: PV changed from "0.18" to "0.19"
packages/core2-32-poky-linux/neard/neard: PKGSIZE changed from 426383 to 426447 (+0%)

--===============2514393974525331888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 50 skipped, 0 masked, 0 errors.
Removing 78 recipes from the core2-32 sysroot...done.
Removing 106 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-78ebd60556f221ca88f7d8941ce1a67663b9eec2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:78ebd60556f221ca88f7d8941ce1a67663b9eec2"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 503 Local 465 Mirrors 0 Missed 38 Current 358 (92% match, 95% complete)
Removing 1 stale sstate objects for arch allarch...done.
Removing 2 stale sstate objects for arch qemux86...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 381 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 383 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 384 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 385 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 387 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 392 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.44.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 405 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 406 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 410 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 411 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 417 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 418 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 423 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-dbus-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pygobject-3.44.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 451 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Started
NOTE: Running task 916 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa)
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: Running task 919 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_recipe_qa)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Started
NOTE: Running task 983 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_recipe_qa)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: Running task 1010 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_recipe_qa)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1041 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_recipe_qa)
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_recipe_qa: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 459 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe neard-0.19-r0: task do_recipe_qa: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_recipe_qa: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Started
NOTE: Running setscene task 465 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 466 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 479 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pycairo-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe neard-0.19-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1130 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1131 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 506 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 508 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 509 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 510 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running task 1132 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_fetch)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1133 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_fetch)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1134 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_fetch)
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe neard-0.19-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 517 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 1161 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_fetch: Started
NOTE: Running task 1162 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_fetch: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 1163 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_unpack)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe neard-0.19-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 522 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 524 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running task 1177 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_unpack)
NOTE: recipe bluez5-5.68-r0: task do_fetch: Succeeded
NOTE: Running task 1178 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_unpack)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 528 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 532 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 534 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1185 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: Running setscene task 537 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: Running task 1186 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: recipe neard-0.19-r0: task do_unpack: Started
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_unpack: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 552 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1193 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 556 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe wpa-supplicant-2.10-r0: task do_unpack: Succeeded
NOTE: Running setscene task 557 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1199 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_fetch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_fetch: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1230 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 561 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 1234 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1235 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 563 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 567 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 572 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 1247 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1253 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_patch)
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 576 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_unpack: Succeeded
NOTE: recipe neard-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 1260 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_patch)
NOTE: Running task 1261 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 596 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 600 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_patch: Started
NOTE: Running setscene task 603 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1273 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe neard-0.19-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 606 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_patch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 623 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running task 1300 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 631 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 636 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_configure: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_patch: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1336 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r90: task do_configure: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: Running task 1337 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe neard-0.19-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1344 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1345 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_populate_lic)
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_compile: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe neard-0.19-r0: task do_populate_lic: Started
NOTE: recipe neard-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_compile: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: Running task 1372 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe neard-0.19-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_populate_lic unihash changed to d18cdc7b89e40451c781550b7dc660d7171daeaccf73082689a2042671b15d3e
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe neard-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 669 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 672 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 673 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 697 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 698 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1413 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 708 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 712 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 730 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 733 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 741 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 742 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 748 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 752 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 759 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 766 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 767 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 774 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 777 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 789 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 791 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 793 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 800 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 804 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 807 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 809 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 810 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 816 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 823 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 825 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 828 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 830 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 832 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 833 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 834 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 835 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 837 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 1548 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 844 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3a1cc294b777438cf57075b2ade5a9c63b5460abf3eed3615217df9727300a7a
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash abc41d9ad02fbb047a6f938d351c52e9be9e06931172bd0a12c97dfd0ce0c325 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': 'd9f00440b1ad60cdc184a0d121f86b2c1cef720ffbbe3da0cf1b80270eca6a5d', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'abc41d9ad02fbb047a6f938d351c52e9be9e06931172bd0a12c97dfd0ce0c325'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed d9f00440b1ad60cdc184a0d121f86b2c1cef720ffbbe3da0cf1b80270eca6a5d -> abc41d9ad02fbb047a6f938d351c52e9be9e06931172bd0a12c97dfd0ce0c325 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 849 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 850 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 852 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 856 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 857 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 859 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 861 of 861 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1899 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1909 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2208 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2289 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 8e674b5c93ffaaba6f218d1060d51b2e2023bdc01969167a5eb944c404805895
NOTE: Running task 2298 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2313 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.68-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.68-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.68-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2316 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_configure)
NOTE: recipe bluez5-5.68-r0: task do_configure: Started
NOTE: recipe bluez5-5.68-r0: task do_configure: Succeeded
NOTE: Running task 2317 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.68-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.68-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2318 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_compile)
NOTE: recipe bluez5-5.68-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2319 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2320 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2321 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2322 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2323 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2324 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2325 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2326 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx)
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.68-r0: task do_compile: Succeeded
NOTE: Running task 2327 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.68-r0: task do_compile_ptest_base: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2328 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_collect_spdx_deps)
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2329 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2330 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2331 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2332 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install)
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Succeeded
NOTE: Running task 2333 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2334 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_package)
NOTE: Running task 2335 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_populate_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2336 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2337 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe neard-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2338 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_configure)
NOTE: recipe neard-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2339 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_configure)
NOTE: recipe wpa-supplicant-2.10-r0: task do_configure: Started
NOTE: recipe neard-0.19-r0: task do_configure: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2340 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_compile)
NOTE: recipe wpa-supplicant-2.10-r0: task do_compile: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Succeeded
NOTE: Running task 2341 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2342 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_create_spdx)
NOTE: recipe libnl-1_3.7.0-r0: task do_create_spdx: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2343 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_install)
NOTE: recipe wpa-supplicant-2.10-r0: task do_install: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2344 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_collect_spdx_deps)
NOTE: Running task 2345 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_collect_spdx_deps)
NOTE: recipe neard-0.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe neard-0.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_install: Succeeded
NOTE: Running task 2346 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_package)
NOTE: recipe wpa-supplicant-2.10-r0: task do_package: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_package: Succeeded
NOTE: Running task 2347 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_packagedata)
NOTE: recipe wpa-supplicant-2.10-r0: task do_packagedata: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2348 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_create_spdx)
NOTE: Running task 2349 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_package_write_rpm)
NOTE: recipe wpa-supplicant-2.10-r0: task do_create_spdx: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_create_spdx: Succeeded
NOTE: recipe neard-0.19-r0: task do_configure: Succeeded
NOTE: Running task 2350 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_compile)
NOTE: recipe neard-0.19-r0: task do_compile: Started
NOTE: recipe neard-0.19-r0: task do_compile: Succeeded
NOTE: Running task 2351 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_install)
NOTE: recipe neard-0.19-r0: task do_install: Started
NOTE: recipe neard-0.19-r0: task do_install: Succeeded
NOTE: Running task 2352 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_package)
NOTE: Running task 2353 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_populate_sysroot)
NOTE: recipe neard-0.19-r0: task do_package: Started
NOTE: recipe neard-0.19-r0: task do_populate_sysroot: Started
NOTE: recipe neard-0.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe neard-0.19-r0: task do_package: Succeeded
NOTE: Running task 2354 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_packagedata)
NOTE: recipe neard-0.19-r0: task do_packagedata: Started
NOTE: recipe neard-0.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2355 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_create_spdx)
NOTE: recipe neard-0.19-r0: task do_create_spdx: Started
NOTE: recipe neard-0.19-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2356 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_install)
NOTE: recipe bluez5-5.68-r0: task do_install: Started
NOTE: recipe bluez5-5.68-r0: task do_install: Succeeded
NOTE: Running task 2357 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.68-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.68-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2358 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_package)
NOTE: recipe bluez5-5.68-r0: task do_package: Started
NOTE: recipe bluez5-5.68-r0: task do_package: Succeeded
NOTE: Running task 2359 of 2365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata)
NOTE: recipe bluez5-5.68-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.68-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2359 tasks of which 2274 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.68/temp/log.do_packagedata.4151788
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata) failed with exit code '1'

--===============2514393974525331888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-78ebd60556f221ca88f7d8941ce1a67663b9eec2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:78ebd60556f221ca88f7d8941ce1a67663b9eec2"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 43 Local 5 Mirrors 0 Missed 38 Current 872 (11% match, 95% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1531 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1608 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa)
NOTE: Running task 1664 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_recipe_qa)
NOTE: Running task 1799 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_recipe_qa)
NOTE: Running task 1963 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Started
NOTE: Running task 2050 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_recipe_qa)
NOTE: recipe libnl-1_3.7.0-r0: task do_recipe_qa: Started
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Started
NOTE: recipe neard-0.19-r0: task do_recipe_qa: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_recipe_qa: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2393 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: recipe libnl-1_3.7.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2394 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2395 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_fetch)
NOTE: recipe neard-0.19-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2396 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_fetch)
NOTE: recipe wpa-supplicant-2.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: Running task 2397 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 2398 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 2399 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 2400 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: recipe bluez5-5.68-r0: task do_fetch: Started
NOTE: recipe neard-0.19-r0: task do_fetch: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_fetch: Started
NOTE: recipe bluez5-5.68-r0: task do_fetch: Succeeded
NOTE: Running task 2401 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_unpack)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 2402 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_unpack)
NOTE: Running task 2403 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2404 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe neard-0.19-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: Running task 2405 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_unpack)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 2406 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: Running task 2407 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.68-r0: task do_unpack: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_unpack: Started
NOTE: Running task 2408 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe neard-0.19-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2409 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_patch)
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2410 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe wpa-supplicant-2.10-r0: task do_patch: Started
NOTE: recipe bluez5-5.68-r0: task do_unpack: Succeeded
NOTE: Running task 2411 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 2412 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 0b33c027f0202e62503cab7c451fbd457bbba674288a166b0ab8845afb7d30f6
NOTE: Running task 2426 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.68-r0: task do_patch: Started
NOTE: recipe neard-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 2439 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_patch)
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_patch: Succeeded
NOTE: Running task 2440 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe neard-0.19-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2441 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe wpa-supplicant-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.68-r0: task do_patch: Succeeded
NOTE: Running task 2442 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_deploy_source_date_epoch)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe neard-0.19-r0: task do_patch: Succeeded
NOTE: Running task 2443 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 2444 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_populate_lic)
NOTE: Running task 2445 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe neard-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe neard-0.19-r0: task do_populate_lic: Started
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe neard-0.19-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_populate_lic unihash changed to d18cdc7b89e40451c781550b7dc660d7171daeaccf73082689a2042671b15d3e
NOTE: recipe neard-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5a0aa8749c4947fab02dda4b951409725b6a3a9c7a5a5ec59338227ae49b9835
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 3ff80af77694be569d328e34277258c4206a8622bb755b993e851c8063300fde to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '5abd6e89a301b3d4b334f464add059a979173bebf7a8d59577ddc86208d91d84', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3ff80af77694be569d328e34277258c4206a8622bb755b993e851c8063300fde'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 5abd6e89a301b3d4b334f464add059a979173bebf7a8d59577ddc86208d91d84 -> 3ff80af77694be569d328e34277258c4206a8622bb755b993e851c8063300fde as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 2459 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.68-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2463 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_configure)
NOTE: recipe bluez5-5.68-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.68-r0: task do_configure: Started
NOTE: recipe bluez5-5.68-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_configure: Succeeded
NOTE: Running task 2464 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.68-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.68-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2465 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_compile)
NOTE: recipe bluez5-5.68-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2466 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2467 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2468 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2469 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2470 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2471 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2472 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2473 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx)
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2474 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_collect_spdx_deps)
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_compile: Succeeded
NOTE: Running task 2475 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.68-r0: task do_compile_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2476 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2477 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2478 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2479 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install)
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Succeeded
NOTE: Running task 2480 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2481 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_package)
NOTE: Running task 2482 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_populate_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2483 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2484 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe neard-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2485 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_configure)
NOTE: recipe neard-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2486 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_configure)
NOTE: recipe wpa-supplicant-2.10-r0: task do_configure: Started
NOTE: recipe neard-0.19-r0: task do_configure: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2487 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_compile)
NOTE: recipe wpa-supplicant-2.10-r0: task do_compile: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Succeeded
NOTE: Running task 2488 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2489 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_create_spdx)
NOTE: recipe libnl-1_3.7.0-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.68-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2490 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_install)
NOTE: recipe bluez5-5.68-r0: task do_install: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2491 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_install)
NOTE: recipe wpa-supplicant-2.10-r0: task do_install: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2492 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_collect_spdx_deps)
NOTE: Running task 2493 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_collect_spdx_deps)
NOTE: recipe neard-0.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe neard-0.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_install: Succeeded
NOTE: Running task 2494 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_install_ptest_base)
NOTE: recipe wpa-supplicant-2.10-r0: task do_install: Succeeded
NOTE: Running task 2495 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_package)
NOTE: recipe bluez5-5.68-r0: task do_install_ptest_base: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_package: Started
NOTE: recipe bluez5-5.68-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2496 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_package)
NOTE: recipe bluez5-5.68-r0: task do_package: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_package: Succeeded
NOTE: Running task 2497 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_packagedata)
NOTE: recipe wpa-supplicant-2.10-r0: task do_packagedata: Started
NOTE: recipe neard-0.19-r0: task do_configure: Succeeded
NOTE: Running task 2498 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_compile)
NOTE: recipe neard-0.19-r0: task do_compile: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2499 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_create_spdx)
NOTE: Running task 2500 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_package_write_rpm)
NOTE: recipe wpa-supplicant-2.10-r0: task do_create_spdx: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_create_spdx: Succeeded
NOTE: recipe neard-0.19-r0: task do_compile: Succeeded
NOTE: Running task 2501 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_install)
NOTE: recipe neard-0.19-r0: task do_install: Started
NOTE: recipe bluez5-5.68-r0: task do_package: Succeeded
NOTE: Running task 2502 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata)
NOTE: recipe bluez5-5.68-r0: task do_packagedata: Started
NOTE: recipe neard-0.19-r0: task do_install: Succeeded
NOTE: Running task 2503 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_package)
NOTE: Running task 2504 of 2512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_populate_sysroot)
NOTE: recipe neard-0.19-r0: task do_package: Started
NOTE: recipe neard-0.19-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.68-r0: task do_packagedata: Failed
NOTE: recipe neard-0.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe neard-0.19-r0: task do_package: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 2504 tasks of which 2427 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/bluez5/5.68/temp/log.do_packagedata.4020474
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata) failed with exit code '1'

--===============2514393974525331888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1808 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1807 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-78ebd60556f221ca88f7d8941ce1a67663b9eec2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:78ebd60556f221ca88f7d8941ce1a67663b9eec2"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 43 Local 5 Mirrors 0 Missed 38 Current 878 (11% match, 95% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1541 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1619 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa)
NOTE: Running task 1677 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_recipe_qa)
NOTE: Running task 1812 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: Running task 1978 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_recipe_qa)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Started
NOTE: Running task 2065 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_recipe_qa)
NOTE: recipe libnl-1_3.7.0-r0: task do_recipe_qa: Started
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Started
NOTE: recipe neard-0.19-r0: task do_recipe_qa: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_recipe_qa: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2410 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: recipe libnl-1_3.7.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2411 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2412 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_fetch)
NOTE: recipe neard-0.19-r0: task do_recipe_qa: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: Running task 2413 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_fetch)
NOTE: recipe wpa-supplicant-2.10-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2414 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 2415 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 2416 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 2417 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: recipe bluez5-5.68-r0: task do_fetch: Started
NOTE: recipe neard-0.19-r0: task do_fetch: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_fetch: Started
NOTE: recipe bluez5-5.68-r0: task do_fetch: Succeeded
NOTE: Running task 2418 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_unpack)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 2419 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_unpack)
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe neard-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 2420 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2421 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 2422 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_unpack)
NOTE: Running task 2423 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: Running task 2424 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.68-r0: task do_unpack: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 2425 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: recipe wpa-supplicant-2.10-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe neard-0.19-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 2426 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_patch)
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2427 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe wpa-supplicant-2.10-r0: task do_patch: Started
NOTE: recipe bluez5-5.68-r0: task do_unpack: Succeeded
NOTE: Running task 2428 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 2429 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d09c5a32b26f664d547f186926a3641ab5aaa30a571662d12e240218b0e77eee
NOTE: Running task 2443 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.68-r0: task do_patch: Started
NOTE: recipe neard-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 2456 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_patch)
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_patch: Succeeded
NOTE: Running task 2457 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe neard-0.19-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2458 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe wpa-supplicant-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.68-r0: task do_patch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: Running task 2459 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe neard-0.19-r0: task do_patch: Succeeded
NOTE: Running task 2460 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 2461 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 2462 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe neard-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe neard-0.19-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe neard-0.19-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_populate_lic unihash changed to d18cdc7b89e40451c781550b7dc660d7171daeaccf73082689a2042671b15d3e
NOTE: recipe neard-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3a34e87fb12bc478fce02fd1539f1bd8da47d021d6031c63048a9a21401fce53
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 3ba3e3a3e32625d0e3766b9de7bd21bbf1ea3b063fb22b44e164d3b8be9ea945 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '3087584524a0dad6d36b1c3162d261635cc2c3481b847135c08dd4deee5ddfb7', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3ba3e3a3e32625d0e3766b9de7bd21bbf1ea3b063fb22b44e164d3b8be9ea945'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 3087584524a0dad6d36b1c3162d261635cc2c3481b847135c08dd4deee5ddfb7 -> 3ba3e3a3e32625d0e3766b9de7bd21bbf1ea3b063fb22b44e164d3b8be9ea945 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 2476 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.68-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2477 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_configure)
NOTE: recipe bluez5-5.68-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.68-r0: task do_configure: Started
NOTE: recipe bluez5-5.68-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_configure: Succeeded
NOTE: Running task 2481 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.68-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.68-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2482 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_compile)
NOTE: recipe bluez5-5.68-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2483 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2484 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2485 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2486 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2487 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2488 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: recipe bluez5-5.68-r0: task do_compile: Succeeded
NOTE: Running task 2489 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.68-r0: task do_compile_ptest_base: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2490 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2491 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx)
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2492 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_collect_spdx_deps)
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2493 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2494 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2495 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2496 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install)
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Started
NOTE: recipe bluez5-5.68-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2497 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_install)
NOTE: recipe bluez5-5.68-r0: task do_install: Started
NOTE: recipe bluez5-5.68-r0: task do_install: Succeeded
NOTE: Running task 2498 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.68-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.68-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2499 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_package)
NOTE: recipe bluez5-5.68-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Succeeded
NOTE: Running task 2500 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2501 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_package)
NOTE: Running task 2502 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_populate_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2503 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2504 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe neard-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2505 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_configure)
NOTE: recipe neard-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2506 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_configure)
NOTE: recipe wpa-supplicant-2.10-r0: task do_configure: Started
NOTE: recipe neard-0.19-r0: task do_configure: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2507 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_compile)
NOTE: recipe wpa-supplicant-2.10-r0: task do_compile: Started
NOTE: recipe bluez5-5.68-r0: task do_package: Succeeded
NOTE: Running task 2508 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata)
NOTE: recipe bluez5-5.68-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.68-r0: task do_packagedata: Failed
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_compile: Succeeded
NOTE: recipe neard-0.19-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2508 tasks of which 2444 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/bluez5/5.68/temp/log.do_packagedata.3902088
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata) failed with exit code '1'

--===============2514393974525331888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-78ebd60556f221ca88f7d8941ce1a67663b9eec2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:78ebd60556f221ca88f7d8941ce1a67663b9eec2"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 43 Local 5 Mirrors 0 Missed 38 Current 878 (11% match, 95% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1541 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1619 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa)
NOTE: Running task 1677 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_recipe_qa)
NOTE: Running task 1812 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: Running task 1978 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_recipe_qa)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Started
NOTE: Running task 2065 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_recipe_qa)
NOTE: recipe libnl-1_3.7.0-r0: task do_recipe_qa: Started
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_recipe_qa: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe neard-0.19-r0: task do_recipe_qa: Started
NOTE: Running task 2410 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: recipe libnl-1_3.7.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2411 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2412 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_fetch)
NOTE: recipe wpa-supplicant-2.10-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2413 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe neard-0.19-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2414 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_fetch)
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 2415 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 2416 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 2417 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: recipe bluez5-5.68-r0: task do_fetch: Started
NOTE: recipe bluez5-5.68-r0: task do_fetch: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_fetch: Started
NOTE: Running task 2418 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_unpack)
NOTE: recipe neard-0.19-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2419 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: Running task 2420 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2421 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 2422 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe neard-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 2423 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_collect_spdx_deps)
NOTE: Running task 2424 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_unpack)
NOTE: recipe bluez5-5.68-r0: task do_unpack: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 2425 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: recipe wpa-supplicant-2.10-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe neard-0.19-r0: task do_unpack: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 2426 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2427 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.68-r0: task do_unpack: Succeeded
NOTE: Running task 2428 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_patch)
NOTE: recipe wpa-supplicant-2.10-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 2429 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f982a4123a6cd558c191245ca50978150707844bc8d5e1992485a942d8fdeede
NOTE: Running task 2443 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.68-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe neard-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 2456 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_patch)
NOTE: recipe bluez5-5.68-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_patch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2457 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe neard-0.19-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2458 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe wpa-supplicant-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.68-r0: task do_patch: Succeeded
NOTE: Running task 2459 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_deploy_source_date_epoch)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 2460 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe neard-0.19-r0: task do_patch: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2461 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 2462 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe neard-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe neard-0.19-r0: task do_populate_lic: Started
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe neard-0.19-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_populate_lic unihash changed to d18cdc7b89e40451c781550b7dc660d7171daeaccf73082689a2042671b15d3e
NOTE: recipe neard-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f561b45f6c5e241d6ad9ef43d77edcf1f3a5b9f911a27c22eff9209cd0f9544a
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 544f5a5a0187bc30338bb502cc7ec44d120b7562826c9110b3009b165bab87bb to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': 'ddb73a994fbdb1123294c2a39511eb04911a5146389d2ff8567f370a31c918e4', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '544f5a5a0187bc30338bb502cc7ec44d120b7562826c9110b3009b165bab87bb'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed ddb73a994fbdb1123294c2a39511eb04911a5146389d2ff8567f370a31c918e4 -> 544f5a5a0187bc30338bb502cc7ec44d120b7562826c9110b3009b165bab87bb as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 2476 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.68-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2477 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_configure)
NOTE: recipe bluez5-5.68-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.68-r0: task do_configure: Started
NOTE: recipe bluez5-5.68-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_configure: Succeeded
NOTE: Running task 2481 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.68-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.68-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2482 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_compile)
NOTE: recipe bluez5-5.68-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2483 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2484 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2485 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2486 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2487 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2488 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2489 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.68-r0: task do_compile: Succeeded
NOTE: Running task 2490 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.68-r0: task do_compile_ptest_base: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2491 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx)
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2492 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_collect_spdx_deps)
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2493 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2494 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2495 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2496 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install)
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Succeeded
NOTE: Running task 2497 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2498 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_package)
NOTE: Running task 2499 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_populate_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2500 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2501 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe neard-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2502 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_configure)
NOTE: recipe neard-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2503 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_configure)
NOTE: recipe wpa-supplicant-2.10-r0: task do_configure: Started
NOTE: recipe neard-0.19-r0: task do_configure: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2504 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_compile)
NOTE: recipe wpa-supplicant-2.10-r0: task do_compile: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Succeeded
NOTE: Running task 2505 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2506 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_create_spdx)
NOTE: recipe libnl-1_3.7.0-r0: task do_create_spdx: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2507 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_install)
NOTE: recipe wpa-supplicant-2.10-r0: task do_install: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2508 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_collect_spdx_deps)
NOTE: Running task 2509 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_collect_spdx_deps)
NOTE: recipe neard-0.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe neard-0.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_install: Succeeded
NOTE: Running task 2510 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_package)
NOTE: recipe wpa-supplicant-2.10-r0: task do_package: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_package: Succeeded
NOTE: Running task 2511 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_packagedata)
NOTE: recipe wpa-supplicant-2.10-r0: task do_packagedata: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2512 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_create_spdx)
NOTE: Running task 2513 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb:do_package_write_rpm)
NOTE: recipe wpa-supplicant-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_create_spdx: Started
NOTE: recipe neard-0.19-r0: task do_configure: Succeeded
NOTE: Running task 2514 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_compile)
NOTE: recipe neard-0.19-r0: task do_compile: Started
NOTE: recipe wpa-supplicant-2.10-r0: task do_create_spdx: Succeeded
NOTE: recipe neard-0.19-r0: task do_compile: Succeeded
NOTE: Running task 2515 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_install)
NOTE: recipe neard-0.19-r0: task do_install: Started
NOTE: recipe neard-0.19-r0: task do_install: Succeeded
NOTE: Running task 2516 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_package)
NOTE: Running task 2517 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_populate_sysroot)
NOTE: recipe neard-0.19-r0: task do_package: Started
NOTE: recipe neard-0.19-r0: task do_populate_sysroot: Started
NOTE: recipe neard-0.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wpa-supplicant-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe neard-0.19-r0: task do_package: Succeeded
NOTE: Running task 2518 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_packagedata)
NOTE: recipe neard-0.19-r0: task do_packagedata: Started
NOTE: recipe neard-0.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2519 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/neard/neard_0.19.bb:do_create_spdx)
NOTE: recipe neard-0.19-r0: task do_create_spdx: Started
NOTE: recipe neard-0.19-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2520 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_install)
NOTE: recipe bluez5-5.68-r0: task do_install: Started
NOTE: recipe bluez5-5.68-r0: task do_install: Succeeded
NOTE: Running task 2521 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.68-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.68-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2522 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_package)
NOTE: recipe bluez5-5.68-r0: task do_package: Started
NOTE: recipe bluez5-5.68-r0: task do_package: Succeeded
NOTE: Running task 2523 of 2529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata)
NOTE: recipe bluez5-5.68-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.68-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2523 tasks of which 2444 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.69-r0 to 0:5.68-r0) [version-going-backwards]
ERROR: bluez5-5.68-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/bluez5/5.68/temp/log.do_packagedata.3963780
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata) failed with exit code '1'

--===============2514393974525331888==--

