Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C815CCF992
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:27 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.5684.1693650553785804383
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OBBfb7ZV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qytaWnlP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018a557091a5-d3aaf847-61c8-40fb-b4d1-bbebe97c3f17-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t38ng36tINsJGxl3hC4wPlvaoKUT1UZ/UXb9Fzm+8Xc=;
	b=OBBfb7ZVGCs2+ddu1N/fqxBT4sJ++Uxkvzlcwt310p3f4NQykyRR4OFlpNrjxZYl
	lEv7D3V8M6up5UbGBYVKIsZfLOOZqMH+EZPSyDRDDtDHSHpj9Z945anxbo28J7Zyy76
	5DLVM3tiRTLc2HVAIvSrKWIoe9G2MSNb6JCitzsU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t38ng36tINsJGxl3hC4wPlvaoKUT1UZ/UXb9Fzm+8Xc=;
	b=qytaWnlPpWTr44y06MZs+i2+BDklxqCMcCVmGUyO9meLvJ5l0EMlFECSAlwH1VoC
	cfTe81vVbRFbxrLks/5oLrHCjC6kfeCbhQaBEsoWVqo4OMP9Rfhkx36KSfzP5wA8M2S
	LbZTw2HuDkVak6ySoh6ZnfD9iBSbOsrbAMIzXngY=
Content-Type: multipart/mixed; boundary="===============5147232698272720336=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.3.261.1 FAILED
Message-ID: <0101018a557091a5-d3aaf847-61c8-40fb-b4d1-bbebe97c3f17-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187120

--===============5147232698272720336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-loader* to *1.3.261.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-loader-upgrade-1.3.250.0-1.3.261.1.patch
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
From dbb49427a3c990e10da723c66984b836e24389ec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 2 Sep 2023 01:56:26 +0000
Subject: [PATCH] vulkan-loader: upgrade 1.3.250.0 -> 1.3.261.1

---
 ...{vulkan-loader_1.3.250.0.bb => vulkan-loader_1.3.261.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.250.0.bb => vulkan-loader_1.3.261.1.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb
index 456c973406..01cbeafa3e 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.250;protocol=https"
-SRCREV = "f372068d09fc13bcf54b8c81274f37aa5f46aea3"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=main;protocol=https"
+SRCREV = "afdd025ead2b63b2c73d900ab128a2d3b512cdf0"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============5147232698272720336==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-loader-upgrade-1.3.250.0-1.3.261.1.patch"

RnJvbSBkYmI0OTQyN2EzYzk5MGUxMGRhNzIzYzY2OTg0YjgzNmUyNDM4OWVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMiBTZXAgMjAyMyAwMTo1NjoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1sb2FkZXI6IHVwZ3JhZGUgMS4zLjI1MC4wIC0+IDEuMy4yNjEuMQoKLS0tCiAuLi57dnVs
a2FuLWxvYWRlcl8xLjMuMjUwLjAuYmIgPT4gdnVsa2FuLWxvYWRlcl8xLjMuMjYxLjEuYmJ9IHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi1sb2FkZXJfMS4zLjI1
MC4wLmJiID0+IHZ1bGthbi1sb2FkZXJfMS4zLjI2MS4xLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWxvYWRlcl8xLjMuMjUwLjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1sb2FkZXJfMS4zLjI2MS4xLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92
dWxrYW4vdnVsa2FuLWxvYWRlcl8xLjMuMjUwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy92dWxrYW4vdnVsa2FuLWxvYWRlcl8xLjMuMjYxLjEuYmIKaW5kZXggNDU2Yzk3MzQw
Ni4uMDFjYmVhZmEzZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92
dWxrYW4tbG9hZGVyXzEuMy4yNTAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1sb2FkZXJfMS4zLjI2MS4xLmJiCkBAIC05LDggKzksOCBAQCBTRUNUSU9OID0g
ImxpYnMiCiAKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0UudHh0O21kNT03ZGJlZmVkMjMyNDI3NjBhYTM0NzVlZTQyODAxYzVhYyIKLVNS
Q19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLUxvYWRlci5naXQ7
YnJhbmNoPXNkay0xLjMuMjUwO3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gImYzNzIwNjhkMDlm
YzEzYmNmNTRiOGM4MTI3NGYzN2FhNWY0NmFlYTMiCitTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5j
b20vS2hyb25vc0dyb3VwL1Z1bGthbi1Mb2FkZXIuZ2l0O2JyYW5jaD1tYWluO3Byb3RvY29sPWh0
dHBzIgorU1JDUkVWID0gImFmZGQwMjVlYWQyYjYzYjJjNzNkOTAwYWIxMjhhMmQzYjUxMmNkZjAi
CiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuMzkuMgoK

--===============5147232698272720336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1806 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-b3c71ae546203347d3795c81267610a2e5204c03"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b3c71ae546203347d3795c81267610a2e5204c03"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 196 Local 182 Mirrors 0 Missed 14 Current 430 (92% match, 97% complete)
Removing 1 stale sstate objects for arch qemux86...done.
Removing 2 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Running setscene task 483 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_create_spdx_setscene)
NOTE: Running setscene task 489 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 490 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 498 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 499 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 500 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 502 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 504 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 505 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 506 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 547 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 548 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 552 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 559 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 562 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 565 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 571 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 573 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 574 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 578 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 584 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1184 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_recipe_qa)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 591 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: Running task 1242 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_fetch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1320 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_write_config)
NOTE: Running setscene task 593 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_fetch: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1339 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 594 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_write_config: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_write_config: Succeeded
NOTE: Running task 1354 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_fetch)
NOTE: recipe mesa-2_23.1.3-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 599 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_fetch: Succeeded
NOTE: Running task 1363 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_unpack)
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_unpack: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 617 of 626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1670 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_unpack: Succeeded
NOTE: Running task 1718 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_patch)
NOTE: Running task 1719 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_patch: Succeeded
NOTE: Running task 1720 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1721 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_generate_toolchain_file)
NOTE: Running task 1722 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_populate_lic)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1723 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_configure: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1724 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_patch)
NOTE: recipe mesa-2_23.1.3-r0: task do_patch: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_configure: Succeeded
NOTE: Running task 1726 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build --target all --
| Change Dir: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build'
| 
| Run Build Command(s): ninja -v -j 56 all
| [1/19] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor
 k/core2-32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto
 -worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/terminator.c.o -MF loader/CMakeFiles/vulkan.dir/terminator.c.o.d -o loader/CMakeFiles/vulkan.dir/terminator.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin
 ux/vulkan-loader/1.3.261.1/git/loader/terminator.c
| FAILED: loader/CMakeFiles/vulkan.dir/terminator.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2
 -32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker
 /auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/terminator.c.o -MF loader/CMakeFiles/vulkan.dir/terminator.c.o.d -o loader/CMakeFiles/vulkan.dir/terminator.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulk
 an-loader/1.3.261.1/git/loader/terminator.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/allocation.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/terminator.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:171:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   171 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:175:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   175 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:640:5: error: unknown type name 'PFN_vkGetEncodedVideoSessionParametersKHR'
|   640 |     PFN_vkGetEncodedVideoSessionParametersKHR GetEncodedVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:673:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2KHR'
|   673 |     PFN_vkCmdBindIndexBuffer2KHR CmdBindIndexBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:674:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularityKHR'
|   674 |     PFN_vkGetRenderingAreaGranularityKHR GetRenderingAreaGranularityKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:675:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayoutKHR'
|   675 |     PFN_vkGetDeviceImageSubresourceLayoutKHR GetDeviceImageSubresourceLayoutKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:676:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2KHR'
|   676 |     PFN_vkGetImageSubresourceLayout2KHR GetImageSubresourceLayout2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:761:5: error: unknown type name 'PFN_vkCreateExecutionGraphPipelinesAMDX'
|   761 |     PFN_vkCreateExecutionGraphPipelinesAMDX CreateExecutionGraphPipelinesAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:764:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineScratchSizeAMDX'
|   764 |     PFN_vkGetExecutionGraphPipelineScratchSizeAMDX GetExecutionGraphPipelineScratchSizeAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:767:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineNodeIndexAMDX'
|   767 |     PFN_vkGetExecutionGraphPipelineNodeIndexAMDX GetExecutionGraphPipelineNodeIndexAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:770:5: error: unknown type name 'PFN_vkCmdInitializeGraphScratchMemoryAMDX'
|   770 |     PFN_vkCmdInitializeGraphScratchMemoryAMDX CmdInitializeGraphScratchMemoryAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:773:5: error: unknown type name 'PFN_vkCmdDispatchGraphAMDX'
|   773 |     PFN_vkCmdDispatchGraphAMDX CmdDispatchGraphAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:776:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectAMDX'
|   776 |     PFN_vkCmdDispatchGraphIndirectAMDX CmdDispatchGraphIndirectAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:779:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectCountAMDX'
|   779 |     PFN_vkCmdDispatchGraphIndirectCountAMDX CmdDispatchGraphIndirectCountAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:885:5: error: unknown type name 'PFN_vkCopyMemoryToImageEXT'
|   885 |     PFN_vkCopyMemoryToImageEXT CopyMemoryToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:886:5: error: unknown type name 'PFN_vkCopyImageToMemoryEXT'
|   886 |     PFN_vkCopyImageToMemoryEXT CopyImageToMemoryEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:887:5: error: unknown type name 'PFN_vkCopyImageToImageEXT'
|   887 |     PFN_vkCopyImageToImageEXT CopyImageToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:888:5: error: unknown type name 'PFN_vkTransitionImageLayoutEXT'
|   888 |     PFN_vkTransitionImageLayoutEXT TransitionImageLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:903:5: error: unknown type name 'PFN_vkCmdSetDepthBias2EXT'
|   903 |     PFN_vkCmdSetDepthBias2EXT CmdSetDepthBias2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1034:5: error: unknown type name 'PFN_vkGetPipelineIndirectMemoryRequirementsNV'
|  1034 |     PFN_vkGetPipelineIndirectMemoryRequirementsNV GetPipelineIndirectMemoryRequirementsNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1035:5: error: unknown type name 'PFN_vkCmdUpdatePipelineIndirectBufferNV'
|  1035 |     PFN_vkCmdUpdatePipelineIndirectBufferNV CmdUpdatePipelineIndirectBufferNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1036:5: error: unknown type name 'PFN_vkGetPipelineIndirectDeviceAddressNV'
|  1036 |     PFN_vkGetPipelineIndirectDeviceAddressNV GetPipelineIndirectDeviceAddressNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:345:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   345 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:349:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   349 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [2/19] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor
 k/core2-32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto
 -worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work
 /core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/extension_manual.c
| FAILED: loader/CMakeFiles/vulkan.dir/extension_manual.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2
 -32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker
 /auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-
 32-poky-linux/vulkan-loader/1.3.261.1/git/loader/extension_manual.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/allocation.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/extension_manual.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:171:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   171 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:175:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   175 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:640:5: error: unknown type name 'PFN_vkGetEncodedVideoSessionParametersKHR'
|   640 |     PFN_vkGetEncodedVideoSessionParametersKHR GetEncodedVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:673:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2KHR'
|   673 |     PFN_vkCmdBindIndexBuffer2KHR CmdBindIndexBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:674:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularityKHR'
|   674 |     PFN_vkGetRenderingAreaGranularityKHR GetRenderingAreaGranularityKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:675:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayoutKHR'
|   675 |     PFN_vkGetDeviceImageSubresourceLayoutKHR GetDeviceImageSubresourceLayoutKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:676:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2KHR'
|   676 |     PFN_vkGetImageSubresourceLayout2KHR GetImageSubresourceLayout2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:761:5: error: unknown type name 'PFN_vkCreateExecutionGraphPipelinesAMDX'
|   761 |     PFN_vkCreateExecutionGraphPipelinesAMDX CreateExecutionGraphPipelinesAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:764:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineScratchSizeAMDX'
|   764 |     PFN_vkGetExecutionGraphPipelineScratchSizeAMDX GetExecutionGraphPipelineScratchSizeAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:767:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineNodeIndexAMDX'
|   767 |     PFN_vkGetExecutionGraphPipelineNodeIndexAMDX GetExecutionGraphPipelineNodeIndexAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:770:5: error: unknown type name 'PFN_vkCmdInitializeGraphScratchMemoryAMDX'
|   770 |     PFN_vkCmdInitializeGraphScratchMemoryAMDX CmdInitializeGraphScratchMemoryAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:773:5: error: unknown type name 'PFN_vkCmdDispatchGraphAMDX'
|   773 |     PFN_vkCmdDispatchGraphAMDX CmdDispatchGraphAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:776:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectAMDX'
|   776 |     PFN_vkCmdDispatchGraphIndirectAMDX CmdDispatchGraphIndirectAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:779:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectCountAMDX'
|   779 |     PFN_vkCmdDispatchGraphIndirectCountAMDX CmdDispatchGraphIndirectCountAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:885:5: error: unknown type name 'PFN_vkCopyMemoryToImageEXT'
|   885 |     PFN_vkCopyMemoryToImageEXT CopyMemoryToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:886:5: error: unknown type name 'PFN_vkCopyImageToMemoryEXT'
|   886 |     PFN_vkCopyImageToMemoryEXT CopyImageToMemoryEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:887:5: error: unknown type name 'PFN_vkCopyImageToImageEXT'
|   887 |     PFN_vkCopyImageToImageEXT CopyImageToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:888:5: error: unknown type name 'PFN_vkTransitionImageLayoutEXT'
|   888 |     PFN_vkTransitionImageLayoutEXT TransitionImageLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:903:5: error: unknown type name 'PFN_vkCmdSetDepthBias2EXT'
|   903 |     PFN_vkCmdSetDepthBias2EXT CmdSetDepthBias2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1034:5: error: unknown type name 'PFN_vkGetPipelineIndirectMemoryRequirementsNV'
|  1034 |     PFN_vkGetPipelineIndirectMemoryRequirementsNV GetPipelineIndirectMemoryRequirementsNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1035:5: error: unknown type name 'PFN_vkCmdUpdatePipelineIndirectBufferNV'
|  1035 |     PFN_vkCmdUpdatePipelineIndirectBufferNV CmdUpdatePipelineIndirectBufferNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1036:5: error: unknown type name 'PFN_vkGetPipelineIndirectDeviceAddressNV'
|  1036 |     PFN_vkGetPipelineIndirectDeviceAddressNV GetPipelineIndirectDeviceAddressNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:345:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   345 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:349:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   349 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [3/19] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor
 k/core2-32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto
 -worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-
 linux/vulkan-loader/1.3.261.1/git/loader/debug_utils.c
