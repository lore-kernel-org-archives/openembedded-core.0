Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60695C41535
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:26 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web09.13953.1646329345693210205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=EplGwPAW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 0101017f50e0321b-59cf76db-6698-482a-b8fa-829a8a8d233d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ideg9N3FmWPhkOoQZQP+Osyn+WkA9Nmqvqg1oTdbHtg=;
	b=EplGwPAWanlCSeaT7lOvwR3D7GW4kZsP2Yfm73ZTdNYaNoMkmZtor4q5f9BmrWba
	yzeZmG+w6WMstB9xURPtnu6BAK22WHy5rTP17St2Qu+rXC12cFqu0IcOGjioU3sbgGb
	4/Eboas+FO8JktEqEHmxL0w5eMOg6zsvVdPJwZjU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ideg9N3FmWPhkOoQZQP+Osyn+WkA9Nmqvqg1oTdbHtg=;
	b=OhbcQBYkANRQA/6pM1QjUhjWFinq+FyyLM14Zk3yRiOcfWD6vX0kT2SYumzTNC8i
	5dR78SoydqMwwfoKkucSWI6VQOHop/SMV5figJx9yY3lL5h8pntiudPxNGPQV+NSveh
	Yh68vj0PckOhYaA1MvyvIf6zpfSRfnMhgpGZ1D84=
Content-Type: multipart/mixed; boundary="===============5200885540469867483=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.3.204.1 SUCCEEDED
Message-ID: 
 <0101017f50e0321b-59cf76db-6698-482a-b8fa-829a8a8d233d-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:24 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162695

--===============5200885540469867483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-loader* to *1.3.204.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-loader-upgrade-1.3.204.0-1.3.204.1.patch
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
--===============5200885540469867483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1522 targets, 50 skipped, 0 masked, 0 errors.
Removing 43 recipes from the core2-32 sysroot...done.
Removing 50 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-f7e66a546b8f9537779b63d96155b8846077b723"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f7e66a546b8f9537779b63d96155b8846077b723"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 218 Local 206 Mirrors 0 Missed 12 Current 170 (94% match, 96% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 174 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.3.7.bb:do_packagedata_setscene)
NOTE: Running task 718 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_fetch)
NOTE: Running task 723 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_fetch)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Started
NOTE: recipe mesa-2_21.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Succeeded
NOTE: Running task 768 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_unpack)
NOTE: Running task 769 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 186 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.3.7.bb:do_package_setscene)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_unpack: Succeeded
NOTE: Running task 770 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_patch)
NOTE: Running task 771 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Succeeded
NOTE: Running task 772 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_generate_toolchain_file)
NOTE: Running task 773 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 774 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 775 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_generate_toolchain_file)
NOTE: Running task 776 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_populate_lic)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_populate_lic unihash changed to 0458d73162895a27e3312bad7b2b7de307f3c367d42a60ca9a343899be7a1403
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_21.3.7-r0: task do_package_setscene: Started
NOTE: recipe mesa-2_21.3.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 187 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_packagedata_setscene)
NOTE: Running setscene task 189 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 190 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 191 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 192 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 194 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_21.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_21.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 202 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 205 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 207 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 213 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 215 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 216 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 220 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 223 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 224 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 228 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 230 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 234 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 237 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 240 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 242 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 245 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 246 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 248 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 249 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 251 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 261 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 262 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 265 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 266 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 269 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 270 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 272 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 277 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 278 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 280 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 281 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 283 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 296 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 310 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 319 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 321 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 324 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 338 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 343 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 351 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 357 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 359 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 361 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 363 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 365 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 366 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 369 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 372 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 382 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 385 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 386 of 388 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1307 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1391 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.3.7.bb:do_package_write_rpm)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1392 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_configure: Succeeded
NOTE: Running task 1393 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_compile: Succeeded
NOTE: Running task 1394 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_install)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_install: Succeeded
NOTE: Running task 1395 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_populate_sysroot)
NOTE: Running task 1396 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_package)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1397 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1398 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_package: Succeeded
NOTE: Running task 1399 of 1407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_packagedata: Failed
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_21.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1399 tasks of which 1378 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/vulkan-headers/1.3.204.0-r0/temp/log.do_packagedata.421654
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_packagedata) failed with exit code '1'

