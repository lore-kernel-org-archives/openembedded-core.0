Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22677C54ECC
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:06 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.131422.1723748334066222808
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=XguLP87I;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=a0Cq3xnN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019157683c48-fe8135eb-d382-42b2-ad85-4b200af0b519-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ne0j+ECwXvpZppzb/WdFoLBuH+C6ORBiYy9EmxdNe3E=;
	b=XguLP87I1gPhmSTNGEecFTAwE4NA32lTCzpSM5ci4C5Cnsccj8TBQIYSjT2EakYq
	wl2FG8g+h1/Vc4ywhdTY0r/JIyR9y++8Z+RlvQxf6ZRyhl7FV4vPdO3g33LnB1u3tyw
	PCMkGCwZiFRP0VpWwbJ29D7a8l76baif8DUHPjLs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ne0j+ECwXvpZppzb/WdFoLBuH+C6ORBiYy9EmxdNe3E=;
	b=a0Cq3xnNBBjiKLe8n6ekdwyEiwccQWthgyte4/fIKiq/5TjINsBuB6gv47+NV/K5
	LS2xn/jD4loc9DHnwEdmYIwpjhwMUlmuCi2K1G/Ws2n7nhmfgBRxTpggAcFYebzpwBQ
	WBcJjglyueS3vIa2OJ17nwoMCBXfNsWol4QxNduw=
Content-Type: multipart/mixed; boundary="===============5763564051781362755=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xmlto: upgrading to 74862a684907ada3d4ed2ce0f8111adf626e1456
 FAILED
Message-ID: <0101019157683c48-fe8135eb-d382-42b2-ad85-4b200af0b519-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203420

--===============5763564051781362755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xmlto* to *74862a684907ada3d4ed2ce0f8111adf626e1456* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-xmlto-upgrade-to-latest-revision.patch
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
From 6cfebdb4ca84e1f2105dc89b9134173c78623c3b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 13:05:06 +0000
Subject: [PATCH] xmlto: upgrade to latest revision

---
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index d5a0e69849..d91d2899c7 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRCREV = "6fa6a0e07644f20abf2596f78a60112713e11cbe"
+SRCREV = "74862a684907ada3d4ed2ce0f8111adf626e1456"
 UPSTREAM_CHECK_COMMITS = "1"
 SRC_URI = "git://pagure.io/xmlto.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
-- 
2.44.0


--===============5763564051781362755==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xmlto-upgrade-to-latest-revision.patch"

RnJvbSA2Y2ZlYmRiNGNhODRlMWYyMTA1ZGM4OWI5MTM0MTczYzc4NjIzYzNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTM6MDU6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
bWx0bzogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3htbHRvL3htbHRvXzAuMC4yOC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy94bWx0by94bWx0b18wLjAuMjguYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMveG1sdG8veG1s
dG9fMC4wLjI4LmJiCmluZGV4IGQ1YTBlNjk4NDkuLmQ5MWQyODk5YzcgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy94bWx0by94bWx0b18wLjAuMjguYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3htbHRvL3htbHRvXzAuMC4yOC5iYgpAQCAtNiw3ICs2LDcgQEAgTElDRU5T
RSA9ICJHUEwtMi4wLW9ubHkiCiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PTU5NTMwYmRmMzM2NTliMjllNzNkNGFkYjlmOWY2NTUyIgogCi1TUkNSRVYgPSAiNmZhNmEw
ZTA3NjQ0ZjIwYWJmMjU5NmY3OGE2MDExMjcxM2UxMWNiZSIKK1NSQ1JFViA9ICI3NDg2MmE2ODQ5
MDdhZGEzZDRlZDJjZTBmODExMWFkZjYyNmUxNDU2IgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9
ICIxIgogU1JDX1VSSSA9ICJnaXQ6Ly9wYWd1cmUuaW8veG1sdG8uZ2l0O3Byb3RvY29sPWh0dHBz
O2JyYW5jaD1tYXN0ZXIiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgotLSAKMi40NC4wCgo=

