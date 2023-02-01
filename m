Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2677C6379F
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:23 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.30350.1675272853813908292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Nz8RHuC0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101860e0b377a-f3c9e56f-d688-4b1e-b0e8-e82950322d15-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272862;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=m2cPjjcTeW5GowvjFE3o68DjHeHnISELCcBaaEkZcq4=;
	b=Nz8RHuC00TomzzeVJ9AmMfzBLGW6bkbIMOu7fCAW8Qi/kLxe8OZ6tnn9T1PreJl4
	qscKacVpaax6RQsetL7u8Ktia7tVHH6Qlaq3fkijyY/jgrsEJt6gxmTkVDNuC1HHoMj
	NsWoip/T/Sz4ZGVdEBkUJNEY++FEtojtGXucHdVo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272862;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=m2cPjjcTeW5GowvjFE3o68DjHeHnISELCcBaaEkZcq4=;
	b=kwmygrEFR5/MPhETciaWOkvc4ZggbRPYbi0TmxcI5wV1KT1sgGD4I34qsWHVWc99
	N72V+tiawf6ew8LAE5xv0gzdwIxTrJak5iZqntc8wc2UmFVya0BOlkHV2Num6C9i0Mb
	Ur7S9cUlW/JZ9K0b2Nmj0sm68xz0Rm4Jg8mxCwM0=
Content-Type: multipart/mixed; boundary="===============6200085363242731184=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 234 SUCCEEDED
Message-ID: <010101860e0b377a-f3c9e56f-d688-4b1e-b0e8-e82950322d15-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176655

--===============6200085363242731184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *234* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-230-234.patch
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
--===============6200085363242731184==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-230-234.patch"

RnJvbSBmNDQ1NDExOTdmZGE2NmRjMzE3ZmJmZGE5MTBjM2Q4NTNhYjdkZDhkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNzoyMDoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjMwIC0+IDIzNAoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yMzAuYmIgPT4gZGlmZm9zY29wZV8yMzQuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzIzMC5iYiA9PiBkaWZmb3Njb3BlXzIz
NC5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjMwLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzIzNC5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjMwLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjM0LmJiCmluZGV4IDQ5NmVkOWU2
MDIuLjk5NGQzZTk0MjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yMzAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzIzNC5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJhMzU5MDhjMTViYjAwNjA1OGY3NGMyZDRmMmJlM2IxYWM3Y2Y2MmM4NzJjZmJkMjk1MDEx
NGE4YTcwNWQ4MTA4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjYwOTFkNTU1YmM4OGNlY2EyODVk
YzQwZTYzZGY1NmI1NzM4NWFhMGRjNTUyZGFhNzBiZGU4MWU4YTY5ZjhjN2EiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJiaW51dGlscyB2aW0gc3F1YXNoZnMtdG9vbHMgcHl0aG9uMy1saWJhcmNoaXZl
LWMgcHl0aG9uMy1tYWdpYyBweXRob24zLXJwbSIKIAotLSAKMi4zNy4zCgo=

