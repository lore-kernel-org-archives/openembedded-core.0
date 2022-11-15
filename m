Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC80C64EAE
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:46 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web09.5191.1668517535100873570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BCiCHkWc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101847b651817-d5379217-6ea2-4777-b9c0-0b97fae184d0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=E+lj2uA/KZ7y2DtPMUtqV/6A0SfiHCDX6ATxcC2KZxs=;
	b=BCiCHkWceJOATbzZUsj2feh77KrhxwPLHDgD3LOLFsCMb7sJHEC/zC8iPascu/6v
	Ht52nW/YBofU32DUGxUAHhZVNWf8PhNJ09LqhbnjDARgo1BYP5xoCgESIpNXE9aqD1n
	TfxU9RHxpaSZhFPGsr7WZLOnkFZ1108+SlSqHpAQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=E+lj2uA/KZ7y2DtPMUtqV/6A0SfiHCDX6ATxcC2KZxs=;
	b=D8xtvAfht2v0Nu/ibho05qJ9Rx/UBurF/Yi2Udpd26auYA9IyROAAWjCdasItndW
	rZAtwTFMFEb9iycBPwYPk80rJGcfSVNIwb+M7KJdU5YDbf6OxmhiVXsszVikivOnPij
	93h/UoxphAUdmcO7G+2N761ZKIb6Os/RMPm/IuVM=
Content-Type: multipart/mixed; boundary="===============7975664458551537654=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bluez5: upgrading to 5.66 FAILED
Message-ID: <010101847b651817-d5379217-6ea2-4777-b9c0-0b97fae184d0-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173280

--===============7975664458551537654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bluez5* to *5.66* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-bluez5-upgrade-5.65-5.66.patch
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
--===============7975664458551537654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/bluez5/bluez5-ptest: FILELIST: added "/usr/lib/bluez5/ptest/unit/test-tester"
packages/core2-32-poky-linux/bluez5/bluez5: FILELIST: removed "/usr/lib/libbluetooth.so.3.19.7", added "/usr/lib/libbluetooth.so.3.19.8"
Changes to packages/core2-32-poky-linux/bluez5 (sysroot):
  /usr/lib/libbluetooth.so.3 changed symlink target from libbluetooth.so.3.19.7 to libbluetooth.so.3.19.8
  /usr/lib/libbluetooth.so changed symlink target from libbluetooth.so.3.19.7 to libbluetooth.so.3.19.8
  /usr/lib/libbluetooth.so.3.19.7 moved to /usr/lib/libbluetooth.so.3.19.8

--===============7975664458551537654==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bluez5-upgrade-5.65-5.66.patch"

RnJvbSAyMDNkNGU3NTBiMTc1NGUxOTk1NDNmOTQ0MDExZDJlNDM0MTI5NzMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMDY6Mzk6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
bHVlejU6IHVwZ3JhZGUgNS42NSAtPiA1LjY2CgotLS0KIC4uLi9ibHVlejUve2JsdWV6NV81LjY1
LmJiID0+IGJsdWV6NV81LjY2LmJifSAgICAgICAgICAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmx1ZXo1L3tibHVlejVfNS42NS5iYiA9PiBibHVlejVfNS42Ni5iYn0g
KDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVl
ejVfNS42NS5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81LjY2
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmx1ZXo1L2JsdWV6NV81LjY1LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2JsdWV6NS9ibHVlejVfNS42Ni5iYgppbmRleCA0YzE1YWViNDZkLi4yMjA4YjczMGIw
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVfNS42
NS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVfNS42Ni5i
YgpAQCAtMSw2ICsxLDYgQEAKIHJlcXVpcmUgYmx1ZXo1LmluYwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMjU2NWE0ZDQ4MzU0YjU3NmU2YWQ5MmUyNWI1NGVkNjY4MDgyOTY1ODFjOGFiYjgwNTg3
MDUxZjk5OTNkOTZkNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzOWZlYTY0YjU5MGM5NDkyOTg0
YTBjMjdhODlmYzIwM2UxY2RjNzQ4NjYwODZlZmI4ZjQ2OTg2NzdhYjJiNTc0IgogCiAjIFRoZXNl
IGlzc3VlcyBoYXZlIGtlcm5lbCBmaXhlcyByYXRoZXIgdGhhbiBibHVleiBmaXhlcyBzbyBleGNs
dWRlIGhlcmUKIENWRV9DSEVDS19JR05PUkUgKz0gIkNWRS0yMDIwLTEyMzUyIENWRS0yMDIwLTI0
NDkwIgotLSAKMi4zMS4xCgo=

