Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D8A9CA9EA0
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:03 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.107893.1682976350886059427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hkuI0Jvt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010187d9352c12-f25ee27c-af8e-45c5-bdd0-dfca5bf72789-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=S5pq+xa4vA5a6qwyCSpbogDBnLaVUWpDQU/5TWvfhlE=;
	b=hkuI0JvtHdQHjQIfqwd//lHdbUIweb5iuREPtO3CitRl2YJrYG5HetHnJa8AUhlo
	gC4CEnp5D20/uLuKkm+2dnC5a+g4P7e1x8+Hb19JhtM715pkVpoBtjmd5hZPtfnm4Ej
	BVWx17lQZlnj0SjITtpnxxpUwGXQTABahBTgjMN0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=S5pq+xa4vA5a6qwyCSpbogDBnLaVUWpDQU/5TWvfhlE=;
	b=gLUntGv3NCnFDv816iTUunUaNjoBdpx5/AyNZ6pmKrTf30RCTJWgDnNSzlk4tS9x
	p+HQfx3/1/Ix4SgqvWhJOc4oEDd4PxisUrhmXAV89/H91tbsh5igfJC1Rh2yveo+n+N
	xqNHdeNITRBtqNXl6Cb1KQizEhIeXRt0FG50rQ30=
Content-Type: multipart/mixed; boundary="===============6464410574207080183=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-devtools: upgrading to 1.22.2 SUCCEEDED
Message-ID: <01010187d9352c12-f25ee27c-af8e-45c5-bdd0-dfca5bf72789-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180696

--===============6464410574207080183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gst-devtools* to *1.22.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.22.0-1.22.2.patch
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
--===============6464410574207080183==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.22.0-1.22.2.patch"

RnJvbSAwNGE2Njk1YWQ2NjA4NDI4ZjU5YjQwMTk5ODY0MTQ5ZGE4NjY2MzUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxOToyODoxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dC1kZXZ0b29sczogdXBncmFkZSAxLjIyLjAgLT4gMS4yMi4yCgotLS0KIC4uLi97Z3N0LWRldnRv
b2xzXzEuMjIuMC5iYiA9PiBnc3QtZGV2dG9vbHNfMS4yMi4yLmJifSAgICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0LWRldnRvb2xzXzEuMjIuMC5iYiA9
PiBnc3QtZGV2dG9vbHNfMS4yMi4yLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yMi4wLmJiIGIvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjIyLjIuYmIKc2ltaWxhcml0
eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdC1kZXZ0b29sc18xLjIyLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yMi4yLmJiCmluZGV4IDNlOWE3ODlkMjQuLjhiMjgy
YmJiN2IgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Qt
ZGV2dG9vbHNfMS4yMi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3QtZGV2dG9vbHNfMS4yMi4yLmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiaHR0
cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtZGV2dG9vbHMvZ3N0LWRldnRv
b2xzLSR7UFZ9CiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50
LXNpZ25hdHVyZS1vbi1tdXNsLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNGQyMWZlZTVjMTVmMjg3N2MwYjFmNmMyZGEwY2RiYTY3Y2U3Y2FhYjJjMTk5YWIy
N2U5MWExMzk0ZDViYTE5NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlYjYyNzI2ZDNlMjdhODc4
MjM2OWEyNGZkNjM2NGE4ODg1ZWQyNDYyYjNiYmRhYjA5MWRmZmM4MTM5ZWUwNmQ4IgogCiBERVBF
TkRTID0gImpzb24tZ2xpYiBnbGliLTIuMCBnbGliLTIuMC1uYXRpdmUgZ3N0cmVhbWVyMS4wIGdz
dHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UiCiBSUkVDT01NRU5EUzoke1BOfSA9ICJnaXQiCi0tIAoy
LjM5LjIKCg==

