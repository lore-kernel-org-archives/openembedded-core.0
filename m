Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F64CC0723F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:12 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.8479.1698848703453616908
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XmMt2DgC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FTmZzgs2;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.31, mailfrom: 0101018b8b460b83-8c733eed-a6ca-488e-b53d-9c5c952e5e86-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rZccCuwY1i8CWnCqIWiVGzYRznrA6Kr7c8uaWB0H2rg=;
	b=XmMt2DgC/dtpqBZUseVkTHmk+rtluvwwBdkVh03l1UoCHqu5tVS1av5VazqnGeF3
	nLcSnCe5nV53GPcpAPoZBN3eUowB8NlsL2dwKdBFGQFCwAuTjtAl6/1dxUmCoEFwXMi
	PeKJCZ6AUgwNn1jKXvuMtoarf6E5ndDx9/YtEeNs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rZccCuwY1i8CWnCqIWiVGzYRznrA6Kr7c8uaWB0H2rg=;
	b=FTmZzgs2FB7ENzWH3Wb1r/OuGjumr30q3OpBHAZH4ojmoM76AnKp3G5dBNfszG60
	yLX/e1fcTsrE2+yhCaJwwLvRj40amoVwWUDflvi6wBnzOL3sRa2BL0VcA2ejT+ZdEyQ
	WCVPk0nA5UpjEu3+Lz/5odefurpE90zEM1qmnQkI=
Content-Type: multipart/mixed; boundary="===============2357977550056915283=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 8.2.2 SUCCEEDED
Message-ID: <0101018b8b460b83-8c733eed-a6ca-488e-b53d-9c5c952e5e86-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190015

--===============2357977550056915283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *harfbuzz* to *8.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-8.2.1-8.2.2.patch
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
From f407f7f22b0a6ac732534361a7bcbb80a1865582 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 12:24:00 +0000
Subject: [PATCH] harfbuzz: upgrade 8.2.1 -> 8.2.2