--===============6200085363242731184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 75 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f56f4c6741438b2c2b7041ffed69c07d5ca1192e"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 120 Local 10 Mirrors 0 Missed 110 Current 608 (8% match, 84% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 665 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1452 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_compile)
NOTE: Running task 1541 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_compile)
NOTE: Running task 1671 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_compile)
NOTE: Running task 1696 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Started
NOTE: Running task 1736 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_populate_sysroot)
NOTE: recipe fontconfig-2.14.1-r0: task do_compile: Started
NOTE: Running task 1761 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_install)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1762 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_install)
NOTE: Running task 1838 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 1839 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 1944 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_install)
NOTE: Running task 1978 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: Running task 2028 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 2029 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Started
NOTE: Running task 2031 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2039 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Started
NOTE: Running task 2072 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_fetch)
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2083 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2084 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2085 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 2086 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Started
NOTE: Running task 2110 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: Running task 2111 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2112 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2113 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe diffoscope-234-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe diffoscope-234-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2114 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_package: Started
NOTE: Running task 2115 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 2116 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2117 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2118 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 2122 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_unpack)
NOTE: Running task 2123 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2124 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2125 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: Running task 2126 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 2127 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2128 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Started
NOTE: Running task 2177 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 2178 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: Running task 2179 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2182 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: Running task 2189 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: Running task 2193 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe diffoscope-234-r0: task do_unpack: Started
NOTE: Running task 2199 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.0.1211-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2297 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2298 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2299 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2300 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2301 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: Running task 2302 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-234-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-234-r0: task do_unpack: Succeeded
NOTE: Running task 2303 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot)
NOTE: recipe vim-9.0.1211-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2304 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Succeeded
NOTE: Running task 2305 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: Running task 2306 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_package)
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 2307 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 2308 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 2309 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_patch)
NOTE: Running task 2310 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2311 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: Running task 2312 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: Running task 2313 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 2314 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 2315 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: Running task 2327 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe diffoscope-234-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe vim-9.0.1211-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2328 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot)
NOTE: Running task 2329 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot)
NOTE: recipe icu-72-1-r0: task do_packagedata: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2330 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_package)
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2331 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: Running task 2332 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_package)
NOTE: Running task 2333 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: Running task 2334 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_install)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2335 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2336 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2337 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Started
NOTE: Running task 2338 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-234-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-234-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: Running task 2339 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 2340 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_deploy_source_date_epoch)
NOTE: Running task 2341 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_populate_lic)
NOTE: Running task 2342 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-234-r0: task do_populate_lic: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-234-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2343 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2344 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: Running task 2345 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2346 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: Running task 2347 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-234-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_populate_lic unihash changed to 1da21f0f1d08bdf46242684cc0dabe0fcd7c891fd82c9b731c25749777ea9399
NOTE: Running task 2348 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2349 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2350 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-234-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2351 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2352 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: Running task 2353 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 2354 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: Running task 2355 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: Running task 2356 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe diffoscope-234-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2357 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-234-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2358 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: Running task 2359 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_compile)
NOTE: Running task 2360 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2361 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe diffoscope-234-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Started
NOTE: Running task 2362 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot)
NOTE: Running task 2363 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2364 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Started
NOTE: recipe vim-9.0.1211-r0: task do_unpack: Succeeded
NOTE: Running task 2365 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_configure: Started
NOTE: recipe vim-9.0.1211-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2366 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2367 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe vim-9.0.1211-r0: task do_patch: Succeeded
NOTE: Running task 2368 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1211-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.1211-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2369 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2370 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata)
NOTE: Running task 2371 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata)
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Succeeded
NOTE: Running task 2372 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2373 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2374 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2375 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe diffoscope-234-r0: task do_compile: Succeeded
NOTE: Running task 2376 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: recipe diffoscope-234-r0: task do_install: Started
NOTE: Running task 2377 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe libdrm-2.4.114-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2378 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 2379 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2380 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_packagedata)
NOTE: Running task 2381 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 2382 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2383 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2384 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe diffoscope-234-r0: task do_install: Succeeded
NOTE: Running task 2386 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_package)
NOTE: Running task 2387 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_populate_sysroot)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-234-r0: task do_populate_sysroot: Started
NOTE: Running task 2388 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe diffoscope-234-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_compile: Succeeded
NOTE: Running task 2389 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_install)
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: Running task 2390 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: Running task 2391 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: Running task 2392 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe fontconfig-2.14.1-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2393 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe diffoscope-234-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2394 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2395 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: Running task 2396 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe binutils-2.40-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2397 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2398 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2399 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2400 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 2401 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2402 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2403 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_install: Succeeded
NOTE: Running task 2404 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_populate_sysroot)
NOTE: Running task 2405 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2406 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-234-r0: task do_package: Succeeded
NOTE: Running task 2407 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_packagedata)
NOTE: recipe fontconfig-2.14.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe diffoscope-234-r0: task do_packagedata: Started
NOTE: recipe diffoscope-234-r0: task do_packagedata: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2408 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 2409 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: Running task 2410 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2411 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2412 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Started
NOTE: recipe binutils-2.40-r0: task do_configure: Succeeded
NOTE: Running task 2413 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_compile)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.40-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 2414 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2415 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2416 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2417 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_package: Succeeded
NOTE: Running task 2418 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 2419 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_install)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_install: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata: Failed
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_install: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: recipe binutils-2.40-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2419 tasks of which 2264 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-src went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-dbg went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-utils went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-staticdev went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-dev went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-doc went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-locale-ka went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-locale-zh-cn went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/fontconfig/2.14.1-r0/temp/log.do_packagedata.3328339
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_packagedata) failed with exit code '1'