--===============5200885540469867483==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vulkan-loader-upgrade-1.3.204.0-1.3.204.1.patch"

From 027e8637e1fa3a7eb8f0f557d5bdc4ae2d35b21a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 3 Mar 2022 16:31:05 +0000
Subject: [PATCH] vulkan-loader: upgrade 1.3.204.0 -> 1.3.204.1

---
 .../{vulkan-loader_1.3.204.0.bb => vulkan-loader_1.3.204.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.204.0.bb => vulkan-loader_1.3.204.1.bb} (96%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb
similarity index 96%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb
index 23e178588e..8924ca34a6 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.204;protocol=https"
-SRCREV = "6a2458b649aae2a8bec8259c2485e7c0bd0465ae"
+SRCREV = "f3e995134211d3fd663febede48e740e44982e27"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============5200885540469867483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 62 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-f7e66a546b8f9537779b63d96155b8846077b723"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f7e66a546b8f9537779b63d96155b8846077b723"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 2 Mirrors 0 Missed 12 Current 375 (14% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1189 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_fetch)
NOTE: Running task 1215 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_fetch)
NOTE: Running task 1389 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.3.7.bb:do_package_write_rpm)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Succeeded
NOTE: Running task 1390 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_unpack)
NOTE: Running task 1391 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_unpack)
NOTE: Running task 1392 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Succeeded
NOTE: Running task 1393 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_unpack: Succeeded
NOTE: Running task 1394 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Succeeded
NOTE: Running task 1395 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1396 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_generate_toolchain_file)
NOTE: Running task 1397 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_populate_lic)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_patch: Succeeded
NOTE: Running task 1398 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_generate_toolchain_file)
NOTE: Running task 1399 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_populate_lic unihash changed to 0458d73162895a27e3312bad7b2b7de307f3c367d42a60ca9a343899be7a1403
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1400 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_configure: Succeeded
NOTE: Running task 1401 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_compile: Succeeded
NOTE: Running task 1402 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_install)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_install: Succeeded
NOTE: Running task 1403 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_populate_sysroot)
NOTE: Running task 1404 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_package)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1405 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1406 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_package: Succeeded
NOTE: Running task 1407 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_packagedata: Failed
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_21.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1407 tasks of which 1386 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/vulkan-headers/1.3.204.0-r0/temp/log.do_packagedata.409821
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_packagedata) failed with exit code '1'

--===============5200885540469867483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 52 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-f7e66a546b8f9537779b63d96155b8846077b723"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f7e66a546b8f9537779b63d96155b8846077b723"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 2 Mirrors 0 Missed 12 Current 375 (14% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1189 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_fetch)
NOTE: Running task 1215 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_fetch)
NOTE: Running task 1389 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.3.7.bb:do_package_write_rpm)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_fetch: Succeeded
NOTE: Running task 1390 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_unpack)
NOTE: Running task 1391 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_unpack)
NOTE: Running task 1392 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Succeeded
NOTE: Running task 1393 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_unpack: Succeeded
NOTE: Running task 1394 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1395 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1396 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_generate_toolchain_file)
NOTE: Running task 1397 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_populate_lic)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_patch: Succeeded
NOTE: Running task 1398 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_generate_toolchain_file)
NOTE: Running task 1399 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_populate_lic unihash changed to 0458d73162895a27e3312bad7b2b7de307f3c367d42a60ca9a343899be7a1403
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1400 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_configure: Succeeded
NOTE: Running task 1401 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_compile: Succeeded
NOTE: Running task 1402 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_install)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_install: Succeeded
NOTE: Running task 1403 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_populate_sysroot)
NOTE: Running task 1404 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_package)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1405 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1406 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_package: Succeeded
NOTE: Running task 1407 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_packagedata: Failed
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_21.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1407 tasks of which 1386 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/vulkan-headers/1.3.204.0-r0/temp/log.do_packagedata.406877
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_packagedata) failed with exit code '1'