| FAILED: loader/CMakeFiles/vulkan.dir/debug_utils.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2
 -32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker
 /auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/v
 ulkan-loader/1.3.261.1/git/loader/debug_utils.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/allocation.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/debug_utils.c:37:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:171:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   171 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:175:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   175 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:640:5: error: unknown type name 'PFN_vkGetEncodedVideoSessionParametersKHR'
|   640 |     PFN_vkGetEncodedVideoSessionParametersKHR GetEncodedVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:673:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2KHR'
|   673 |     PFN_vkCmdBindIndexBuffer2KHR CmdBindIndexBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:674:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularityKHR'
|   674 |     PFN_vkGetRenderingAreaGranularityKHR GetRenderingAreaGranularityKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:675:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayoutKHR'
|   675 |     PFN_vkGetDeviceImageSubresourceLayoutKHR GetDeviceImageSubresourceLayoutKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:676:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2KHR'
|   676 |     PFN_vkGetImageSubresourceLayout2KHR GetImageSubresourceLayout2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:761:5: error: unknown type name 'PFN_vkCreateExecutionGraphPipelinesAMDX'
|   761 |     PFN_vkCreateExecutionGraphPipelinesAMDX CreateExecutionGraphPipelinesAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:764:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineScratchSizeAMDX'
|   764 |     PFN_vkGetExecutionGraphPipelineScratchSizeAMDX GetExecutionGraphPipelineScratchSizeAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:767:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineNodeIndexAMDX'
|   767 |     PFN_vkGetExecutionGraphPipelineNodeIndexAMDX GetExecutionGraphPipelineNodeIndexAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:770:5: error: unknown type name 'PFN_vkCmdInitializeGraphScratchMemoryAMDX'
|   770 |     PFN_vkCmdInitializeGraphScratchMemoryAMDX CmdInitializeGraphScratchMemoryAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:773:5: error: unknown type name 'PFN_vkCmdDispatchGraphAMDX'
|   773 |     PFN_vkCmdDispatchGraphAMDX CmdDispatchGraphAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:776:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectAMDX'
|   776 |     PFN_vkCmdDispatchGraphIndirectAMDX CmdDispatchGraphIndirectAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:779:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectCountAMDX'
|   779 |     PFN_vkCmdDispatchGraphIndirectCountAMDX CmdDispatchGraphIndirectCountAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:885:5: error: unknown type name 'PFN_vkCopyMemoryToImageEXT'
|   885 |     PFN_vkCopyMemoryToImageEXT CopyMemoryToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:886:5: error: unknown type name 'PFN_vkCopyImageToMemoryEXT'
|   886 |     PFN_vkCopyImageToMemoryEXT CopyImageToMemoryEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:887:5: error: unknown type name 'PFN_vkCopyImageToImageEXT'
|   887 |     PFN_vkCopyImageToImageEXT CopyImageToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:888:5: error: unknown type name 'PFN_vkTransitionImageLayoutEXT'
|   888 |     PFN_vkTransitionImageLayoutEXT TransitionImageLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:903:5: error: unknown type name 'PFN_vkCmdSetDepthBias2EXT'
|   903 |     PFN_vkCmdSetDepthBias2EXT CmdSetDepthBias2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1034:5: error: unknown type name 'PFN_vkGetPipelineIndirectMemoryRequirementsNV'
|  1034 |     PFN_vkGetPipelineIndirectMemoryRequirementsNV GetPipelineIndirectMemoryRequirementsNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1035:5: error: unknown type name 'PFN_vkCmdUpdatePipelineIndirectBufferNV'
|  1035 |     PFN_vkCmdUpdatePipelineIndirectBufferNV CmdUpdatePipelineIndirectBufferNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1036:5: error: unknown type name 'PFN_vkGetPipelineIndirectDeviceAddressNV'
|  1036 |     PFN_vkGetPipelineIndirectDeviceAddressNV GetPipelineIndirectDeviceAddressNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:345:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   345 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:349:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   349 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [4/19] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor
 k/core2-32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto
 -worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/log.c.o -MF loader/CMakeFiles/vulkan.dir/log.c.o.d -o loader/CMakeFiles/vulkan.dir/log.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.
 261.1/git/loader/log.c
| FAILED: loader/CMakeFiles/vulkan.dir/log.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2
 -32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker
 /auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/log.c.o -MF loader/CMakeFiles/vulkan.dir/log.c.o.d -o loader/CMakeFiles/vulkan.dir/log.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/g
 it/loader/log.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/debug_utils.h:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/log.c:34:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:171:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   171 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:175:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   175 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:640:5: error: unknown type name 'PFN_vkGetEncodedVideoSessionParametersKHR'
|   640 |     PFN_vkGetEncodedVideoSessionParametersKHR GetEncodedVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:673:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2KHR'
|   673 |     PFN_vkCmdBindIndexBuffer2KHR CmdBindIndexBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:674:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularityKHR'
|   674 |     PFN_vkGetRenderingAreaGranularityKHR GetRenderingAreaGranularityKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:675:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayoutKHR'
|   675 |     PFN_vkGetDeviceImageSubresourceLayoutKHR GetDeviceImageSubresourceLayoutKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:676:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2KHR'
|   676 |     PFN_vkGetImageSubresourceLayout2KHR GetImageSubresourceLayout2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:761:5: error: unknown type name 'PFN_vkCreateExecutionGraphPipelinesAMDX'
|   761 |     PFN_vkCreateExecutionGraphPipelinesAMDX CreateExecutionGraphPipelinesAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:764:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineScratchSizeAMDX'
|   764 |     PFN_vkGetExecutionGraphPipelineScratchSizeAMDX GetExecutionGraphPipelineScratchSizeAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:767:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineNodeIndexAMDX'
|   767 |     PFN_vkGetExecutionGraphPipelineNodeIndexAMDX GetExecutionGraphPipelineNodeIndexAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:770:5: error: unknown type name 'PFN_vkCmdInitializeGraphScratchMemoryAMDX'
|   770 |     PFN_vkCmdInitializeGraphScratchMemoryAMDX CmdInitializeGraphScratchMemoryAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:773:5: error: unknown type name 'PFN_vkCmdDispatchGraphAMDX'
|   773 |     PFN_vkCmdDispatchGraphAMDX CmdDispatchGraphAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:776:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectAMDX'
|   776 |     PFN_vkCmdDispatchGraphIndirectAMDX CmdDispatchGraphIndirectAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:779:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectCountAMDX'
|   779 |     PFN_vkCmdDispatchGraphIndirectCountAMDX CmdDispatchGraphIndirectCountAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:885:5: error: unknown type name 'PFN_vkCopyMemoryToImageEXT'
|   885 |     PFN_vkCopyMemoryToImageEXT CopyMemoryToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:886:5: error: unknown type name 'PFN_vkCopyImageToMemoryEXT'
|   886 |     PFN_vkCopyImageToMemoryEXT CopyImageToMemoryEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:887:5: error: unknown type name 'PFN_vkCopyImageToImageEXT'
|   887 |     PFN_vkCopyImageToImageEXT CopyImageToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:888:5: error: unknown type name 'PFN_vkTransitionImageLayoutEXT'
|   888 |     PFN_vkTransitionImageLayoutEXT TransitionImageLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:903:5: error: unknown type name 'PFN_vkCmdSetDepthBias2EXT'
|   903 |     PFN_vkCmdSetDepthBias2EXT CmdSetDepthBias2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1034:5: error: unknown type name 'PFN_vkGetPipelineIndirectMemoryRequirementsNV'
|  1034 |     PFN_vkGetPipelineIndirectMemoryRequirementsNV GetPipelineIndirectMemoryRequirementsNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1035:5: error: unknown type name 'PFN_vkCmdUpdatePipelineIndirectBufferNV'
|  1035 |     PFN_vkCmdUpdatePipelineIndirectBufferNV CmdUpdatePipelineIndirectBufferNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1036:5: error: unknown type name 'PFN_vkGetPipelineIndirectDeviceAddressNV'
|  1036 |     PFN_vkGetPipelineIndirectDeviceAddressNV GetPipelineIndirectDeviceAddressNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:345:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   345 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:349:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   349 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [5/19] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor
 k/core2-32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto
 -worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/allocation.c.o -MF loader/CMakeFiles/vulkan.dir/allocation.c.o.d -o loader/CMakeFiles/vulkan.dir/allocation.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin
 ux/vulkan-loader/1.3.261.1/git/loader/allocation.c
| FAILED: loader/CMakeFiles/vulkan.dir/allocation.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2
 -32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker
 /auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/allocation.c.o -MF loader/CMakeFiles/vulkan.dir/allocation.c.o.d -o loader/CMakeFiles/vulkan.dir/allocation.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulk
 an-loader/1.3.261.1/git/loader/allocation.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/allocation.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/allocation.c:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:171:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   171 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:175:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   175 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:640:5: error: unknown type name 'PFN_vkGetEncodedVideoSessionParametersKHR'
|   640 |     PFN_vkGetEncodedVideoSessionParametersKHR GetEncodedVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:673:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2KHR'
|   673 |     PFN_vkCmdBindIndexBuffer2KHR CmdBindIndexBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:674:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularityKHR'
|   674 |     PFN_vkGetRenderingAreaGranularityKHR GetRenderingAreaGranularityKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:675:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayoutKHR'
|   675 |     PFN_vkGetDeviceImageSubresourceLayoutKHR GetDeviceImageSubresourceLayoutKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:676:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2KHR'
|   676 |     PFN_vkGetImageSubresourceLayout2KHR GetImageSubresourceLayout2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:761:5: error: unknown type name 'PFN_vkCreateExecutionGraphPipelinesAMDX'
|   761 |     PFN_vkCreateExecutionGraphPipelinesAMDX CreateExecutionGraphPipelinesAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:764:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineScratchSizeAMDX'
|   764 |     PFN_vkGetExecutionGraphPipelineScratchSizeAMDX GetExecutionGraphPipelineScratchSizeAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:767:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineNodeIndexAMDX'
|   767 |     PFN_vkGetExecutionGraphPipelineNodeIndexAMDX GetExecutionGraphPipelineNodeIndexAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:770:5: error: unknown type name 'PFN_vkCmdInitializeGraphScratchMemoryAMDX'
|   770 |     PFN_vkCmdInitializeGraphScratchMemoryAMDX CmdInitializeGraphScratchMemoryAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:773:5: error: unknown type name 'PFN_vkCmdDispatchGraphAMDX'
|   773 |     PFN_vkCmdDispatchGraphAMDX CmdDispatchGraphAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:776:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectAMDX'
|   776 |     PFN_vkCmdDispatchGraphIndirectAMDX CmdDispatchGraphIndirectAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:779:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectCountAMDX'
|   779 |     PFN_vkCmdDispatchGraphIndirectCountAMDX CmdDispatchGraphIndirectCountAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:885:5: error: unknown type name 'PFN_vkCopyMemoryToImageEXT'
|   885 |     PFN_vkCopyMemoryToImageEXT CopyMemoryToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:886:5: error: unknown type name 'PFN_vkCopyImageToMemoryEXT'
|   886 |     PFN_vkCopyImageToMemoryEXT CopyImageToMemoryEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:887:5: error: unknown type name 'PFN_vkCopyImageToImageEXT'
|   887 |     PFN_vkCopyImageToImageEXT CopyImageToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:888:5: error: unknown type name 'PFN_vkTransitionImageLayoutEXT'
|   888 |     PFN_vkTransitionImageLayoutEXT TransitionImageLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:903:5: error: unknown type name 'PFN_vkCmdSetDepthBias2EXT'
|   903 |     PFN_vkCmdSetDepthBias2EXT CmdSetDepthBias2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1034:5: error: unknown type name 'PFN_vkGetPipelineIndirectMemoryRequirementsNV'
|  1034 |     PFN_vkGetPipelineIndirectMemoryRequirementsNV GetPipelineIndirectMemoryRequirementsNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1035:5: error: unknown type name 'PFN_vkCmdUpdatePipelineIndirectBufferNV'
|  1035 |     PFN_vkCmdUpdatePipelineIndirectBufferNV CmdUpdatePipelineIndirectBufferNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1036:5: error: unknown type name 'PFN_vkGetPipelineIndirectDeviceAddressNV'
|  1036 |     PFN_vkGetPipelineIndirectDeviceAddressNV GetPipelineIndirectDeviceAddressNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:345:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   345 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:349:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   349 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [6/19] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor
 k/core2-32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto
 -worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o -c /home/pokybuild/yocto-worker/auh
 /build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/unknown_function_handling.c