--===============6200085363242731184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1698 targets, 52 skipped, 0 masked, 0 errors.
Removing 121 recipes from the core2-32 sysroot...done.
Removing 126 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============6200085363242731184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f56f4c6741438b2c2b7041ffed69c07d5ca1192e"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 118 Local 10 Mirrors 0 Missed 108 Current 610 (8% match, 85% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 667 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1452 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_compile)
NOTE: Running task 1541 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_compile)
NOTE: Running task 1671 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_compile)
NOTE: Running task 1695 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_compile)
NOTE: Running task 1783 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot)
NOTE: Running task 1838 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 1839 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Started
NOTE: Running task 1977 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: recipe fontconfig-2.14.1-r0: task do_compile: Started
NOTE: Running task 2027 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 2028 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2030 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2040 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_packagedata)
NOTE: Running task 2072 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_fetch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Started
NOTE: Running task 2085 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_package)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-234-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe diffoscope-234-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 2099 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 2100 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_install)
NOTE: Running task 2101 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_install)
NOTE: Running task 2102 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2103 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2104 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2105 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2106 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_install)
NOTE: Running task 2107 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 2108 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2109 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: Running task 2118 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Started
NOTE: Running task 2119 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: Running task 2120 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_compile)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Started
NOTE: Running task 2124 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_unpack)
NOTE: Running task 2125 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2126 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2127 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 2128 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2129 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: Running task 2130 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2177 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: Running task 2180 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2181 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Started
NOTE: Running task 2184 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2191 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Started
NOTE: recipe diffoscope-234-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: Running task 2195 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe vim-9.0.1211-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2196 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: Running task 2197 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2203 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: Running task 2204 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2221 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-234-r0: task do_unpack: Succeeded
NOTE: recipe vim-9.0.1211-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-234-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2222 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 2223 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2224 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: Running task 2225 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: Running task 2226 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: Running task 2227 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2228 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 2229 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_patch)
NOTE: Running task 2230 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-72-1-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: Running task 2323 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.0.1211-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe diffoscope-234-r0: task do_patch: Started
NOTE: Running task 2324 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Succeeded
NOTE: Running task 2325 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2326 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2327 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_package)
NOTE: Running task 2328 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: Running task 2329 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 2330 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2331 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package)
NOTE: recipe icu-72-1-r0: task do_packagedata: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: Running task 2332 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-234-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-234-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Started
NOTE: Running task 2333 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_deploy_source_date_epoch)
NOTE: Running task 2334 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_populate_lic)
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 2335 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2336 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-234-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-234-r0: task do_populate_lic: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2337 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2338 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 2339 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2340 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2341 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_install)
NOTE: Running task 2342 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-234-r0: task do_populate_lic: Succeeded
NOTE: Running task 2343 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Started
NOTE: Running task 2344 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_populate_lic unihash changed to 1da21f0f1d08bdf46242684cc0dabe0fcd7c891fd82c9b731c25749777ea9399
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 2345 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe diffoscope-234-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2346 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: Running task 2347 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: Running task 2348 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2349 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2350 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: Running task 2351 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe diffoscope-234-r0: task do_configure: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: Running task 2352 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: recipe diffoscope-234-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2353 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2354 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2355 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2356 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: Running task 2357 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_compile)
NOTE: Running task 2358 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2359 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe vim-9.0.1211-r0: task do_unpack: Succeeded
NOTE: Running task 2360 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: Running task 2361 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe diffoscope-234-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe vim-9.0.1211-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2362 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2363 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2364 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_configure)
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata)
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2366 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Started
NOTE: Running task 2367 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Started
NOTE: recipe vim-9.0.1211-r0: task do_patch: Succeeded
NOTE: Running task 2368 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2370 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe vim-9.0.1211-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe vim-9.0.1211-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2371 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Succeeded
NOTE: Running task 2372 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2373 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Succeeded
NOTE: Running task 2374 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 2375 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-234-r0: task do_compile: Succeeded
NOTE: Running task 2376 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_install)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2377 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe diffoscope-234-r0: task do_install: Started
NOTE: Running task 2378 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2379 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Started
NOTE: Running task 2380 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2381 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_configure: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2382 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2383 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe diffoscope-234-r0: task do_install: Succeeded
NOTE: Running task 2384 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_package)
NOTE: Running task 2385 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_populate_sysroot)
NOTE: recipe diffoscope-234-r0: task do_package: Started
NOTE: recipe diffoscope-234-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2386 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: Running task 2388 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2389 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2390 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_compile: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2391 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_install)
NOTE: Running task 2392 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2393 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_configure)
NOTE: recipe diffoscope-234-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2394 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: Running task 2395 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2396 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2397 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2398 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2399 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2400 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2401 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2402 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2403 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-234-r0: task do_package: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2404 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: Running task 2405 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 2406 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: Running task 2407 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: recipe diffoscope-234-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_install: Succeeded
NOTE: Running task 2408 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_populate_sysroot)
NOTE: Running task 2409 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_package)
NOTE: recipe diffoscope-234-r0: task do_packagedata: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2410 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 2411 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: Running task 2412 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2413 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe binutils-2.40-r0: task do_configure: Succeeded
NOTE: Running task 2414 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2415 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_configure)
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2416 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_compile)
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2417 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: Running task 2418 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_compile: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2419 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_install)
NOTE: Running task 2420 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: Running task 2421 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe fontconfig-2.14.1-r0: task do_package: Succeeded
NOTE: Running task 2422 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2423 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_install)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_install: Succeeded
NOTE: Running task 2424 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 2425 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_package)
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata: Failed
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_package: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: recipe binutils-2.40-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2425 tasks of which 2267 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-src went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-dbg went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-utils went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-staticdev went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-dev went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-doc went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-locale-ka went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-locale-zh-cn went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/fontconfig/2.14.1-r0/temp/log.do_packagedata.2958140
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_packagedata) failed with exit code '1'

