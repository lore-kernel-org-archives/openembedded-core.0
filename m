Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68005C5321D
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:16 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.1375.1721071147900558110
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QjSb1DMd;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=v1I6ZIYw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010190b7d59811-7e5dfef4-4f4a-4ec2-88d0-2af26e7b1087-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/fEqC5oBl3s07t063cks0QiOTwp0cMoGdYq4XjS1q9k=;
	b=QjSb1DMdh69uedVXd9ZRTdPInB4NpLuOzCQuJvMAMCpNTaVhxeDnEaDrKtumVKFr
	Zblz+LU3ryrO7CIP0X+0RdhWz2w2g72RL0BM52YLDE6qkDlI1/j9VA51pwFI3Xy6Xin
	cWiG+05Yb+K/0gqIFxKJ4mllEtfbKA7HYW6QyQgI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/fEqC5oBl3s07t063cks0QiOTwp0cMoGdYq4XjS1q9k=;
	b=v1I6ZIYwfHY49Ad9ATsi6MfYzo0ynla2hVbe1aOi7FUXq8VU+I0ce7WRnohd1Hn/
	TlDqq8xJBNspxks6Qy0Pi97/kA9ioAThRCKKcV6HalNb2Z2w4SvgsrUBg6gABSJGIHK
	33XMnmI56O8B6sr6qs1L47smMf8sEBY9ArwnihPc=
Content-Type: multipart/mixed; boundary="===============6234867229623395644=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xmlto: upgrading to 635dcd5bc84a7b67a3a2050a179d96e1d3050b15
 FAILED
Message-ID: <01010190b7d59811-7e5dfef4-4f4a-4ec2-88d0-2af26e7b1087-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202009

--===============6234867229623395644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xmlto* to *635dcd5bc84a7b67a3a2050a179d96e1d3050b15* has Failed(do_compile).

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
From 6344dfde6723a25c7f2f41d11d7aa01fd2f7a675 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 12:10:23 +0000
Subject: [PATCH] xmlto: upgrade to latest revision

---
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index d5a0e69849..ce4aed8240 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRCREV = "6fa6a0e07644f20abf2596f78a60112713e11cbe"
+SRCREV = "635dcd5bc84a7b67a3a2050a179d96e1d3050b15"
 UPSTREAM_CHECK_COMMITS = "1"
 SRC_URI = "git://pagure.io/xmlto.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
-- 
2.44.0


--===============6234867229623395644==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xmlto-upgrade-to-latest-revision.patch"

RnJvbSA2MzQ0ZGZkZTY3MjNhMjVjN2YyZjQxZDExZDdhYTAxZmQyZjdhNjc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTI6MTA6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
bWx0bzogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3htbHRvL3htbHRvXzAuMC4yOC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy94bWx0by94bWx0b18wLjAuMjguYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMveG1sdG8veG1s
dG9fMC4wLjI4LmJiCmluZGV4IGQ1YTBlNjk4NDkuLmNlNGFlZDgyNDAgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy94bWx0by94bWx0b18wLjAuMjguYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3htbHRvL3htbHRvXzAuMC4yOC5iYgpAQCAtNiw3ICs2LDcgQEAgTElDRU5T
RSA9ICJHUEwtMi4wLW9ubHkiCiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PTU5NTMwYmRmMzM2NTliMjllNzNkNGFkYjlmOWY2NTUyIgogCi1TUkNSRVYgPSAiNmZhNmEw
ZTA3NjQ0ZjIwYWJmMjU5NmY3OGE2MDExMjcxM2UxMWNiZSIKK1NSQ1JFViA9ICI2MzVkY2Q1YmM4
NGE3YjY3YTNhMjA1MGExNzlkOTZlMWQzMDUwYjE1IgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9
ICIxIgogU1JDX1VSSSA9ICJnaXQ6Ly9wYWd1cmUuaW8veG1sdG8uZ2l0O3Byb3RvY29sPWh0dHBz
O2JyYW5jaD1tYXN0ZXIiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgotLSAKMi40NC4wCgo=