| FAILED: loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2
 -32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker
 /auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_function_handling.c.o -c /home/pokybuild/yocto-worker/auh/build/
 build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/unknown_function_handling.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/unknown_function_handling.h:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/unknown_function_handling.c:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:171:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   171 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:175:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   175 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:640:5: error: unknown type name 'PFN_vkGetEncodedVideoSessionParametersKHR'
|   640 |     PFN_vkGetEncodedVideoSessionParametersKHR GetEncodedVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:673:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2KHR'
|   673 |     PFN_vkCmdBindIndexBuffer2KHR CmdBindIndexBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:674:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularityKHR'
|   674 |     PFN_vkGetRenderingAreaGranularityKHR GetRenderingAreaGranularityKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:675:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayoutKHR'
|   675 |     PFN_vkGetDeviceImageSubresourceLayoutKHR GetDeviceImageSubresourceLayoutKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:676:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2KHR'
|   676 |     PFN_vkGetImageSubresourceLayout2KHR GetImageSubresourceLayout2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:761:5: error: unknown type name 'PFN_vkCreateExecutionGraphPipelinesAMDX'
|   761 |     PFN_vkCreateExecutionGraphPipelinesAMDX CreateExecutionGraphPipelinesAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:764:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineScratchSizeAMDX'
|   764 |     PFN_vkGetExecutionGraphPipelineScratchSizeAMDX GetExecutionGraphPipelineScratchSizeAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:767:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineNodeIndexAMDX'
|   767 |     PFN_vkGetExecutionGraphPipelineNodeIndexAMDX GetExecutionGraphPipelineNodeIndexAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:770:5: error: unknown type name 'PFN_vkCmdInitializeGraphScratchMemoryAMDX'
|   770 |     PFN_vkCmdInitializeGraphScratchMemoryAMDX CmdInitializeGraphScratchMemoryAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:773:5: error: unknown type name 'PFN_vkCmdDispatchGraphAMDX'
|   773 |     PFN_vkCmdDispatchGraphAMDX CmdDispatchGraphAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:776:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectAMDX'
|   776 |     PFN_vkCmdDispatchGraphIndirectAMDX CmdDispatchGraphIndirectAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:779:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectCountAMDX'
|   779 |     PFN_vkCmdDispatchGraphIndirectCountAMDX CmdDispatchGraphIndirectCountAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:885:5: error: unknown type name 'PFN_vkCopyMemoryToImageEXT'
|   885 |     PFN_vkCopyMemoryToImageEXT CopyMemoryToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:886:5: error: unknown type name 'PFN_vkCopyImageToMemoryEXT'
|   886 |     PFN_vkCopyImageToMemoryEXT CopyImageToMemoryEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:887:5: error: unknown type name 'PFN_vkCopyImageToImageEXT'
|   887 |     PFN_vkCopyImageToImageEXT CopyImageToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:888:5: error: unknown type name 'PFN_vkTransitionImageLayoutEXT'
|   888 |     PFN_vkTransitionImageLayoutEXT TransitionImageLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:903:5: error: unknown type name 'PFN_vkCmdSetDepthBias2EXT'
|   903 |     PFN_vkCmdSetDepthBias2EXT CmdSetDepthBias2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1034:5: error: unknown type name 'PFN_vkGetPipelineIndirectMemoryRequirementsNV'
|  1034 |     PFN_vkGetPipelineIndirectMemoryRequirementsNV GetPipelineIndirectMemoryRequirementsNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1035:5: error: unknown type name 'PFN_vkCmdUpdatePipelineIndirectBufferNV'
|  1035 |     PFN_vkCmdUpdatePipelineIndirectBufferNV CmdUpdatePipelineIndirectBufferNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1036:5: error: unknown type name 'PFN_vkGetPipelineIndirectDeviceAddressNV'
|  1036 |     PFN_vkGetPipelineIndirectDeviceAddressNV GetPipelineIndirectDeviceAddressNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:345:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   345 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:349:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   349 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [7/19] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor
 k/core2-32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto
 -worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_environment.c.o -MF loader/CMakeFiles/vulkan.dir/loader_environment.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_environment.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tm
 p/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_environment.c
| FAILED: loader/CMakeFiles/vulkan.dir/loader_environment.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2
 -32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker
 /auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_environment.c.o -MF loader/CMakeFiles/vulkan.dir/loader_environment.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_environment.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/
 core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_environment.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_environment.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_environment.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:171:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   171 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:175:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   175 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:640:5: error: unknown type name 'PFN_vkGetEncodedVideoSessionParametersKHR'
|   640 |     PFN_vkGetEncodedVideoSessionParametersKHR GetEncodedVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:673:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2KHR'
|   673 |     PFN_vkCmdBindIndexBuffer2KHR CmdBindIndexBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:674:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularityKHR'
|   674 |     PFN_vkGetRenderingAreaGranularityKHR GetRenderingAreaGranularityKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:675:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayoutKHR'
|   675 |     PFN_vkGetDeviceImageSubresourceLayoutKHR GetDeviceImageSubresourceLayoutKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:676:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2KHR'
|   676 |     PFN_vkGetImageSubresourceLayout2KHR GetImageSubresourceLayout2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:761:5: error: unknown type name 'PFN_vkCreateExecutionGraphPipelinesAMDX'
|   761 |     PFN_vkCreateExecutionGraphPipelinesAMDX CreateExecutionGraphPipelinesAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:764:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineScratchSizeAMDX'
|   764 |     PFN_vkGetExecutionGraphPipelineScratchSizeAMDX GetExecutionGraphPipelineScratchSizeAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:767:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineNodeIndexAMDX'
|   767 |     PFN_vkGetExecutionGraphPipelineNodeIndexAMDX GetExecutionGraphPipelineNodeIndexAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:770:5: error: unknown type name 'PFN_vkCmdInitializeGraphScratchMemoryAMDX'
|   770 |     PFN_vkCmdInitializeGraphScratchMemoryAMDX CmdInitializeGraphScratchMemoryAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:773:5: error: unknown type name 'PFN_vkCmdDispatchGraphAMDX'
|   773 |     PFN_vkCmdDispatchGraphAMDX CmdDispatchGraphAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:776:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectAMDX'
|   776 |     PFN_vkCmdDispatchGraphIndirectAMDX CmdDispatchGraphIndirectAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:779:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectCountAMDX'
|   779 |     PFN_vkCmdDispatchGraphIndirectCountAMDX CmdDispatchGraphIndirectCountAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:885:5: error: unknown type name 'PFN_vkCopyMemoryToImageEXT'
|   885 |     PFN_vkCopyMemoryToImageEXT CopyMemoryToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:886:5: error: unknown type name 'PFN_vkCopyImageToMemoryEXT'
|   886 |     PFN_vkCopyImageToMemoryEXT CopyImageToMemoryEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:887:5: error: unknown type name 'PFN_vkCopyImageToImageEXT'
|   887 |     PFN_vkCopyImageToImageEXT CopyImageToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:888:5: error: unknown type name 'PFN_vkTransitionImageLayoutEXT'
|   888 |     PFN_vkTransitionImageLayoutEXT TransitionImageLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:903:5: error: unknown type name 'PFN_vkCmdSetDepthBias2EXT'
|   903 |     PFN_vkCmdSetDepthBias2EXT CmdSetDepthBias2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1034:5: error: unknown type name 'PFN_vkGetPipelineIndirectMemoryRequirementsNV'
|  1034 |     PFN_vkGetPipelineIndirectMemoryRequirementsNV GetPipelineIndirectMemoryRequirementsNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1035:5: error: unknown type name 'PFN_vkCmdUpdatePipelineIndirectBufferNV'
|  1035 |     PFN_vkCmdUpdatePipelineIndirectBufferNV CmdUpdatePipelineIndirectBufferNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1036:5: error: unknown type name 'PFN_vkGetPipelineIndirectDeviceAddressNV'
|  1036 |     PFN_vkGetPipelineIndirectDeviceAddressNV GetPipelineIndirectDeviceAddressNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:345:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   345 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:349:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   349 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [8/19] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor
 k/core2-32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto
 -worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -O -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build
 /tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/dev_ext_trampoline.c
| FAILED: loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2
 -32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker
 /auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -O -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/wo
 rk/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/dev_ext_trampoline.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader.h:32,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/dev_ext_trampoline.c:22:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:171:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   171 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:175:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   175 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:640:5: error: unknown type name 'PFN_vkGetEncodedVideoSessionParametersKHR'
|   640 |     PFN_vkGetEncodedVideoSessionParametersKHR GetEncodedVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:673:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2KHR'
|   673 |     PFN_vkCmdBindIndexBuffer2KHR CmdBindIndexBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:674:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularityKHR'
|   674 |     PFN_vkGetRenderingAreaGranularityKHR GetRenderingAreaGranularityKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:675:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayoutKHR'
|   675 |     PFN_vkGetDeviceImageSubresourceLayoutKHR GetDeviceImageSubresourceLayoutKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:676:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2KHR'
|   676 |     PFN_vkGetImageSubresourceLayout2KHR GetImageSubresourceLayout2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:761:5: error: unknown type name 'PFN_vkCreateExecutionGraphPipelinesAMDX'
|   761 |     PFN_vkCreateExecutionGraphPipelinesAMDX CreateExecutionGraphPipelinesAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:764:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineScratchSizeAMDX'
|   764 |     PFN_vkGetExecutionGraphPipelineScratchSizeAMDX GetExecutionGraphPipelineScratchSizeAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:767:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineNodeIndexAMDX'
|   767 |     PFN_vkGetExecutionGraphPipelineNodeIndexAMDX GetExecutionGraphPipelineNodeIndexAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:770:5: error: unknown type name 'PFN_vkCmdInitializeGraphScratchMemoryAMDX'
|   770 |     PFN_vkCmdInitializeGraphScratchMemoryAMDX CmdInitializeGraphScratchMemoryAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:773:5: error: unknown type name 'PFN_vkCmdDispatchGraphAMDX'
|   773 |     PFN_vkCmdDispatchGraphAMDX CmdDispatchGraphAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:776:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectAMDX'
|   776 |     PFN_vkCmdDispatchGraphIndirectAMDX CmdDispatchGraphIndirectAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:779:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectCountAMDX'
|   779 |     PFN_vkCmdDispatchGraphIndirectCountAMDX CmdDispatchGraphIndirectCountAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:885:5: error: unknown type name 'PFN_vkCopyMemoryToImageEXT'
|   885 |     PFN_vkCopyMemoryToImageEXT CopyMemoryToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:886:5: error: unknown type name 'PFN_vkCopyImageToMemoryEXT'
|   886 |     PFN_vkCopyImageToMemoryEXT CopyImageToMemoryEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:887:5: error: unknown type name 'PFN_vkCopyImageToImageEXT'
|   887 |     PFN_vkCopyImageToImageEXT CopyImageToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:888:5: error: unknown type name 'PFN_vkTransitionImageLayoutEXT'
|   888 |     PFN_vkTransitionImageLayoutEXT TransitionImageLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:903:5: error: unknown type name 'PFN_vkCmdSetDepthBias2EXT'
|   903 |     PFN_vkCmdSetDepthBias2EXT CmdSetDepthBias2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1034:5: error: unknown type name 'PFN_vkGetPipelineIndirectMemoryRequirementsNV'
|  1034 |     PFN_vkGetPipelineIndirectMemoryRequirementsNV GetPipelineIndirectMemoryRequirementsNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1035:5: error: unknown type name 'PFN_vkCmdUpdatePipelineIndirectBufferNV'
|  1035 |     PFN_vkCmdUpdatePipelineIndirectBufferNV CmdUpdatePipelineIndirectBufferNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1036:5: error: unknown type name 'PFN_vkGetPipelineIndirectDeviceAddressNV'
|  1036 |     PFN_vkGetPipelineIndirectDeviceAddressNV GetPipelineIndirectDeviceAddressNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:345:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   345 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:349:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   349 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [9/19] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor
 k/core2-32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto
 -worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_linux.c.o -MF loader/CMakeFiles/vulkan.dir/loader_linux.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_linux.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po
 ky-linux/vulkan-loader/1.3.261.1/git/loader/loader_linux.c
| FAILED: loader/CMakeFiles/vulkan.dir/loader_linux.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2
 -32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker
 /auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader_linux.c.o -MF loader/CMakeFiles/vulkan.dir/loader_linux.c.o.d -o loader/CMakeFiles/vulkan.dir/loader_linux.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu
 x/vulkan-loader/1.3.261.1/git/loader/loader_linux.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_linux.h:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_linux.c:30:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:171:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   171 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:175:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   175 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:640:5: error: unknown type name 'PFN_vkGetEncodedVideoSessionParametersKHR'