--===============6200085363242731184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "230" to "234"
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 230 [default] to 234 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "230" to "234"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 230 [default] to 234 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "230" to "234"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 230 [default] to 234 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "230" to "234"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 230 [default] to 234 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "230" to "234"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 230 [default] to 234 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "230" to "234"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 230 [default] to 234 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "230" to "234"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1388149 to 1389553 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 230 [default] to 234 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "230" to "234"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-230.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-234.tar.gz"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 230 [default] to 234 [default]
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-230.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-234.dist-info

--===============6200085363242731184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1698 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1697 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f56f4c6741438b2c2b7041ffed69c07d5ca1192e"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 118 Local 10 Mirrors 0 Missed 108 Current 614 (8% match, 85% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 671 of 732 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1452 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_compile)
NOTE: Running task 1541 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_compile)
NOTE: Running task 1673 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_compile)
NOTE: Running task 1697 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Started
NOTE: Running task 1763 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_install)
NOTE: recipe fontconfig-2.14.1-r0: task do_compile: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 1764 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_install)
NOTE: Running task 1765 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1837 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_install)
NOTE: Running task 1846 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 1847 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1997 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Started
NOTE: Running task 2047 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2049 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2050 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 2060 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: Running task 2092 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_fetch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Started
NOTE: Running task 2127 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 2128 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_compile)
NOTE: Running task 2129 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 2130 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2131 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2132 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2134 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata: Started
NOTE: Running task 2135 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2138 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2139 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2140 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2141 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 2142 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2143 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: Running task 2180 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2193 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-234-r0: task do_fetch: Started
NOTE: Running task 2196 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: Running task 2206 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata)
NOTE: recipe diffoscope-234-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Started
NOTE: Running task 2207 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe vim-9.0.1211-r0: task do_fetch: Started
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 2208 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 2209 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_unpack)
NOTE: Running task 2210 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: Running task 2211 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: Running task 2217 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe vim-9.0.1211-r0: task do_fetch: Succeeded
NOTE: Running task 2218 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe icu-72-1-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-234-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2219 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: Running task 2220 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2221 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2222 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2223 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: Running task 2240 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe diffoscope-234-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2241 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 2242 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 2243 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 2244 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2245 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 2246 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: recipe diffoscope-234-r0: task do_unpack: Succeeded
NOTE: recipe vim-9.0.1211-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2339 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2340 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: Running task 2341 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-234-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: Running task 2342 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Succeeded
NOTE: Running task 2343 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot)
NOTE: Running task 2344 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2345 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2346 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_packagedata: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: Running task 2347 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2348 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 2349 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_package)
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 2350 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2351 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2352 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: recipe diffoscope-234-r0: task do_patch: Succeeded
NOTE: Running task 2353 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_deploy_source_date_epoch)
NOTE: Running task 2354 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_populate_lic)
NOTE: recipe diffoscope-234-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2355 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2356 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-234-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Started
NOTE: Running task 2357 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe diffoscope-234-r0: task do_populate_lic: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running task 2358 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 2359 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2360 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: Running task 2361 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot)
NOTE: recipe diffoscope-234-r0: task do_populate_lic: Succeeded
NOTE: Running task 2362 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_package)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_populate_lic unihash changed to 1da21f0f1d08bdf46242684cc0dabe0fcd7c891fd82c9b731c25749777ea9399
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2363 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Started
NOTE: recipe diffoscope-234-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Started
NOTE: Running task 2364 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 2365 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2366 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: Running task 2367 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2368 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe diffoscope-234-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: Running task 2369 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2370 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2371 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2372 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2373 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-234-r0: task do_configure: Succeeded
NOTE: Running task 2374 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2375 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: Running task 2376 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: Running task 2377 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe diffoscope-234-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2378 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: Running task 2379 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2380 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2381 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: Running task 2382 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe vim-9.0.1211-r0: task do_unpack: Succeeded
NOTE: Running task 2383 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: Running task 2384 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_configure)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe vim-9.0.1211-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2386 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_configure)
NOTE: Running task 2387 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2388 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2389 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vim-9.0.1211-r0: task do_patch: Succeeded
NOTE: Running task 2390 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2391 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe vim-9.0.1211-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: recipe diffoscope-234-r0: task do_compile: Succeeded
NOTE: Running task 2392 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: Running task 2393 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe diffoscope-234-r0: task do_install: Started
NOTE: recipe vim-9.0.1211-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Succeeded
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 2394 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: Running task 2395 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2396 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata)
NOTE: Running task 2397 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2398 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata)
NOTE: Running task 2399 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Started
NOTE: Running task 2400 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2401 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: Running task 2402 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2403 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-234-r0: task do_install: Succeeded
NOTE: Running task 2404 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2405 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe diffoscope-234-r0: task do_package: Started
NOTE: recipe diffoscope-234-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 2406 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2407 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2408 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2409 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2410 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe diffoscope-234-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: Running task 2411 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2412 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2413 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: recipe binutils-2.40-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2414 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: Running task 2415 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2416 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe fontconfig-2.14.1-r0: task do_compile: Succeeded
NOTE: Running task 2417 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2418 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2419 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2420 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2421 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2422 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2423 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: Running task 2424 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe diffoscope-234-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2425 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe diffoscope-234-r0: task do_packagedata: Started
NOTE: recipe diffoscope-234-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 2426 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_install: Succeeded
NOTE: Running task 2427 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: Running task 2428 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_populate_sysroot)
NOTE: Running task 2429 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: Running task 2430 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe fontconfig-2.14.1-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2431 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.40-r0: task do_configure: Succeeded
NOTE: Running task 2432 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_compile)
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.40-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2433 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_compile)
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2434 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_configure)
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 2435 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_install)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2436 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_install: Succeeded
NOTE: Running task 2437 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 2438 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: Running task 2439 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2440 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2441 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: Running task 2442 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2443 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2444 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 2445 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_package)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_package: Succeeded
NOTE: Running task 2446 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2447 of 2542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata: Failed
NOTE: recipe mesa-2_22.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_package: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: recipe binutils-2.40-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2447 tasks of which 2285 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-src went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-dbg went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-utils went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-staticdev went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-dev went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-doc went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-locale-ka went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-locale-zh-cn went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/fontconfig/2.14.1-r0/temp/log.do_packagedata.2723619
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_packagedata) failed with exit code '1'