--===============5763564051781362755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-090ed2b7f1f2ab51bb88f07a0895f21e560da3e7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:090ed2b7f1f2ab51bb88f07a0895f21e560da3e7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 400 Local 384 Mirrors 0 Missed 16 Current 526 (96% match, 98% complete)
Removing 1 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 9 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 610 of 926 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 835 of 926 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 836 of 926 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 910 of 926 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 912 of 926 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 913 of 926 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 926 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 916 of 926 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1633 of 2607 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1734 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_fetch)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 920 of 926 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 922 of 926 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 923 of 926 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: Running task 1846 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_fetch: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: Running task 2130 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_fetch: Succeeded
NOTE: Running task 2174 of 2607 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_unpack)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2175 of 2607 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 925 of 926 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2385 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_unpack: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_fetch: Succeeded
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2416 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_unpack)
NOTE: Running task 2417 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_unpack: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_unpack: Succeeded
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2555 of 2607 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_patch)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_patch: Started
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_patch: Succeeded
NOTE: Running task 2557 of 2607 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2558 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_unpack: Succeeded
NOTE: Running task 2559 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_patch)
NOTE: Running task 2560 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_collect_spdx_deps)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_configure: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_patch: Succeeded
NOTE: Running task 2562 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_configure)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_configure: Succeeded
NOTE: Running task 2565 of 2607 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_compile)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_compile: Started
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_compile: Succeeded
NOTE: Running task 2566 of 2607 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_install)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_configure: Succeeded
NOTE: Running task 2567 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_compile)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_install: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_compile: Started
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_install: Succeeded
NOTE: Running task 2568 of 2607 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_populate_sysroot)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_populate_sysroot: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_compile: Succeeded
NOTE: Running task 2569 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_install)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2570 of 2607 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_install: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_install: Succeeded
NOTE: Running task 2571 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package)
NOTE: Running task 2572 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_populate_sysroot)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2573 of 2607 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_populate_sysroot unihash changed to 7081b65dafc4c9ba943f91e980b8804bfffc7d56d997474cf8970b483ae3cd84
NOTE: Setscene tasks completed
NOTE: recipe shared-mime-info-native-2.4-r0: task do_configure: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package: Succeeded
NOTE: Running task 2574 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_packagedata)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_packagedata: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_packagedata: Succeeded
NOTE: Running task 2575 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_create_spdx)
NOTE: Running task 2576 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_write_ipk)
NOTE: Running task 2577 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_write_deb)
NOTE: Running task 2578 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_write_rpm)
NOTE: Running task 2579 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_qa)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_spdx: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_ipk: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_deb: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_rpm: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_qa: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_spdx: Succeeded
NOTE: Running task 2580 of 2607 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_create_package_spdx)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_package_spdx: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_deb: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_configure: Succeeded
NOTE: Running task 2581 of 2607 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_package_spdx: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_compile: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_compile: Succeeded
NOTE: Running task 2582 of 2607 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_install: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_install: Succeeded
NOTE: Running task 2583 of 2607 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_qa: Failed
NOTE: recipe shared-mime-info-native-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Tasks Summary: Attempted 2583 tasks of which 2549 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815130442.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815130442.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_qa
Summary: There were 3 ERROR messages, returning a non-zero exit code.
ERROR: xmlto-0.0.28+0.0.29+git-r0 do_package_qa: QA Issue: File /usr/bin/xmlto in package xmlto contains reference to TMPDIR [buildpaths]
ERROR: xmlto-0.0.28+0.0.29+git-r0 do_package_qa: QA Issue: /usr/bin/xmlto contained in package xmlto requires /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/bash, but no providers found in RDEPENDS:xmlto? [file-rdeps]
ERROR: xmlto-0.0.28+0.0.29+git-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xmlto/0.0.28+0.0.29+git/temp/log.do_package_qa.2310935
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_qa) failed with exit code '1'

--===============5763564051781362755==--