|   640 |     PFN_vkGetEncodedVideoSessionParametersKHR GetEncodedVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:673:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2KHR'
|   673 |     PFN_vkCmdBindIndexBuffer2KHR CmdBindIndexBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:674:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularityKHR'
|   674 |     PFN_vkGetRenderingAreaGranularityKHR GetRenderingAreaGranularityKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:675:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayoutKHR'
|   675 |     PFN_vkGetDeviceImageSubresourceLayoutKHR GetDeviceImageSubresourceLayoutKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:676:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2KHR'
|   676 |     PFN_vkGetImageSubresourceLayout2KHR GetImageSubresourceLayout2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:761:5: error: unknown type name 'PFN_vkCreateExecutionGraphPipelinesAMDX'
|   761 |     PFN_vkCreateExecutionGraphPipelinesAMDX CreateExecutionGraphPipelinesAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:764:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineScratchSizeAMDX'
|   764 |     PFN_vkGetExecutionGraphPipelineScratchSizeAMDX GetExecutionGraphPipelineScratchSizeAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:767:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineNodeIndexAMDX'
|   767 |     PFN_vkGetExecutionGraphPipelineNodeIndexAMDX GetExecutionGraphPipelineNodeIndexAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:770:5: error: unknown type name 'PFN_vkCmdInitializeGraphScratchMemoryAMDX'
|   770 |     PFN_vkCmdInitializeGraphScratchMemoryAMDX CmdInitializeGraphScratchMemoryAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:773:5: error: unknown type name 'PFN_vkCmdDispatchGraphAMDX'
|   773 |     PFN_vkCmdDispatchGraphAMDX CmdDispatchGraphAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:776:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectAMDX'
|   776 |     PFN_vkCmdDispatchGraphIndirectAMDX CmdDispatchGraphIndirectAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:779:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectCountAMDX'
|   779 |     PFN_vkCmdDispatchGraphIndirectCountAMDX CmdDispatchGraphIndirectCountAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:885:5: error: unknown type name 'PFN_vkCopyMemoryToImageEXT'
|   885 |     PFN_vkCopyMemoryToImageEXT CopyMemoryToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:886:5: error: unknown type name 'PFN_vkCopyImageToMemoryEXT'
|   886 |     PFN_vkCopyImageToMemoryEXT CopyImageToMemoryEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:887:5: error: unknown type name 'PFN_vkCopyImageToImageEXT'
|   887 |     PFN_vkCopyImageToImageEXT CopyImageToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:888:5: error: unknown type name 'PFN_vkTransitionImageLayoutEXT'
|   888 |     PFN_vkTransitionImageLayoutEXT TransitionImageLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:903:5: error: unknown type name 'PFN_vkCmdSetDepthBias2EXT'
|   903 |     PFN_vkCmdSetDepthBias2EXT CmdSetDepthBias2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1034:5: error: unknown type name 'PFN_vkGetPipelineIndirectMemoryRequirementsNV'
|  1034 |     PFN_vkGetPipelineIndirectMemoryRequirementsNV GetPipelineIndirectMemoryRequirementsNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1035:5: error: unknown type name 'PFN_vkCmdUpdatePipelineIndirectBufferNV'
|  1035 |     PFN_vkCmdUpdatePipelineIndirectBufferNV CmdUpdatePipelineIndirectBufferNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1036:5: error: unknown type name 'PFN_vkGetPipelineIndirectDeviceAddressNV'
|  1036 |     PFN_vkGetPipelineIndirectDeviceAddressNV GetPipelineIndirectDeviceAddressNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:345:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   345 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:349:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   349 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [10/19] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wo
 rk/core2-32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yoct
 o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3
 .261.1/git/loader/wsi.c
| FAILED: loader/CMakeFiles/vulkan.dir/wsi.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2
 -32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker
 /auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/g
 it/loader/wsi.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/allocation.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/wsi.c:31:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:171:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   171 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:175:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   175 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:640:5: error: unknown type name 'PFN_vkGetEncodedVideoSessionParametersKHR'
|   640 |     PFN_vkGetEncodedVideoSessionParametersKHR GetEncodedVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:673:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2KHR'
|   673 |     PFN_vkCmdBindIndexBuffer2KHR CmdBindIndexBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:674:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularityKHR'
|   674 |     PFN_vkGetRenderingAreaGranularityKHR GetRenderingAreaGranularityKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:675:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayoutKHR'
|   675 |     PFN_vkGetDeviceImageSubresourceLayoutKHR GetDeviceImageSubresourceLayoutKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:676:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2KHR'
|   676 |     PFN_vkGetImageSubresourceLayout2KHR GetImageSubresourceLayout2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:761:5: error: unknown type name 'PFN_vkCreateExecutionGraphPipelinesAMDX'
|   761 |     PFN_vkCreateExecutionGraphPipelinesAMDX CreateExecutionGraphPipelinesAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:764:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineScratchSizeAMDX'
|   764 |     PFN_vkGetExecutionGraphPipelineScratchSizeAMDX GetExecutionGraphPipelineScratchSizeAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:767:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineNodeIndexAMDX'
|   767 |     PFN_vkGetExecutionGraphPipelineNodeIndexAMDX GetExecutionGraphPipelineNodeIndexAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:770:5: error: unknown type name 'PFN_vkCmdInitializeGraphScratchMemoryAMDX'
|   770 |     PFN_vkCmdInitializeGraphScratchMemoryAMDX CmdInitializeGraphScratchMemoryAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:773:5: error: unknown type name 'PFN_vkCmdDispatchGraphAMDX'
|   773 |     PFN_vkCmdDispatchGraphAMDX CmdDispatchGraphAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:776:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectAMDX'
|   776 |     PFN_vkCmdDispatchGraphIndirectAMDX CmdDispatchGraphIndirectAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:779:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectCountAMDX'
|   779 |     PFN_vkCmdDispatchGraphIndirectCountAMDX CmdDispatchGraphIndirectCountAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:885:5: error: unknown type name 'PFN_vkCopyMemoryToImageEXT'
|   885 |     PFN_vkCopyMemoryToImageEXT CopyMemoryToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:886:5: error: unknown type name 'PFN_vkCopyImageToMemoryEXT'
|   886 |     PFN_vkCopyImageToMemoryEXT CopyImageToMemoryEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:887:5: error: unknown type name 'PFN_vkCopyImageToImageEXT'
|   887 |     PFN_vkCopyImageToImageEXT CopyImageToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:888:5: error: unknown type name 'PFN_vkTransitionImageLayoutEXT'
|   888 |     PFN_vkTransitionImageLayoutEXT TransitionImageLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:903:5: error: unknown type name 'PFN_vkCmdSetDepthBias2EXT'
|   903 |     PFN_vkCmdSetDepthBias2EXT CmdSetDepthBias2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1034:5: error: unknown type name 'PFN_vkGetPipelineIndirectMemoryRequirementsNV'
|  1034 |     PFN_vkGetPipelineIndirectMemoryRequirementsNV GetPipelineIndirectMemoryRequirementsNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1035:5: error: unknown type name 'PFN_vkCmdUpdatePipelineIndirectBufferNV'
|  1035 |     PFN_vkCmdUpdatePipelineIndirectBufferNV CmdUpdatePipelineIndirectBufferNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1036:5: error: unknown type name 'PFN_vkGetPipelineIndirectDeviceAddressNV'
|  1036 |     PFN_vkGetPipelineIndirectDeviceAddressNV GetPipelineIndirectDeviceAddressNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:345:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   345 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:349:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   349 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [11/19] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wo
 rk/core2-32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yoct
 o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/gpa_helper.c.o -MF loader/CMakeFiles/vulkan.dir/gpa_helper.c.o.d -o loader/CMakeFiles/vulkan.dir/gpa_helper.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li
 nux/vulkan-loader/1.3.261.1/git/loader/gpa_helper.c
| FAILED: loader/CMakeFiles/vulkan.dir/gpa_helper.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2
 -32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker
 /auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/gpa_helper.c.o -MF loader/CMakeFiles/vulkan.dir/gpa_helper.c.o.d -o loader/CMakeFiles/vulkan.dir/gpa_helper.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulk
 an-loader/1.3.261.1/git/loader/gpa_helper.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/gpa_helper.h:25,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/gpa_helper.c:23:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:171:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   171 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:175:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   175 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:640:5: error: unknown type name 'PFN_vkGetEncodedVideoSessionParametersKHR'
|   640 |     PFN_vkGetEncodedVideoSessionParametersKHR GetEncodedVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:673:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2KHR'
|   673 |     PFN_vkCmdBindIndexBuffer2KHR CmdBindIndexBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:674:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularityKHR'
|   674 |     PFN_vkGetRenderingAreaGranularityKHR GetRenderingAreaGranularityKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:675:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayoutKHR'
|   675 |     PFN_vkGetDeviceImageSubresourceLayoutKHR GetDeviceImageSubresourceLayoutKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:676:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2KHR'
|   676 |     PFN_vkGetImageSubresourceLayout2KHR GetImageSubresourceLayout2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:761:5: error: unknown type name 'PFN_vkCreateExecutionGraphPipelinesAMDX'
|   761 |     PFN_vkCreateExecutionGraphPipelinesAMDX CreateExecutionGraphPipelinesAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:764:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineScratchSizeAMDX'
|   764 |     PFN_vkGetExecutionGraphPipelineScratchSizeAMDX GetExecutionGraphPipelineScratchSizeAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:767:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineNodeIndexAMDX'
|   767 |     PFN_vkGetExecutionGraphPipelineNodeIndexAMDX GetExecutionGraphPipelineNodeIndexAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:770:5: error: unknown type name 'PFN_vkCmdInitializeGraphScratchMemoryAMDX'
|   770 |     PFN_vkCmdInitializeGraphScratchMemoryAMDX CmdInitializeGraphScratchMemoryAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:773:5: error: unknown type name 'PFN_vkCmdDispatchGraphAMDX'
|   773 |     PFN_vkCmdDispatchGraphAMDX CmdDispatchGraphAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:776:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectAMDX'
|   776 |     PFN_vkCmdDispatchGraphIndirectAMDX CmdDispatchGraphIndirectAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:779:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectCountAMDX'
|   779 |     PFN_vkCmdDispatchGraphIndirectCountAMDX CmdDispatchGraphIndirectCountAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:885:5: error: unknown type name 'PFN_vkCopyMemoryToImageEXT'
|   885 |     PFN_vkCopyMemoryToImageEXT CopyMemoryToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:886:5: error: unknown type name 'PFN_vkCopyImageToMemoryEXT'
|   886 |     PFN_vkCopyImageToMemoryEXT CopyImageToMemoryEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:887:5: error: unknown type name 'PFN_vkCopyImageToImageEXT'
|   887 |     PFN_vkCopyImageToImageEXT CopyImageToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:888:5: error: unknown type name 'PFN_vkTransitionImageLayoutEXT'
|   888 |     PFN_vkTransitionImageLayoutEXT TransitionImageLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:903:5: error: unknown type name 'PFN_vkCmdSetDepthBias2EXT'
|   903 |     PFN_vkCmdSetDepthBias2EXT CmdSetDepthBias2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1034:5: error: unknown type name 'PFN_vkGetPipelineIndirectMemoryRequirementsNV'
|  1034 |     PFN_vkGetPipelineIndirectMemoryRequirementsNV GetPipelineIndirectMemoryRequirementsNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1035:5: error: unknown type name 'PFN_vkCmdUpdatePipelineIndirectBufferNV'
|  1035 |     PFN_vkCmdUpdatePipelineIndirectBufferNV CmdUpdatePipelineIndirectBufferNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1036:5: error: unknown type name 'PFN_vkGetPipelineIndirectDeviceAddressNV'
|  1036 |     PFN_vkGetPipelineIndirectDeviceAddressNV GetPipelineIndirectDeviceAddressNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:345:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   345 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:349:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   349 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [12/19] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wo
 rk/core2-32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yoct
 o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/settings.c.o -MF loader/CMakeFiles/vulkan.dir/settings.c.o.d -o loader/CMakeFiles/vulkan.dir/settings.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vu
 lkan-loader/1.3.261.1/git/loader/settings.c
| FAILED: loader/CMakeFiles/vulkan.dir/settings.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2
 -32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker
 /auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/settings.c.o -MF loader/CMakeFiles/vulkan.dir/settings.c.o.d -o loader/CMakeFiles/vulkan.dir/settings.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loa
 der/1.3.261.1/git/loader/settings.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/allocation.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/settings.c:26:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:171:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   171 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:175:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   175 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:640:5: error: unknown type name 'PFN_vkGetEncodedVideoSessionParametersKHR'