--===============6464410574207080183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 57 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7bef57733cf2a73c8613ac5741f0a94a5e1baea1"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 46 Local 28 Mirrors 0 Missed 18 Current 484 (60% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 494 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libxft/1_2.3.7-r0/temp/log.do_packagedata_setscene.3153356
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 527 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/harfbuzz/7.1.0-r0/temp/log.do_packagedata_setscene.3153354
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 528 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_package_setscene)
NOTE: Running task 1499 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 1555 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 1659 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_fetch)
NOTE: Running task 1718 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_fetch)
NOTE: Running task 1759 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_write_config)
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_fetch: Started
NOTE: Running task 1788 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: Running task 1789 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.39.2-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_fetch: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_write_config: Started
NOTE: Running task 1790 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_unpack)
NOTE: recipe git-2.39.2-r0: task do_fetch: Succeeded
NOTE: Running task 1791 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_unpack)
NOTE: Running task 1792 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_unpack: Started
NOTE: recipe git-2.39.2-r0: task do_unpack: Started
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_unpack: Succeeded
NOTE: Running task 1793 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_patch)
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1794 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Succeeded
NOTE: Running task 1805 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: recipe gst-devtools-1.22.2-r0: task do_patch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe git-2.39.2-r0: task do_unpack: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_patch: Succeeded
NOTE: Running task 1806 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_patch)
NOTE: Running task 1807 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1808 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_populate_lic)
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1830 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_install)
NOTE: Running task 1832 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata)
NOTE: recipe git-2.39.2-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_lic: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: Running task 1833 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_populate_lic unihash changed to e1bee6ffb19dc2e142fd9a8b577e7460b79da7746796d99b76d5196d535a16d7
NOTE: recipe git-2.39.2-r0: task do_patch: Succeeded
NOTE: Running task 1834 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_deploy_source_date_epoch)
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1835 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1838 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_configure)
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe git-2.39.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 1839 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 1840 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 1841 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1842 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe git-2.39.2-r0: task do_configure: Succeeded
NOTE: Running task 1843 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_compile)
NOTE: recipe git-2.39.2-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 1844 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1845 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 1846 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 1847 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1848 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 1849 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1850 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.22.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1851 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_configure)
NOTE: recipe gst-devtools-1.22.2-r0: task do_configure: Started
NOTE: recipe git-2.39.2-r0: task do_compile: Succeeded
NOTE: Running task 1852 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_install)
NOTE: recipe git-2.39.2-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 1853 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_configure: Succeeded
NOTE: Running task 1854 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_compile: Started
NOTE: recipe git-2.39.2-r0: task do_install: Succeeded
NOTE: Running task 1855 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package)
NOTE: recipe git-2.39.2-r0: task do_package: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_compile: Succeeded
NOTE: Running task 1856 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_install)
NOTE: recipe gst-devtools-1.22.2-r0: task do_install: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_install: Succeeded
NOTE: Running task 1857 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_package)
NOTE: Running task 1858 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_populate_sysroot)
NOTE: recipe git-2.39.2-r0: task do_package: Succeeded
NOTE: Running task 1859 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_packagedata)
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_sysroot: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_package: Started
NOTE: recipe git-2.39.2-r0: task do_packagedata: Started
NOTE: recipe git-2.39.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1860 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package_write_rpm)
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_package: Succeeded
NOTE: Running task 1861 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_packagedata)
NOTE: recipe gst-devtools-1.22.2-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1862 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_package_write_rpm)
NOTE: Running task 1863 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_package_qa)
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_qa: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_qa: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1864 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1864 tasks of which 1816 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-src went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dbg went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-staticdev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-doc went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-locale went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6464410574207080183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7bef57733cf2a73c8613ac5741f0a94a5e1baea1"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 46 Local 28 Mirrors 0 Missed 18 Current 478 (60% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 488 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libxft/1_2.3.7-r0/temp/log.do_packagedata_setscene.3180470
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 521 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package_setscene)
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/harfbuzz/7.1.0-r0/temp/log.do_packagedata_setscene.3180468
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 522 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_package_setscene)
NOTE: Running task 1499 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 1555 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 1653 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_fetch)
NOTE: Running task 1706 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_fetch)
NOTE: Running task 1738 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_write_config)
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: Running task 1766 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: Running task 1767 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.22.2-r0: task do_fetch: Started
NOTE: recipe git-2.39.2-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_fetch: Succeeded
NOTE: Running task 1768 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_unpack)
NOTE: recipe git-2.39.2-r0: task do_fetch: Succeeded
NOTE: Running task 1769 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_unpack)
NOTE: Running task 1770 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_unpack: Started
NOTE: recipe git-2.39.2-r0: task do_unpack: Started
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_unpack: Succeeded
NOTE: Running task 1771 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_patch)
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1772 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Succeeded
NOTE: Running task 1783 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: recipe gst-devtools-1.22.2-r0: task do_patch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_patch: Succeeded
NOTE: Running task 1784 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1785 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_populate_lic)
NOTE: recipe git-2.39.2-r0: task do_unpack: Succeeded
NOTE: Running task 1786 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_patch)
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1808 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_install)
NOTE: Running task 1810 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata)
NOTE: recipe gst-devtools-1.22.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_lic: Started
NOTE: recipe git-2.39.2-r0: task do_patch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: Running task 1811 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_populate_lic unihash changed to e1bee6ffb19dc2e142fd9a8b577e7460b79da7746796d99b76d5196d535a16d7
NOTE: recipe git-2.39.2-r0: task do_patch: Succeeded
NOTE: Running task 1812 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_deploy_source_date_epoch)
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1813 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1816 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_configure)
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe git-2.39.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 1817 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 1818 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 1819 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1820 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe git-2.39.2-r0: task do_configure: Succeeded
NOTE: Running task 1821 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_compile)
NOTE: recipe git-2.39.2-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 1822 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1823 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 1824 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata)
NOTE: Running task 1825 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1826 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 1827 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1828 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1829 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_configure)
NOTE: recipe gst-devtools-1.22.2-r0: task do_configure: Started
NOTE: recipe git-2.39.2-r0: task do_compile: Succeeded
NOTE: Running task 1830 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 1831 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe git-2.39.2-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_configure: Succeeded
NOTE: Running task 1832 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_compile)
NOTE: recipe gst-devtools-1.22.2-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.39.2-r0: task do_install: Succeeded
NOTE: Running task 1833 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package)
NOTE: recipe git-2.39.2-r0: task do_package: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_compile: Succeeded
NOTE: Running task 1834 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_install)
NOTE: recipe gst-devtools-1.22.2-r0: task do_install: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_install: Succeeded
NOTE: Running task 1835 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_package)
NOTE: Running task 1836 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_populate_sysroot)
NOTE: recipe gst-devtools-1.22.2-r0: task do_package: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_sysroot: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.39.2-r0: task do_package: Succeeded
NOTE: Running task 1837 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_packagedata)
NOTE: recipe git-2.39.2-r0: task do_packagedata: Started
NOTE: recipe git-2.39.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1838 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package_write_rpm)
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_package: Succeeded
NOTE: Running task 1839 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_packagedata)
NOTE: recipe gst-devtools-1.22.2-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1840 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_package_write_rpm)
NOTE: Running task 1841 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_package_qa)
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_qa: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_qa: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1842 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1842 tasks of which 1794 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-src went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dbg went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-staticdev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-doc went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-locale went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6464410574207080183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: FILELIST: removed "/usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2200.0 /usr/lib/.debug/libgstvalidate-1.0.so.0.2200.0", added "/usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2202.0 /usr/lib/.debug/libgstvalidate-1.0.so.0.2202.0"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: PKGSIZE changed from 1973216 to 1973972 (+0%)
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dev: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dev: PKGSIZE changed from 394408 to 394908 (+0%)
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dev: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-doc: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-doc: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-locale: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-locale: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-src: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-src: PKGSIZE changed from 907396 to 907753 (+0%)
packages/core2-32-poky-linux/gst-devtools/gst-devtools-src: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-staticdev: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-staticdev: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2200.0 /usr/lib/libgstvalidate-1.0.so.0.2200.0", added "/usr/lib/libgstvalidate-1.0.so.0.2202.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2202.0"
packages/core2-32-poky-linux/gst-devtools/gst-devtools: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools: PKGSIZE changed from 1532762 to 1533700 (+0%)
packages/core2-32-poky-linux/gst-devtools/gst-devtools: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gst-devtools: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.22.0.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch" to "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.22.2.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch"
packages/core2-32-poky-linux/gst-devtools: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gst-devtools: PV changed from "1.22.0" to "1.22.2"
Changes to packages/core2-32-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2200.0 to libgstvalidate-1.0.so.0.2202.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2200.0 to libgstvalidate-default-overrides-1.0.so.0.2202.0
  /usr/lib/libgstvalidate-1.0.so.0.2200.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2202.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2200.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2202.0