--===============6200085363242731184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 68 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f56f4c6741438b2c2b7041ffed69c07d5ca1192e"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 120 Local 10 Mirrors 0 Missed 110 Current 608 (8% match, 84% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 665 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1448 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_compile)
NOTE: Running task 1539 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_compile)
NOTE: Running task 1667 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_compile)
NOTE: Running task 1692 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Started
NOTE: Running task 1732 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_populate_sysroot)
NOTE: Running task 1759 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_install)
NOTE: recipe fontconfig-2.14.1-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 1761 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_install)
NOTE: Running task 1762 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_install)
NOTE: Running task 1838 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1839 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 1948 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: Running task 2027 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2028 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2030 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 2037 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_package)
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Started
NOTE: Running task 2069 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Started
NOTE: Running task 2104 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_compile)
NOTE: Running task 2105 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2106 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Started
NOTE: Running task 2107 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2108 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 2109 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2110 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2113 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 2114 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2115 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2116 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: Running task 2117 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2118 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2180 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata)
NOTE: Running task 2186 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe diffoscope-234-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Started
NOTE: recipe diffoscope-234-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 2195 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe libdrm-2.4.114-r0: task do_package: Started
NOTE: Running task 2196 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: Running task 2197 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2198 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 2199 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_unpack)
NOTE: Running task 2200 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: Running task 2201 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2202 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe vim-9.0.1211-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2209 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2210 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2213 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-72-1-r0: task do_packagedata: Started
NOTE: Running task 2214 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_install)
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: Running task 2215 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2240 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: Running task 2241 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe diffoscope-234-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 2270 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2311 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe vim-9.0.1211-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-234-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: Running task 2312 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2313 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2314 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: Running task 2315 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Started
NOTE: Running task 2316 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: Running task 2317 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: recipe diffoscope-234-r0: task do_unpack: Succeeded
NOTE: Running task 2318 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.0.1211-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-234-r0: task do_patch: Started
NOTE: Running task 2319 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe icu-72-1-r0: task do_packagedata: Succeeded
NOTE: Running task 2320 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Succeeded
NOTE: Running task 2321 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2322 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 2323 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_package)
NOTE: Running task 2324 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package)
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: Running task 2325 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: recipe diffoscope-234-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 2326 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-234-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2327 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2328 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_deploy_source_date_epoch)
NOTE: Running task 2329 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_populate_lic)
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Started
NOTE: Running task 2330 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2331 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: Running task 2332 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_install)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2333 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2334 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: Running task 2335 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-234-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-234-r0: task do_populate_lic: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 2336 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: Running task 2337 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot)
NOTE: Running task 2338 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_package)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-234-r0: task do_populate_lic: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_populate_lic unihash changed to 1da21f0f1d08bdf46242684cc0dabe0fcd7c891fd82c9b731c25749777ea9399
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Started
NOTE: Running task 2339 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2340 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: Running task 2341 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2342 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2343 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: Running task 2344 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2345 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: Running task 2346 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2347 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe diffoscope-234-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2348 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: Running task 2349 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2350 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: Running task 2351 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Started
NOTE: Running task 2352 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-234-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: Running task 2353 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2354 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2355 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe diffoscope-234-r0: task do_configure: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2356 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: Running task 2357 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe diffoscope-234-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: Running task 2358 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe vim-9.0.1211-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2359 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2360 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vim-9.0.1211-r0: task do_patch: Started
NOTE: Running task 2361 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot)
NOTE: Running task 2362 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package)
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2363 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2364 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2365 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe vim-9.0.1211-r0: task do_patch: Succeeded
NOTE: Running task 2366 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2367 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe vim-9.0.1211-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2368 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe vim-9.0.1211-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Succeeded
NOTE: Running task 2369 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata)
NOTE: recipe diffoscope-234-r0: task do_compile: Succeeded
NOTE: Running task 2370 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_install)
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Succeeded
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 2371 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2372 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Started
NOTE: Running task 2373 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2374 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata)
NOTE: recipe diffoscope-234-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2375 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2376 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2377 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe libdrm-2.4.114-r0: task do_package: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2379 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_packagedata)
NOTE: recipe diffoscope-234-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 2380 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_package)
NOTE: Running task 2381 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: Running task 2382 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata)
NOTE: Running task 2383 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_populate_sysroot)
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2384 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: Running task 2385 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe diffoscope-234-r0: task do_package: Started
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata: Started
NOTE: recipe diffoscope-234-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2386 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_configure)
NOTE: recipe binutils-2.40-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2387 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-234-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2388 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2389 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Running task 2390 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_compile: Succeeded
NOTE: Running task 2391 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: Running task 2392 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: Running task 2393 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2394 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: Running task 2395 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2396 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2397 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2398 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2399 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2400 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 2401 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe diffoscope-234-r0: task do_package: Succeeded
NOTE: Running task 2402 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_234.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe diffoscope-234-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2403 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2404 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2405 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-234-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_install: Succeeded
NOTE: Running task 2406 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_populate_sysroot)
NOTE: Running task 2407 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_package)
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 2408 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: Running task 2409 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe binutils-2.40-r0: task do_configure: Succeeded
NOTE: Running task 2410 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_compile)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2411 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2412 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe binutils-2.40-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2413 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2414 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_compile)
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2415 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 2416 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_install)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_install: Succeeded
NOTE: Running task 2417 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 2418 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_package)
NOTE: recipe fontconfig-2.14.1-r0: task do_package: Succeeded
NOTE: Running task 2419 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2420 of 2524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_install)
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata: Failed
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_package: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: recipe binutils-2.40-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2420 tasks of which 2263 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-src went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-dbg went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-utils went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-staticdev went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-dev went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-doc went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-locale-ka went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: QA Issue: Package version for package fontconfig-locale-zh-cn went backwards which would break package feeds (from 0:2.14.2-r0 to 0:2.14.1-r0) [version-going-backwards]
ERROR: fontconfig-2.14.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/fontconfig/2.14.1-r0/temp/log.do_packagedata.3163832
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_packagedata) failed with exit code '1'

--===============6200085363242731184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-230.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-234.dist-info

--===============6200085363242731184==--