--===============7975664458551537654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (0 cached, 887 parsed). 1666 targets, 49 skipped, 0 masked, 0 errors.
Removing 92 recipes from the core2-32 sysroot...done.
Removing 91 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1a8272f40f071fda3b2039e433cee6fa6e42d783"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 357 Local 31 Mirrors 0 Missed 326 Current 207 (8% match, 42% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 530 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 243 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: Running task 249 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_fetch)
NOTE: Running task 269 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_fetch)
NOTE: Running task 316 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_fetch)
NOTE: Running task 371 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 392 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: Running task 393 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_fetch)
NOTE: Running task 397 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_fetch)
NOTE: Running task 398 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_fetch)
NOTE: Running task 444 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_fetch)
NOTE: Running task 506 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: Running task 529 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Started
NOTE: Running task 611 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: Running task 612 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running task 613 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_fetch)
NOTE: Running task 614 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_fetch)
NOTE: Running task 615 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_fetch)
NOTE: Running task 616 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 617 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_fetch)
NOTE: Running task 618 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: Running task 619 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch)
NOTE: Running task 620 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: Running task 678 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_fetch: Started
NOTE: Running task 682 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_fetch)
NOTE: Running task 683 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_fetch)
NOTE: Running task 688 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_unpack)
NOTE: recipe flex-2.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 700 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_fetch)
NOTE: Running task 701 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_fetch)
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Started
NOTE: Running task 708 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: Running task 715 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_write_config)
NOTE: Running task 716 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 718 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 719 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_write_config)
NOTE: Running task 720 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_fetch)
NOTE: Running task 721 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_fetch)
NOTE: Running task 722 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: Running task 723 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: Running task 724 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: Running task 728 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_fetch)
NOTE: Running task 732 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_fetch)
NOTE: Running task 741 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_fetch)
NOTE: Running task 744 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: Running task 746 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_fetch)
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: Running task 754 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_fetch)
NOTE: Running task 757 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.3.bb:do_fetch)
NOTE: Running task 758 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 760 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 761 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_fetch)
NOTE: Running task 783 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_write_config)
NOTE: Running task 784 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 785 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: recipe ncurses-6.3+20220423-r0: task do_fetch: Started
NOTE: Running task 808 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_fetch)
NOTE: Running task 812 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_fetch)
NOTE: Running task 815 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 816 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_fetch)
NOTE: Running task 817 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running task 818 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_unpack)
NOTE: recipe openssl-3.0.7-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 819 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_unpack)
NOTE: Running task 820 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: Running task 821 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_unpack)
NOTE: Running task 822 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_fetch: Started
NOTE: recipe readline-8.1.2-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: Running task 823 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe xz-5.2.7-r0: task do_fetch: Started
NOTE: recipe xz-5.2.7-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Started
NOTE: Running task 824 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_unpack)
NOTE: recipe libxml2-2.9.14-r0: task do_fetch: Succeeded
NOTE: Running task 825 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_unpack)
NOTE: Running task 826 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: Running task 827 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_unpack)
NOTE: recipe libxau-1_1.0.10-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 828 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: Running task 829 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_unpack)
NOTE: Running task 830 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_unpack)
NOTE: Running task 831 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_unpack)
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 832 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: Running task 833 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: Running task 834 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: Running task 835 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_unpack)
NOTE: Running task 836 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_unpack)
NOTE: Running task 837 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_fetch: Started
NOTE: Running task 838 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 839 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: Running task 840 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 841 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_unpack)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe python3-3.11.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Succeeded
NOTE: Running setscene task 537 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_write_config: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: Running task 842 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: Running task 843 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_unpack)
NOTE: Running task 844 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: Running task 845 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_unpack)
NOTE: Running task 846 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_unpack)
NOTE: Running task 847 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_unpack)
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Succeeded
NOTE: Running task 848 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_fetch)
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Started
NOTE: recipe shadow-4.12.3-r0: task do_fetch: Started
NOTE: recipe shadow-4.12.3-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 849 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 850 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_unpack)
NOTE: Running task 851 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_unpack)
NOTE: Running task 852 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: Running task 853 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: Running task 854 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.3.bb:do_unpack)
NOTE: Running task 855 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: Running task 856 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: Running task 857 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Started
NOTE: Running task 858 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_unpack)
NOTE: recipe python3-3.11.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_write_config: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_fetch: Succeeded
NOTE: Running task 859 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_unpack)
NOTE: Running task 860 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_unpack)
NOTE: Running task 861 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_unpack)
NOTE: recipe flex-2.6.4-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: Running task 862 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_unpack)
NOTE: Running task 863 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: recipe cracklib-2.9.8-r0: task do_unpack: Started
NOTE: recipe icu-71.1-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 864 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-71.1-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Started
NOTE: Running setscene task 539 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.39.4-r0: task do_unpack: Started
NOTE: Running task 866 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: Running task 870 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_unpack)
NOTE: Running task 872 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: recipe openssl-3.0.7-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_unpack: Started
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Started
NOTE: Running task 873 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: Running task 874 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: recipe xz-5.2.7-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Started
NOTE: Running task 875 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_unpack)
NOTE: recipe ncurses-6.3+20220423-r0: task do_unpack: Started
NOTE: recipe readline-8.1.2-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Started
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_unpack: Started
NOTE: Running task 876 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_unpack: Started
NOTE: Running task 877 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Started
NOTE: Running task 878 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_patch)
NOTE: recipe util-linux-2.38.1-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.38-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.13-r0: task do_patch: Started
NOTE: Running task 879 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Started
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Started
NOTE: Running task 880 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.38-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_unpack: Started
NOTE: Running task 881 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_patch)
NOTE: Running task 882 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Started
NOTE: Running task 883 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_patch)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_unpack: Started
NOTE: Running task 884 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_patch)
NOTE: Running task 885 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_patch)
NOTE: Running task 886 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: Running task 887 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: recipe shadow-4.12.3-r0: task do_unpack: Started
NOTE: Running task 888 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Started
NOTE: Running task 889 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 890 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_fetch)
NOTE: recipe dbus-1.14.4-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Succeeded
NOTE: Running task 891 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_patch)
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_unpack: Started
NOTE: Running task 892 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: Running task 893 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_patch)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 894 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_patch)
NOTE: Running task 895 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_patch)
NOTE: Running setscene task 541 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 896 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_patch)
NOTE: Running task 897 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_unpack)
NOTE: Running task 905 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_fetch)
NOTE: recipe python3-3.11.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Started
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe libffi-3.4.4-r0: task do_patch: Started
NOTE: recipe xz-5.2.7-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: Running task 906 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_fetch)
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 907 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 908 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: Running task 909 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: Running task 910 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_patch)
NOTE: Running task 911 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 912 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_patch: Started
NOTE: Running task 913 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_patch)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: Running task 914 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_deploy_source_date_epoch)
NOTE: recipe libxau-1_1.0.10-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libpng-1.6.38-r0: task do_unpack: Started
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Started
NOTE: Running task 915 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_patch)
NOTE: Running task 916 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: Running task 917 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: Running task 918 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_patch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Started
NOTE: recipe vala-0.56.3-r0: task do_fetch: Started
NOTE: Running task 919 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_patch)
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Started
NOTE: Running task 920 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe kmod-30-r0: task do_fetch: Started
NOTE: Running task 921 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_patch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: recipe wayland-1.21.0-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_unpack: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.12.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 542 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: Running task 923 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxau-1_1.0.10-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Succeeded
NOTE: Running task 924 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 925 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: Running task 926 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 927 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: Running task 928 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.3.bb:do_patch)
NOTE: Running task 929 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_unpack: Succeeded
NOTE: Running task 930 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 931 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 932 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 933 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 934 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Started
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 935 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 936 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 937 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_patch)
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe kmod-30-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 938 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Started
NOTE: Running task 939 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: Running task 940 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: Running task 941 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_unpack)
NOTE: Running task 948 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_fetch)
NOTE: Running task 949 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libpam-1.5.2-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: Running task 950 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Started
NOTE: Running task 951 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.0.7-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 952 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 963 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_fetch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 545 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 546 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: Running task 964 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_patch)
NOTE: Running task 965 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_patch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 966 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe wayland-1.21.0-r0: task do_patch: Succeeded
NOTE: Running task 967 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_patch)
NOTE: Running task 968 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 969 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 970 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.38-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.12.3-r0: task do_patch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.2.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 971 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cracklib-2.9.8-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 972 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 973 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libffi-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Started
NOTE: Running task 974 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: Running task 975 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.14.4-r0: task do_patch: Started
NOTE: recipe icu-71.1-r0: task do_unpack: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Started
NOTE: Running task 976 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_patch)
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: Running task 977 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: Running task 978 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_patch: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch: Started
NOTE: Running task 979 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe readline-8.1.2-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 980 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 981 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 982 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 983 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_unpack: Succeeded
NOTE: Running task 984 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 985 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_patch)
NOTE: Running task 986 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_fetch)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_patch: Started
NOTE: recipe libpam-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.38-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 548 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.39.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 992 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 994 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_fetch)
NOTE: Running task 995 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_fetch)
NOTE: Running task 996 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb:do_fetch)
NOTE: Running task 997 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_fetch)
NOTE: Running task 998 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: recipe flex-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_unpack: Succeeded
NOTE: Running task 1000 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: Running task 1001 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_fetch)
NOTE: Running task 1002 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_unpack)
NOTE: Running task 1003 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: Running task 1004 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_unpack)
NOTE: Running task 1005 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_unpack)
NOTE: Running task 1006 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_unpack)
NOTE: Running task 1007 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxml2-2.9.14-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.38-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1008 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.12.3-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1009 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_patch)
NOTE: Running task 1010 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_patch)
NOTE: Running task 1011 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1019 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 1020 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_fetch)
NOTE: Running task 1021 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_fetch)
NOTE: Running task 1022 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cracklib-2.9.8-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1023 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1026 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1027 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1028 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Started
NOTE: Running task 1029 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1036 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1047 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: recipe libx11-1_1.8.1-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe bluez5-5.66-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.1-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 1048 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1049 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_unpack)
NOTE: Running task 1056 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_unpack)
NOTE: Running task 1058 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_fetch)
NOTE: Running task 1059 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_write_config)
NOTE: Running task 1066 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: Running task 1067 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_fetch)
NOTE: recipe libxshmfence-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_unpack: Started
NOTE: Running task 1068 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe vala-0.56.3-r0: task do_unpack: Started
NOTE: Running task 1069 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_unpack)
NOTE: Running task 1070 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_unpack)
NOTE: Running task 1071 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_patch: Succeeded
NOTE: Running task 1072 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1100 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_unpack)
NOTE: recipe kmod-30-r0: task do_unpack: Started
NOTE: Running task 1101 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_generate_toolchain_file)
NOTE: Running task 1102 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_patch: Started
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1114 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: Running task 1115 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_write_config)
NOTE: recipe libxml2-2.9.14-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.0.7-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: Running task 1116 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe shadow-4.12.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1117 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_fetch: Succeeded
NOTE: Running task 1118 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_22.2.3-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1119 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: recipe libx11-1_1.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: Running task 1120 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: Running task 1121 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Started
NOTE: Running setscene task 558 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.66-r0: task do_fetch: Started
NOTE: Running task 1136 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.21.0.bb:do_fetch)
NOTE: Running task 1137 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_unpack)
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_unpack: Started
NOTE: recipe bash-5.1.16-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_write_config: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libcap-2.66-r0: task do_fetch: Succeeded
NOTE: Running task 1138 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.1-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1141 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1142 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_unpack)
NOTE: Running task 1143 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_unpack: Started
NOTE: Running task 1144 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: Running task 1145 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_fetch)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe initscripts-1.0-r155: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: Running task 1146 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: Running task 1147 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1148 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_fetch)
NOTE: Running task 1151 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.21.0.bb:do_write_config)
NOTE: recipe mesa-2_22.2.3-r0: task do_write_config: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1153 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.114-r0: task do_write_config: Succeeded
NOTE: Running task 1154 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe fontconfig-2.14.1-r0: task do_unpack: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1156 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_fetch)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycairo-1.21.0-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: Running task 1157 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe initscripts-1.0-r155: task do_configure: Succeeded
NOTE: Running task 1158 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_patch)
NOTE: Running task 1159 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_patch)
NOTE: Running task 1160 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycairo-1.21.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.66-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_unpack: Started
NOTE: Running task 1161 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe mesa-2_22.2.3-r0: task do_write_config: Succeeded
NOTE: Running task 1162 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: Running task 1163 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.21.0.bb:do_unpack)
NOTE: Running task 1164 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: Running task 1167 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_write_config)
NOTE: Running task 1168 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_write_config)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_fetch: Started
NOTE: Running task 1169 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: Running task 1170 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.12.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycairo-1.21.0-r0: task do_write_config: Started
NOTE: recipe dbus-1.14.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_unpack: Succeeded
NOTE: Running task 1199 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_deploy_source_date_epoch)
NOTE: Running task 1200 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb:do_patch)
NOTE: Running task 1201 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: Running task 1208 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: Running task 1209 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_patch)
NOTE: recipe cracklib-2.9.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1210 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_patch)
NOTE: Running task 1211 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_unpack)
NOTE: recipe psmisc-23.5-r0: task do_fetch: Started
NOTE: Running task 1212 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Started
NOTE: Running task 1213 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 1214 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe initscripts-1.0-r155: task do_compile: Started
NOTE: recipe make-4.3-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycairo-1.21.0-r0: task do_write_config: Succeeded
NOTE: Running task 1215 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.21.0-r0: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_write_config: Started
NOTE: Running task 1216 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: Running task 1217 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe libcap-2.66-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: Running task 1218 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_write_config: Started
NOTE: recipe openssl-3.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3.1-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_compile: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Started
NOTE: Running task 1219 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycairo-1.21.0-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-30-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_patch: Started
NOTE: Running task 1220 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Started
NOTE: recipe freetype-2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_write_config: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1221 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_patch)
NOTE: recipe python3-dbus-1.3.2-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_patch: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1222 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_patch)
NOTE: recipe util-linux-2.38.1-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1223 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1224 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: Running task 1225 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1226 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_patch)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 1227 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_patch)
NOTE: Running task 1228 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.14.1-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1229 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.1.16-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_patch: Succeeded
NOTE: Running task 1230 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1231 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1232 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 1233 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Succeeded
NOTE: Running task 1234 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_patch: Succeeded
NOTE: recipe make-4.3-r0: task do_unpack: Started
NOTE: Running task 1235 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1236 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1237 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1238 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1239 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_patch)
NOTE: Running task 1240 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_patch)
NOTE: recipe make-4.3-r0: task do_unpack: Succeeded
NOTE: Running task 1241 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: Running task 1242 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.21.0.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1243 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: Running task 1244 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1245 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1246 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: Running task 1247 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_unpack)
NOTE: Running task 1248 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: Running task 1249 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_patch)
NOTE: recipe python3-3.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1250 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe icu-71.1-r0: task do_unpack: Succeeded
NOTE: Running task 1251 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1252 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_patch)
NOTE: Running task 1253 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_unpack)
NOTE: recipe kmod-30-r0: task do_patch: Started
NOTE: recipe vala-0.56.3-r0: task do_patch: Started
NOTE: recipe freetype-2.12.1-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_patch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_patch: Started
NOTE: recipe bluez5-5.66-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.66-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.1.16-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.12.1-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Started
NOTE: Running task 1254 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1255 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 561 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pycairo-1.21.0-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_patch: Started
NOTE: recipe icu-71.1-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_patch: Succeeded
NOTE: recipe make-4.3-r0: task do_patch: Started
NOTE: recipe psmisc-23.5-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: Running task 1266 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_generate_toolchain_file)
NOTE: Running task 1267 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_deploy_source_date_epoch)
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Succeeded
NOTE: recipe kmod-30-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_patch: Started
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1268 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1269 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1270 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycairo-1.21.0-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1271 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.21.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.114-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.66-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1272 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1273 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1274 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1275 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1276 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_deploy_source_date_epoch)
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1277 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_populate_lic)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libcap-2.66-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pycairo-1.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1278 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygobject-3.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_patch: Started
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1279 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-71.1-r0: task do_patch: Succeeded
NOTE: Running task 1280 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_patch)
NOTE: recipe bluez5-5.66-r0: task do_populate_lic: Started
NOTE: Running task 1281 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 562 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_patch: Succeeded
NOTE: Running task 1292 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1293 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1294 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe psmisc-23.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycairo-1.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1295 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_patch)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-71.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_populate_lic: Succeeded
NOTE: Running task 1296 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_populate_lic unihash changed to 0703909186b79d0064e7a21045dc2aff0624da12a925985eafa7db7ac7a26985
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe make-4.3-r0: task do_patch: Succeeded
NOTE: Running task 1297 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe psmisc-23.5-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_patch: Succeeded
NOTE: Running task 1298 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_deploy_source_date_epoch)
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1299 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe icu-71.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1300 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe psmisc-23.5-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1301 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1302 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1349 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1350 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1351 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1356 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1357 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1362 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1363 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1364 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_22.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_install: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1365 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot)
NOTE: recipe opkg-utils-0.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.2.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1366 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1367 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1368 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1369 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_configure)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package: Started
NOTE: Running task 1370 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_configure)
NOTE: recipe zlib-1.2.13-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1371 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_configure)
NOTE: recipe libtool-cross-2.4.7-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1372 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Started
NOTE: Running task 1373 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_configure)
NOTE: recipe opkg-utils-0.5.0-r0: task do_configure: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_configure: Started
NOTE: Running task 1374 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_compile)
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_configure: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_configure: Started
NOTE: Running task 1375 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_configure)
NOTE: Running task 1376 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_patch: Succeeded
NOTE: Running task 1377 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_compile: Started
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_configure: Succeeded
NOTE: Running task 1378 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1379 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_compile: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_compile: Started
NOTE: Running task 1380 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe zlib-1.2.13-r0: task do_configure: Succeeded
NOTE: Running task 1381 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_configure_ptest_base)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_compile: Succeeded
NOTE: Running task 1382 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_install)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_install: Started
NOTE: Running task 1383 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_install)
NOTE: recipe zlib-1.2.13-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_install: Started
NOTE: Running task 1384 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_compile)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_install: Succeeded
NOTE: Running task 1385 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe zlib-1.2.13-r0: task do_compile: Started
NOTE: Running task 1386 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot)
NOTE: Running task 1387 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Succeeded
NOTE: Running task 1388 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_install: Succeeded
NOTE: Running task 1389 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_populate_sysroot)
NOTE: Running task 1390 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1391 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1392 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1393 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe zlib-1.2.13-r0: task do_compile: Succeeded
NOTE: Running task 1394 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_compile_ptest_base)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe openssl-3.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1395 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_configure)
NOTE: recipe zlib-1.2.13-r0: task do_compile_ptest_base: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1396 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe zlib-1.2.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1397 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_install)
NOTE: recipe openssl-3.0.7-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe zlib-1.2.13-r0: task do_install: Started
NOTE: recipe initscripts-1.0-r155: task do_package: Succeeded
NOTE: Running task 1398 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata)
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Succeeded
NOTE: Running task 1399 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_compile)
NOTE: recipe expat-2.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1400 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_configure_ptest_base)
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Started
NOTE: recipe zlib-1.2.13-r0: task do_install: Succeeded
NOTE: Running task 1401 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_install_ptest_base)
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Started
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_install_ptest_base: Started
NOTE: Running task 1402 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_install)
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1403 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_compile)
NOTE: Running task 1404 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata)
NOTE: recipe zlib-1.2.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1405 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot)
NOTE: Running task 1406 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata: Started
NOTE: recipe expat-2.5.0-r0: task do_compile: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_install: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot: Started
NOTE: recipe zlib-1.2.13-r0: task do_package: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_package: Succeeded
NOTE: Running task 1407 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: Running task 1408 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_packagedata: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1409 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_packagedata: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_install: Succeeded
NOTE: Running task 1410 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot)
NOTE: Running task 1411 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2022.2-r0: task do_package: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1412 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_configure)
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_package: Succeeded
NOTE: Running task 1413 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata)
NOTE: recipe xorgproto-2022.2-r0: task do_package: Succeeded
NOTE: Running task 1414 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Succeeded
NOTE: Running task 1415 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_compile)
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Started
NOTE: recipe expat-2.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1416 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_compile_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1417 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_install)
NOTE: recipe expat-2.5.0-r0: task do_install: Started
NOTE: recipe expat-2.5.0-r0: task do_install: Succeeded
NOTE: Running task 1418 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_install_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1419 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot)
NOTE: Running task 1420 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_package)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_package: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1421 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_compile)
NOTE: recipe expat-2.5.0-r0: task do_package: Succeeded
NOTE: Running task 1422 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata)
NOTE: recipe libtool-cross-2.4.7-r0: task do_compile: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1423 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 1424 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1425 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_configure: Succeeded
NOTE: Running task 1426 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_configure_ptest_base)
NOTE: recipe openssl-3.0.7-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.0.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1427 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_compile)
NOTE: recipe openssl-3.0.7-r0: task do_compile: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1428 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_install)
NOTE: recipe libtool-cross-2.4.7-r0: task do_install: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1429 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Succeeded
NOTE: Running task 1430 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1431 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1432 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1433 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1434 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1435 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1436 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1437 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1438 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1439 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1440 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1441 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1442 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1443 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1444 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1445 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1446 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1447 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1448 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1449 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_install)
NOTE: recipe flex-2.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cracklib-2.9.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1450 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1451 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1452 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.3+20220423-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-71.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1453 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: Running task 1454 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_configure)
NOTE: Running task 1455 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1456 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_configure)
NOTE: Running task 1457 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_configure)
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1458 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_configure)
NOTE: Running task 1459 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_configure)
NOTE: Running task 1460 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_configure)
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1461 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_configure)
NOTE: recipe libcap-ng-0.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1462 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_configure)
NOTE: Running task 1463 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_configure)
NOTE: Running task 1464 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-71.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpng-1.6.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1465 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe base-passwd-3.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1466 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_configure)
NOTE: Running task 1467 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_configure)
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe cracklib-2.9.8-r0: task do_configure: Started
NOTE: recipe flex-2.6.4-r0: task do_configure: Started
NOTE: recipe make-4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1468 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_configure)
NOTE: Running task 1469 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_configure: Started
NOTE: Running task 1470 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_make_icudata)
NOTE: Running task 1471 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_configure)
NOTE: Running task 1472 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Started
NOTE: Running task 1473 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_configure)
NOTE: recipe gdbm-1.23-r0: task do_configure: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_configure: Started
NOTE: recipe libffi-3.4.4-r0: task do_configure: Started
NOTE: recipe bash-completion-2.11-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_configure: Started
NOTE: Running task 1474 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_configure)
NOTE: recipe libpng-1.6.38-r0: task do_configure: Started
NOTE: recipe attr-2.5.1-r0: task do_configure: Started
NOTE: recipe icu-71.1-r0: task do_make_icudata: Started
NOTE: recipe gmp-6.2.1-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe make-4.3-r0: task do_configure: Started
NOTE: recipe icu-71.1-r0: task do_make_icudata: Succeeded
NOTE: Running task 1475 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_configure)
NOTE: recipe xcb-proto-1.15.2-r0: task do_configure: Started
NOTE: recipe icu-71.1-r0: task do_configure: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Succeeded
NOTE: Running task 1476 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot)
NOTE: Running task 1477 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_package)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Succeeded
NOTE: Running task 1478 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Succeeded
NOTE: Running task 1479 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Started
NOTE: recipe bash-completion-2.11-r0: task do_configure: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_configure: Succeeded
NOTE: Running task 1480 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Succeeded
NOTE: Running task 1481 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_compile)
NOTE: Running task 1482 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_install)
NOTE: recipe bash-completion-2.11-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_compile: Succeeded
NOTE: Running task 1483 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_install)
NOTE: recipe xcb-proto-1.15.2-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1484 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Succeeded
NOTE: Running task 1485 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot)
NOTE: Running task 1486 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: recipe base-passwd-3.6.1-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1487 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1488 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1489 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-passwd-3.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1490 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: Running task 1491 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_install)
NOTE: Running task 1492 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: recipe xcb-proto-1.15.2-r0: task do_install: Succeeded
NOTE: Running task 1493 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot)
NOTE: Running task 1494 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_package)
NOTE: recipe libxau-1_1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_install: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_package: Started
NOTE: Running task 1495 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1496 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_configure)
NOTE: recipe libxau-1_1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1497 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: Running task 1498 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_install: Succeeded
NOTE: Running task 1499 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_configure)
NOTE: Running task 1500 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot)
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_compile: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: Running task 1501 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_install)
NOTE: Running task 1502 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot)
NOTE: Running task 1503 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_install: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1504 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1505 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_package)
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: Running task 1506 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1507 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_configure)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Succeeded
NOTE: Running task 1508 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_compile)
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Succeeded
NOTE: Running task 1509 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_install)
NOTE: recipe xcb-proto-1.15.2-r0: task do_package: Succeeded
NOTE: Running task 1510 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata)
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Succeeded
NOTE: Running task 1511 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: Running task 1512 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: Running task 1513 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1514 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 1515 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_configure: Succeeded
NOTE: Running task 1516 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_compile)
NOTE: recipe sqlite3-3_3.39.4-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe icu-71.1-r0: task do_configure: Succeeded
NOTE: Running task 1517 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_compile)
NOTE: recipe icu-71.1-r0: task do_compile: Started
NOTE: recipe libpng-1.6.38-r0: task do_configure: Succeeded
NOTE: Running task 1518 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_compile)
NOTE: recipe libpng-1.6.38-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1519 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe cracklib-2.9.8-r0: task do_configure: Succeeded
NOTE: Running task 1520 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1521 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_configure: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_compile: Started
NOTE: Running task 1522 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_configure_ptest_base)
NOTE: Running task 1523 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe attr-2.5.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Started
NOTE: recipe attr-2.5.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1524 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_compile)
NOTE: recipe attr-2.5.1-r0: task do_compile: Started
NOTE: recipe openssl-3.0.7-r0: task do_compile: Succeeded
NOTE: Running task 1525 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.0.7-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.0.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1526 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_install)
NOTE: recipe libcap-ng-0.8.3-r0: task do_configure: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_install: Started
NOTE: Running task 1527 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_compile)
NOTE: recipe libcap-ng-0.8.3-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1528 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 1529 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_install)
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Started
NOTE: recipe attr-2.5.1-r0: task do_compile: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1530 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_compile_ptest_base)
NOTE: Running task 1531 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1532 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: Running task 1533 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: recipe cracklib-2.9.8-r0: task do_compile: Succeeded
NOTE: Running task 1534 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe attr-2.5.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1535 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_install)
NOTE: recipe cracklib-2.9.8-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1536 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe attr-2.5.1-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 1537 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1538 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: Running task 1539 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-ng-0.8.3-r0: task do_compile: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_install: Succeeded
NOTE: Running task 1540 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 1541 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package)
NOTE: Running task 1542 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_install)
NOTE: Running task 1543 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot)
NOTE: Running task 1544 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: recipe libpng-1.6.38-r0: task do_compile: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1545 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_install: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: recipe libpng-1.6.38-r0: task do_install: Started
NOTE: recipe gdbm-1.23-r0: task do_configure: Succeeded
NOTE: Running task 1546 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_configure_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1547 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: recipe gdbm-1.23-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.23-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: Running task 1548 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_compile)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_install: Succeeded
NOTE: Running task 1549 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.23-r0: task do_compile: Started
NOTE: Running task 1550 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_install_ptest_base)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1551 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_install_ptest_base: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1552 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot)
NOTE: Running task 1553 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: recipe make-4.3-r0: task do_configure: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1554 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_configure)
NOTE: Running task 1555 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_compile)
NOTE: Running task 1556 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_configure)
NOTE: recipe libpng-1.6.38-r0: task do_install: Succeeded
NOTE: Running task 1557 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_populate_sysroot)
NOTE: Running task 1558 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_package)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe make-4.3-r0: task do_compile: Started
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Started
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.38-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_install: Succeeded
NOTE: Running task 1559 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot)
NOTE: Running task 1560 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1561 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1562 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1563 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_configure)
NOTE: recipe libffi-3.4.4-r0: task do_configure: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1564 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_compile)
NOTE: Running task 1565 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_configure)
NOTE: recipe cracklib-2.9.8-r0: task do_install: Succeeded
NOTE: Running task 1566 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: Running task 1567 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot)
NOTE: Running task 1568 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package)
NOTE: recipe acl-2.3.1-r0: task do_configure: Started
NOTE: recipe freetype-2.12.1-r0: task do_configure: Started
NOTE: recipe libffi-3.4.4-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot: Started
NOTE: recipe cracklib-2.9.8-r0: task do_package: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe make-4.3-r0: task do_compile: Succeeded
NOTE: Running task 1569 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_install)
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 1570 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Started
NOTE: recipe make-4.3-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 1571 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe libffi-3.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1572 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_install)
NOTE: recipe gdbm-1.23-r0: task do_compile: Succeeded
NOTE: Running task 1573 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_compile_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe libffi-3.4.4-r0: task do_install: Started
NOTE: recipe gdbm-1.23-r0: task do_compile_ptest_base: Started
NOTE: recipe libpng-1.6.38-r0: task do_package: Succeeded
NOTE: Running task 1574 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Succeeded
NOTE: Running task 1575 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata)
NOTE: recipe libpng-1.6.38-r0: task do_packagedata: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.38-r0: task do_packagedata: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_install: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1576 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot)
NOTE: Running task 1577 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package)
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: Running task 1578 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_install)
NOTE: Running task 1579 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe flex-2.6.4-r0: task do_configure: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_package: Started
NOTE: Running task 1580 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_configure_ptest_base)
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Started
NOTE: recipe make-4.3-r0: task do_install: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_install: Started
NOTE: Running task 1581 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package)
NOTE: recipe flex-2.6.4-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: Running task 1582 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata)
NOTE: recipe flex-2.6.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1583 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_compile)
NOTE: recipe make-4.3-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Started
NOTE: recipe flex-2.6.4-r0: task do_compile: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 1584 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_compile)
NOTE: recipe libxau-1_1.0.10-r0: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Succeeded
NOTE: Running task 1585 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_compile)
NOTE: Running task 1586 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_compile)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Started
NOTE: recipe xz-5.2.7-r0: task do_configure: Succeeded
NOTE: Running task 1587 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_compile)
NOTE: recipe xz-5.2.7-r0: task do_compile: Started
NOTE: recipe gdbm-1.23-r0: task do_install: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 1588 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_install)
NOTE: Running task 1589 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_install_ptest_base)
NOTE: recipe libxau-1_1.0.10-r0: task do_install: Started
NOTE: recipe libffi-3.4.4-r0: task do_package: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_install_ptest_base: Started
NOTE: Running task 1590 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1591 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_install)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Started
NOTE: recipe gdbm-1.23-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Started
NOTE: Running task 1592 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot)
NOTE: Running task 1593 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: recipe libxau-1_1.0.10-r0: task do_install: Succeeded
NOTE: Running task 1594 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 1595 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_package)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot: Started
NOTE: recipe cracklib-2.9.8-r0: task do_package: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: Running task 1596 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata)
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Succeeded
NOTE: Running task 1597 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_install)
NOTE: recipe libxau-1_1.0.10-r0: task do_package: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata: Started
NOTE: recipe libpciaccess-0.17-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 1598 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 1599 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_install: Succeeded
NOTE: Running task 1600 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot)
NOTE: Running task 1601 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_package)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.17-r0: task do_package: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1602 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-4.3-r0: task do_package: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1603 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_compile: Succeeded
NOTE: Running task 1604 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-4.3-r0: task do_packagedata: Started
NOTE: Running task 1605 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_compile_ptest_base)
NOTE: recipe libxcb-1.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_compile_ptest_base: Started
NOTE: Running task 1606 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_configure)
NOTE: recipe libdrm-2.4.114-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcb-1.15-r0: task do_configure: Started
NOTE: recipe make-4.3-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1607 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_configure)
NOTE: recipe libdrm-2.4.114-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_package: Succeeded
NOTE: Running task 1608 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_packagedata)
NOTE: recipe xz-5.2.7-r0: task do_compile: Succeeded
NOTE: Running task 1609 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_install)
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_install: Started
NOTE: Running task 1610 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata)
NOTE: recipe freetype-2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 1611 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_compile)
NOTE: recipe freetype-2.12.1-r0: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_package: Succeeded
NOTE: Running task 1612 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1613 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_compile)
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Started
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: Running task 1614 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata)
NOTE: recipe gdbm-1.23-r0: task do_packagedata: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1615 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_install)
NOTE: recipe xz-5.2.7-r0: task do_install: Succeeded
NOTE: Running task 1616 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot)
NOTE: Running task 1617 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_package)
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Started
NOTE: recipe acl-2.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1618 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_configure_ptest_base)
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_package: Started
NOTE: recipe acl-2.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1619 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_compile)
NOTE: Running task 1620 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_compile)
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Started
NOTE: recipe acl-2.3.1-r0: task do_compile: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1621 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot)
NOTE: Running task 1622 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1623 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Started
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.114-r0: task do_configure: Succeeded
NOTE: Running task 1624 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1625 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure_ptest_base)
NOTE: recipe libdrm-2.4.114-r0: task do_compile: Started
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Started
NOTE: Running task 1626 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_configure)
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1627 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile)
NOTE: recipe gmp-6.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1628 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_compile)
NOTE: recipe kmod-30-r0: task do_configure: Started
NOTE: recipe libpcre-8.45-r0: task do_compile: Started
NOTE: recipe gmp-6.2.1-r0: task do_compile: Started
NOTE: recipe acl-2.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1629 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_compile_ptest_base)
NOTE: recipe acl-2.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 1630 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_install)
NOTE: recipe libice-1_1.0.10-r0: task do_install: Started
NOTE: recipe acl-2.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1631 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_install)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_configure: Succeeded
NOTE: Running task 1632 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_compile)
NOTE: recipe acl-2.3.1-r0: task do_install: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Running task 1633 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1634 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe libice-1_1.0.10-r0: task do_install: Succeeded
NOTE: Running task 1635 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 1636 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe freetype-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 1637 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_install)
NOTE: recipe freetype-2.12.1-r0: task do_install: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1638 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_compile: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1639 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_install: Succeeded
NOTE: Running task 1640 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: Running task 1641 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_install_ptest_base)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Started
NOTE: recipe acl-2.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1642 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_configure)
NOTE: recipe libdrm-2.4.114-r0: task do_compile: Succeeded
NOTE: Running task 1643 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_install)
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Started
NOTE: recipe acl-2.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1644 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot)
NOTE: Running task 1645 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package)
NOTE: recipe libdrm-2.4.114-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe acl-2.3.1-r0: task do_package: Started
NOTE: recipe freetype-2.12.1-r0: task do_install: Succeeded
NOTE: Running task 1646 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot)
NOTE: Running task 1647 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_package)
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.12.1-r0: task do_package: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_install: Succeeded
NOTE: Running task 1648 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot)
NOTE: Running task 1649 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package)
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_install: Succeeded
NOTE: Running task 1650 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_populate_sysroot)
NOTE: Running task 1651 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_package)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe xz-5.2.7-r0: task do_package: Succeeded
NOTE: Running task 1652 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata)
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot: Started
NOTE: Running task 1653 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata)
NOTE: recipe libdrm-2.4.114-r0: task do_package: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_packagedata: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1654 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Succeeded
NOTE: Running task 1655 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1656 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata: Started
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_configure: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1657 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_compile)
NOTE: recipe ncurses-6.3+20220423-r0: task do_compile: Started
NOTE: recipe freetype-2.12.1-r0: task do_package: Succeeded
NOTE: Running task 1658 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata)
NOTE: recipe acl-2.3.1-r0: task do_package: Succeeded
NOTE: Running task 1659 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.114-r0: task do_package: Succeeded
NOTE: Running task 1660 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_packagedata)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata: Succeeded
NOTE: Running task 1661 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1662 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe gmp-6.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1663 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_install)
NOTE: recipe gmp-6.2.1-r0: task do_install: Started
NOTE: recipe libxcb-1.15-r0: task do_configure: Succeeded
NOTE: Running task 1664 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_compile)
NOTE: recipe libxcb-1.15-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_compile: Succeeded
NOTE: Running task 1665 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1666 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install)
NOTE: recipe gmp-6.2.1-r0: task do_install: Succeeded
NOTE: Running task 1667 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot)
NOTE: Running task 1668 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe libpcre-8.45-r0: task do_install: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_install: Succeeded
NOTE: Running task 1669 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1670 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot)
NOTE: Running task 1671 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1672 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_compile)
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Started
NOTE: recipe kmod-30-r0: task do_configure: Succeeded
NOTE: Running task 1673 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_compile)
NOTE: recipe kmod-30-r0: task do_compile: Started
NOTE: recipe libxcb-1.15-r0: task do_compile: Succeeded
NOTE: Running task 1674 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_install)
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Running task 1675 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata)
NOTE: recipe libxcb-1.15-r0: task do_install: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1676 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_install)
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1677 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 1678 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Running task 1679 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata: Succeeded
NOTE: recipe kmod-30-r0: task do_compile: Succeeded
NOTE: Running task 1680 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_install)
NOTE: recipe kmod-30-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Succeeded
NOTE: Running task 1681 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata)
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Succeeded
NOTE: recipe kmod-30-r0: task do_install: Succeeded
NOTE: Running task 1682 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot)
NOTE: Running task 1683 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package)
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-30-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 1684 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_install: Succeeded
NOTE: Running task 1685 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot)
NOTE: Running task 1686 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.15-r0: task do_package: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_compile: Succeeded
NOTE: Running task 1687 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_install)
NOTE: recipe ncurses-6.3+20220423-r0: task do_install: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1688 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-30-r0: task do_package: Succeeded
NOTE: Running task 1689 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata)
NOTE: recipe libx11-1_1.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-30-r0: task do_packagedata: Started
NOTE: recipe kmod-30-r0: task do_packagedata: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1690 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_configure)
NOTE: recipe libx11-1_1.8.1-r0: task do_configure: Started
NOTE: recipe icu-71.1-r0: task do_compile: Succeeded
NOTE: Running task 1691 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_install)
NOTE: recipe icu-71.1-r0: task do_install: Started
NOTE: recipe icu-71.1-r0: task do_install: Succeeded
NOTE: Running task 1692 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_populate_sysroot)
NOTE: Running task 1693 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_package)
NOTE: recipe icu-71.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-71.1-r0: task do_package: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_package: Succeeded
NOTE: Running task 1694 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata)
NOTE: recipe libxcb-1.15-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata: Succeeded
NOTE: recipe icu-71.1-r0: task do_package: Succeeded
NOTE: Running task 1695 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_packagedata)
NOTE: recipe icu-71.1-r0: task do_packagedata: Started
NOTE: recipe icu-71.1-r0: task do_packagedata: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_install: Succeeded
NOTE: Running task 1696 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot)
NOTE: Running task 1697 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_package)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_package: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1698 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1699 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1700 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe readline-8.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.1.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.7-r0: task do_install: Succeeded
NOTE: Running task 1701 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_install_ptest_base)
NOTE: recipe openssl-3.0.7-r0: task do_install_ptest_base: Started
NOTE: recipe psmisc-23.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1702 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_configure)
NOTE: Running task 1703 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_configure)
NOTE: recipe readline-8.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1704 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_configure)
NOTE: recipe psmisc-23.5-r0: task do_configure: Started
NOTE: recipe bash-5.1.16-r0: task do_configure: Started
NOTE: recipe readline-8.1.2-r0: task do_configure: Started
NOTE: recipe openssl-3.0.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1705 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot)
NOTE: Running task 1706 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_package)
NOTE: recipe openssl-3.0.7-r0: task do_package: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_compile: Succeeded
NOTE: Running task 1707 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_install)
NOTE: recipe sqlite3-3_3.39.4-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_install: Succeeded
NOTE: Running task 1708 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_populate_sysroot)
NOTE: Running task 1709 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_package)
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1710 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_compile)
NOTE: recipe libx11-1_1.8.1-r0: task do_compile: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_package: Succeeded
NOTE: Running task 1711 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_packagedata)
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1712 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_compile)
NOTE: recipe readline-8.1.2-r0: task do_compile: Started
NOTE: recipe readline-8.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1713 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_install)
NOTE: recipe readline-8.1.2-r0: task do_install: Started
NOTE: recipe readline-8.1.2-r0: task do_install: Succeeded
NOTE: Running task 1714 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot)
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1715 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_package: Succeeded
NOTE: Running task 1716 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Started
NOTE: recipe python3-3.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1717 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_configure)
NOTE: recipe python3-3.11.0-r0: task do_configure: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Succeeded
NOTE: Running task 1718 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_package)
NOTE: recipe readline-8.1.2-r0: task do_package: Started
NOTE: recipe readline-8.1.2-r0: task do_package: Succeeded
NOTE: Running task 1719 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata)
NOTE: recipe readline-8.1.2-r0: task do_packagedata: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1720 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_install)
NOTE: recipe libx11-1_1.8.1-r0: task do_install: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_install: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_configure: Succeeded
NOTE: Running task 1721 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot)
NOTE: Running task 1722 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_package)
NOTE: Running task 1723 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_compile)
NOTE: recipe bash-5.1.16-r0: task do_configure: Succeeded
NOTE: Running task 1724 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_configure_ptest_base)
NOTE: recipe psmisc-23.5-r0: task do_compile: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe bash-5.1.16-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.1.16-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1725 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_compile)
NOTE: recipe bash-5.1.16-r0: task do_compile: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1726 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1727 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1728 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1729 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.5-r0: task do_compile: Succeeded
NOTE: Running task 1730 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.5-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1731 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1732 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe libxshmfence-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1733 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb:do_configure)
NOTE: Running task 1734 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.1-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Started
NOTE: recipe psmisc-23.5-r0: task do_install: Succeeded
NOTE: Running task 1735 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_package)
NOTE: recipe psmisc-23.5-r0: task do_package: Started
NOTE: recipe flex-2.6.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1736 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_install)
NOTE: recipe flex-2.6.4-r0: task do_install: Started
NOTE: recipe flex-2.6.4-r0: task do_install: Succeeded
NOTE: Running task 1737 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_install_ptest_base)
NOTE: recipe flex-2.6.4-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.1.16-r0: task do_compile: Succeeded
NOTE: Running task 1738 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_compile_ptest_base)
NOTE: recipe psmisc-23.5-r0: task do_package: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_compile_ptest_base: Started
NOTE: Running task 1739 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_packagedata)
NOTE: recipe flex-2.6.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1740 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot)
NOTE: Running task 1741 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package)
NOTE: recipe psmisc-23.5-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_package: Succeeded
NOTE: Running task 1742 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata)
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot: Started
NOTE: recipe flex-2.6.4-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata: Started
NOTE: recipe psmisc-23.5-r0: task do_packagedata: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1743 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm)
NOTE: Running task 1744 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm: Started
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1745 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_configure: Started
NOTE: recipe bash-5.1.16-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1746 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_install)
NOTE: recipe bash-5.1.16-r0: task do_install: Started
NOTE: recipe flex-2.6.4-r0: task do_package: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1747 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: Running task 1748 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Succeeded
NOTE: Running task 1749 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1750 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb:do_compile)
NOTE: recipe libxshmfence-1.3.1-r0: task do_compile: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1751 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Succeeded
NOTE: Running task 1752 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_install)
NOTE: recipe libxshmfence-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1753 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb:do_install)
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3.1-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1754 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 1755 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: Running task 1756 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot)
NOTE: Running task 1757 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package)
NOTE: recipe libxshmfence-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1758 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 1759 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb:do_package)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3.1-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1760 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1761 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Started
NOTE: recipe bash-5.1.16-r0: task do_install: Succeeded
NOTE: Running task 1762 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_install_ptest_base)
NOTE: recipe bash-5.1.16-r0: task do_install_ptest_base: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1763 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Succeeded
NOTE: recipe libxshmfence-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 1764 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata)
NOTE: Running task 1765 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Succeeded
NOTE: recipe libxshmfence-1.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1766 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_compile)
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1767 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_install)
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1768 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1769 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_package)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1770 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1771 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1772 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_configure)
NOTE: Running task 1773 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Started
NOTE: recipe bash-5.1.16-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1774 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package)
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1775 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata)
NOTE: recipe bash-5.1.16-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1776 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1777 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile)
NOTE: recipe libpam-1.5.2-r0: task do_compile: Started
NOTE: recipe python3-3.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1778 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_configure_ptest_base)
NOTE: recipe python3-3.11.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.11.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1779 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1780 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_compile)
NOTE: recipe python3-3.11.0-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Started
NOTE: recipe bash-5.1.16-r0: task do_package: Succeeded
NOTE: Running task 1781 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata)
NOTE: recipe bash-5.1.16-r0: task do_packagedata: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1782 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_install)
NOTE: recipe bash-5.1.16-r0: task do_packagedata: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1783 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 1784 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 1785 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_package: Succeeded
NOTE: Running task 1786 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata)
NOTE: recipe openssl-3.0.7-r0: task do_packagedata: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1787 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_compile)
NOTE: Running task 1788 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1789 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1790 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_install)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1791 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1792 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1793 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 1794 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1795 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1796 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_configure)
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 1797 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata)
NOTE: Running task 1798 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_compile: Succeeded
NOTE: Running task 1799 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_compile_ptest_base)
NOTE: recipe python3-3.11.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.11.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1800 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_install)
NOTE: recipe python3-3.11.0-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1801 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_compile)
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1802 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_install)
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Succeeded
NOTE: Running task 1803 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot)
NOTE: Running task 1804 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1805 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile_ptest_base)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1806 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install)
NOTE: recipe libpam-1.5.2-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Succeeded
NOTE: Running task 1807 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1808 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1809 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1810 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1811 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1812 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1813 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.66-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.12.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.66-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1814 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_configure)
NOTE: recipe shadow-4.12.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1815 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.3.bb:do_configure)
NOTE: recipe util-linux-2.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1816 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_configure)
NOTE: recipe libcap-2.66-r0: task do_configure: Started
NOTE: recipe libcap-2.66-r0: task do_configure: Succeeded
NOTE: recipe shadow-4.12.3-r0: task do_configure: Started
NOTE: Running task 1817 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_compile)
NOTE: recipe util-linux-2.38.1-r0: task do_configure: Started
NOTE: recipe libcap-2.66-r0: task do_compile: Started
NOTE: recipe libcap-2.66-r0: task do_compile: Succeeded
NOTE: Running task 1818 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_install)
NOTE: recipe libcap-2.66-r0: task do_install: Started
NOTE: recipe libcap-2.66-r0: task do_install: Succeeded
NOTE: Running task 1819 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_populate_sysroot)
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1820 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1821 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Succeeded
NOTE: Running task 1822 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1823 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_package)
NOTE: recipe libcap-2.66-r0: task do_package: Started
NOTE: recipe libcap-2.66-r0: task do_package: Succeeded
NOTE: Running task 1824 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata)
NOTE: recipe libcap-2.66-r0: task do_packagedata: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata: Succeeded
NOTE: recipe shadow-4.12.3-r0: task do_configure: Succeeded
NOTE: Running task 1825 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.3.bb:do_compile)
NOTE: recipe shadow-4.12.3-r0: task do_compile: Started
NOTE: recipe shadow-4.12.3-r0: task do_compile: Succeeded
NOTE: Running task 1826 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.3.bb:do_install)
NOTE: recipe shadow-4.12.3-r0: task do_install: Started
NOTE: recipe shadow-4.12.3-r0: task do_install: Succeeded
NOTE: Running task 1827 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.3.bb:do_populate_sysroot)
NOTE: Running task 1828 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.3.bb:do_package)
NOTE: recipe shadow-4.12.3-r0: task do_populate_sysroot: Started
NOTE: recipe shadow-4.12.3-r0: task do_package: Started
NOTE: recipe shadow-4.12.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_configure: Succeeded
NOTE: Running task 1829 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.38.1-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.38.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1830 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_compile)
NOTE: recipe util-linux-2.38.1-r0: task do_compile: Started
NOTE: recipe shadow-4.12.3-r0: task do_package: Succeeded
NOTE: Running task 1831 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.3.bb:do_packagedata)
NOTE: recipe shadow-4.12.3-r0: task do_packagedata: Started
NOTE: recipe shadow-4.12.3-r0: task do_packagedata: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_compile: Succeeded
NOTE: Running task 1832 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.38.1-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-2.38.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1833 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_install)
NOTE: recipe util-linux-2.38.1-r0: task do_install: Started
NOTE: recipe python3-3.11.0-r0: task do_install: Succeeded
NOTE: Running task 1834 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_install_ptest_base)
NOTE: recipe python3-3.11.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.11.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1835 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot)
NOTE: Running task 1836 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_package)
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-3.11.0-r0: task do_package: Started
NOTE: recipe util-linux-2.38.1-r0: task do_install: Succeeded
NOTE: Running task 1837 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.38.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1838 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.9.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.38.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1839 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot)
NOTE: Running task 1840 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package)
NOTE: recipe util-linux-2.38.1-r0: task do_package: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.9.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1841 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_configure)
NOTE: recipe libxml2-2.9.14-r0: task do_configure: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1842 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1843 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1844 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1845 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_configure)
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1846 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_configure)
NOTE: recipe fontconfig-2.14.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1847 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_configure)
NOTE: recipe eudev-3.2.11-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_configure: Started
NOTE: recipe libxml2-2.9.14-r0: task do_configure: Succeeded
NOTE: Running task 1848 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.9.14-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.9.14-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1849 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_compile)
NOTE: recipe libxml2-2.9.14-r0: task do_compile: Started
NOTE: recipe eudev-3.2.11-r0: task do_configure: Succeeded
NOTE: Running task 1850 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_compile)
NOTE: recipe eudev-3.2.11-r0: task do_compile: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_configure: Succeeded
NOTE: Running task 1851 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_compile)
NOTE: recipe fontconfig-2.14.1-r0: task do_compile: Started
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: Running task 1852 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure_ptest_base)
NOTE: recipe python3-3.11.0-r0: task do_package: Succeeded
NOTE: Running task 1853 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_configure: Succeeded
NOTE: Running task 1854 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1855 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.11.0-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1856 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_compile: Started
NOTE: recipe python3-3.11.0-r0: task do_packagedata: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_compile: Succeeded
NOTE: Running task 1857 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_install)
NOTE: recipe fontconfig-2.14.1-r0: task do_install: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package: Succeeded
NOTE: Running task 1858 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.11-r0: task do_compile: Succeeded
NOTE: Running task 1859 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_install)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_install: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_install: Succeeded
NOTE: Running task 1860 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_populate_sysroot)
NOTE: Running task 1861 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_package)
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_install: Succeeded
NOTE: Running task 1862 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot)
NOTE: Running task 1863 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_package)
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.11-r0: task do_package: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_compile: Succeeded
NOTE: Running task 1864 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.9.14-r0: task do_compile_ptest_base: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_package: Succeeded
NOTE: Running task 1865 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_package: Succeeded
NOTE: Running task 1866 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_compile: Succeeded
NOTE: Running task 1867 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1868 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_install: Started
NOTE: recipe coreutils-9.1-r0: task do_compile: Succeeded
NOTE: Running task 1869 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1870 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install)
NOTE: recipe coreutils-9.1-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_install: Succeeded
NOTE: Running task 1871 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1872 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot)
NOTE: Running task 1873 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_package: Started
NOTE: recipe coreutils-9.1-r0: task do_install: Succeeded
NOTE: Running task 1874 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1875 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1876 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1877 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1878 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1879 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1880 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_configure)
NOTE: recipe dbus-1.14.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1881 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1882 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe vala-0.56.3-r0: task do_configure: Started
NOTE: recipe dbus-1.14.4-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1883 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1884 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 1885 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 1886 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_configure: Succeeded
NOTE: Running task 1887 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_compile)
NOTE: recipe vala-0.56.3-r0: task do_compile: Started
NOTE: recipe libxml2-2.9.14-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1888 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_install)
NOTE: recipe libxml2-2.9.14-r0: task do_install: Started
NOTE: recipe libxml2-2.9.14-r0: task do_install: Succeeded
NOTE: Running task 1889 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.9.14-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_package: Succeeded
NOTE: Running task 1890 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.14-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1891 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot)
NOTE: Running task 1892 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_package)
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.9.14-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1893 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: Running task 1894 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1895 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure)
NOTE: recipe wayland-1.21.0-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 1896 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_configure: Succeeded
NOTE: Running task 1897 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1898 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile)
NOTE: recipe wayland-1.21.0-r0: task do_compile: Started
NOTE: recipe wayland-1.21.0-r0: task do_compile: Succeeded
NOTE: Running task 1899 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile_ptest_base)
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1900 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_install)
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Running task 1901 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe wayland-1.21.0-r0: task do_install: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe wayland-1.21.0-r0: task do_install: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1902 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_install_ptest_base)
NOTE: Running task 1903 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_install_ptest_base: Started
NOTE: Running task 1904 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_install)
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Started
NOTE: Running task 1905 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot)
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1906 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.4-r0: task do_configure: Succeeded
NOTE: Running task 1907 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_configure_ptest_base)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.4-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Succeeded
NOTE: Running task 1908 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_compile)
NOTE: Running task 1909 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot)
NOTE: Running task 1910 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Started
NOTE: recipe dbus-1.14.4-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1911 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_configure: Succeeded
NOTE: Running task 1912 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Succeeded
NOTE: Running task 1913 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_compile: Succeeded
NOTE: Running task 1914 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_compile_ptest_base)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_compile: Succeeded
NOTE: Running task 1915 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_install)
NOTE: recipe dbus-1.14.4-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1916 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_install)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_install: Started
NOTE: recipe dbus-1.14.4-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_install: Succeeded
NOTE: Running task 1917 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_populate_sysroot)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1918 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_22.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1919 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_configure)
NOTE: recipe mesa-2_22.2.3-r0: task do_configure: Started
NOTE: recipe dbus-1.14.4-r0: task do_install: Succeeded
NOTE: Running task 1920 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.4-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1921 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot)
NOTE: Running task 1922 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_package)
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.4-r0: task do_package: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1923 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dbus-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1924 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_configure)
NOTE: recipe python3-dbus-1.3.2-r0: task do_configure: Started
NOTE: recipe vala-0.56.3-r0: task do_compile: Succeeded
NOTE: Running task 1925 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_install)
NOTE: recipe libxml2-2.9.14-r0: task do_package: Succeeded
NOTE: Running task 1926 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata)
NOTE: recipe vala-0.56.3-r0: task do_install: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata: Succeeded
NOTE: Running task 1927 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package)
NOTE: recipe wayland-1.21.0-r0: task do_package: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1928 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_compile)
NOTE: recipe python3-dbus-1.3.2-r0: task do_compile: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1929 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_install)
NOTE: recipe vala-0.56.3-r0: task do_install: Succeeded
NOTE: Running task 1930 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_populate_sysroot)
NOTE: Running task 1931 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_package)
NOTE: recipe python3-dbus-1.3.2-r0: task do_install: Started
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.3-r0: task do_package: Started
NOTE: recipe dbus-1.14.4-r0: task do_package: Succeeded
NOTE: Running task 1932 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata)
NOTE: recipe dbus-1.14.4-r0: task do_packagedata: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_install: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1933 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_package)
NOTE: Running task 1934 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1935 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_package_write_rpm)
NOTE: recipe python3-dbus-1.3.2-r0: task do_package: Started
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.4-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.21.0-r0: task do_package: Succeeded
NOTE: Running task 1936 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1937 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_configure)
NOTE: recipe libical-3.0.16-r0: task do_configure: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1938 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_package)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_package: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1939 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_compile)
NOTE: recipe mesa-2_22.2.3-r0: task do_compile: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1940 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_packagedata)
NOTE: recipe python3-dbus-1.3.2-r0: task do_packagedata: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1941 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_package_write_rpm)
NOTE: recipe python3-dbus-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe vala-0.56.3-r0: task do_package: Succeeded
NOTE: Running task 1942 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata)
NOTE: recipe dbus-1.14.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_package: Succeeded
NOTE: Running task 1943 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_configure: Succeeded
NOTE: Running task 1944 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_compile)
NOTE: recipe libical-3.0.16-r0: task do_compile: Started
NOTE: recipe libical-3.0.16-r0: task do_compile: Succeeded
NOTE: Running task 1945 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_install)
NOTE: recipe libical-3.0.16-r0: task do_install: Started
NOTE: recipe libical-3.0.16-r0: task do_install: Succeeded
NOTE: Running task 1946 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot)
NOTE: Running task 1947 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_package)
NOTE: recipe libical-3.0.16-r0: task do_package: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1948 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.66-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.66-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1949 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_configure)
NOTE: recipe bluez5-5.66-r0: task do_configure: Started
NOTE: recipe libical-3.0.16-r0: task do_package: Succeeded
NOTE: Running task 1950 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata)
NOTE: recipe libical-3.0.16-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_configure: Succeeded
NOTE: Running task 1951 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.66-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.66-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1952 of 1986 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_compile)
NOTE: recipe bluez5-5.66-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-musl', 'i686-linux-musl', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/bluetooth.h lib/bluetooth/bluetooth.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/hci.h lib/bluetooth/hci.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/hci_lib.h lib/bluetooth/hci_lib.h
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/sco.h lib/bluetooth/sco.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/l2cap.h lib/bluetooth/l2cap.h
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p ell
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/sdp.h lib/bluetooth/sdp.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/sdp_lib.h lib/bluetooth/sdp_lib.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/rfcomm.h lib/bluetooth/rfcomm.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/bnep.h lib/bluetooth/bnep.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/cmtp.h lib/bluetooth/cmtp.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/hidp.h lib/bluetooth/hidp.h
| for f in  ; do \
| 	if [ ! -f $f ] ; then \
| 		ln -s -t ell -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build/../bluez-5.66/../ell/$f ; \
| 	fi \
| done > ell/shared
| ../bluez-5.66/src/genbuiltin hostname wiimote autopair policy    a2dp avrcp network input hog  gap scanparam deviceinfo  battery bap mcp vcp > src/builtin.h
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p obexd/src/
| ../bluez-5.66/obexd/src/genbuiltin filesystem bluetooth  opp ftp irmc pbap mas mns > obexd/src/builtin.h
| make --no-print-directory all-am
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/sdp-xml.o ../bluez-5.66/src/sdp-xml.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/mcaptest.o ../bluez-5.66/tools/mcaptest.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/cltest.o ../bluez-5.66/tools/cltest.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/oobtest.o ../bluez-5.66/tools/oobtest.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/advtest.o ../bluez-5.66/tools/advtest.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/seq2bseq.o ../bluez-5.66/tools/seq2bseq.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/nokfw.o ../bluez-5.66/tools/nokfw.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/rtlfw.o ../bluez-5.66/tools/rtlfw.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/bcmfw.o ../bluez-5.66/tools/bcmfw.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/create-image.o ../bluez-5.66/tools/create-image.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/eddystone.o ../bluez-5.66/tools/eddystone.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/ibeacon.o ../bluez-5.66/tools/ibeacon.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/btgatt-client.o ../bluez-5.66/tools/btgatt-client.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/uuid-helper.o ../bluez-5.66/src/uuid-helper.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/btgatt-server.o ../bluez-5.66/tools/btgatt-server.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/test-runner.o ../bluez-5.66/tools/test-runner.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/check-selftest.o ../bluez-5.66/tools/check-selftest.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/gatt-service.o ../bluez-5.66/tools/gatt-service.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/btmgmt.o ../bluez-5.66/tools/btmgmt.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/obex-client-tool.o ../bluez-5.66/tools/obex-client-tool.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/obex-server-tool.o ../bluez-5.66/tools/obex-server-tool.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/bluetooth-player.o ../bluez-5.66/tools/bluetooth-player.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/obexctl.o ../bluez-5.66/tools/obexctl.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o profiles/network/bluetoothd-manager.o `test -f 'profiles/network/manager.c' || echo '../bluez-5.66/'`profiles/network/manager.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o profiles/network/bluetoothd-bnep.o `test -f 'profiles/network/bnep.c' || echo '../bluez-5.66/'`profiles/network/bnep.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o profiles/network/bluetoothd-server.o `test -f 'profiles/network/server.c' || echo '../bluez-5.66/'`profiles/network/server.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o profiles/network/bluetoothd-connection.o `test -f 'profiles/network/connection.c' || echo '../bluez-5.66/'`profiles/network/connection.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o profiles/audio/bluetoothd-bap.o `test -f 'profiles/audio/bap.c' || echo '../bluez-5.66/'`profiles/audio/bap.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o profiles/audio/bluetoothd-mcp.o `test -f 'profiles/audio/mcp.c' || echo '../bluez-5.66/'`profiles/audio/mcp.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o profiles/audio/bluetoothd-vcp.o `test -f 'profiles/audio/vcp.c' || echo '../bluez-5.66/'`profiles/audio/vcp.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o attrib/bluetoothd-att.o `test -f 'attrib/att.c' || echo '../bluez-5.66/'`attrib/att.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o attrib/bluetoothd-gatt.o `test -f 'attrib/gatt.c' || echo '../bluez-5.66/'`attrib/gatt.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o attrib/bluetoothd-gattrib.o `test -f 'attrib/gattrib.c' || echo '../bluez-5.66/'`attrib/gattrib.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o btio/bluetoothd-btio.o `test -f 'btio/btio.c' || echo '../bluez-5.66/'`btio/btio.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-main.o `test -f 'src/main.c' || echo '../bluez-5.66/'`src/main.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-log.o `test -f 'src/log.c' || echo '../bluez-5.66/'`src/log.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-backtrace.o `test -f 'src/backtrace.c' || echo '../bluez-5.66/'`src/backtrace.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-rfkill.o `test -f 'src/rfkill.c' || echo '../bluez-5.66/'`src/rfkill.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-sdpd-server.o `test -f 'src/sdpd-server.c' || echo '../bluez-5.66/'`src/sdpd-server.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-sdpd-request.o `test -f 'src/sdpd-request.c' || echo '../bluez-5.66/'`src/sdpd-request.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-sdpd-service.o `test -f 'src/sdpd-service.c' || echo '../bluez-5.66/'`src/sdpd-service.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-sdpd-database.o `test -f 'src/sdpd-database.c' || echo '../bluez-5.66/'`src/sdpd-database.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-gatt-database.o `test -f 'src/gatt-database.c' || echo '../bluez-5.66/'`src/gatt-database.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-sdp-xml.o `test -f 'src/sdp-xml.c' || echo '../bluez-5.66/'`src/sdp-xml.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-sdp-client.o `test -f 'src/sdp-client.c' || echo '../bluez-5.66/'`src/sdp-client.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-textfile.o `test -f 'src/textfile.c' || echo '../bluez-5.66/'`src/textfile.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-uuid-helper.o `test -f 'src/uuid-helper.c' || echo '../bluez-5.66/'`src/uuid-helper.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-plugin.o `test -f 'src/plugin.c' || echo '../bluez-5.66/'`src/plugin.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-storage.o `test -f 'src/storage.c' || echo '../bluez-5.66/'`src/storage.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-advertising.o `test -f 'src/advertising.c' || echo '../bluez-5.66/'`src/advertising.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-agent.o `test -f 'src/agent.c' || echo '../bluez-5.66/'`src/agent.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-error.o `test -f 'src/error.c' || echo '../bluez-5.66/'`src/error.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-adapter.o `test -f 'src/adapter.c' || echo '../bluez-5.66/'`src/adapter.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-profile.o `test -f 'src/profile.c' || echo '../bluez-5.66/'`src/profile.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-service.o `test -f 'src/service.c' || echo '../bluez-5.66/'`src/service.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-gatt-client.o `test -f 'src/gatt-client.c' || echo '../bluez-5.66/'`src/gatt-client.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-device.o `test -f 'src/device.c' || echo '../bluez-5.66/'`src/device.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-dbus-common.o `test -f 'src/dbus-common.c' || echo '../bluez-5.66/'`src/dbus-common.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-eir.o `test -f 'src/eir.c' || echo '../bluez-5.66/'`src/eir.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-adv_monitor.o `test -f 'src/adv_monitor.c' || echo '../bluez-5.66/'`src/adv_monitor.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-battery.o `test -f 'src/battery.c' || echo '../bluez-5.66/'`src/battery.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"          -O2 -p
 ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/bluetoothd-settings.o `test -f 'src/settings.c' || echo '../bluez-5.66/'`src/settings.c
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p src/ && sed -e 's,@pkglibexecdir\@,/usr/libexec/bluetooth,g' -e 's,@libexecdir\@,/usr/libexec,g' -e 's,@statedir\@,/var/lib/bluetooth,g' -e 's,@confdir\@,/etc/bluetooth,g' < ../bluez-5.66/src/bluetooth.service.in > src/bluetooth.service
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include  -DOBEX_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/obex/plugins"\" -D_FILE_OFFSET_BITS=64 -I./lib -I./obexd/src        -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o btio/obexd-btio.o `test -f 'btio/btio.c' || echo '../bluez-5.66/'`btio/btio.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include  -DOBEX_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/obex/plugins"\" -D_FILE_OFFSET_BITS=64 -I./lib -I./obexd/src        -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o gobex/obexd-gobex.o `test -f 'gobex/gobex.c' || echo '../bluez-5.66/'`gobex/gobex.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include  -DOBEX_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/obex/plugins"\" -D_FILE_OFFSET_BITS=64 -I./lib -I./obexd/src        -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o gobex/obexd-gobex-defs.o `test -f 'gobex/gobex-defs.c' || echo '../bluez-5.66/'`gobex/gobex-defs.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include  -DOBEX_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/obex/plugins"\" -D_FILE_OFFSET_BITS=64 -I./lib -I./obexd/src        -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o gobex/obexd-gobex-packet.o `test -f 'gobex/gobex-packet.c' || echo '../bluez-5.66/'`gobex/gobex-packet.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include  -DOBEX_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/obex/plugins"\" -D_FILE_OFFSET_BITS=64 -I./lib -I./obexd/src        -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o gobex/obexd-gobex-header.o `test -f 'gobex/gobex-header.c' || echo '../bluez-5.66/'`gobex/gobex-header.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include  -DOBEX_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/obex/plugins"\" -D_FILE_OFFSET_BITS=64 -I./lib -I./obexd/src        -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o gobex/obexd-gobex-transfer.o `test -f 'gobex/gobex-transfer.c' || echo '../bluez-5.66/'`gobex/gobex-transfer.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include  -DOBEX_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/obex/plugins"\" -D_FILE_OFFSET_BITS=64 -I./lib -I./obexd/src        -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o gobex/obexd-gobex-apparam.o `test -f 'gobex/gobex-apparam.c' || echo '../bluez-5.66/'`gobex/gobex-apparam.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include  -DOBEX_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/obex/plugins"\" -D_FILE_OFFSET_BITS=64 -I./lib -I./obexd/src        -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o obexd/client/obexd-manager.o `test -f 'obexd/client/manager.c' || echo '../bluez-5.66/'`obexd/client/manager.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include  -DOBEX_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/obex/plugins"\" -D_FILE_OFFSET_BITS=64 -I./lib -I./obexd/src        -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o obexd/client/obexd-session.o `test -f 'obexd/client/session.c' || echo '../bluez-5.66/'`obexd/client/session.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include  -DOBEX_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/obex/plugins"\" -D_FILE_OFFSET_BITS=64 -I./lib -I./obexd/src        -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o obexd/client/obexd-bluetooth.o `test -f 'obexd/client/bluetooth.c' || echo '../bluez-5.66/'`obexd/client/bluetooth.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include  -DOBEX_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/obex/plugins"\" -D_FILE_OFFSET_BITS=64 -I./lib -I./obexd/src        -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o obexd/client/obexd-sync.o `test -f 'obexd/client/sync.c' || echo '../bluez-5.66/'`obexd/client/sync.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include  -DOBEX_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/obex/plugins"\" -D_FILE_OFFSET_BITS=64 -I./lib -I./obexd/src        -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o obexd/client/obexd-pbap.o `test -f 'obexd/client/pbap.c' || echo '../bluez-5.66/'`obexd/client/pbap.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include  -DOBEX_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/obex/plugins"\" -D_FILE_OFFSET_BITS=64 -I./lib -I./obexd/src        -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o obexd/client/obexd-ftp.o `test -f 'obexd/client/ftp.c' || echo '../bluez-5.66/'`obexd/client/ftp.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include  -DOBEX_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/obex/plugins"\" -D_FILE_OFFSET_BITS=64 -I./lib -I./obexd/src        -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o obexd/client/obexd-opp.o `test -f 'obexd/client/opp.c' || echo '../bluez-5.66/'`obexd/client/opp.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include  -DOBEX_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/obex/plugins"\" -D_FILE_OFFSET_BITS=64 -I./lib -I./obexd/src        -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o obexd/client/obexd-map.o `test -f 'obexd/client/map.c' || echo '../bluez-5.66/'`obexd/client/map.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include  -DOBEX_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/obex/plugins"\" -D_FILE_OFFSET_BITS=64 -I./lib -I./obexd/src        -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o obexd/client/obexd-map-event.o `test -f 'obexd/client/map-event.c' || echo '../bluez-5.66/'`obexd/client/map-event.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include  -DOBEX_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/obex/plugins"\" -D_FILE_OFFSET_BITS=64 -I./lib -I./obexd/src        -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o obexd/client/obexd-transfer.o `test -f 'obexd/client/transfer.c' || echo '../bluez-5.66/'`obexd/client/transfer.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include  -DOBEX_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/obex/plugins"\" -D_FILE_OFFSET_BITS=64 -I./lib -I./obexd/src        -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o obexd/client/obexd-transport.o `test -f 'obexd/client/transport.c' || echo '../bluez-5.66/'`obexd/client/transport.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include  -DOBEX_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/obex/plugins"\" -D_FILE_OFFSET_BITS=64 -I./lib -I./obexd/src        -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o obexd/client/obexd-driver.o `test -f 'obexd/client/driver.c' || echo '../bluez-5.66/'`obexd/client/driver.c
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p obexd/src/ && sed -e 's,@pkglibexecdir\@,/usr/libexec/bluetooth,g' -e 's,@libexecdir\@,/usr/libexec,g' -e 's,@statedir\@,/var/lib/bluetooth,g' -e 's,@confdir\@,/etc/bluetooth,g' < ../bluez-5.66/obexd/src/org.bluez.obex.service.in > obexd/src/org.bluez.obex.service
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o client/main.o ../bluez-5.66/client/main.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o client/display.o ../bluez-5.66/client/display.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o client/agent.o ../bluez-5.66/client/agent.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o client/advertising.o ../bluez-5.66/client/advertising.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o client/adv_monitor.o ../bluez-5.66/client/adv_monitor.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o client/gatt.o ../bluez-5.66/client/gatt.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o client/admin.o ../bluez-5.66/client/admin.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-s
 ysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o client/player.o ../bluez-5.66/client/player.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o gdbus/mainloop.lo ../bluez-5.66/gdbus/mainloop.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o gdbus/watch.lo ../bluez-5.66/gdbus/watch.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o gdbus/object.lo ../bluez-5.66/gdbus/object.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o gdbus/client.lo ../bluez-5.66/gdbus/client.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o gdbus/polkit.lo ../bluez-5.66/gdbus/polkit.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-queue.lo `test -f 'src/shared/queue.c' || echo '../bluez-5.66/'`src/shared/queue.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-util.lo `test -f 'src/shared/util.c' || echo '../bluez-5.66/'`src/shared/util.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-mgmt.lo `test -f 'src/shared/mgmt.c' || echo '../bluez-5.66/'`src/shared/mgmt.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-crypto.lo `test -f 'src/shared/crypto.c' || echo '../bluez-5.66/'`src/shared/crypto.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-ecc.lo `test -f 'src/shared/ecc.c' || echo '../bluez-5.66/'`src/shared/ecc.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-ringbuf.lo `test -f 'src/shared/ringbuf.c' || echo '../bluez-5.66/'`src/shared/ringbuf.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-hci.lo `test -f 'src/shared/hci.c' || echo '../bluez-5.66/'`src/shared/hci.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-hci-crypto.lo `test -f 'src/shared/hci-crypto.c' || echo '../bluez-5.66/'`src/shared/hci-crypto.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-hfp.lo `test -f 'src/shared/hfp.c' || echo '../bluez-5.66/'`src/shared/hfp.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-uhid.lo `test -f 'src/shared/uhid.c' || echo '../bluez-5.66/'`src/shared/uhid.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-pcap.lo `test -f 'src/shared/pcap.c' || echo '../bluez-5.66/'`src/shared/pcap.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-btsnoop.lo `test -f 'src/shared/btsnoop.c' || echo '../bluez-5.66/'`src/shared/btsnoop.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-ad.lo `test -f 'src/shared/ad.c' || echo '../bluez-5.66/'`src/shared/ad.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-att.lo `test -f 'src/shared/att.c' || echo '../bluez-5.66/'`src/shared/att.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-gatt-helpers.lo `test -f 'src/shared/gatt-helpers.c' || echo '../bluez-5.66/'`src/shared/gatt-helpers.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-gatt-client.lo `test -f 'src/shared/gatt-client.c' || echo '../bluez-5.66/'`src/shared/gatt-client.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-gatt-server.lo `test -f 'src/shared/gatt-server.c' || echo '../bluez-5.66/'`src/shared/gatt-server.c
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/gdbus/mainloop.c  -fPIC -DPIC -o gdbus/.libs/mainloop.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/gdbus/polkit.c  -fPIC -DPIC -o gdbus/.libs/polkit.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/gdbus/watch.c  -fPIC -DPIC -o gdbus/.libs/watch.o
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-gatt-db.lo `test -f 'src/shared/gatt-db.c' || echo '../bluez-5.66/'`src/shared/gatt-db.c
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/gdbus/object.c  -fPIC -DPIC -o gdbus/.libs/object.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/gdbus/client.c  -fPIC -DPIC -o gdbus/.libs/client.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/mgmt.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-mgmt.o
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-gap.lo `test -f 'src/shared/gap.c' || echo '../bluez-5.66/'`src/shared/gap.c
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/queue.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-queue.o
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-log.lo `test -f 'src/shared/log.c' || echo '../bluez-5.66/'`src/shared/log.c
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/ecc.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-ecc.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/hci.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-hci.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/hci-crypto.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-hci-crypto.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/crypto.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-crypto.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/ringbuf.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-ringbuf.o
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-bap.lo `test -f 'src/shared/bap.c' || echo '../bluez-5.66/'`src/shared/bap.c
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/util.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-util.o
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-mcp.lo `test -f 'src/shared/mcp.c' || echo '../bluez-5.66/'`src/shared/mcp.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-vcp.lo `test -f 'src/shared/vcp.c' || echo '../bluez-5.66/'`src/shared/vcp.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-shell.lo `test -f 'src/shared/shell.c' || echo '../bluez-5.66/'`src/shared/shell.c
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/btsnoop.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-btsnoop.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/hfp.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-hfp.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/uhid.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-uhid.o
| ../bluez-5.66/src/shared/util.c: In function 'util_debug_va':
| ../bluez-5.66/src/shared/util.c:68:18: error: 'MAX_INPUT' undeclared (first use in this function)
|    68 |         char str[MAX_INPUT];
|       |                  ^~~~~~~~~
| ../bluez-5.66/src/shared/util.c:68:18: note: each undeclared identifier is reported only once for each function it appears in
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/att.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-att.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/ad.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-ad.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/gatt-helpers.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-gatt-helpers.o
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib        -O2 -pipe -g -feliminate-unused-d
 ebug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_glib_la-io-glib.lo `test -f 'src/shared/io-glib.c' || echo '../bluez-5.66/'`src/shared/io-glib.c