|   640 |     PFN_vkGetEncodedVideoSessionParametersKHR GetEncodedVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:673:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2KHR'
|   673 |     PFN_vkCmdBindIndexBuffer2KHR CmdBindIndexBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:674:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularityKHR'
|   674 |     PFN_vkGetRenderingAreaGranularityKHR GetRenderingAreaGranularityKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:675:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayoutKHR'
|   675 |     PFN_vkGetDeviceImageSubresourceLayoutKHR GetDeviceImageSubresourceLayoutKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:676:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2KHR'
|   676 |     PFN_vkGetImageSubresourceLayout2KHR GetImageSubresourceLayout2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:761:5: error: unknown type name 'PFN_vkCreateExecutionGraphPipelinesAMDX'
|   761 |     PFN_vkCreateExecutionGraphPipelinesAMDX CreateExecutionGraphPipelinesAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:764:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineScratchSizeAMDX'
|   764 |     PFN_vkGetExecutionGraphPipelineScratchSizeAMDX GetExecutionGraphPipelineScratchSizeAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:767:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineNodeIndexAMDX'
|   767 |     PFN_vkGetExecutionGraphPipelineNodeIndexAMDX GetExecutionGraphPipelineNodeIndexAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:770:5: error: unknown type name 'PFN_vkCmdInitializeGraphScratchMemoryAMDX'
|   770 |     PFN_vkCmdInitializeGraphScratchMemoryAMDX CmdInitializeGraphScratchMemoryAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:773:5: error: unknown type name 'PFN_vkCmdDispatchGraphAMDX'
|   773 |     PFN_vkCmdDispatchGraphAMDX CmdDispatchGraphAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:776:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectAMDX'
|   776 |     PFN_vkCmdDispatchGraphIndirectAMDX CmdDispatchGraphIndirectAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:779:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectCountAMDX'
|   779 |     PFN_vkCmdDispatchGraphIndirectCountAMDX CmdDispatchGraphIndirectCountAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:885:5: error: unknown type name 'PFN_vkCopyMemoryToImageEXT'
|   885 |     PFN_vkCopyMemoryToImageEXT CopyMemoryToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:886:5: error: unknown type name 'PFN_vkCopyImageToMemoryEXT'
|   886 |     PFN_vkCopyImageToMemoryEXT CopyImageToMemoryEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:887:5: error: unknown type name 'PFN_vkCopyImageToImageEXT'
|   887 |     PFN_vkCopyImageToImageEXT CopyImageToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:888:5: error: unknown type name 'PFN_vkTransitionImageLayoutEXT'
|   888 |     PFN_vkTransitionImageLayoutEXT TransitionImageLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:903:5: error: unknown type name 'PFN_vkCmdSetDepthBias2EXT'
|   903 |     PFN_vkCmdSetDepthBias2EXT CmdSetDepthBias2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1034:5: error: unknown type name 'PFN_vkGetPipelineIndirectMemoryRequirementsNV'
|  1034 |     PFN_vkGetPipelineIndirectMemoryRequirementsNV GetPipelineIndirectMemoryRequirementsNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1035:5: error: unknown type name 'PFN_vkCmdUpdatePipelineIndirectBufferNV'
|  1035 |     PFN_vkCmdUpdatePipelineIndirectBufferNV CmdUpdatePipelineIndirectBufferNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1036:5: error: unknown type name 'PFN_vkGetPipelineIndirectDeviceAddressNV'
|  1036 |     PFN_vkGetPipelineIndirectDeviceAddressNV GetPipelineIndirectDeviceAddressNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:345:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   345 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:349:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   349 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [13/19] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wo
 rk/core2-32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yoct
 o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -O -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3
 2-poky-linux/vulkan-loader/1.3.261.1/git/loader/phys_dev_ext.c
| FAILED: loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2
 -32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker
 /auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -O -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l
 inux/vulkan-loader/1.3.261.1/git/loader/phys_dev_ext.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader.h:32,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/phys_dev_ext.c:31:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:171:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   171 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:175:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   175 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:640:5: error: unknown type name 'PFN_vkGetEncodedVideoSessionParametersKHR'
|   640 |     PFN_vkGetEncodedVideoSessionParametersKHR GetEncodedVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:673:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2KHR'
|   673 |     PFN_vkCmdBindIndexBuffer2KHR CmdBindIndexBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:674:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularityKHR'
|   674 |     PFN_vkGetRenderingAreaGranularityKHR GetRenderingAreaGranularityKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:675:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayoutKHR'
|   675 |     PFN_vkGetDeviceImageSubresourceLayoutKHR GetDeviceImageSubresourceLayoutKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:676:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2KHR'
|   676 |     PFN_vkGetImageSubresourceLayout2KHR GetImageSubresourceLayout2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:761:5: error: unknown type name 'PFN_vkCreateExecutionGraphPipelinesAMDX'
|   761 |     PFN_vkCreateExecutionGraphPipelinesAMDX CreateExecutionGraphPipelinesAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:764:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineScratchSizeAMDX'
|   764 |     PFN_vkGetExecutionGraphPipelineScratchSizeAMDX GetExecutionGraphPipelineScratchSizeAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:767:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineNodeIndexAMDX'
|   767 |     PFN_vkGetExecutionGraphPipelineNodeIndexAMDX GetExecutionGraphPipelineNodeIndexAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:770:5: error: unknown type name 'PFN_vkCmdInitializeGraphScratchMemoryAMDX'
|   770 |     PFN_vkCmdInitializeGraphScratchMemoryAMDX CmdInitializeGraphScratchMemoryAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:773:5: error: unknown type name 'PFN_vkCmdDispatchGraphAMDX'
|   773 |     PFN_vkCmdDispatchGraphAMDX CmdDispatchGraphAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:776:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectAMDX'
|   776 |     PFN_vkCmdDispatchGraphIndirectAMDX CmdDispatchGraphIndirectAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:779:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectCountAMDX'
|   779 |     PFN_vkCmdDispatchGraphIndirectCountAMDX CmdDispatchGraphIndirectCountAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:885:5: error: unknown type name 'PFN_vkCopyMemoryToImageEXT'
|   885 |     PFN_vkCopyMemoryToImageEXT CopyMemoryToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:886:5: error: unknown type name 'PFN_vkCopyImageToMemoryEXT'
|   886 |     PFN_vkCopyImageToMemoryEXT CopyImageToMemoryEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:887:5: error: unknown type name 'PFN_vkCopyImageToImageEXT'
|   887 |     PFN_vkCopyImageToImageEXT CopyImageToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:888:5: error: unknown type name 'PFN_vkTransitionImageLayoutEXT'
|   888 |     PFN_vkTransitionImageLayoutEXT TransitionImageLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:903:5: error: unknown type name 'PFN_vkCmdSetDepthBias2EXT'
|   903 |     PFN_vkCmdSetDepthBias2EXT CmdSetDepthBias2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1034:5: error: unknown type name 'PFN_vkGetPipelineIndirectMemoryRequirementsNV'
|  1034 |     PFN_vkGetPipelineIndirectMemoryRequirementsNV GetPipelineIndirectMemoryRequirementsNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1035:5: error: unknown type name 'PFN_vkCmdUpdatePipelineIndirectBufferNV'
|  1035 |     PFN_vkCmdUpdatePipelineIndirectBufferNV CmdUpdatePipelineIndirectBufferNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1036:5: error: unknown type name 'PFN_vkGetPipelineIndirectDeviceAddressNV'
|  1036 |     PFN_vkGetPipelineIndirectDeviceAddressNV GetPipelineIndirectDeviceAddressNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:345:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   345 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:349:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   349 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [14/19] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wo
 rk/core2-32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yoct
 o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/cJSON.c.o -MF loader/CMakeFiles/vulkan.dir/cJSON.c.o.d -o loader/CMakeFiles/vulkan.dir/cJSON.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-load
 er/1.3.261.1/git/loader/cJSON.c
| FAILED: loader/CMakeFiles/vulkan.dir/cJSON.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2
 -32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker
 /auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/cJSON.c.o -MF loader/CMakeFiles/vulkan.dir/cJSON.c.o.d -o loader/CMakeFiles/vulkan.dir/cJSON.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.2
 61.1/git/loader/cJSON.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/allocation.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/cJSON.c:39:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:171:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   171 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:175:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   175 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:640:5: error: unknown type name 'PFN_vkGetEncodedVideoSessionParametersKHR'
|   640 |     PFN_vkGetEncodedVideoSessionParametersKHR GetEncodedVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:673:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2KHR'
|   673 |     PFN_vkCmdBindIndexBuffer2KHR CmdBindIndexBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:674:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularityKHR'
|   674 |     PFN_vkGetRenderingAreaGranularityKHR GetRenderingAreaGranularityKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:675:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayoutKHR'
|   675 |     PFN_vkGetDeviceImageSubresourceLayoutKHR GetDeviceImageSubresourceLayoutKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:676:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2KHR'
|   676 |     PFN_vkGetImageSubresourceLayout2KHR GetImageSubresourceLayout2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:761:5: error: unknown type name 'PFN_vkCreateExecutionGraphPipelinesAMDX'
|   761 |     PFN_vkCreateExecutionGraphPipelinesAMDX CreateExecutionGraphPipelinesAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:764:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineScratchSizeAMDX'
|   764 |     PFN_vkGetExecutionGraphPipelineScratchSizeAMDX GetExecutionGraphPipelineScratchSizeAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:767:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineNodeIndexAMDX'
|   767 |     PFN_vkGetExecutionGraphPipelineNodeIndexAMDX GetExecutionGraphPipelineNodeIndexAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:770:5: error: unknown type name 'PFN_vkCmdInitializeGraphScratchMemoryAMDX'
|   770 |     PFN_vkCmdInitializeGraphScratchMemoryAMDX CmdInitializeGraphScratchMemoryAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:773:5: error: unknown type name 'PFN_vkCmdDispatchGraphAMDX'
|   773 |     PFN_vkCmdDispatchGraphAMDX CmdDispatchGraphAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:776:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectAMDX'
|   776 |     PFN_vkCmdDispatchGraphIndirectAMDX CmdDispatchGraphIndirectAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:779:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectCountAMDX'
|   779 |     PFN_vkCmdDispatchGraphIndirectCountAMDX CmdDispatchGraphIndirectCountAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:885:5: error: unknown type name 'PFN_vkCopyMemoryToImageEXT'
|   885 |     PFN_vkCopyMemoryToImageEXT CopyMemoryToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:886:5: error: unknown type name 'PFN_vkCopyImageToMemoryEXT'
|   886 |     PFN_vkCopyImageToMemoryEXT CopyImageToMemoryEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:887:5: error: unknown type name 'PFN_vkCopyImageToImageEXT'
|   887 |     PFN_vkCopyImageToImageEXT CopyImageToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:888:5: error: unknown type name 'PFN_vkTransitionImageLayoutEXT'
|   888 |     PFN_vkTransitionImageLayoutEXT TransitionImageLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:903:5: error: unknown type name 'PFN_vkCmdSetDepthBias2EXT'
|   903 |     PFN_vkCmdSetDepthBias2EXT CmdSetDepthBias2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1034:5: error: unknown type name 'PFN_vkGetPipelineIndirectMemoryRequirementsNV'
|  1034 |     PFN_vkGetPipelineIndirectMemoryRequirementsNV GetPipelineIndirectMemoryRequirementsNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1035:5: error: unknown type name 'PFN_vkCmdUpdatePipelineIndirectBufferNV'
|  1035 |     PFN_vkCmdUpdatePipelineIndirectBufferNV CmdUpdatePipelineIndirectBufferNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1036:5: error: unknown type name 'PFN_vkGetPipelineIndirectDeviceAddressNV'
|  1036 |     PFN_vkGetPipelineIndirectDeviceAddressNV GetPipelineIndirectDeviceAddressNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:345:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   345 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:349:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   349 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [15/19] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wo
 rk/core2-32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yoct
 o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li
 nux/vulkan-loader/1.3.261.1/git/loader/trampoline.c
| FAILED: loader/CMakeFiles/vulkan.dir/trampoline.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2
 -32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker
 /auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulk
 an-loader/1.3.261.1/git/loader/trampoline.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/allocation.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/trampoline.c:30:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:171:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   171 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:175:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   175 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:640:5: error: unknown type name 'PFN_vkGetEncodedVideoSessionParametersKHR'
|   640 |     PFN_vkGetEncodedVideoSessionParametersKHR GetEncodedVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:673:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2KHR'
|   673 |     PFN_vkCmdBindIndexBuffer2KHR CmdBindIndexBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:674:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularityKHR'
|   674 |     PFN_vkGetRenderingAreaGranularityKHR GetRenderingAreaGranularityKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:675:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayoutKHR'
|   675 |     PFN_vkGetDeviceImageSubresourceLayoutKHR GetDeviceImageSubresourceLayoutKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:676:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2KHR'
|   676 |     PFN_vkGetImageSubresourceLayout2KHR GetImageSubresourceLayout2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:761:5: error: unknown type name 'PFN_vkCreateExecutionGraphPipelinesAMDX'
|   761 |     PFN_vkCreateExecutionGraphPipelinesAMDX CreateExecutionGraphPipelinesAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:764:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineScratchSizeAMDX'
|   764 |     PFN_vkGetExecutionGraphPipelineScratchSizeAMDX GetExecutionGraphPipelineScratchSizeAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:767:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineNodeIndexAMDX'
|   767 |     PFN_vkGetExecutionGraphPipelineNodeIndexAMDX GetExecutionGraphPipelineNodeIndexAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:770:5: error: unknown type name 'PFN_vkCmdInitializeGraphScratchMemoryAMDX'
|   770 |     PFN_vkCmdInitializeGraphScratchMemoryAMDX CmdInitializeGraphScratchMemoryAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:773:5: error: unknown type name 'PFN_vkCmdDispatchGraphAMDX'
|   773 |     PFN_vkCmdDispatchGraphAMDX CmdDispatchGraphAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:776:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectAMDX'
|   776 |     PFN_vkCmdDispatchGraphIndirectAMDX CmdDispatchGraphIndirectAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:779:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectCountAMDX'
|   779 |     PFN_vkCmdDispatchGraphIndirectCountAMDX CmdDispatchGraphIndirectCountAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:885:5: error: unknown type name 'PFN_vkCopyMemoryToImageEXT'
|   885 |     PFN_vkCopyMemoryToImageEXT CopyMemoryToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:886:5: error: unknown type name 'PFN_vkCopyImageToMemoryEXT'
|   886 |     PFN_vkCopyImageToMemoryEXT CopyImageToMemoryEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:887:5: error: unknown type name 'PFN_vkCopyImageToImageEXT'
|   887 |     PFN_vkCopyImageToImageEXT CopyImageToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:888:5: error: unknown type name 'PFN_vkTransitionImageLayoutEXT'
|   888 |     PFN_vkTransitionImageLayoutEXT TransitionImageLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:903:5: error: unknown type name 'PFN_vkCmdSetDepthBias2EXT'
|   903 |     PFN_vkCmdSetDepthBias2EXT CmdSetDepthBias2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1034:5: error: unknown type name 'PFN_vkGetPipelineIndirectMemoryRequirementsNV'
|  1034 |     PFN_vkGetPipelineIndirectMemoryRequirementsNV GetPipelineIndirectMemoryRequirementsNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1035:5: error: unknown type name 'PFN_vkCmdUpdatePipelineIndirectBufferNV'
|  1035 |     PFN_vkCmdUpdatePipelineIndirectBufferNV CmdUpdatePipelineIndirectBufferNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1036:5: error: unknown type name 'PFN_vkGetPipelineIndirectDeviceAddressNV'
|  1036 |     PFN_vkGetPipelineIndirectDeviceAddressNV GetPipelineIndirectDeviceAddressNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:345:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   345 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:349:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   349 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [16/19] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wo
 rk/core2-32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yoct
 o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -O -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/t
 mp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/unknown_ext_chain.c