--===============5200885540469867483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-loader: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-loader: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-loader/vulkan-loader-dbg: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-loader/vulkan-loader-dbg: PKGSIZE changed from 2224912 to 2224748 (-0%)
packages/core2-32-poky-linux/vulkan-loader/vulkan-loader-dbg: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-loader/vulkan-loader-dev: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-loader/vulkan-loader-dev: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-loader/vulkan-loader-doc: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-loader/vulkan-loader-doc: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-loader/vulkan-loader-locale: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-loader/vulkan-loader-locale: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-loader/vulkan-loader-src: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-loader/vulkan-loader-src: PKGSIZE changed from 1566312 to 1568784 (+0%)
packages/core2-32-poky-linux/vulkan-loader/vulkan-loader-src: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-loader/vulkan-loader-staticdev: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-loader/vulkan-loader-staticdev: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-loader/vulkan-loader: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-loader/vulkan-loader: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]

--===============5200885540469867483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 68 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-f7e66a546b8f9537779b63d96155b8846077b723"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f7e66a546b8f9537779b63d96155b8846077b723"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 2 Mirrors 0 Missed 12 Current 375 (14% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1189 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_fetch)
NOTE: Running task 1215 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_fetch)
NOTE: Running task 1389 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.3.7.bb:do_package_write_rpm)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Succeeded
NOTE: Running task 1390 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_unpack)
NOTE: Running task 1391 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_unpack)
NOTE: Running task 1392 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Succeeded
NOTE: Running task 1393 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_unpack: Succeeded
NOTE: Running task 1394 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Succeeded
NOTE: Running task 1395 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1396 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_generate_toolchain_file)
NOTE: Running task 1397 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_populate_lic)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_patch: Succeeded
NOTE: Running task 1398 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_generate_toolchain_file)
NOTE: Running task 1399 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_populate_lic unihash changed to 0458d73162895a27e3312bad7b2b7de307f3c367d42a60ca9a343899be7a1403
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1400 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_configure: Succeeded
NOTE: Running task 1401 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_compile: Succeeded
NOTE: Running task 1402 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_install)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_install: Succeeded
NOTE: Running task 1403 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_populate_sysroot)
NOTE: Running task 1404 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_package)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1405 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1406 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_package: Succeeded
NOTE: Running task 1407 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_packagedata: Failed
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_21.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1407 tasks of which 1386 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/vulkan-headers/1.3.204.0-r0/temp/log.do_packagedata.412768
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_packagedata) failed with exit code '1'

--===============5200885540469867483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1521 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (842 cached, 1 parsed). 1521 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-f7e66a546b8f9537779b63d96155b8846077b723"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f7e66a546b8f9537779b63d96155b8846077b723"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 2 Mirrors 0 Missed 12 Current 375 (14% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1189 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_fetch)
NOTE: Running task 1215 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_fetch)
NOTE: Running task 1389 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.3.7.bb:do_package_write_rpm)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Succeeded
NOTE: Running task 1390 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_unpack)
NOTE: Running task 1391 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_unpack)
NOTE: Running task 1392 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Succeeded
NOTE: Running task 1393 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_unpack: Succeeded
NOTE: Running task 1394 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Succeeded
NOTE: Running task 1395 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1396 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_generate_toolchain_file)
NOTE: Running task 1397 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_populate_lic)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_patch: Succeeded
NOTE: Running task 1398 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_generate_toolchain_file)
NOTE: Running task 1399 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_populate_lic unihash changed to 0458d73162895a27e3312bad7b2b7de307f3c367d42a60ca9a343899be7a1403
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1400 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_configure: Succeeded
NOTE: Running task 1401 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_compile: Succeeded
NOTE: Running task 1402 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_install)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_install: Succeeded
NOTE: Running task 1403 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_populate_sysroot)
NOTE: Running task 1404 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_package)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1405 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1406 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_package: Succeeded
NOTE: Running task 1407 of 1415 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.204.0-r0: task do_packagedata: Failed
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_21.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1407 tasks of which 1386 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.204.1-r0 to 0:1.3.204.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.204.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vulkan-headers/1.3.204.0-r0/temp/log.do_packagedata.402940
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb:do_packagedata) failed with exit code '1'

--===============5200885540469867483==--

