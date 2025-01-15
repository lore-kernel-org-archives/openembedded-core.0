Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B133C021B3
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:32 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.17882.1736936780809362370
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Iy+wvYWw;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=sssj6+WM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010194697ff168-65d1fbbd-345a-4fe0-9ffd-194d0c7fede2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936780;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wal8yUGdfeHKN26rAOv1qjqXJZvz1jKScJ+8Oel7m/g=;
	b=Iy+wvYWwuYrn/25Yap3EfiYdnyrtcWZlb+8os51Yk/oqPiD5wUMh07ulQf5QEe3S
	ln0yYHiIlIvKhB4/oMtBanlrhS6q1wtDSP/3MdA8kY06yijbLgwug3urTixEmU8IXj9
	u3aR5o6/lWvSQEOWcHEEvfh5y9l4GE8aOyxp8mrE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936780;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wal8yUGdfeHKN26rAOv1qjqXJZvz1jKScJ+8Oel7m/g=;
	b=sssj6+WMkxPmtwUC/HqfSRpGLbgrF4gSs1MCi+uYHauaRlflWJHUjEFOdTsS455i
	56voJz7CBRierY6zqLRMfqg4JcmOxxxjU2ldGOFoZZ7nfohIc9y5C2uWMU7MTTT+fet
	NSG1/XjZa1lNfy3JlnUZD+uFi4UlocqFUTGtSapw=
Content-Type: multipart/mixed; boundary="===============6022795087273133038=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-volk: upgrading to 1.4.304.0 SUCCEEDED
Message-ID: <01010194697ff168-65d1fbbd-345a-4fe0-9ffd-194d0c7fede2-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209879

--===============6022795087273133038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-volk* to *1.4.304.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-volk-upgrade-1.3.296.0-1.4.304.0.patch
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
From a5606f5ceb31d18fe550c4218740e158d3a15ce8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 09:47:15 +0000
Subject: [PATCH] vulkan-volk: upgrade 1.3.296.0 -> 1.4.304.0

---
 .../{vulkan-volk_1.3.296.0.bb => vulkan-volk_1.4.304.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.3.296.0.bb => vulkan-volk_1.4.304.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb
index bed4293490..f5e3b5b755 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=12e6af3a0e2a5e5dbf7796aa82b64626"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
-SRCREV = "59d26900f53c7621a8ba8ab0e3f18d3bd883fa9a"
+SRCREV = "0b17a763ba5643e32da1b2152f8140461b3b7345"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============6022795087273133038==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-volk-upgrade-1.3.296.0-1.4.304.0.patch"

RnJvbSBhNTYwNmY1Y2ViMzFkMThmZTU1MGM0MjE4NzQwZTE1OGQzYTE1Y2U4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDk6NDc6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdm9sazogdXBncmFkZSAxLjMuMjk2LjAgLT4gMS40LjMwNC4wCgotLS0KIC4uLi97dnVs
a2FuLXZvbGtfMS4zLjI5Ni4wLmJiID0+IHZ1bGthbi12b2xrXzEuNC4zMDQuMC5iYn0gICAgICB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi12b2xrXzEuMy4yOTYuMC5i
YiA9PiB2dWxrYW4tdm9sa18xLjQuMzA0LjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdm9sa18xLjMuMjk2LjAuYmIgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEuNC4zMDQuMC5iYgpzaW1pbGFyaXR5
IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGth
bi12b2xrXzEuMy4yOTYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tdm9sa18xLjQuMzA0LjAuYmIKaW5kZXggYmVkNDI5MzQ5MC4uZjVlM2I1Yjc1NSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdm9sa18xLjMu
Mjk2LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdm9sa18x
LjQuMzA0LjAuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT0xMmU2YWYzYTBlMmE1ZTVkYmY3Nzk2YWE4
MmI2NDYyNiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3pldXgvdm9say5naXQ7YnJh
bmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyIKLVNSQ1JFViA9ICI1OWQyNjkwMGY1M2M3NjIxYThi
YThhYjBlM2YxOGQzYmQ4ODNmYTlhIgorU1JDUkVWID0gIjBiMTdhNzYzYmE1NjQzZTMyZGExYjIx
NTJmODE0MDQ2MWIzYjczNDUiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuNDQuMQoK

--===============6022795087273133038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-volk: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/vulkan-volk: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dbg: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dbg: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PKGSIZE changed from 396738 to 410684 (+4%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-doc: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-doc: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-locale: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-locale: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PKGSIZE changed from 388624 to 402570 (+4%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGSIZE changed from 672328 to 672344 (+0%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk: PV changed from "1.3.296.0" to "1.4.304.0"

--===============6022795087273133038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (0 cached, 919 parsed). 1875 targets, 52 skipped, 0 masked, 0 errors.
Removing 50 recipes from the core2-64 sysroot...done.
Removing 50 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f8514b1d26893358db2d245e22591c0c2838ba4e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 130 Local 119 Mirrors 0 Missed 11 Current 187 (91% match, 96% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 254 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 257 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 773 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_recipe_qa)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 263 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 264 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/vulkan-headers/1.3.296.0/temp/log.do_packagedata_setscene.2566249
NOTE: Running setscene task 267 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 268 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_package_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 272 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: Running task 774 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_fetch: Succeeded
NOTE: Running task 793 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_unpack)
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_unpack: Succeeded
NOTE: Running task 794 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_patch)
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 277 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 278 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_patch: Succeeded
NOTE: Running task 795 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 796 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 283 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 285 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 287 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 289 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 292 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 294 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 299 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 304 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 305 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 307 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 309 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 311 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 314 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 316 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 919 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_packagedata)
NOTE: Running task 920 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata: Succeeded
NOTE: Running task 934 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 935 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_configure)
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_configure: Started
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_configure: Succeeded
NOTE: Running task 936 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_compile)
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_compile: Started
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_compile: Succeeded
NOTE: Running task 937 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_install)
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_install: Started
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_install: Succeeded
NOTE: Running task 938 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_package)
NOTE: Running task 939 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_populate_sysroot)
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_package: Started
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_package: Succeeded
NOTE: Running task 940 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_packagedata)
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_packagedata: Succeeded
NOTE: Running task 941 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_create_spdx)
NOTE: Running task 942 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_package_write_ipk)
NOTE: Running task 943 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_package_write_deb)
NOTE: Running task 944 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_package_write_rpm)
NOTE: Running task 945 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_package_qa)
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_create_spdx: Started
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_package_write_ipk: Started
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_package_write_deb: Started
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_package_qa: Started
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 946 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_create_package_spdx)
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_create_package_spdx: Started
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_package_qa: Succeeded
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe vulkan-volk-1.4.304.0-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 947 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.0.bb:do_build)
NOTE: Tasks Summary: Attempted 947 tasks of which 925 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.4.304.0-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.4.304.0-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.4.304.0-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.4.304.0-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.4.304.0-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.4.304.0-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.4.304.0-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6022795087273133038==--