--===============6234867229623395644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (917 cached, 1 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-649978940db87ff462a89978ca3c5a05e947e92e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:649978940db87ff462a89978ca3c5a05e947e92e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 404 Local 385 Mirrors 0 Missed 19 Current 519 (95% match, 97% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 10 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 831 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 832 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 910 of 923 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 912 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 914 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 915 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1629 of 2597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_fetch)
NOTE: Running task 1744 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1822 of 2597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 1831 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 920 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 921 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_fetch: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2106 of 2597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_fetch: Started
NOTE: Running task 2124 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_fetch: Succeeded
NOTE: Running task 2211 of 2597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_unpack)
NOTE: Running task 2212 of 2597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 923 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: Running task 2364 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_fetch: Succeeded
NOTE: Running task 2444 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_unpack)
NOTE: Running task 2445 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_unpack: Started
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_write_config: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2497 of 2597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_unpack: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_unpack: Started
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_unpack: Succeeded
NOTE: Running task 2543 of 2597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_patch)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2544 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_patch: Succeeded
NOTE: Running task 2545 of 2597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_unpack: Succeeded
NOTE: Running task 2546 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_patch)
NOTE: Running task 2547 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_patch: Started
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_patch: Succeeded
NOTE: Running task 2548 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_deploy_source_date_epoch)
NOTE: Running task 2549 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_populate_lic)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_populate_lic: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2551 of 2597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2552 of 2597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_configure)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_populate_lic unihash changed to 79460b7fc69ff35808a7d26b4e36b9c95519259479dbb3e0a3c64099b8a49777
NOTE: recipe shared-mime-info-native-2.4-r0: task do_patch: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_configure: Started
NOTE: Running task 2553 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_configure)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_patch: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_configure: Started
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_configure: Succeeded
NOTE: Running task 2555 of 2597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_compile)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_compile: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_configure: Succeeded
NOTE: Running task 2556 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_compile)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_compile: Started
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_compile: Succeeded
NOTE: Running task 2557 of 2597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_install)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_install: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_compile: Succeeded
NOTE: Running task 2558 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_install)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_install: Succeeded
NOTE: Running task 2559 of 2597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_populate_sysroot)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_install: Started
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_populate_sysroot: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_install: Succeeded
NOTE: Running task 2560 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package)
NOTE: Running task 2561 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_populate_sysroot)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_populate_sysroot: Started
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2562 of 2597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_populate_sysroot unihash changed to d8731bc1324662ab7ffb83b2b7fccf8e7cde8015a68ddf8bb5714d34be8f48d9
NOTE: recipe shared-mime-info-native-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2563 of 2597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_configure: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package: Succeeded
NOTE: Running task 2564 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_packagedata)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_packagedata: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_packagedata: Succeeded
NOTE: Running task 2565 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_create_spdx)
NOTE: Running task 2566 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_write_ipk)
NOTE: Running task 2567 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_write_deb)
NOTE: Running task 2568 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_write_rpm)
NOTE: Running task 2569 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_qa)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_spdx: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_ipk: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_deb: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_rpm: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_qa: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_spdx: Succeeded
NOTE: Running task 2570 of 2597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_create_runtime_spdx)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_runtime_spdx: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_deb: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_configure: Succeeded
NOTE: Running task 2571 of 2597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_compile: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_compile: Succeeded
NOTE: Running task 2572 of 2597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_install: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_install: Succeeded
NOTE: Running task 2573 of 2597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_qa: Failed
NOTE: recipe shared-mime-info-native-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Tasks Summary: Attempted 2573 tasks of which 2532 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715121000.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715121000.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_qa
Summary: There were 3 ERROR messages, returning a non-zero exit code.
ERROR: xmlto-0.0.28+0.0.29+git-r0 do_package_qa: QA Issue: File /usr/bin/xmlto in package xmlto contains reference to TMPDIR [buildpaths]
ERROR: xmlto-0.0.28+0.0.29+git-r0 do_package_qa: QA Issue: /usr/bin/xmlto contained in package xmlto requires /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/bash, but no providers found in RDEPENDS:xmlto? [file-rdeps]
ERROR: xmlto-0.0.28+0.0.29+git-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xmlto/0.0.28+0.0.29+git/temp/log.do_package_qa.1761216
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_qa) failed with exit code '1'

--===============6234867229623395644==--