| FAILED: loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2
 -32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker
 /auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -O -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/
 core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/unknown_ext_chain.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader.h:32,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/unknown_ext_chain.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:171:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   171 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:175:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   175 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:640:5: error: unknown type name 'PFN_vkGetEncodedVideoSessionParametersKHR'
|   640 |     PFN_vkGetEncodedVideoSessionParametersKHR GetEncodedVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:673:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2KHR'
|   673 |     PFN_vkCmdBindIndexBuffer2KHR CmdBindIndexBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:674:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularityKHR'
|   674 |     PFN_vkGetRenderingAreaGranularityKHR GetRenderingAreaGranularityKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:675:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayoutKHR'
|   675 |     PFN_vkGetDeviceImageSubresourceLayoutKHR GetDeviceImageSubresourceLayoutKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:676:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2KHR'
|   676 |     PFN_vkGetImageSubresourceLayout2KHR GetImageSubresourceLayout2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:761:5: error: unknown type name 'PFN_vkCreateExecutionGraphPipelinesAMDX'
|   761 |     PFN_vkCreateExecutionGraphPipelinesAMDX CreateExecutionGraphPipelinesAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:764:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineScratchSizeAMDX'
|   764 |     PFN_vkGetExecutionGraphPipelineScratchSizeAMDX GetExecutionGraphPipelineScratchSizeAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:767:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineNodeIndexAMDX'
|   767 |     PFN_vkGetExecutionGraphPipelineNodeIndexAMDX GetExecutionGraphPipelineNodeIndexAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:770:5: error: unknown type name 'PFN_vkCmdInitializeGraphScratchMemoryAMDX'
|   770 |     PFN_vkCmdInitializeGraphScratchMemoryAMDX CmdInitializeGraphScratchMemoryAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:773:5: error: unknown type name 'PFN_vkCmdDispatchGraphAMDX'
|   773 |     PFN_vkCmdDispatchGraphAMDX CmdDispatchGraphAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:776:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectAMDX'
|   776 |     PFN_vkCmdDispatchGraphIndirectAMDX CmdDispatchGraphIndirectAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:779:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectCountAMDX'
|   779 |     PFN_vkCmdDispatchGraphIndirectCountAMDX CmdDispatchGraphIndirectCountAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:885:5: error: unknown type name 'PFN_vkCopyMemoryToImageEXT'
|   885 |     PFN_vkCopyMemoryToImageEXT CopyMemoryToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:886:5: error: unknown type name 'PFN_vkCopyImageToMemoryEXT'
|   886 |     PFN_vkCopyImageToMemoryEXT CopyImageToMemoryEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:887:5: error: unknown type name 'PFN_vkCopyImageToImageEXT'
|   887 |     PFN_vkCopyImageToImageEXT CopyImageToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:888:5: error: unknown type name 'PFN_vkTransitionImageLayoutEXT'
|   888 |     PFN_vkTransitionImageLayoutEXT TransitionImageLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:903:5: error: unknown type name 'PFN_vkCmdSetDepthBias2EXT'
|   903 |     PFN_vkCmdSetDepthBias2EXT CmdSetDepthBias2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1034:5: error: unknown type name 'PFN_vkGetPipelineIndirectMemoryRequirementsNV'
|  1034 |     PFN_vkGetPipelineIndirectMemoryRequirementsNV GetPipelineIndirectMemoryRequirementsNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1035:5: error: unknown type name 'PFN_vkCmdUpdatePipelineIndirectBufferNV'
|  1035 |     PFN_vkCmdUpdatePipelineIndirectBufferNV CmdUpdatePipelineIndirectBufferNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1036:5: error: unknown type name 'PFN_vkGetPipelineIndirectDeviceAddressNV'
|  1036 |     PFN_vkGetPipelineIndirectDeviceAddressNV GetPipelineIndirectDeviceAddressNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:345:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   345 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:349:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   349 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [17/19] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wo
 rk/core2-32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yoct
 o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-l
 oader/1.3.261.1/git/loader/loader.c
| FAILED: loader/CMakeFiles/vulkan.dir/loader.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_ALLOCA_H -DHAVE_CET_H -DHAVE_SECURE_GETENV -DLOADER_ENABLE_LINUX_SORT -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_GNU_SOURCE -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2
 -32-poky-linux/vulkan-loader/1.3.261.1/build/loader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker
 /auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build=/usr/src/debug/vulkan-loader/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/recipe-sysroot-native=  -std=c99 -fPIC -Werror -Wall -Wextra -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wshadow=local -fvisibility=hidden -Wpointer-arith -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.
 3.261.1/git/loader/loader.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader.h:32,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:171:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   171 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:175:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   175 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:640:5: error: unknown type name 'PFN_vkGetEncodedVideoSessionParametersKHR'