| make[1]: *** [Makefile:7899: src/shared/libshared_glib_la-util.lo] Error 1
| make[1]: *** Waiting for unfinished jobs....
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/pcap.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-pcap.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/gatt-client.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-gatt-client.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/gatt-db.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-gatt-db.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/gatt-server.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-gatt-server.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/mcp.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-mcp.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/shell.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-shell.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/gap.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-gap.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/log.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-log.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/bap.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-bap.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/vcp.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-vcp.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pok
 ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe
 -sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/io-glib.c  -fPIC -DPIC -o src/shared/.libs/libshared_glib_la-io-glib.o
| make: *** [Makefile:4468: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/temp/run.do_compile.1055874:184 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/temp/run.do_compile.1055874, line 184
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/temp/run.do_compile.1055874, line 168
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/temp/run.do_compile.1055874, line 163
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/temp/run.do_compile.1055874, line 158
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/temp/run.do_compile.1055874, line 153
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/temp/run.do_compile.1055874, line 197
NOTE: recipe bluez5-5.66-r0: task do_compile: Failed
NOTE: recipe mesa-2_22.2.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1952 tasks of which 1003 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: bluez5-5.66-r0 do_compile: oe_runmake failed
ERROR: bluez5-5.66-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/temp/run.do_compile.1055874', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/temp/log.do_compile.1055874
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_compile) failed with exit code '1'