---
 .../harfbuzz/{harfbuzz_8.2.1.bb => harfbuzz_8.2.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_8.2.1.bb => harfbuzz_8.2.2.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb
index df41af29f9..ce1a6bed65 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "0fec78f98c9c8faf228957a201c8846f809452c20f8445eb092a1ba6f22dbea5"
+SRC_URI[sha256sum] = "e433ad85fbdf57f680be29479b3f964577379aaf319f557eb76569f0ecbc90f3"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.39.2


--===============2357977550056915283==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-8.2.1-8.2.2.patch"

RnJvbSBmNDA3ZjdmMjJiMGE2YWM3MzI1MzQzNjFhN2JjYmI4MGExODY1NTgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMjoyNDowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGhh
cmZidXp6OiB1cGdyYWRlIDguMi4xIC0+IDguMi4yCgotLS0KIC4uLi9oYXJmYnV6ei97aGFyZmJ1
enpfOC4yLjEuYmIgPT4gaGFyZmJ1enpfOC4yLjIuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy9oYXJmYnV6ei97aGFyZmJ1enpfOC4yLjEuYmIgPT4gaGFyZmJ1enpfOC4y
LjIuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6
L2hhcmZidXp6XzguMi4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZi
dXp6XzguMi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el84LjIuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6XzguMi4yLmJiCmluZGV4IGRmNDFhZjI5Zjku
LmNlMWE2YmVkNjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9o
YXJmYnV6el84LjIuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFy
ZmJ1enpfOC4yLjIuYmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0NPUFlJTkc7bWQ1PWI5ODQyOWI4ZThlM2MyYTY3Y2ZlZjAxZTk5ZTQ4OTNkIFwKICAgICAgICAg
ICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8k
e1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBmZWM3OGY5
OGM5YzhmYWYyMjg5NTdhMjAxYzg4NDZmODA5NDUyYzIwZjg0NDVlYjA5MmExYmE2ZjIyZGJlYTUi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTQzM2FkODVmYmRmNTdmNjgwYmUyOTQ3OWIzZjk2NDU3
NzM3OWFhZjMxOWY1NTdlYjc2NTY5ZjBlY2JjOTBmMyIKIAogREVQRU5EUyArPSAiZ2xpYi0yLjAt
bmF0aXZlIgogCi0tIAoyLjM5LjIKCg==

--===============2357977550056915283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-icu.so.0.60821.0 /usr/lib/.debug/libharfbuzz.so.0.60821.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.60821.0 /usr/lib/.debug/libharfbuzz-subset.so.0.60821.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.60821.0", added "/usr/lib/.debug/libharfbuzz.so.0.60822.0 /usr/lib/.debug/libharfbuzz-icu.so.0.60822.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.60822.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.60822.0 /usr/lib/.debug/libharfbuzz-subset.so.0.60822.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 61437176 to 62893456 (+2%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1716216 to 1715666 (-0%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.60821.0", added "/usr/lib/libharfbuzz-icu.so.0.60822.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 4735770 to 4769996 (+1%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.60821.0", added "/usr/lib/libharfbuzz-subset.so.0.60822.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 1267951 to 1317103 (+4%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.60821.0 /usr/lib/libharfbuzz-cairo.so.0.60821.0 /usr/lib/libharfbuzz.so.0.60821.0", added "/usr/lib/libharfbuzz-gobject.so.0.60822.0 /usr/lib/libharfbuzz-cairo.so.0.60822.0 /usr/lib/libharfbuzz.so.0.60822.0"
packages/core2-64-poky-linux/harfbuzz: PKGV changed from 8.2.1 [default] to 8.2.2 [default]
packages/core2-64-poky-linux/harfbuzz: PV changed from "8.2.1" to "8.2.2"
packages/core2-64-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/8.2.1/harfbuzz-8.2.1.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/8.2.2/harfbuzz-8.2.2.tar.xz"
Changes to packages/core2-64-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.60821.0 to libharfbuzz-cairo.so.0.60822.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.60821.0 to libharfbuzz-gobject.so.0.60822.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.60821.0 to libharfbuzz-icu.so.0.60822.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.60821.0 to libharfbuzz.so.0.60822.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.60821.0 to libharfbuzz-subset.so.0.60822.0
  /usr/lib/libharfbuzz-cairo.so.0.60821.0 moved to /usr/lib/libharfbuzz-cairo.so.0.60822.0
  /usr/lib/libharfbuzz-gobject.so.0.60821.0 moved to /usr/lib/libharfbuzz-gobject.so.0.60822.0
  /usr/lib/libharfbuzz-icu.so.0.60821.0 moved to /usr/lib/libharfbuzz-icu.so.0.60822.0
  /usr/lib/libharfbuzz.so.0.60821.0 moved to /usr/lib/libharfbuzz.so.0.60822.0
  /usr/lib/libharfbuzz-subset.so.0.60821.0 moved to /usr/lib/libharfbuzz-subset.so.0.60822.0

--===============2357977550056915283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1843 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-fe0b2580c7a7a527d49e805657109059d650867d"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fe0b2580c7a7a527d49e805657109059d650867d"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 61 Local 51 Mirrors 0 Missed 10 Current 680 (83% match, 98% complete)
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 690 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libdrm/2.4.116/temp/log.do_packagedata_setscene.1995575
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 739 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_package_setscene)
NOTE: Running task 1825 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_recipe_qa)
NOTE: Running task 1898 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_write_config)
NOTE: recipe harfbuzz-8.2.2-r0: task do_recipe_qa: Started
NOTE: recipe harfbuzz-8.2.2-r0: task do_write_config: Started
NOTE: recipe harfbuzz-8.2.2-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-8.2.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1985 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_fetch)
NOTE: recipe libdrm-2.4.116-r0: task do_package_setscene: Started
NOTE: recipe harfbuzz-8.2.2-r0: task do_fetch: Started
NOTE: recipe harfbuzz-8.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1986 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_unpack)
NOTE: recipe harfbuzz-8.2.2-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.116-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 741 of 741 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2008 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_packagedata)
NOTE: Running task 2010 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-8.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-8.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-8.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2021 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_patch)
NOTE: Running task 2022 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_collect_spdx_deps)
NOTE: recipe harfbuzz-8.2.2-r0: task do_patch: Started
NOTE: recipe harfbuzz-8.2.2-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-8.2.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2023 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2024 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_populate_lic)
NOTE: recipe harfbuzz-8.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-8.2.2-r0: task do_populate_lic: Started
NOTE: recipe harfbuzz-8.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe harfbuzz-8.2.2-r0: task do_populate_lic: Succeeded
NOTE: recipe harfbuzz-8.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2025 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_configure)
NOTE: recipe harfbuzz-8.2.2-r0: task do_configure: Started
NOTE: recipe harfbuzz-8.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2026 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_compile)
NOTE: recipe harfbuzz-8.2.2-r0: task do_compile: Started
NOTE: recipe harfbuzz-8.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2027 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_install)
NOTE: recipe harfbuzz-8.2.2-r0: task do_install: Started
NOTE: recipe harfbuzz-8.2.2-r0: task do_install: Succeeded
NOTE: Running task 2028 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_package)
NOTE: Running task 2029 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-8.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-8.2.2-r0: task do_package: Started
NOTE: recipe harfbuzz-8.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-8.2.2-r0: task do_package: Succeeded
NOTE: Running task 2030 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_packagedata)
NOTE: recipe harfbuzz-8.2.2-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-8.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2031 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_create_spdx)
NOTE: Running task 2032 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_package_write_rpm)
NOTE: Running task 2033 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_package_qa)
NOTE: recipe harfbuzz-8.2.2-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-8.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-8.2.2-r0: task do_package_qa: Started
NOTE: recipe harfbuzz-8.2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2034 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_create_runtime_spdx)
NOTE: recipe harfbuzz-8.2.2-r0: task do_create_runtime_spdx: Started
NOTE: recipe harfbuzz-8.2.2-r0: task do_package_qa: Succeeded
NOTE: recipe harfbuzz-8.2.2-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe harfbuzz-8.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2035 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2035 tasks of which 2014 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 18 ERROR messages, returning a non-zero exit code.
ERROR: libdrm-2.4.116-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.117-r0 to 0:2.4.116-r0) [version-going-backwards]
ERROR: libdrm-2.4.116-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.117-r0 to 0:2.4.116-r0) [version-going-backwards]
ERROR: libdrm-2.4.116-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.117-r0 to 0:2.4.116-r0) [version-going-backwards]
ERROR: libdrm-2.4.116-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.117-r0 to 0:2.4.116-r0) [version-going-backwards]
ERROR: libdrm-2.4.116-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.117-r0 to 0:2.4.116-r0) [version-going-backwards]
ERROR: libdrm-2.4.116-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.117-r0 to 0:2.4.116-r0) [version-going-backwards]
ERROR: libdrm-2.4.116-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.117-r0 to 0:2.4.116-r0) [version-going-backwards]
ERROR: libdrm-2.4.116-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.117-r0 to 0:2.4.116-r0) [version-going-backwards]
ERROR: libdrm-2.4.116-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.117-r0 to 0:2.4.116-r0) [version-going-backwards]
ERROR: libdrm-2.4.116-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.117-r0 to 0:2.4.116-r0) [version-going-backwards]
ERROR: libdrm-2.4.116-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.117-r0 to 0:2.4.116-r0) [version-going-backwards]
ERROR: libdrm-2.4.116-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.117-r0 to 0:2.4.116-r0) [version-going-backwards]
ERROR: libdrm-2.4.116-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.117-r0 to 0:2.4.116-r0) [version-going-backwards]
ERROR: libdrm-2.4.116-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.117-r0 to 0:2.4.116-r0) [version-going-backwards]
ERROR: libdrm-2.4.116-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.117-r0 to 0:2.4.116-r0) [version-going-backwards]
ERROR: libdrm-2.4.116-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.117-r0 to 0:2.4.116-r0) [version-going-backwards]
ERROR: libdrm-2.4.116-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.117-r0 to 0:2.4.116-r0) [version-going-backwards]
ERROR: libdrm-2.4.116-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2357977550056915283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.60821.0", added "/usr/lib/libharfbuzz-icu.so.0.60822.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.60821.0", added "/usr/lib/libharfbuzz-subset.so.0.60822.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.60821.0 /usr/lib/libharfbuzz-cairo.so.0.60821.0 /usr/lib/libharfbuzz-gobject.so.0.60821.0", added "/usr/lib/libharfbuzz.so.0.60822.0 /usr/lib/libharfbuzz-gobject.so.0.60822.0 /usr/lib/libharfbuzz-cairo.so.0.60822.0"
Changes to packages/core2-64-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.60821.0 to libharfbuzz-cairo.so.0.60822.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.60821.0 to libharfbuzz-gobject.so.0.60822.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.60821.0 to libharfbuzz-icu.so.0.60822.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.60821.0 to libharfbuzz.so.0.60822.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.60821.0 to libharfbuzz-subset.so.0.60822.0
  /usr/lib/libharfbuzz-cairo.so.0.60821.0 moved to /usr/lib/libharfbuzz-cairo.so.0.60822.0
  /usr/lib/libharfbuzz-gobject.so.0.60821.0 moved to /usr/lib/libharfbuzz-gobject.so.0.60822.0
  /usr/lib/libharfbuzz-icu.so.0.60821.0 moved to /usr/lib/libharfbuzz-icu.so.0.60822.0
  /usr/lib/libharfbuzz.so.0.60821.0 moved to /usr/lib/libharfbuzz.so.0.60822.0
  /usr/lib/libharfbuzz-subset.so.0.60821.0 moved to /usr/lib/libharfbuzz-subset.so.0.60822.0

--===============2357977550056915283==--