--===============6464410574207080183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 51 skipped, 0 masked, 0 errors.
Removing 101 recipes from the core2-32 sysroot...done.
Removing 112 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7bef57733cf2a73c8613ac5741f0a94a5e1baea1"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 349 Local 310 Mirrors 0 Missed 39 Current 186 (88% match, 92% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 189 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 190 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 218 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 219 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 221 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 223 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 224 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 228 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 232 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 239 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 240 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 241 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 761 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_fetch)
NOTE: Running task 831 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 832 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_write_config)
NOTE: Running task 833 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 834 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 838 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_fetch)
NOTE: Running task 839 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 840 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 841 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 842 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 850 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_fetch)
NOTE: Running task 855 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_fetch)
NOTE: Running task 870 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_write_config)
NOTE: Running task 874 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_fetch)
NOTE: Running task 883 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_write_config)
NOTE: Running task 885 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_write_config)
NOTE: recipe curl-8.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 255 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 261 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 263 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 265 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 266 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe orc-0.4.33-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_write_config: Started
NOTE: recipe git-2.39.2-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_fetch: Started
NOTE: Running task 901 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 902 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_unpack)
NOTE: recipe orc-0.4.33-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Started
NOTE: Running task 903 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 904 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 905 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 906 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_unpack)
NOTE: Running task 907 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_write_config: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.39.2-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 908 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: recipe gst-devtools-1.22.2-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 909 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 910 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_unpack)
NOTE: Running task 911 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_unpack)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.33-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_write_config: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe git-2.39.2-r0: task do_unpack: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libxft/1_2.3.7-r0/temp/log.do_packagedata_setscene.3236051
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 270 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/harfbuzz/7.1.0-r0/temp/log.do_packagedata_setscene.3236050
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 271 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_package_setscene)
NOTE: recipe orc-0.4.33-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 275 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 916 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_patch)
NOTE: Running task 921 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: Running task 926 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 928 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_patch)
NOTE: Running task 929 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 930 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 931 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: Running task 932 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 933 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 934 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe git-2.39.2-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 935 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe orc-0.4.33-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: Running task 939 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe git-2.39.2-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_patch: Succeeded
NOTE: Running task 942 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 943 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_populate_lic)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_lic: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe git-2.39.2-r0: task do_patch: Succeeded
NOTE: Running task 951 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_lic: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_populate_lic unihash changed to e1bee6ffb19dc2e142fd9a8b577e7460b79da7746796d99b76d5196d535a16d7
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Started
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Started
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 280 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 282 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 285 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 290 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 296 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 298 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 300 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 304 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 309 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 311 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 314 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 319 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 321 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 329 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 332 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 334 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 335 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 340 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 342 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 344 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 348 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 352 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 354 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 357 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 359 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 366 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 372 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 376 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 385 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 388 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 389 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 396 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 401 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 402 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 406 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 413 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 414 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 418 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 428 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 429 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 434 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 436 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 449 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 453 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 458 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 465 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 475 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 494 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 510 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 512 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 513 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 519 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 520 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 529 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 532 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 533 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1629 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1672 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1707 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1736 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1738 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1739 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1777 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: Running task 1778 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata)
NOTE: Running task 1792 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Started
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1803 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1804 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1807 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1808 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: Running task 1809 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_configure)
NOTE: recipe orc-0.4.33-r0: task do_configure: Started
NOTE: recipe git-2.39.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1810 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure)
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1811 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe orc-0.4.33-r0: task do_configure: Succeeded
NOTE: Running task 1812 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_compile)
NOTE: recipe orc-0.4.33-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 1813 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1814 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe orc-0.4.33-r0: task do_compile: Succeeded
NOTE: Running task 1815 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_install)
NOTE: recipe orc-0.4.33-r0: task do_install: Started
NOTE: recipe git-2.39.2-r0: task do_configure: Succeeded
NOTE: Running task 1816 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_compile)
NOTE: recipe orc-0.4.33-r0: task do_install: Succeeded
NOTE: Running task 1817 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot)
NOTE: Running task 1818 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_package)
NOTE: recipe git-2.39.2-r0: task do_compile: Started
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 1819 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1820 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile)
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Started
NOTE: recipe orc-0.4.33-r0: task do_package: Succeeded
NOTE: Running task 1821 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_packagedata)
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 1822 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1823 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 1824 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1825 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 1826 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1827 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: Running task 1828 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 1829 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1830 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe git-2.39.2-r0: task do_compile: Succeeded
NOTE: Running task 1831 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_install)
NOTE: recipe git-2.39.2-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1832 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1833 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 1834 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1835 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1836 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 1837 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 1838 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1839 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1840 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.39.2-r0: task do_install: Succeeded
NOTE: Running task 1841 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package)
NOTE: recipe git-2.39.2-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1842 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 1843 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 1844 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 1845 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1846 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 1847 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 1848 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1849 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 1850 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 1851 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 1852 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: Running task 1853 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 1854 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: Running task 1855 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 1856 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Succeeded
NOTE: Running task 1857 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_populate_sysroot)
NOTE: Running task 1858 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 1859 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 1860 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1861 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 1862 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1863 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Started
NOTE: recipe git-2.39.2-r0: task do_package: Succeeded
NOTE: Running task 1864 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_packagedata)
NOTE: recipe git-2.39.2-r0: task do_packagedata: Started
NOTE: recipe git-2.39.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1865 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package_write_rpm)
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 1866 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Succeeded
NOTE: Running task 1867 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 1868 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 1869 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Started
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 1870 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 1871 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 1872 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1873 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.22.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1874 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_configure)
NOTE: recipe gst-devtools-1.22.2-r0: task do_configure: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_configure: Succeeded
NOTE: Running task 1875 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_compile)
NOTE: recipe gst-devtools-1.22.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 1876 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_compile: Succeeded
NOTE: Running task 1877 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_install)
NOTE: recipe gst-devtools-1.22.2-r0: task do_install: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_install: Succeeded
NOTE: Running task 1878 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_package)
NOTE: Running task 1879 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_populate_sysroot)
NOTE: recipe gst-devtools-1.22.2-r0: task do_package: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_sysroot: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_package: Succeeded
NOTE: Running task 1880 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_packagedata)
NOTE: recipe gst-devtools-1.22.2-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1881 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_package_write_rpm)
NOTE: Running task 1882 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_package_qa)
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_qa: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_qa: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1883 of 1883 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1883 tasks of which 1753 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-src went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dbg went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-staticdev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-doc went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-locale went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6464410574207080183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 74 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7bef57733cf2a73c8613ac5741f0a94a5e1baea1"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 46 Local 28 Mirrors 0 Missed 18 Current 484 (60% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 494 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libxft/1_2.3.7-r0/temp/log.do_packagedata_setscene.3207656
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 527 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/harfbuzz/7.1.0-r0/temp/log.do_packagedata_setscene.3207654
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_package_setscene)
NOTE: Running task 1499 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 1555 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 1659 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_fetch)
NOTE: Running task 1718 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_fetch)
NOTE: Running task 1759 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_write_config)
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: Running task 1788 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: Running task 1789 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.22.2-r0: task do_fetch: Started
NOTE: recipe git-2.39.2-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_fetch: Succeeded
NOTE: Running task 1790 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_unpack)
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_write_config: Started
NOTE: recipe git-2.39.2-r0: task do_fetch: Succeeded
NOTE: Running task 1791 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_unpack)
NOTE: Running task 1792 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_unpack: Started
NOTE: recipe git-2.39.2-r0: task do_unpack: Started
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_unpack: Succeeded
NOTE: Running task 1793 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_patch)
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1804 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: Running task 1805 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: recipe gst-devtools-1.22.2-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1806 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1807 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_populate_lic)
NOTE: Setscene tasks completed
NOTE: Running task 1829 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_install)
NOTE: recipe git-2.39.2-r0: task do_unpack: Succeeded
NOTE: Running task 1831 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata)
NOTE: Running task 1832 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_patch)
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_lic: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.39.2-r0: task do_patch: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: Running task 1833 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_populate_lic unihash changed to e1bee6ffb19dc2e142fd9a8b577e7460b79da7746796d99b76d5196d535a16d7
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.39.2-r0: task do_patch: Succeeded
NOTE: Running task 1834 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_deploy_source_date_epoch)
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1837 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1838 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_configure)
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe git-2.39.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 1839 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 1840 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 1841 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1842 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe git-2.39.2-r0: task do_configure: Succeeded
NOTE: Running task 1843 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_compile)
NOTE: recipe git-2.39.2-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 1844 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1845 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 1846 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 1847 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1848 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 1849 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1850 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.22.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1851 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_configure)
NOTE: recipe gst-devtools-1.22.2-r0: task do_configure: Started
NOTE: recipe git-2.39.2-r0: task do_compile: Succeeded
NOTE: Running task 1852 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_install)
NOTE: recipe git-2.39.2-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 1853 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_configure: Succeeded
NOTE: Running task 1854 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_compile)
NOTE: recipe gst-devtools-1.22.2-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.39.2-r0: task do_install: Succeeded
NOTE: Running task 1855 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package)
NOTE: recipe git-2.39.2-r0: task do_package: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_compile: Succeeded
NOTE: Running task 1856 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_install)
NOTE: recipe gst-devtools-1.22.2-r0: task do_install: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_install: Succeeded
NOTE: Running task 1857 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_package)
NOTE: Running task 1858 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_populate_sysroot)
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_sysroot: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_package: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.39.2-r0: task do_package: Succeeded
NOTE: Running task 1859 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_packagedata)
NOTE: recipe git-2.39.2-r0: task do_packagedata: Started
NOTE: recipe git-2.39.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1860 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package_write_rpm)
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_package: Succeeded
NOTE: Running task 1861 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_packagedata)
NOTE: recipe gst-devtools-1.22.2-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1862 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_package_write_rpm)
NOTE: Running task 1863 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_package_qa)
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_qa: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_qa: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1864 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1864 tasks of which 1816 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-src went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dbg went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-staticdev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-doc went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-locale went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6464410574207080183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1799 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1799 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7bef57733cf2a73c8613ac5741f0a94a5e1baea1"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 45 Local 27 Mirrors 0 Missed 18 Current 489 (60% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 498 of 534 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 534 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 502 of 534 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 534 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxft/1_2.3.7-r0/temp/log.do_packagedata_setscene.3126182
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 531 of 534 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/harfbuzz/7.1.0-r0/temp/log.do_packagedata_setscene.3126180
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 532 of 534 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_package_setscene)
NOTE: Running task 1499 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 1555 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 1665 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_fetch)
NOTE: Running task 1736 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_fetch)
NOTE: Running task 1777 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_write_config)
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: Running task 1806 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: Running task 1807 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.22.2-r0: task do_fetch: Started
NOTE: recipe git-2.39.2-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_fetch: Succeeded
NOTE: Running task 1808 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_unpack)
NOTE: recipe gst-devtools-1.22.2-r0: task do_write_config: Started
NOTE: recipe git-2.39.2-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: Running task 1809 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_unpack)
NOTE: Running task 1810 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_unpack: Started
NOTE: recipe git-2.39.2-r0: task do_unpack: Started
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_unpack: Succeeded
NOTE: Running task 1811 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_patch)
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1815 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: Running task 1823 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: recipe gst-devtools-1.22.2-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_patch: Succeeded
NOTE: Running task 1824 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1825 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_populate_lic)
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe git-2.39.2-r0: task do_unpack: Succeeded
NOTE: Running task 1847 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_install)
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1848 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_patch)
NOTE: Running task 1850 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata)
NOTE: recipe gst-devtools-1.22.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_lic: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: Running task 1851 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe git-2.39.2-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_populate_lic unihash changed to e1bee6ffb19dc2e142fd9a8b577e7460b79da7746796d99b76d5196d535a16d7
NOTE: recipe gst-devtools-1.22.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.39.2-r0: task do_patch: Succeeded
NOTE: Running task 1852 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_deploy_source_date_epoch)
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1855 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1856 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_configure)
NOTE: recipe git-2.39.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 1857 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 1858 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 1859 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1860 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe git-2.39.2-r0: task do_configure: Succeeded
NOTE: Running task 1861 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_compile)
NOTE: recipe git-2.39.2-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 1862 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1863 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 1864 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1865 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 1866 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: Running task 1867 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1868 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.22.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1869 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_configure)
NOTE: recipe gst-devtools-1.22.2-r0: task do_configure: Started
NOTE: recipe git-2.39.2-r0: task do_compile: Succeeded
NOTE: Running task 1870 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_install)
NOTE: recipe git-2.39.2-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 1871 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_configure: Succeeded
NOTE: Running task 1872 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_compile)
NOTE: recipe gst-devtools-1.22.2-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.39.2-r0: task do_install: Succeeded
NOTE: Running task 1873 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package)
NOTE: recipe git-2.39.2-r0: task do_package: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_compile: Succeeded
NOTE: Running task 1874 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_install)
NOTE: recipe gst-devtools-1.22.2-r0: task do_install: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_install: Succeeded
NOTE: Running task 1875 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_package)
NOTE: Running task 1876 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_populate_sysroot)
NOTE: recipe gst-devtools-1.22.2-r0: task do_package: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_sysroot: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.39.2-r0: task do_package: Succeeded
NOTE: Running task 1877 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_packagedata)
NOTE: recipe git-2.39.2-r0: task do_packagedata: Started
NOTE: recipe git-2.39.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1878 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package_write_rpm)
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_package: Succeeded
NOTE: Running task 1879 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_packagedata)
NOTE: recipe gst-devtools-1.22.2-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1880 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_package_write_rpm)
NOTE: Running task 1881 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_package_qa)
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_qa: Started
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_qa: Succeeded
NOTE: recipe gst-devtools-1.22.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1882 of 1882 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1882 tasks of which 1834 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-src went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dbg went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-staticdev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-doc went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-locale went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:7.2.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6464410574207080183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-1.0.so.0.2200.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2200.0", added "/usr/lib/libgstvalidate-1.0.so.0.2202.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2202.0"
Changes to packages/core2-32-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2200.0 to libgstvalidate-1.0.so.0.2202.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2200.0 to libgstvalidate-default-overrides-1.0.so.0.2202.0
  /usr/lib/libgstvalidate-1.0.so.0.2200.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2202.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2200.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2202.0

--===============6464410574207080183==--