--===============7975664458551537654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bluez5/bluez5-dbg: FILELIST: removed "/usr/lib/.debug/libbluetooth.so.3.19.7", added "/usr/lib/.debug/libbluetooth.so.3.19.8 /usr/lib/bluez5/ptest/unit/.debug/test-tester"
packages/core2-32-poky-linux/bluez5/bluez5-dbg: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-dbg: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-dbg: PKGSIZE changed from 25149244 to 25733232 (+2%)
packages/core2-32-poky-linux/bluez5/bluez5-dev: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-dev: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-doc: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-doc: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-locale: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-locale: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: PKGSIZE changed from 4579096 to 4588536 (+0%)
packages/core2-32-poky-linux/bluez5/bluez5-obex: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-obex: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-ptest: FILELIST: added "/usr/lib/bluez5/ptest/unit/test-tester"
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PKGSIZE changed from 3894239 to 4010643 (+3%)
packages/core2-32-poky-linux/bluez5/bluez5-src: FILELIST: directory renamed /usr/src/debug/bluez5/5.65-r0/gobex -> /usr/src/debug/bluez5/5.66-r0/gobex, directory renamed /usr/src/debug/bluez5/5.65-r0/obexd/src -> /usr/src/debug/bluez5/5.66-r0/obexd/src, directory renamed /usr/src/debug/bluez5/5.65-r0/profiles/input -> /usr/src/debug/bluez5/5.66-r0/profiles/input, directory renamed /usr/src/debug/bluez5/5.65-r0/monitor -> /usr/src/debug/bluez5/5.66-r0/monitor, directory renamed /usr/src/debug/bluez5/5.65-r0/tools/parser -> /usr/src/debug/bluez5/5.66-r0/tools/parser, directory renamed /usr/src/debug/bluez5/5.65-r0/profiles/network -> /usr/src/debug/bluez5/5.66-r0/profiles/network, directory renamed /usr/src/debug/bluez5/5.65-r0/obexd/client -> /usr/src/debug/bluez5/5.66-r0/obexd/client, directory renamed /usr/src/debug/bluez5/5.65-r0/btio -> /usr/src/debug/bluez5/5.66-r0/btio, directory renamed /usr/src/debug/bluez5/5.65-r0/client -> /usr/src/debug/bluez5/5.66-r0/client, directory rena
 med /usr/src/debug/bluez5/5.65-r0/profiles/battery -> /usr/src/debug/bluez5/5.66-r0/profiles/battery, directory renamed /usr/src/debug/bluez5/5.65-r0/profiles/scanparam -> /usr/src/debug/bluez5/5.66-r0/profiles/scanparam, directory renamed /usr/src/debug/bluez5/5.65-r0/lib -> /usr/src/debug/bluez5/5.66-r0/lib, directory renamed /usr/src/debug/bluez5/5.65-r0/profiles/deviceinfo -> /usr/src/debug/bluez5/5.66-r0/profiles/deviceinfo, directory renamed /usr/src/debug/bluez5/5.65-r0/android -> /usr/src/debug/bluez5/5.66-r0/android, directory renamed /usr/src/debug/bluez5/5.65-r0/attrib -> /usr/src/debug/bluez5/5.66-r0/attrib, directory renamed /usr/src/debug/bluez5/5.65-r0/gdbus -> /usr/src/debug/bluez5/5.66-r0/gdbus, directory renamed /usr/src/debug/bluez5/5.65-r0/profiles/health -> /usr/src/debug/bluez5/5.66-r0/profiles/health, directory renamed /usr/src/debug/bluez5/5.65-r0/tools -> /usr/src/debug/bluez5/5.66-r0/tools, directory renamed /usr/src/debug/bluez5/5.65-r0/obexd/plugins -> /u
 sr/src/debug/bluez5/5.66-r0/obexd/plugins, directory renamed /usr/src/debug/bluez5/5.65-r0/profiles/iap -> /usr/src/debug/bluez5/5.66-r0/profiles/iap, directory renamed /usr/src/debug/bluez5/5.65-r0/src -> /usr/src/debug/bluez5/5.66-r0/src, directory renamed /usr/src/debug/bluez5/5.65-r0/plugins -> /usr/src/debug/bluez5/5.66-r0/plugins, directory renamed /usr/src/debug/bluez5/5.65-r0/profiles/gap -> /usr/src/debug/bluez5/5.66-r0/profiles/gap, removed "/usr/src/debug/bluez5/5.65-r0/profiles/audio/avctp.c /usr/src/debug/bluez5/5.65-r0/unit/test-crc.c /usr/src/debug/bluez5/5.65-r0/src/shared/mainloop.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/control.h /usr/src/debug/bluez5/5.65-r0/profiles/audio/source.c /usr/src/debug/bluez5/5.65-r0/src/shared/btsnoop.h /usr/src/debug/bluez5/5.65-r0/unit/util.h /usr/src/debug/bluez5/5.65-r0/unit/test-eir.c /usr/src/debug/bluez5/5.65-r0/src/shared/mainloop-notify.c /usr/src/debug/bluez5/5.65-r0/src/shared/tester.c /usr/src/debug/bluez5/5.65-r0/src
 /shared/timeout-glib.c /usr/src/debug/bluez5/5.65-r0/src/shared/crypto.c /usr/src/debug/bluez5/5.65-r0/src/shared/log.c /usr/src/debug/bluez5/5.65-r0/src/shared/hci.c /usr/src/debug/bluez5/5.65-r0/src/shared/uhid.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/sink.h /usr/src/debug/bluez5/5.65-r0/src/shared/queue.h /usr/src/debug/bluez5/5.65-r0/profiles/audio/a2dp-codecs.h /usr/src/debug/bluez5/5.65-r0/src/shared/queue.c /usr/src/debug/bluez5/5.65-r0/unit/test-sdp.c /usr/src/debug/bluez5/5.65-r0/src/shared/ad.c /usr/src/debug/bluez5/5.65-r0/unit/test-gatt.c /usr/src/debug/bluez5/5.65-r0/src/shared/gatt-server.h /usr/src/debug/bluez5/5.65-r0/src/shared/util.h /usr/src/debug/bluez5/5.65-r0/src/shared/io-mainloop.c /usr/src/debug/bluez5/5.65-r0/unit/test-hog.c /usr/src/debug/bluez5/5.65-r0/src/shared/att-types.h /usr/src/debug/bluez5/5.65-r0/src/shared/gatt-server.c /usr/src/debug/bluez5/5.65-r0/src/shared/mgmt.h /usr/src/debug/bluez5/5.65-r0/src/shared/ringbuf.c /usr/src/debug/bluez5/5
 .65-r0/unit/test-avrcp.c /usr/src/debug/bluez5/5.65-r0/src/shared/mainloop.h /usr/src/debug/bluez5/5.65-r0/profiles/audio/a2dp.h /usr/src/debug/bluez5/5.65-r0/profiles/audio/avctp.h /usr/src/debug/bluez5/5.65-r0/src/shared/ringbuf.h /usr/src/debug/bluez5/5.65-r0/unit/test-gobex-packet.c /usr/src/debug/bluez5/5.65-r0/src/shared/util.c /usr/src/debug/bluez5/5.65-r0/src/shared/ecc.h /usr/src/debug/bluez5/5.65-r0/src/shared/io-glib.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/transport.h /usr/src/debug/bluez5/5.65-r0/src/shared/ad.h /usr/src/debug/bluez5/5.65-r0/src/shared/att.h /usr/src/debug/bluez5/5.65-r0/profiles/audio/transport.c /usr/src/debug/bluez5/5.65-r0/unit/test-crypto.c /usr/src/debug/bluez5/5.65-r0/unit/test-lib.c /usr/src/debug/bluez5/5.65-r0/src/shared/gatt-client.c /usr/src/debug/bluez5/5.65-r0/src/shared/crypto.h /usr/src/debug/bluez5/5.65-r0/profiles/audio/media.h /usr/src/debug/bluez5/5.65-r0/src/shared/hci.h /usr/src/debug/bluez5/5.65-r0/src/shared/timeout-mainloo
 p.c /usr/src/debug/bluez5/5.65-r0/unit/test-gobex.c /usr/src/debug/bluez5/5.65-r0/src/shared/uhid.h /usr/src/debug/bluez5/5.65-r0/profiles/audio/source.h /usr/src/debug/bluez5/5.65-r0/src/shared/ecc.c /usr/src/debug/bluez5/5.65-r0/unit/test-queue.c /usr/src/debug/bluez5/5.65-r0/unit/test-avctp.c /usr/src/debug/bluez5/5.65-r0/src/shared/mainloop-glib.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/control.c /usr/src/debug/bluez5/5.65-r0/src/shared/btsnoop.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/avdtp.h /usr/src/debug/bluez5/5.65-r0/src/shared/hfp.h /usr/src/debug/bluez5/5.65-r0/profiles/audio/a2dp.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/avrcp.c /usr/src/debug/bluez5/5.65-r0/src/shared/io.h /usr/src/debug/bluez5/5.65-r0/unit/test-gobex-apparam.c /usr/src/debug/bluez5/5.65-r0/unit/test-ecc.c /usr/src/debug/bluez5/5.65-r0/src/shared/gatt-helpers.h /usr/src/debug/bluez5/5.65-r0/src/shared/gatt-db.c /usr/src/debug/bluez5/5.65-r0/src/shared/log.h /usr/src/debug/bluez5/5.65-r0/
 unit/test-avdtp.c /usr/src/debug/bluez5/5.65-r0/unit/test-gattrib.c /usr/src/debug/bluez5/5.65-r0/unit/test-uuid.c /usr/src/debug/bluez5/5.65-r0/unit/test-uhid.c /usr/src/debug/bluez5/5.65-r0/src/shared/gatt-helpers.c /usr/src/debug/bluez5/5.65-r0/src/shared/gatt-client.h /usr/src/debug/bluez5/5.65-r0/src/shared/timeout.h /usr/src/debug/bluez5/5.65-r0/unit/test-gdbus-client.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/media.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/avdtp.c /usr/src/debug/bluez5/5.65-r0/unit/test-gobex-transfer.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/player.h /usr/src/debug/bluez5/5.65-r0/unit/test-textfile.c /usr/src/debug/bluez5/5.65-r0/src/shared/mgmt.c /usr/src/debug/bluez5/5.65-r0/src/shared/hfp.c /usr/src/debug/bluez5/5.65-r0/unit/test-hfp.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/sink.c /usr/src/debug/bluez5/5.65-r0/unit/util.c /usr/src/debug/bluez5/5.65-r0/unit/test-ringbuf.c /usr/src/debug/bluez5/5.65-r0/src/shared/att.c /usr/src/debug/blu
 ez5/5.65-r0/unit/test-gobex-header.c /usr/src/debug/bluez5/5.65-r0/src/shared/mainloop-notify.h /usr/src/debug/bluez5/5.65-r0/profiles/audio/player.c /usr/src/debug/bluez5/5.65-r0/src/shared/tty.h /usr/src/debug/bluez5/5.65-r0/profiles/audio/avrcp.h /usr/src/debug/bluez5/5.65-r0/src/shared/gatt-db.h /usr/src/debug/bluez5/5.65-r0/unit/test-mgmt.c /usr/src/debug/bluez5/5.65-r0/src/shared/tester.h /usr/src/debug/bluez5/5.65-r0/src/shared/shell.c /usr/src/debug/bluez5/5.65-r0/src/shared/shell.h", added "/usr/src/debug/bluez5/5.66-r0/src/shared/uhid.c /usr/src/debug/bluez5/5.66-r0/src/shared/ringbuf.c /usr/src/debug/bluez5/5.66-r0/src/shared/crypto.c /usr/src/debug/bluez5/5.66-r0/src/shared/att.h /usr/src/debug/bluez5/5.66-r0/src/shared/tester.c /usr/src/debug/bluez5/5.66-r0/src/shared/mainloop-notify.h /usr/src/debug/bluez5/5.66-r0/profiles/audio/control.h /usr/src/debug/bluez5/5.66-r0/src/shared/mainloop.c /usr/src/debug/bluez5/5.66-r0/src/shared/hci.c /usr/src/debug/bluez5/5.66-r0/uni
 t/test-gobex-header.c /usr/src/debug/bluez5/5.66-r0/src/shared/gatt-db.c /usr/src/debug/bluez5/5.66-r0/unit/test-eir.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/bap.c /usr/src/debug/bluez5/5.66-r0/unit/test-textfile.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/source.h /usr/src/debug/bluez5/5.66-r0/src/shared/gatt-helpers.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/a2dp.c /usr/src/debug/bluez5/5.66-r0/src/shared/mainloop-notify.c /usr/src/debug/bluez5/5.66-r0/src/shared/crypto.h /usr/src/debug/bluez5/5.66-r0/src/shared/mgmt.c /usr/src/debug/bluez5/5.66-r0/src/shared/ad.c /usr/src/debug/bluez5/5.66-r0/src/shared/ecc.h /usr/src/debug/bluez5/5.66-r0/src/shared/gatt-helpers.h /usr/src/debug/bluez5/5.66-r0/profiles/audio/media.c /usr/src/debug/bluez5/5.66-r0/src/shared/tty.h /usr/src/debug/bluez5/5.66-r0/unit/test-sdp.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/player.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/player.h /usr/src/debug/bluez5/5.66-r0/src/shared/att-types.h /
 usr/src/debug/bluez5/5.66-r0/src/shared/bap.c /usr/src/debug/bluez5/5.66-r0/unit/test-gdbus-client.c /usr/src/debug/bluez5/5.66-r0/src/shared/gatt-client.c /usr/src/debug/bluez5/5.66-r0/src/shared/mainloop.h /usr/src/debug/bluez5/5.66-r0/src/shared/timeout-glib.c /usr/src/debug/bluez5/5.66-r0/src/shared/vcp.c /usr/src/debug/bluez5/5.66-r0/unit/test-ecc.c /usr/src/debug/bluez5/5.66-r0/src/shared/mcp.c /usr/src/debug/bluez5/5.66-r0/src/shared/io.h /usr/src/debug/bluez5/5.66-r0/profiles/audio/sink.h /usr/src/debug/bluez5/5.66-r0/src/shared/ascs.h /usr/src/debug/bluez5/5.66-r0/profiles/audio/avdtp.c /usr/src/debug/bluez5/5.66-r0/unit/test-gobex-apparam.c /usr/src/debug/bluez5/5.66-r0/src/shared/hfp.c /usr/src/debug/bluez5/5.66-r0/src/shared/bap.h /usr/src/debug/bluez5/5.66-r0/src/shared/util.c /usr/src/debug/bluez5/5.66-r0/src/shared/btsnoop.h /usr/src/debug/bluez5/5.66-r0/src/shared/mainloop-glib.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/avdtp.h /usr/src/debug/bluez5/5.66-r0/src/s
 hared/ringbuf.h /usr/src/debug/bluez5/5.66-r0/unit/util.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/avctp.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/source.c /usr/src/debug/bluez5/5.66-r0/unit/test-avdtp.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/a2dp-codecs.h /usr/src/debug/bluez5/5.66-r0/src/shared/log.h /usr/src/debug/bluez5/5.66-r0/profiles/audio/avrcp.c /usr/src/debug/bluez5/5.66-r0/src/shared/mgmt.h /usr/src/debug/bluez5/5.66-r0/src/shared/hci.h /usr/src/debug/bluez5/5.66-r0/src/shared/log.c /usr/src/debug/bluez5/5.66-r0/src/shared/shell.h /usr/src/debug/bluez5/5.66-r0/profiles/audio/a2dp.h /usr/src/debug/bluez5/5.66-r0/unit/util.h /usr/src/debug/bluez5/5.66-r0/unit/test-lib.c /usr/src/debug/bluez5/5.66-r0/unit/test-crypto.c /usr/src/debug/bluez5/5.66-r0/src/shared/att.c /usr/src/debug/bluez5/5.66-r0/unit/test-crc.c /usr/src/debug/bluez5/5.66-r0/unit/test-hog.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/control.c /usr/src/debug/bluez5/5.66-r0/src/shared/io-glib.c 
 /usr/src/debug/bluez5/5.66-r0/unit/test-mgmt.c /usr/src/debug/bluez5/5.66-r0/unit/test-tester.c /usr/src/debug/bluez5/5.66-r0/src/shared/btsnoop.c /usr/src/debug/bluez5/5.66-r0/src/shared/vcp.h /usr/src/debug/bluez5/5.66-r0/unit/test-uhid.c /usr/src/debug/bluez5/5.66-r0/unit/test-gattrib.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/media.h /usr/src/debug/bluez5/5.66-r0/src/shared/gatt-client.h /usr/src/debug/bluez5/5.66-r0/src/shared/timeout-mainloop.c /usr/src/debug/bluez5/5.66-r0/src/shared/gatt-server.c /usr/src/debug/bluez5/5.66-r0/unit/test-queue.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/transport.h /usr/src/debug/bluez5/5.66-r0/unit/test-avctp.c /usr/src/debug/bluez5/5.66-r0/unit/test-gatt.c /usr/src/debug/bluez5/5.66-r0/src/shared/queue.h /usr/src/debug/bluez5/5.66-r0/unit/test-uuid.c /usr/src/debug/bluez5/5.66-r0/src/shared/gatt-db.h /usr/src/debug/bluez5/5.66-r0/src/shared/timeout.h /usr/src/debug/bluez5/5.66-r0/src/shared/ecc.c /usr/src/debug/bluez5/5.66-r0/src/shar
 ed/gatt-server.h /usr/src/debug/bluez5/5.66-r0/unit/test-hfp.c /usr/src/debug/bluez5/5.66-r0/unit/test-avrcp.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/vcp.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/avrcp.h /usr/src/debug/bluez5/5.66-r0/src/shared/uhid.h /usr/src/debug/bluez5/5.66-r0/src/shared/shell.c /usr/src/debug/bluez5/5.66-r0/src/shared/hfp.h /usr/src/debug/bluez5/5.66-r0/src/shared/tester.h /usr/src/debug/bluez5/5.66-r0/unit/test-gobex-packet.c /usr/src/debug/bluez5/5.66-r0/src/shared/queue.c /usr/src/debug/bluez5/5.66-r0/unit/test-gobex.c /usr/src/debug/bluez5/5.66-r0/src/shared/ad.h /usr/src/debug/bluez5/5.66-r0/profiles/audio/avctp.h /usr/src/debug/bluez5/5.66-r0/profiles/audio/sink.c /usr/src/debug/bluez5/5.66-r0/unit/test-gobex-transfer.c /usr/src/debug/bluez5/5.66-r0/src/shared/io-mainloop.c /usr/src/debug/bluez5/5.66-r0/src/shared/mcp.h /usr/src/debug/bluez5/5.66-r0/src/shared/util.h /usr/src/debug/bluez5/5.66-r0/unit/test-ringbuf.c /usr/src/debug/bluez5/5.66-r
 0/profiles/audio/transport.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/mcp.c"