|   640 |     PFN_vkGetEncodedVideoSessionParametersKHR GetEncodedVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:673:5: error: unknown type name 'PFN_vkCmdBindIndexBuffer2KHR'
|   673 |     PFN_vkCmdBindIndexBuffer2KHR CmdBindIndexBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:674:5: error: unknown type name 'PFN_vkGetRenderingAreaGranularityKHR'
|   674 |     PFN_vkGetRenderingAreaGranularityKHR GetRenderingAreaGranularityKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:675:5: error: unknown type name 'PFN_vkGetDeviceImageSubresourceLayoutKHR'
|   675 |     PFN_vkGetDeviceImageSubresourceLayoutKHR GetDeviceImageSubresourceLayoutKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:676:5: error: unknown type name 'PFN_vkGetImageSubresourceLayout2KHR'
|   676 |     PFN_vkGetImageSubresourceLayout2KHR GetImageSubresourceLayout2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:761:5: error: unknown type name 'PFN_vkCreateExecutionGraphPipelinesAMDX'
|   761 |     PFN_vkCreateExecutionGraphPipelinesAMDX CreateExecutionGraphPipelinesAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:764:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineScratchSizeAMDX'
|   764 |     PFN_vkGetExecutionGraphPipelineScratchSizeAMDX GetExecutionGraphPipelineScratchSizeAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:767:5: error: unknown type name 'PFN_vkGetExecutionGraphPipelineNodeIndexAMDX'
|   767 |     PFN_vkGetExecutionGraphPipelineNodeIndexAMDX GetExecutionGraphPipelineNodeIndexAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:770:5: error: unknown type name 'PFN_vkCmdInitializeGraphScratchMemoryAMDX'
|   770 |     PFN_vkCmdInitializeGraphScratchMemoryAMDX CmdInitializeGraphScratchMemoryAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:773:5: error: unknown type name 'PFN_vkCmdDispatchGraphAMDX'
|   773 |     PFN_vkCmdDispatchGraphAMDX CmdDispatchGraphAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:776:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectAMDX'
|   776 |     PFN_vkCmdDispatchGraphIndirectAMDX CmdDispatchGraphIndirectAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:779:5: error: unknown type name 'PFN_vkCmdDispatchGraphIndirectCountAMDX'
|   779 |     PFN_vkCmdDispatchGraphIndirectCountAMDX CmdDispatchGraphIndirectCountAMDX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:885:5: error: unknown type name 'PFN_vkCopyMemoryToImageEXT'
|   885 |     PFN_vkCopyMemoryToImageEXT CopyMemoryToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:886:5: error: unknown type name 'PFN_vkCopyImageToMemoryEXT'
|   886 |     PFN_vkCopyImageToMemoryEXT CopyImageToMemoryEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:887:5: error: unknown type name 'PFN_vkCopyImageToImageEXT'
|   887 |     PFN_vkCopyImageToImageEXT CopyImageToImageEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:888:5: error: unknown type name 'PFN_vkTransitionImageLayoutEXT'
|   888 |     PFN_vkTransitionImageLayoutEXT TransitionImageLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:903:5: error: unknown type name 'PFN_vkCmdSetDepthBias2EXT'
|   903 |     PFN_vkCmdSetDepthBias2EXT CmdSetDepthBias2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1034:5: error: unknown type name 'PFN_vkGetPipelineIndirectMemoryRequirementsNV'
|  1034 |     PFN_vkGetPipelineIndirectMemoryRequirementsNV GetPipelineIndirectMemoryRequirementsNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1035:5: error: unknown type name 'PFN_vkCmdUpdatePipelineIndirectBufferNV'
|  1035 |     PFN_vkCmdUpdatePipelineIndirectBufferNV CmdUpdatePipelineIndirectBufferNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_layer_dispatch_table.h:1036:5: error: unknown type name 'PFN_vkGetPipelineIndirectDeviceAddressNV'
|  1036 |     PFN_vkGetPipelineIndirectDeviceAddressNV GetPipelineIndirectDeviceAddressNV;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader_common.h:40:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:345:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR'
|   345 |     PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.h:349:5: error: unknown type name 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR'
|   349 |     PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader.c:73:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'loader_icd_init_entries':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:54:36: error: 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'?
|    54 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
|       |                                    ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:193:5: note: in expansion of macro 'LOOKUP_GIPA'
|   193 |     LOOKUP_GIPA(GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR, false);
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:54:36: note: each undeclared identifier is reported only once for each function it appears in
|    54 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
|       |                                    ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:193:5: note: in expansion of macro 'LOOKUP_GIPA'
|   193 |     LOOKUP_GIPA(GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR, false);
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:54:49: error: expected ';' before 'fp_gipa'
|    54 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
|       |                                                 ^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:193:5: note: in expansion of macro 'LOOKUP_GIPA'
|   193 |     LOOKUP_GIPA(GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR, false);
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:54:36: error: 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|    54 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
|       |                                    ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:197:5: note: in expansion of macro 'LOOKUP_GIPA'
|   197 |     LOOKUP_GIPA(GetPhysicalDeviceCooperativeMatrixPropertiesKHR, false);
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:54:49: error: expected ';' before 'fp_gipa'
|    54 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
|       |                                                 ^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:197:5: note: in expansion of macro 'LOOKUP_GIPA'
|   197 |     LOOKUP_GIPA(GetPhysicalDeviceCooperativeMatrixPropertiesKHR, false);
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'loader_init_device_extension_dispatch_table':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:678:51: error: 'PFN_vkGetEncodedVideoSessionParametersKHR' undeclared (first use in this function); did you mean 'PFN_vkDestroyVideoSessionParametersKHR'?
|   678 |     table->GetEncodedVideoSessionParametersKHR = (PFN_vkGetEncodedVideoSessionParametersKHR)gdpa(dev, "vkGetEncodedVideoSessionParametersKHR");
|       |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                   PFN_vkDestroyVideoSessionParametersKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:678:93: error: expected ';' before 'gdpa'
|   678 |     table->GetEncodedVideoSessionParametersKHR = (PFN_vkGetEncodedVideoSessionParametersKHR)gdpa(dev, "vkGetEncodedVideoSessionParametersKHR");
|       |                                                                                             ^~~~
|       |                                                                                             ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:711:38: error: 'PFN_vkCmdBindIndexBuffer2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdBindIndexBuffer'?
|   711 |     table->CmdBindIndexBuffer2KHR = (PFN_vkCmdBindIndexBuffer2KHR)gdpa(dev, "vkCmdBindIndexBuffer2KHR");
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      PFN_vkCmdBindIndexBuffer
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:711:67: error: expected ';' before 'gdpa'
|   711 |     table->CmdBindIndexBuffer2KHR = (PFN_vkCmdBindIndexBuffer2KHR)gdpa(dev, "vkCmdBindIndexBuffer2KHR");
|       |                                                                   ^~~~
|       |                                                                   ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:712:46: error: 'PFN_vkGetRenderingAreaGranularityKHR' undeclared (first use in this function); did you mean 'PFN_vkGetRenderAreaGranularity'?
|   712 |     table->GetRenderingAreaGranularityKHR = (PFN_vkGetRenderingAreaGranularityKHR)gdpa(dev, "vkGetRenderingAreaGranularityKHR");
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              PFN_vkGetRenderAreaGranularity
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:712:83: error: expected ';' before 'gdpa'
|   712 |     table->GetRenderingAreaGranularityKHR = (PFN_vkGetRenderingAreaGranularityKHR)gdpa(dev, "vkGetRenderingAreaGranularityKHR");
|       |                                                                                   ^~~~
|       |                                                                                   ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:713:50: error: 'PFN_vkGetDeviceImageSubresourceLayoutKHR' undeclared (first use in this function); did you mean 'PFN_vkGetImageSubresourceLayout'?
|   713 |     table->GetDeviceImageSubresourceLayoutKHR = (PFN_vkGetDeviceImageSubresourceLayoutKHR)gdpa(dev, "vkGetDeviceImageSubresourceLayoutKHR");
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                  PFN_vkGetImageSubresourceLayout
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:713:91: error: expected ';' before 'gdpa'
|   713 |     table->GetDeviceImageSubresourceLayoutKHR = (PFN_vkGetDeviceImageSubresourceLayoutKHR)gdpa(dev, "vkGetDeviceImageSubresourceLayoutKHR");
|       |                                                                                           ^~~~
|       |                                                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:714:45: error: 'PFN_vkGetImageSubresourceLayout2KHR' undeclared (first use in this function); did you mean 'PFN_vkGetImageSubresourceLayout2EXT'?
|   714 |     table->GetImageSubresourceLayout2KHR = (PFN_vkGetImageSubresourceLayout2KHR)gdpa(dev, "vkGetImageSubresourceLayout2KHR");
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             PFN_vkGetImageSubresourceLayout2EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:714:81: error: expected ';' before 'gdpa'
|   714 |     table->GetImageSubresourceLayout2KHR = (PFN_vkGetImageSubresourceLayout2KHR)gdpa(dev, "vkGetImageSubresourceLayout2KHR");
|       |                                                                                 ^~~~
|       |                                                                                 ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:799:49: error: 'PFN_vkCreateExecutionGraphPipelinesAMDX' undeclared (first use in this function)
|   799 |     table->CreateExecutionGraphPipelinesAMDX = (PFN_vkCreateExecutionGraphPipelinesAMDX)gdpa(dev, "vkCreateExecutionGraphPipelinesAMDX");
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:799:89: error: expected ';' before 'gdpa'
|   799 |     table->CreateExecutionGraphPipelinesAMDX = (PFN_vkCreateExecutionGraphPipelinesAMDX)gdpa(dev, "vkCreateExecutionGraphPipelinesAMDX");
|       |                                                                                         ^~~~
|       |                                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:802:56: error: 'PFN_vkGetExecutionGraphPipelineScratchSizeAMDX' undeclared (first use in this function)
|   802 |     table->GetExecutionGraphPipelineScratchSizeAMDX = (PFN_vkGetExecutionGraphPipelineScratchSizeAMDX)gdpa(dev, "vkGetExecutionGraphPipelineScratchSizeAMDX");
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:802:103: error: expected ';' before 'gdpa'
|   802 |     table->GetExecutionGraphPipelineScratchSizeAMDX = (PFN_vkGetExecutionGraphPipelineScratchSizeAMDX)gdpa(dev, "vkGetExecutionGraphPipelineScratchSizeAMDX");
|       |                                                                                                       ^~~~
|       |                                                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:805:54: error: 'PFN_vkGetExecutionGraphPipelineNodeIndexAMDX' undeclared (first use in this function)
|   805 |     table->GetExecutionGraphPipelineNodeIndexAMDX = (PFN_vkGetExecutionGraphPipelineNodeIndexAMDX)gdpa(dev, "vkGetExecutionGraphPipelineNodeIndexAMDX");
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:805:99: error: expected ';' before 'gdpa'
|   805 |     table->GetExecutionGraphPipelineNodeIndexAMDX = (PFN_vkGetExecutionGraphPipelineNodeIndexAMDX)gdpa(dev, "vkGetExecutionGraphPipelineNodeIndexAMDX");
|       |                                                                                                   ^~~~
|       |                                                                                                   ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:808:51: error: 'PFN_vkCmdInitializeGraphScratchMemoryAMDX' undeclared (first use in this function)
|   808 |     table->CmdInitializeGraphScratchMemoryAMDX = (PFN_vkCmdInitializeGraphScratchMemoryAMDX)gdpa(dev, "vkCmdInitializeGraphScratchMemoryAMDX");
|       |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:808:93: error: expected ';' before 'gdpa'
|   808 |     table->CmdInitializeGraphScratchMemoryAMDX = (PFN_vkCmdInitializeGraphScratchMemoryAMDX)gdpa(dev, "vkCmdInitializeGraphScratchMemoryAMDX");
|       |                                                                                             ^~~~
|       |                                                                                             ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:811:36: error: 'PFN_vkCmdDispatchGraphAMDX' undeclared (first use in this function); did you mean 'PFN_vkCmdDispatchBaseKHR'?
|   811 |     table->CmdDispatchGraphAMDX = (PFN_vkCmdDispatchGraphAMDX)gdpa(dev, "vkCmdDispatchGraphAMDX");
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    PFN_vkCmdDispatchBaseKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:811:63: error: expected ';' before 'gdpa'
|   811 |     table->CmdDispatchGraphAMDX = (PFN_vkCmdDispatchGraphAMDX)gdpa(dev, "vkCmdDispatchGraphAMDX");
|       |                                                               ^~~~
|       |                                                               ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:814:44: error: 'PFN_vkCmdDispatchGraphIndirectAMDX' undeclared (first use in this function); did you mean 'PFN_vkCmdDispatchIndirect'?
|   814 |     table->CmdDispatchGraphIndirectAMDX = (PFN_vkCmdDispatchGraphIndirectAMDX)gdpa(dev, "vkCmdDispatchGraphIndirectAMDX");
|       |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                            PFN_vkCmdDispatchIndirect
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:814:79: error: expected ';' before 'gdpa'
|   814 |     table->CmdDispatchGraphIndirectAMDX = (PFN_vkCmdDispatchGraphIndirectAMDX)gdpa(dev, "vkCmdDispatchGraphIndirectAMDX");
|       |                                                                               ^~~~
|       |                                                                               ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:817:49: error: 'PFN_vkCmdDispatchGraphIndirectCountAMDX' undeclared (first use in this function); did you mean 'PFN_vkCmdDrawIndirectCountAMD'?
|   817 |     table->CmdDispatchGraphIndirectCountAMDX = (PFN_vkCmdDispatchGraphIndirectCountAMDX)gdpa(dev, "vkCmdDispatchGraphIndirectCountAMDX");
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 PFN_vkCmdDrawIndirectCountAMD
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:817:89: error: expected ';' before 'gdpa'
|   817 |     table->CmdDispatchGraphIndirectCountAMDX = (PFN_vkCmdDispatchGraphIndirectCountAMDX)gdpa(dev, "vkCmdDispatchGraphIndirectCountAMDX");
|       |                                                                                         ^~~~
|       |                                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:923:36: error: 'PFN_vkCopyMemoryToImageEXT' undeclared (first use in this function); did you mean 'PFN_vkCopyMemoryToMicromapEXT'?
|   923 |     table->CopyMemoryToImageEXT = (PFN_vkCopyMemoryToImageEXT)gdpa(dev, "vkCopyMemoryToImageEXT");
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    PFN_vkCopyMemoryToMicromapEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:923:63: error: expected ';' before 'gdpa'
|   923 |     table->CopyMemoryToImageEXT = (PFN_vkCopyMemoryToImageEXT)gdpa(dev, "vkCopyMemoryToImageEXT");
|       |                                                               ^~~~
|       |                                                               ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:924:36: error: 'PFN_vkCopyImageToMemoryEXT' undeclared (first use in this function); did you mean 'PFN_vkCopyMicromapToMemoryEXT'?
|   924 |     table->CopyImageToMemoryEXT = (PFN_vkCopyImageToMemoryEXT)gdpa(dev, "vkCopyImageToMemoryEXT");
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    PFN_vkCopyMicromapToMemoryEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:924:63: error: expected ';' before 'gdpa'
|   924 |     table->CopyImageToMemoryEXT = (PFN_vkCopyImageToMemoryEXT)gdpa(dev, "vkCopyImageToMemoryEXT");
|       |                                                               ^~~~
|       |                                                               ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:925:35: error: 'PFN_vkCopyImageToImageEXT' undeclared (first use in this function); did you mean 'PFN_vkCopyMicromapEXT'?
|   925 |     table->CopyImageToImageEXT = (PFN_vkCopyImageToImageEXT)gdpa(dev, "vkCopyImageToImageEXT");
|       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                   PFN_vkCopyMicromapEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:925:61: error: expected ';' before 'gdpa'
|   925 |     table->CopyImageToImageEXT = (PFN_vkCopyImageToImageEXT)gdpa(dev, "vkCopyImageToImageEXT");
|       |                                                             ^~~~
|       |                                                             ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:926:40: error: 'PFN_vkTransitionImageLayoutEXT' undeclared (first use in this function)
|   926 |     table->TransitionImageLayoutEXT = (PFN_vkTransitionImageLayoutEXT)gdpa(dev, "vkTransitionImageLayoutEXT");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:926:71: error: expected ';' before 'gdpa'
|   926 |     table->TransitionImageLayoutEXT = (PFN_vkTransitionImageLayoutEXT)gdpa(dev, "vkTransitionImageLayoutEXT");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:941:35: error: 'PFN_vkCmdSetDepthBias2EXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetDepthBias'?
|   941 |     table->CmdSetDepthBias2EXT = (PFN_vkCmdSetDepthBias2EXT)gdpa(dev, "vkCmdSetDepthBias2EXT");
|       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                   PFN_vkCmdSetDepthBias
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:941:61: error: expected ';' before 'gdpa'
|   941 |     table->CmdSetDepthBias2EXT = (PFN_vkCmdSetDepthBias2EXT)gdpa(dev, "vkCmdSetDepthBias2EXT");
|       |                                                             ^~~~
|       |                                                             ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:1072:55: error: 'PFN_vkGetPipelineIndirectMemoryRequirementsNV' undeclared (first use in this function); did you mean 'PFN_vkGetDeviceImageMemoryRequirements'?
|  1072 |     table->GetPipelineIndirectMemoryRequirementsNV = (PFN_vkGetPipelineIndirectMemoryRequirementsNV)gdpa(dev, "vkGetPipelineIndirectMemoryRequirementsNV");
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                       PFN_vkGetDeviceImageMemoryRequirements
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:1072:101: error: expected ';' before 'gdpa'
|  1072 |     table->GetPipelineIndirectMemoryRequirementsNV = (PFN_vkGetPipelineIndirectMemoryRequirementsNV)gdpa(dev, "vkGetPipelineIndirectMemoryRequirementsNV");
|       |                                                                                                     ^~~~
|       |                                                                                                     ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:1073:49: error: 'PFN_vkCmdUpdatePipelineIndirectBufferNV' undeclared (first use in this function)
|  1073 |     table->CmdUpdatePipelineIndirectBufferNV = (PFN_vkCmdUpdatePipelineIndirectBufferNV)gdpa(dev, "vkCmdUpdatePipelineIndirectBufferNV");
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:1073:89: error: expected ';' before 'gdpa'
|  1073 |     table->CmdUpdatePipelineIndirectBufferNV = (PFN_vkCmdUpdatePipelineIndirectBufferNV)gdpa(dev, "vkCmdUpdatePipelineIndirectBufferNV");
|       |                                                                                         ^~~~
|       |                                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:1074:50: error: 'PFN_vkGetPipelineIndirectDeviceAddressNV' undeclared (first use in this function)
|  1074 |     table->GetPipelineIndirectDeviceAddressNV = (PFN_vkGetPipelineIndirectDeviceAddressNV)gdpa(dev, "vkGetPipelineIndirectDeviceAddressNV");
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:1074:91: error: expected ';' before 'gdpa'
|  1074 |     table->GetPipelineIndirectDeviceAddressNV = (PFN_vkGetPipelineIndirectDeviceAddressNV)gdpa(dev, "vkGetPipelineIndirectDeviceAddressNV");
|       |                                                                                           ^~~~
|       |                                                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'loader_init_instance_extension_dispatch_table':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:1308:69: error: 'PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'?
|  1308 |     table->GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR = (PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR)gpa(inst, "vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR");
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:1308:129: error: expected ';' before 'gpa'
|  1308 |     table->GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR = (PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR)gpa(inst, "vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR");
|       |                                                                                                                                 ^~~
|       |                                                                                                                                 ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:1312:63: error: 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|  1312 |     table->GetPhysicalDeviceCooperativeMatrixPropertiesKHR = (PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR)gpa(inst, "vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR");
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                               PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:1312:117: error: expected ';' before 'gpa'
|  1312 |     table->GetPhysicalDeviceCooperativeMatrixPropertiesKHR = (PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR)gpa(inst, "vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR");
|       |                                                                                                                     ^~~
|       |                                                                                                                     ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:4392:11: error: unknown type name 'VkPhysicalDeviceVideoEncodeQualityLevelInfoKHR'
|  4392 |     const VkPhysicalDeviceVideoEncodeQualityLevelInfoKHR* pQualityLevelInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:4393:5: error: unknown type name 'VkVideoEncodeQualityLevelPropertiesKHR'
|  4393 |     VkVideoEncodeQualityLevelPropertiesKHR*     pQualityLevelProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:4408:11: error: unknown type name 'VkPhysicalDeviceVideoEncodeQualityLevelInfoKHR'
|  4408 |     const VkPhysicalDeviceVideoEncodeQualityLevelInfoKHR* pQualityLevelInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:4409:5: error: unknown type name 'VkVideoEncodeQualityLevelPropertiesKHR'
|  4409 |     VkVideoEncodeQualityLevelPropertiesKHR*     pQualityLevelProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:4424:11: error: unknown type name 'VkVideoEncodeSessionParametersGetInfoKHR'
|  4424 |     const VkVideoEncodeSessionParametersGetInfoKHR* pVideoSessionParametersInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:4425:5: error: unknown type name 'VkVideoEncodeSessionParametersFeedbackInfoKHR'; did you mean 'VkVideoDecodeH265SessionParametersCreateInfoKHR'?
|  4425 |     VkVideoEncodeSessionParametersFeedbackInfoKHR* pFeedbackInfo,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkVideoDecodeH265SessionParametersCreateInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'CmdBindIndexBuffer2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:4732:5: error: called object is not a function or function pointer
|  4732 |     disp->CmdBindIndexBuffer2KHR(commandBuffer, buffer, offset, size, indexType);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:4737:11: error: unknown type name 'VkRenderingAreaInfoKHR'
|  4737 |     const VkRenderingAreaInfoKHR*               pRenderingAreaInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'GetRenderingAreaGranularityKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:4746:5: error: called object is not a function or function pointer
|  4746 |     disp->GetRenderingAreaGranularityKHR(device, pRenderingAreaInfo, pGranularity);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:4751:11: error: unknown type name 'VkDeviceImageSubresourceInfoKHR'
|  4751 |     const VkDeviceImageSubresourceInfoKHR*      pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:4752:5: error: unknown type name 'VkSubresourceLayout2KHR'; did you mean 'VkSubresourceLayout2EXT'?
|  4752 |     VkSubresourceLayout2KHR*                    pLayout) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     VkSubresourceLayout2EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:4766:11: error: unknown type name 'VkImageSubresource2KHR'
|  4766 |     const VkImageSubresource2KHR*               pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:4767:5: error: unknown type name 'VkSubresourceLayout2KHR'; did you mean 'VkSubresourceLayout2EXT'?
|  4767 |     VkSubresourceLayout2KHR*                    pLayout) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     VkSubresourceLayout2EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:4784:5: error: unknown type name 'VkCooperativeMatrixPropertiesKHR'; did you mean 'VkCooperativeMatrixPropertiesNV'?
|  4784 |     VkCooperativeMatrixPropertiesKHR*           pProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkCooperativeMatrixPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:4800:5: error: unknown type name 'VkCooperativeMatrixPropertiesKHR'; did you mean 'VkCooperativeMatrixPropertiesNV'?
|  4800 |     VkCooperativeMatrixPropertiesKHR*           pProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkCooperativeMatrixPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:5793:11: error: unknown type name 'VkExecutionGraphPipelineCreateInfoAMDX'
|  5793 |     const VkExecutionGraphPipelineCreateInfoAMDX* pCreateInfos,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'CreateExecutionGraphPipelinesAMDX':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:5803:12: error: called object is not a function or function pointer
|  5803 |     return disp->CreateExecutionGraphPipelinesAMDX(device, pipelineCache, createInfoCount, pCreateInfos, pAllocator, pPipelines);
|       |            ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:5811:5: error: unknown type name 'VkExecutionGraphPipelineScratchSizeAMDX'
|  5811 |     VkExecutionGraphPipelineScratchSizeAMDX*    pSizeInfo) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:5827:11: error: unknown type name 'VkPipelineShaderStageNodeCreateInfoAMDX'
|  5827 |     const VkPipelineShaderStageNodeCreateInfoAMDX* pNodeInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'GetExecutionGraphPipelineNodeIndexAMDX':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:5836:12: error: called object is not a function or function pointer
|  5836 |     return disp->GetExecutionGraphPipelineNodeIndexAMDX(device, executionGraph, pNodeInfo, pNodeIndex);
|       |            ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'CmdInitializeGraphScratchMemoryAMDX':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:5851:5: error: called object is not a function or function pointer
|  5851 |     disp->CmdInitializeGraphScratchMemoryAMDX(commandBuffer, scratch);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:5859:11: error: unknown type name 'VkDispatchGraphCountInfoAMDX'
|  5859 |     const VkDispatchGraphCountInfoAMDX*         pCountInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'CmdDispatchGraphAMDX':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:5867:5: error: called object is not a function or function pointer
|  5867 |     disp->CmdDispatchGraphAMDX(commandBuffer, scratch, pCountInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:5875:11: error: unknown type name 'VkDispatchGraphCountInfoAMDX'
|  5875 |     const VkDispatchGraphCountInfoAMDX*         pCountInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'CmdDispatchGraphIndirectAMDX':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:5883:5: error: called object is not a function or function pointer
|  5883 |     disp->CmdDispatchGraphIndirectAMDX(commandBuffer, scratch, pCountInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'CmdDispatchGraphIndirectCountAMDX':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:5899:5: error: called object is not a function or function pointer
|  5899 |     disp->CmdDispatchGraphIndirectCountAMDX(commandBuffer, scratch, countInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:6956:11: error: unknown type name 'VkCopyMemoryToImageInfoEXT'
|  6956 |     const VkCopyMemoryToImageInfoEXT*           pCopyMemoryToImageInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'CopyMemoryToImageEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:6964:12: error: called object is not a function or function pointer
|  6964 |     return disp->CopyMemoryToImageEXT(device, pCopyMemoryToImageInfo);
|       |            ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:6969:11: error: unknown type name 'VkCopyImageToMemoryInfoEXT'
|  6969 |     const VkCopyImageToMemoryInfoEXT*           pCopyImageToMemoryInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'CopyImageToMemoryEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:6977:12: error: called object is not a function or function pointer
|  6977 |     return disp->CopyImageToMemoryEXT(device, pCopyImageToMemoryInfo);
|       |            ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:6982:11: error: unknown type name 'VkCopyImageToImageInfoEXT'
|  6982 |     const VkCopyImageToImageInfoEXT*            pCopyImageToImageInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'CopyImageToImageEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:6990:12: error: called object is not a function or function pointer
|  6990 |     return disp->CopyImageToImageEXT(device, pCopyImageToImageInfo);
|       |            ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:6996:11: error: unknown type name 'VkHostImageLayoutTransitionInfoEXT'
|  6996 |     const VkHostImageLayoutTransitionInfoEXT*   pTransitions) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'TransitionImageLayoutEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:7004:12: error: called object is not a function or function pointer
|  7004 |     return disp->TransitionImageLayoutEXT(device, transitionCount, pTransitions);
|       |            ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:7010:11: error: unknown type name 'VkImageSubresource2KHR'
|  7010 |     const VkImageSubresource2KHR*               pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:7011:5: error: unknown type name 'VkSubresourceLayout2KHR'; did you mean 'VkSubresourceLayout2EXT'?
|  7011 |     VkSubresourceLayout2KHR*                    pLayout) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     VkSubresourceLayout2EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:7131:11: error: unknown type name 'VkDepthBiasInfoEXT'
|  7131 |     const VkDepthBiasInfoEXT*                   pDepthBiasInfo) {
|       |           ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthBias2EXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:7139:5: error: called object is not a function or function pointer
|  7139 |     disp->CmdSetDepthBias2EXT(commandBuffer, pDepthBiasInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'GetPipelineIndirectMemoryRequirementsNV':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:8296:5: error: called object is not a function or function pointer
|  8296 |     disp->GetPipelineIndirectMemoryRequirementsNV(device, pCreateInfo, pMemoryRequirements);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'CmdUpdatePipelineIndirectBufferNV':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:8310:5: error: called object is not a function or function pointer
|  8310 |     disp->CmdUpdatePipelineIndirectBufferNV(commandBuffer, pipelineBindPoint, pipeline);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:8315:11: error: unknown type name 'VkPipelineIndirectDeviceAddressInfoNV'
|  8315 |     const VkPipelineIndirectDeviceAddressInfoNV* pInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'GetPipelineIndirectDeviceAddressNV':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:8323:12: error: called object is not a function or function pointer
|  8323 |     return disp->GetPipelineIndirectDeviceAddressNV(device, pInfo);
|       |            ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'extension_instance_gpa':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:9840:25: error: 'GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR' undeclared (first use in this function); did you mean 'GetPhysicalDeviceVideoFormatPropertiesKHR'?
|  9840 |         *addr = (void *)GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         GetPhysicalDeviceVideoFormatPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:9846:25: error: 'GetEncodedVideoSessionParametersKHR' undeclared (first use in this function); did you mean 'DestroyVideoSessionParametersKHR'?
|  9846 |         *addr = (void *)GetEncodedVideoSessionParametersKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         DestroyVideoSessionParametersKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:9947:25: error: 'GetDeviceImageSubresourceLayoutKHR' undeclared (first use in this function); did you mean 'vkGetImageSubresourceLayout'?
|  9947 |         *addr = (void *)GetDeviceImageSubresourceLayoutKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         vkGetImageSubresourceLayout
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:9951:25: error: 'GetImageSubresourceLayout2KHR' undeclared (first use in this function); did you mean 'vkGetImageSubresourceLayout2EXT'?
|  9951 |         *addr = (void *)GetImageSubresourceLayout2KHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         vkGetImageSubresourceLayout2EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:9957:25: error: 'GetPhysicalDeviceCooperativeMatrixPropertiesKHR' undeclared (first use in this function); did you mean 'GetPhysicalDeviceCooperativeMatrixPropertiesNV'?
|  9957 |         *addr = (void *)GetPhysicalDeviceCooperativeMatrixPropertiesKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         GetPhysicalDeviceCooperativeMatrixPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:10244:25: error: 'GetExecutionGraphPipelineScratchSizeAMDX' undeclared (first use in this function); did you mean 'GetExecutionGraphPipelineNodeIndexAMDX'?
| 10244 |         *addr = (void *)GetExecutionGraphPipelineScratchSizeAMDX;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         GetExecutionGraphPipelineNodeIndexAMDX
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:10611:25: error: 'GetImageSubresourceLayout2EXT' undeclared (first use in this function); did you mean 'vkGetImageSubresourceLayout2EXT'?
| 10611 |         *addr = (void *)GetImageSubresourceLayout2EXT;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         vkGetImageSubresourceLayout2EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:11600:62: error: 'terminator_GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR' undeclared here (not in a function); did you mean 'terminator_GetPhysicalDeviceVideoFormatPropertiesKHR'?
| 11600 |     .GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR = terminator_GetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR,
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              terminator_GetPhysicalDeviceVideoFormatPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:11604:56: error: 'terminator_GetPhysicalDeviceCooperativeMatrixPropertiesKHR' undeclared here (not in a function); did you mean 'terminator_GetPhysicalDeviceCooperativeMatrixPropertiesNV'?
| 11604 |     .GetPhysicalDeviceCooperativeMatrixPropertiesKHR = terminator_GetPhysicalDeviceCooperativeMatrixPropertiesKHR,
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        terminator_GetPhysicalDeviceCooperativeMatrixPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader.c: In function 'terminator_CreateDevice':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader.c:5846:22: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES_KHR' undeclared (first use in this function); did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES_KHR'?
|  5846 |                 case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES_KHR: {
|       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                      VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader.c:5847:27: error: unknown type name 'VkPhysicalDeviceMaintenance5FeaturesKHR'
|  5847 |                     const VkPhysicalDeviceMaintenance5FeaturesKHR *maintenance_features = pNext;
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader.c:5848:45: error: request for member 'maintenance5' in something not a structure or union
|  5848 |                     if (maintenance_features->maintenance5 == VK_TRUE) {
|       |                                             ^~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader.c:5851:49: error: request for member 'pNext' in something not a structure or union
|  5851 |                     pNext = maintenance_features->pNext;
|       |                                                 ^~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/loader.c:5877:72: error: 'VK_KHR_MAINTENANCE_5_EXTENSION_NAME' undeclared (first use in this function); did you mean 'VK_KHR_MAINTENANCE_3_EXTENSION_NAME'?
|  5877 |         } else if (!strcmp(localCreateInfo.ppEnabledExtensionNames[i], VK_KHR_MAINTENANCE_5_EXTENSION_NAME) &&
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                        VK_KHR_MAINTENANCE_3_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'CreateExecutionGraphPipelinesAMDX':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:5804:1: error: control reaches end of non-void function [-Werror=return-type]
|  5804 | }
|       | ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'GetExecutionGraphPipelineNodeIndexAMDX':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:5837:1: error: control reaches end of non-void function [-Werror=return-type]
|  5837 | }
|       | ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'CopyMemoryToImageEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:6965:1: error: control reaches end of non-void function [-Werror=return-type]
|  6965 | }
|       | ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'CopyImageToMemoryEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:6978:1: error: control reaches end of non-void function [-Werror=return-type]
|  6978 | }
|       | ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'CopyImageToImageEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:6991:1: error: control reaches end of non-void function [-Werror=return-type]
|  6991 | }
|       | ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'TransitionImageLayoutEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:7005:1: error: control reaches end of non-void function [-Werror=return-type]
|  7005 | }
|       | ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c: In function 'GetPipelineIndirectDeviceAddressNV':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/git/loader/generated/vk_loader_extensions.c:8324:1: error: control reaches end of non-void function [-Werror=return-type]
|  8324 | }
|       | ^
| cc1: all warnings being treated as errors
| ninja: build stopped: subcommand failed.
| 
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/temp/run.do_compile.1086737:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/temp/run.do_compile.1086737, line 153
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/temp/run.do_compile.1086737, line 147
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/temp/run.do_compile.1086737, line 142
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/temp/run.do_compile.1086737, line 166
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1726 tasks of which 1711 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-loader-1.3.261.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/temp/run.do_compile.1086737', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.261.1/temp/log.do_compile.1086737
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_compile) failed with exit code '1'

--===============5147232698272720336==--