packages/core2-32-poky-linux/bluez5/bluez5-src: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-src: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-src: PKGSIZE changed from 7449597 to 7760525 (+4%)
packages/core2-32-poky-linux/bluez5/bluez5-staticdev: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-staticdev: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-testtools: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-testtools: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-testtools: PKGSIZE changed from 176705 to 177385 (+0%)
packages/core2-32-poky-linux/bluez5/bluez5: FILELIST: removed "/usr/lib/libbluetooth.so.3.19.7", added "/usr/lib/libbluetooth.so.3.19.8"
packages/core2-32-poky-linux/bluez5/bluez5: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5: PKGSIZE changed from 5506380 to 5689876 (+3%)
packages/core2-32-poky-linux/bluez5: SRC_URI changed from "https://cdn.kernel.org/pub/linux/bluetooth/bluez-5.65.tar.xz file://init file://run-ptest file://0001-tests-add-a-target-for-building-tests-without-runnin.patch file://0001-test-gatt-Fix-hung-issue.patch" to "https://cdn.kernel.org/pub/linux/bluetooth/bluez-5.66.tar.xz file://init file://run-ptest file://0001-tests-add-a-target-for-building-tests-without-runnin.patch file://0001-test-gatt-Fix-hung-issue.patch"
packages/core2-32-poky-linux/bluez5: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5: PKGV changed from 5.65 [default] to 5.66 [default]
Changes to packages/core2-32-poky-linux/bluez5 (sysroot):
  /usr/lib/libbluetooth.so.3 changed symlink target from libbluetooth.so.3.19.7 to libbluetooth.so.3.19.8
  /usr/lib/libbluetooth.so changed symlink target from libbluetooth.so.3.19.7 to libbluetooth.so.3.19.8
  /usr/lib/libbluetooth.so.3.19.7 moved to /usr/lib/libbluetooth.so.3.19.8

--===============7975664458551537654==--

