Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625B9C10F14
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:14:57 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.22337.1701436493351200076
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VF8Zwxzx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MMTax1jK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018c25848b88-22960ca8-2727-4206-8103-3e4637cd59b8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kinS8KydbonM+MOX1wSqjKTRZK3BYgtsKEwIq/05DDQ=;
	b=VF8Zwxzxs5CYyrKdhFWrat2mEuCiLSb50TVjGL6SU1snhvp582U/gwORWIxlahHO
	4oGogRTM3gEKieTWU9W3H3Ky3MLpcYMqEU4FzLZizCX9xsOvXhFNHS0JSwMK0h8Bn3b
	P2BtnpvvcgEIt9tdk/Jd8PBoOcQqvEfSfBmPi4Us=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kinS8KydbonM+MOX1wSqjKTRZK3BYgtsKEwIq/05DDQ=;
	b=MMTax1jK5q7igGxSGcHoARDgLrpwUqFaT/ErRXlBvgA2plu+3H5BWO1yWKDbcexe
	Gjt1QjgUoY3EGp4W+JomxPfmK6zQs2GCE/pDZVS0rQJXd0FrBr98ekvX6MPLbzN+a0x
	Y+0UrrnN1B/pD1XKSYOfHMD2s5WhFMzYYtO5befY=
Content-Type: multipart/mixed; boundary="===============6868400554884132772=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20231111 FAILED
Message-ID: <0101018c25848b88-22960ca8-2727-4206-8103-3e4637cd59b8-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191653

--===============6868400554884132772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20231111* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20231030-20231111.patch
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
From fb9c9b94b8a54711b41a13877ab2ce99b6759b9a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 12:24:11 +0000
Subject: [PATCH] linux-firmware: upgrade 20231030 -> 20231111

---
 ...20231030.bb => linux-firmware_20231111.bb} | 171 +++++++++++++++++-
 1 file changed, 169 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20231030.bb => linux-firmware_20231111.bb} (92%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb
similarity index 92%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb
index c0394b9b3b..e015dde93e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb
@@ -1,3 +1,170 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- WHENCE
+# +++ WHENCE
+# @@ -1143,6 +1143,16 @@
+#  Link: intel/ipu3-fw.bin -> irci_irci_ecr-master_20161208_0213_20170112_1500.bin
+#  
+#  Licence: Redistributable. See LICENSE.ipu3_firmware for details
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: ixp4xx-npe - Intel IXP4xx XScale Network Processing Engine (NPE) Firmware
+# +File: ixp4xx/NPE-A
+# +File: ixp4xx/NPE-A-HSS
+# +File: ixp4xx/NPE-B
+# +File: ixp4xx/NPE-C
+# +Version: date = February 26, 2007
+# +License: Redistributable. See LICENSE.ixp4xx for details
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3794,17 +3804,17 @@
+#  File:intel/ibt-19-240-4.ddc
+#  Version: BT_HarrisonPeak_REL53497
+#  File:intel/ibt-0041-0041.sfi
+# -Version: BT_TyphoonPeak_REL66410
+# +Version: BT_TyphoonPeak_REL70976
+#  File:intel/ibt-0041-0041.ddc
+# -Version: BT_TyphoonPeak_REL66410
+# +Version: BT_TyphoonPeak_REL70976
+#  File:intel/ibt-0040-0041.sfi
+# -Version: BT_Solar_GfP2_REL66410
+# +Version: BT_Solar_GfP2_REL70976
+#  File:intel/ibt-0040-0041.ddc
+# -Version: BT_Solar_GfP2_REL66410
+# +Version: BT_Solar_GfP2_REL70976
+#  File:intel/ibt-1040-0041.sfi
+# -Version: BT_SolarF_GfP2_REL66410
+# +Version: BT_SolarF_GfP2_REL70976
+#  File:intel/ibt-1040-0041.ddc
+# -Version: BT_SolarF_GfP2_REL66410
+# +Version: BT_SolarF_GfP2_REL70976
+#  
+#  File:intel/ibt-0040-1020.sfi
+#  Version: BT_Solar_JfP1_REL59564
+# @@ -3825,33 +3835,33 @@
+#  Version: BT_SolarF_JfP2_REL59564
+#  
+#  File:intel/ibt-0040-4150.sfi
+# -Version: BT_Solar_JnP2_REL66410
+# +Version: BT_Solar_JnP2_REL70976
+#  File:intel/ibt-0040-4150.ddc
+# -Version: BT_Solar_JnP2_REL66410
+# +Version: BT_Solar_JnP2_REL70976
+#  File:intel/ibt-1040-4150.sfi
+# -Version: BT_SolarF_JnP2_REL66410
+# +Version: BT_SolarF_JnP2_REL70976
+#  File:intel/ibt-1040-4150.ddc
+# -Version: BT_SolarF_JnP2_REL66410
+# +Version: BT_SolarF_JnP2_REL70976
+#  
+#  File:intel/ibt-0291-0291.sfi
+# -Version: BT_GalePeak_REL39025
+# +Version: BT_GalePeak_REL43914
+#  File:intel/ibt-0291-0291.ddc
+# -Version: BT_GalePeak_REL39025
+# +Version: BT_GalePeak_REL43914
+#  
+#  File:intel/ibt-0180-0041.sfi
+# -Version: BT_Magnetar_GfP2_REL82221
+# +Version: BT_Magnetar_GfP2_REL90033
+#  File:intel/ibt-0180-0041.ddc
+# -Version: BT_Magnetar_GfP2_REL82221
+# +Version: BT_Magnetar_GfP2_REL90033
+#  
+#  File:intel/ibt-0180-4150.sfi
+# -Version: BT_Magnetar_HrP2_REL82221
+# +Version: BT_Magnetar_JnP2_REL90033
+#  File:intel/ibt-0180-4150.ddc
+# -Version: BT_Magnetar_HrP2_REL82221
+# +Version: BT_Magnetar_JnP2_REL90033
+#  
+#  File:intel/ibt-0180-1050.sfi
+# -Version: BT_Magnetar_HrP1_REL82221
+# +Version: BT_Magnetar_HrP1_REL90033
+#  File:intel/ibt-0180-1050.ddc
+# -Version: BT_Magnetar_HrP1_REL82221
+# +Version: BT_Magnetar_HrP1_REL90033
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+#  
+# @@ -4364,6 +4374,17 @@
+#  File: qca/nvm_usb_00190200.bin
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt for details
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: qca - Qualcomm Atheros Bluetooth support for WCN3988 chips
+# +
+# +File: qca/apbtfw10.tlv
+# +File: qca/apbtfw11.tlv
+# +File: qca/apnv10.bin
+# +File: qca/apnv11.bin
+# +
+# +Licence: Redistributable. See LICENSE.qcom and qca/NOTICE.txt for details
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -5211,6 +5232,48 @@
+#  File: nvidia/tu10x/typec/ccg_primary.cyacd
+#  File: nvidia/tu10x/typec/ccg_secondary.cyacd
+#  File: nvidia/tu10x/typec/ccg_boot.cyacd
+# +
+# +Firmware images needed for GSP-RM:
+# +
+# +File: nvidia/tu102/gsp/bootloader-535.113.01.bin
+# +File: nvidia/tu102/gsp/booter_load-535.113.01.bin
+# +File: nvidia/tu102/gsp/booter_unload-535.113.01.bin
+# +Link: nvidia/tu104/gsp -> ../tu102/gsp
+# +Link: nvidia/tu106/gsp -> ../tu102/gsp
+# +
+# +File: nvidia/tu116/gsp/booter_load-535.113.01.bin
+# +File: nvidia/tu116/gsp/booter_unload-535.113.01.bin
+# +Link: nvidia/tu116/gsp/bootloader-535.113.01.bin -> ../../tu102/gsp/bootloader-535.113.01.bin
+# +Link: nvidia/tu117/gsp -> ../tu116/gsp
+# +
+# +File: nvidia/ga100/gsp/bootloader-535.113.01.bin
+# +File: nvidia/ga100/gsp/booter_load-535.113.01.bin
+# +File: nvidia/ga100/gsp/booter_unload-535.113.01.bin
+# +
+# +File: nvidia/ad102/gsp/bootloader-535.113.01.bin
+# +File: nvidia/ad102/gsp/booter_load-535.113.01.bin
+# +File: nvidia/ad102/gsp/booter_unload-535.113.01.bin
+# +Link: nvidia/ad103/gsp -> ../ad102/gsp
+# +Link: nvidia/ad104/gsp -> ../ad102/gsp
+# +Link: nvidia/ad106/gsp -> ../ad102/gsp
+# +Link: nvidia/ad107/gsp -> ../ad102/gsp
+# +
+# +File: nvidia/ga102/gsp/bootloader-535.113.01.bin
+# +File: nvidia/ga102/gsp/booter_load-535.113.01.bin
+# +File: nvidia/ga102/gsp/booter_unload-535.113.01.bin
+# +Link: nvidia/ga103/gsp -> ../ga102/gsp
+# +Link: nvidia/ga104/gsp -> ../ga102/gsp
+# +Link: nvidia/ga106/gsp -> ../ga102/gsp
+# +Link: nvidia/ga107/gsp -> ../ga102/gsp
+# +
+# +File: nvidia/tu102/gsp/gsp-535.113.01.bin
+# +Origin: gsp_tu10x.bin from NVIDIA-Linux-x86_64-535.113.01.run
+# +Link: nvidia/tu116/gsp/gsp-535.113.01.bin -> ../../tu102/gsp/gsp-535.113.01.bin
+# +Link: nvidia/ga100/gsp/gsp-535.113.01.bin -> ../../tu102/gsp/gsp-535.113.01.bin
+# +
+# +File: nvidia/ga102/gsp/gsp-535.113.01.bin
+# +Origin: gsp_ga10x.bin from NVIDIA-Linux-x86_64-535.113.01.run
+# +Link: nvidia/ad102/gsp/gsp-535.113.01.bin -> ../../ga102/gsp/gsp-535.113.01.bin
+#  
+#  Licence: Redistributable. See LICENCE.nvidia for details
+#  
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -147,7 +314,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=4b94007ebc35009d5e657ddd4b63005e \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -237,7 +404,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "c98d200fc4a3120de1a594713ce34e135819dff23e883a4ed387863ba25679c7"
+SRC_URI[sha256sum] = "8d4959c1293ff8a6e40ac3d265205297a3e93e4fe5e8e25a7d16cfed78cbb098"
 
 inherit allarch
 
-- 
2.39.2


--===============6868400554884132772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-d477dc0182a3835d67065ea2de6e820d758a2241"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d477dc0182a3835d67065ea2de6e820d758a2241"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 36 Local 24 Mirrors 0 Missed 12 Current 174 (66% match, 94% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 448 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_recipe_qa)
NOTE: recipe linux-firmware-1_20231111-r0: task do_recipe_qa: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_recipe_qa: Succeeded
NOTE: Running task 663 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_fetch)
NOTE: recipe linux-firmware-1_20231111-r0: task do_fetch: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_fetch: Succeeded
NOTE: Running task 664 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_unpack)
NOTE: Running task 665 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-firmware-1_20231111-r0: task do_unpack: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-firmware-1_20231111-r0: task do_unpack: Succeeded
NOTE: Running task 666 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_patch)
NOTE: Running task 667 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_collect_spdx_deps)
NOTE: recipe linux-firmware-1_20231111-r0: task do_patch: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-firmware-1_20231111-r0: task do_patch: Succeeded
NOTE: Running task 668 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_deploy_source_date_epoch)
NOTE: Running task 669 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_populate_lic)
NOTE: recipe linux-firmware-1_20231111-r0: task do_populate_lic: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_populate_lic: Succeeded
NOTE: recipe linux-firmware-1_20231111-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_populate_lic unihash changed to 10e020eb704c04fc8c4b766d76ac66395558c1283d39fb3ee89a21f7256efebd
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_deploy_source_date_epoch unihash changed to c96abff0bc56a6fd7cef302d7f8d90dfe88b57175c2e6fcdf35b099e4bba7c7a
NOTE: Setscene tasks completed
NOTE: Running task 670 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_configure)
NOTE: recipe linux-firmware-1_20231111-r0: task do_configure: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_configure: Succeeded
NOTE: Running task 671 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_compile)
NOTE: recipe linux-firmware-1_20231111-r0: task do_compile: Started
NOTE: recipe linux-firmware-1_20231111-r0: task do_compile: Succeeded
NOTE: Running task 672 of 682 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_install)
NOTE: recipe linux-firmware-1_20231111-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'libtool-native', 'quilt-native', 'texinfo-dummy-native', 'patch-native', 'pseudo-native', 'xz-native', 'attr-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 16 -l 52 DESTDIR=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/image FIRMWAREDIR=/usr/lib/firmware install
| install -d /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/image/usr/lib/firmware
| ./copy-firmware.sh /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/image/usr/lib/firmware
| ERROR: rdfind is not installed
| make: *** [Makefile:31: install] Error 1
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/temp/run.do_install.3064982:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/temp/run.do_install.3064982, line 174
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/temp/run.do_install.3064982, line 158
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/temp/run.do_install.3064982, line 153
| 	#4: do_install, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/temp/run.do_install.3064982, line 144
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/temp/run.do_install.3064982, line 187
NOTE: recipe linux-firmware-1_20231111-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 672 tasks of which 661 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231201122337.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231201122337.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_install
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: linux-firmware-1_20231111-r0 do_install: oe_runmake failed
ERROR: linux-firmware-1_20231111-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/temp/run.do_install.3064982', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20231111/temp/log.do_install.3064982
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-firmware/linux-firmware_20231111.bb:do_install) failed with exit code '1'

--===============6868400554884132772==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20231030-20231111.patch"

RnJvbSBmYjljOWI5NGI4YTU0NzExYjQxYTEzODc3YWIyY2U5OWI2NzU5YjlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAxMjoyNDoxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
bnV4LWZpcm13YXJlOiB1cGdyYWRlIDIwMjMxMDMwIC0+IDIwMjMxMTExCgotLS0KIC4uLjIwMjMx
MDMwLmJiID0+IGxpbnV4LWZpcm13YXJlXzIwMjMxMTExLmJifSB8IDE3MSArKysrKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNjkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL3tsaW51eC1maXJtd2Fy
ZV8yMDIzMTAzMC5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIzMTExMS5iYn0gKDkyJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJl
XzIwMjMxMDMwLmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1m
aXJtd2FyZV8yMDIzMTExMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjMxMDMwLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13
YXJlXzIwMjMxMTExLmJiCmluZGV4IGMwMzk0YjliM2IuLmUwMTVkZGU5M2UgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmVfMjAyMzEw
MzAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIzMTExMS5iYgpAQCAtMSwzICsxLDE3MCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxF
U19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgor
IyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYg
bmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2Fn
ZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRl
OiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0t
IFdIRU5DRQorIyArKysgV0hFTkNFCisjIEBAIC0xMTQzLDYgKzExNDMsMTYgQEAKKyMgIExpbms6
IGludGVsL2lwdTMtZncuYmluIC0+IGlyY2lfaXJjaV9lY3ItbWFzdGVyXzIwMTYxMjA4XzAyMTNf
MjAxNzAxMTJfMTUwMC5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5TRS5pcHUzX2Zpcm13YXJlIGZvciBkZXRhaWxzCisjICsKKyMgKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCisjICsKKyMgK0RyaXZlcjogaXhwNHh4LW5wZSAtIEludGVsIElYUDR4eCBYU2NhbGUgTmV0
d29yayBQcm9jZXNzaW5nIEVuZ2luZSAoTlBFKSBGaXJtd2FyZQorIyArRmlsZTogaXhwNHh4L05Q
RS1BCisjICtGaWxlOiBpeHA0eHgvTlBFLUEtSFNTCisjICtGaWxlOiBpeHA0eHgvTlBFLUIKKyMg
K0ZpbGU6IGl4cDR4eC9OUEUtQworIyArVmVyc2lvbjogZGF0ZSA9IEZlYnJ1YXJ5IDI2LCAyMDA3
CisjICtMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLml4cDR4eCBmb3IgZGV0
YWlscworIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC0zNzk0LDE3ICszODA0
LDE3IEBACisjICBGaWxlOmludGVsL2lidC0xOS0yNDAtNC5kZGMKKyMgIFZlcnNpb246IEJUX0hh
cnJpc29uUGVha19SRUw1MzQ5NworIyAgRmlsZTppbnRlbC9pYnQtMDA0MS0wMDQxLnNmaQorIyAt
VmVyc2lvbjogQlRfVHlwaG9vblBlYWtfUkVMNjY0MTAKKyMgK1ZlcnNpb246IEJUX1R5cGhvb25Q
ZWFrX1JFTDcwOTc2CisjICBGaWxlOmludGVsL2lidC0wMDQxLTAwNDEuZGRjCisjIC1WZXJzaW9u
OiBCVF9UeXBob29uUGVha19SRUw2NjQxMAorIyArVmVyc2lvbjogQlRfVHlwaG9vblBlYWtfUkVM
NzA5NzYKKyMgIEZpbGU6aW50ZWwvaWJ0LTAwNDAtMDA0MS5zZmkKKyMgLVZlcnNpb246IEJUX1Nv
bGFyX0dmUDJfUkVMNjY0MTAKKyMgK1ZlcnNpb246IEJUX1NvbGFyX0dmUDJfUkVMNzA5NzYKKyMg
IEZpbGU6aW50ZWwvaWJ0LTAwNDAtMDA0MS5kZGMKKyMgLVZlcnNpb246IEJUX1NvbGFyX0dmUDJf
UkVMNjY0MTAKKyMgK1ZlcnNpb246IEJUX1NvbGFyX0dmUDJfUkVMNzA5NzYKKyMgIEZpbGU6aW50
ZWwvaWJ0LTEwNDAtMDA0MS5zZmkKKyMgLVZlcnNpb246IEJUX1NvbGFyRl9HZlAyX1JFTDY2NDEw
CisjICtWZXJzaW9uOiBCVF9Tb2xhckZfR2ZQMl9SRUw3MDk3NgorIyAgRmlsZTppbnRlbC9pYnQt
MTA0MC0wMDQxLmRkYworIyAtVmVyc2lvbjogQlRfU29sYXJGX0dmUDJfUkVMNjY0MTAKKyMgK1Zl
cnNpb246IEJUX1NvbGFyRl9HZlAyX1JFTDcwOTc2CisjICAKKyMgIEZpbGU6aW50ZWwvaWJ0LTAw
NDAtMTAyMC5zZmkKKyMgIFZlcnNpb246IEJUX1NvbGFyX0pmUDFfUkVMNTk1NjQKKyMgQEAgLTM4
MjUsMzMgKzM4MzUsMzMgQEAKKyMgIFZlcnNpb246IEJUX1NvbGFyRl9KZlAyX1JFTDU5NTY0Cisj
ICAKKyMgIEZpbGU6aW50ZWwvaWJ0LTAwNDAtNDE1MC5zZmkKKyMgLVZlcnNpb246IEJUX1NvbGFy
X0puUDJfUkVMNjY0MTAKKyMgK1ZlcnNpb246IEJUX1NvbGFyX0puUDJfUkVMNzA5NzYKKyMgIEZp
bGU6aW50ZWwvaWJ0LTAwNDAtNDE1MC5kZGMKKyMgLVZlcnNpb246IEJUX1NvbGFyX0puUDJfUkVM
NjY0MTAKKyMgK1ZlcnNpb246IEJUX1NvbGFyX0puUDJfUkVMNzA5NzYKKyMgIEZpbGU6aW50ZWwv
aWJ0LTEwNDAtNDE1MC5zZmkKKyMgLVZlcnNpb246IEJUX1NvbGFyRl9KblAyX1JFTDY2NDEwCisj
ICtWZXJzaW9uOiBCVF9Tb2xhckZfSm5QMl9SRUw3MDk3NgorIyAgRmlsZTppbnRlbC9pYnQtMTA0
MC00MTUwLmRkYworIyAtVmVyc2lvbjogQlRfU29sYXJGX0puUDJfUkVMNjY0MTAKKyMgK1ZlcnNp
b246IEJUX1NvbGFyRl9KblAyX1JFTDcwOTc2CisjICAKKyMgIEZpbGU6aW50ZWwvaWJ0LTAyOTEt
MDI5MS5zZmkKKyMgLVZlcnNpb246IEJUX0dhbGVQZWFrX1JFTDM5MDI1CisjICtWZXJzaW9uOiBC
VF9HYWxlUGVha19SRUw0MzkxNAorIyAgRmlsZTppbnRlbC9pYnQtMDI5MS0wMjkxLmRkYworIyAt
VmVyc2lvbjogQlRfR2FsZVBlYWtfUkVMMzkwMjUKKyMgK1ZlcnNpb246IEJUX0dhbGVQZWFrX1JF
TDQzOTE0CisjICAKKyMgIEZpbGU6aW50ZWwvaWJ0LTAxODAtMDA0MS5zZmkKKyMgLVZlcnNpb246
IEJUX01hZ25ldGFyX0dmUDJfUkVMODIyMjEKKyMgK1ZlcnNpb246IEJUX01hZ25ldGFyX0dmUDJf
UkVMOTAwMzMKKyMgIEZpbGU6aW50ZWwvaWJ0LTAxODAtMDA0MS5kZGMKKyMgLVZlcnNpb246IEJU
X01hZ25ldGFyX0dmUDJfUkVMODIyMjEKKyMgK1ZlcnNpb246IEJUX01hZ25ldGFyX0dmUDJfUkVM
OTAwMzMKKyMgIAorIyAgRmlsZTppbnRlbC9pYnQtMDE4MC00MTUwLnNmaQorIyAtVmVyc2lvbjog
QlRfTWFnbmV0YXJfSHJQMl9SRUw4MjIyMQorIyArVmVyc2lvbjogQlRfTWFnbmV0YXJfSm5QMl9S
RUw5MDAzMworIyAgRmlsZTppbnRlbC9pYnQtMDE4MC00MTUwLmRkYworIyAtVmVyc2lvbjogQlRf
TWFnbmV0YXJfSHJQMl9SRUw4MjIyMQorIyArVmVyc2lvbjogQlRfTWFnbmV0YXJfSm5QMl9SRUw5
MDAzMworIyAgCisjICBGaWxlOmludGVsL2lidC0wMTgwLTEwNTAuc2ZpCisjIC1WZXJzaW9uOiBC
VF9NYWduZXRhcl9IclAxX1JFTDgyMjIxCisjICtWZXJzaW9uOiBCVF9NYWduZXRhcl9IclAxX1JF
TDkwMDMzCisjICBGaWxlOmludGVsL2lidC0wMTgwLTEwNTAuZGRjCisjIC1WZXJzaW9uOiBCVF9N
YWduZXRhcl9IclAxX1JFTDgyMjIxCisjICtWZXJzaW9uOiBCVF9NYWduZXRhcl9IclAxX1JFTDkw
MDMzCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuaWJ0X2Zp
cm13YXJlIGZvciBkZXRhaWxzCisjICAKKyMgQEAgLTQzNjQsNiArNDM3NCwxNyBAQAorIyAgRmls
ZTogcWNhL252bV91c2JfMDAxOTAyMDAuYmluCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0
YWJsZS4gU2VlIExJQ0VOU0UuUXVhbGNvbW1BdGhlcm9zX2F0aDEwayBhbmQgcWNhL05PVElDRS50
eHQgZm9yIGRldGFpbHMKKyMgKworIyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgKworIyArRHJpdmVy
OiBxY2EgLSBRdWFsY29tbSBBdGhlcm9zIEJsdWV0b290aCBzdXBwb3J0IGZvciBXQ04zOTg4IGNo
aXBzCisjICsKKyMgK0ZpbGU6IHFjYS9hcGJ0ZncxMC50bHYKKyMgK0ZpbGU6IHFjYS9hcGJ0Zncx
MS50bHYKKyMgK0ZpbGU6IHFjYS9hcG52MTAuYmluCisjICtGaWxlOiBxY2EvYXBudjExLmJpbgor
IyArCisjICtMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnFjb20gYW5kIHFj
YS9OT1RJQ0UudHh0IGZvciBkZXRhaWxzCisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAK
KyMgQEAgLTUyMTEsNiArNTIzMiw0OCBAQAorIyAgRmlsZTogbnZpZGlhL3R1MTB4L3R5cGVjL2Nj
Z19wcmltYXJ5LmN5YWNkCisjICBGaWxlOiBudmlkaWEvdHUxMHgvdHlwZWMvY2NnX3NlY29uZGFy
eS5jeWFjZAorIyAgRmlsZTogbnZpZGlhL3R1MTB4L3R5cGVjL2NjZ19ib290LmN5YWNkCisjICsK
KyMgK0Zpcm13YXJlIGltYWdlcyBuZWVkZWQgZm9yIEdTUC1STToKKyMgKworIyArRmlsZTogbnZp
ZGlhL3R1MTAyL2dzcC9ib290bG9hZGVyLTUzNS4xMTMuMDEuYmluCisjICtGaWxlOiBudmlkaWEv
dHUxMDIvZ3NwL2Jvb3Rlcl9sb2FkLTUzNS4xMTMuMDEuYmluCisjICtGaWxlOiBudmlkaWEvdHUx
MDIvZ3NwL2Jvb3Rlcl91bmxvYWQtNTM1LjExMy4wMS5iaW4KKyMgK0xpbms6IG52aWRpYS90dTEw
NC9nc3AgLT4gLi4vdHUxMDIvZ3NwCisjICtMaW5rOiBudmlkaWEvdHUxMDYvZ3NwIC0+IC4uL3R1
MTAyL2dzcAorIyArCisjICtGaWxlOiBudmlkaWEvdHUxMTYvZ3NwL2Jvb3Rlcl9sb2FkLTUzNS4x
MTMuMDEuYmluCisjICtGaWxlOiBudmlkaWEvdHUxMTYvZ3NwL2Jvb3Rlcl91bmxvYWQtNTM1LjEx
My4wMS5iaW4KKyMgK0xpbms6IG52aWRpYS90dTExNi9nc3AvYm9vdGxvYWRlci01MzUuMTEzLjAx
LmJpbiAtPiAuLi8uLi90dTEwMi9nc3AvYm9vdGxvYWRlci01MzUuMTEzLjAxLmJpbgorIyArTGlu
azogbnZpZGlhL3R1MTE3L2dzcCAtPiAuLi90dTExNi9nc3AKKyMgKworIyArRmlsZTogbnZpZGlh
L2dhMTAwL2dzcC9ib290bG9hZGVyLTUzNS4xMTMuMDEuYmluCisjICtGaWxlOiBudmlkaWEvZ2Ex
MDAvZ3NwL2Jvb3Rlcl9sb2FkLTUzNS4xMTMuMDEuYmluCisjICtGaWxlOiBudmlkaWEvZ2ExMDAv
Z3NwL2Jvb3Rlcl91bmxvYWQtNTM1LjExMy4wMS5iaW4KKyMgKworIyArRmlsZTogbnZpZGlhL2Fk
MTAyL2dzcC9ib290bG9hZGVyLTUzNS4xMTMuMDEuYmluCisjICtGaWxlOiBudmlkaWEvYWQxMDIv
Z3NwL2Jvb3Rlcl9sb2FkLTUzNS4xMTMuMDEuYmluCisjICtGaWxlOiBudmlkaWEvYWQxMDIvZ3Nw
L2Jvb3Rlcl91bmxvYWQtNTM1LjExMy4wMS5iaW4KKyMgK0xpbms6IG52aWRpYS9hZDEwMy9nc3Ag
LT4gLi4vYWQxMDIvZ3NwCisjICtMaW5rOiBudmlkaWEvYWQxMDQvZ3NwIC0+IC4uL2FkMTAyL2dz
cAorIyArTGluazogbnZpZGlhL2FkMTA2L2dzcCAtPiAuLi9hZDEwMi9nc3AKKyMgK0xpbms6IG52
aWRpYS9hZDEwNy9nc3AgLT4gLi4vYWQxMDIvZ3NwCisjICsKKyMgK0ZpbGU6IG52aWRpYS9nYTEw
Mi9nc3AvYm9vdGxvYWRlci01MzUuMTEzLjAxLmJpbgorIyArRmlsZTogbnZpZGlhL2dhMTAyL2dz
cC9ib290ZXJfbG9hZC01MzUuMTEzLjAxLmJpbgorIyArRmlsZTogbnZpZGlhL2dhMTAyL2dzcC9i
b290ZXJfdW5sb2FkLTUzNS4xMTMuMDEuYmluCisjICtMaW5rOiBudmlkaWEvZ2ExMDMvZ3NwIC0+
IC4uL2dhMTAyL2dzcAorIyArTGluazogbnZpZGlhL2dhMTA0L2dzcCAtPiAuLi9nYTEwMi9nc3AK
KyMgK0xpbms6IG52aWRpYS9nYTEwNi9nc3AgLT4gLi4vZ2ExMDIvZ3NwCisjICtMaW5rOiBudmlk
aWEvZ2ExMDcvZ3NwIC0+IC4uL2dhMTAyL2dzcAorIyArCisjICtGaWxlOiBudmlkaWEvdHUxMDIv
Z3NwL2dzcC01MzUuMTEzLjAxLmJpbgorIyArT3JpZ2luOiBnc3BfdHUxMHguYmluIGZyb20gTlZJ
RElBLUxpbnV4LXg4Nl82NC01MzUuMTEzLjAxLnJ1bgorIyArTGluazogbnZpZGlhL3R1MTE2L2dz
cC9nc3AtNTM1LjExMy4wMS5iaW4gLT4gLi4vLi4vdHUxMDIvZ3NwL2dzcC01MzUuMTEzLjAxLmJp
bgorIyArTGluazogbnZpZGlhL2dhMTAwL2dzcC9nc3AtNTM1LjExMy4wMS5iaW4gLT4gLi4vLi4v
dHUxMDIvZ3NwL2dzcC01MzUuMTEzLjAxLmJpbgorIyArCisjICtGaWxlOiBudmlkaWEvZ2ExMDIv
Z3NwL2dzcC01MzUuMTEzLjAxLmJpbgorIyArT3JpZ2luOiBnc3BfZ2ExMHguYmluIGZyb20gTlZJ
RElBLUxpbnV4LXg4Nl82NC01MzUuMTEzLjAxLnJ1bgorIyArTGluazogbnZpZGlhL2FkMTAyL2dz
cC9nc3AtNTM1LjExMy4wMS5iaW4gLT4gLi4vLi4vZ2ExMDIvZ3NwL2dzcC01MzUuMTEzLjAxLmJp
bgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm52aWRpYSBm
b3IgZGV0YWlscworIyAgCisjIAorIworCiBTVU1NQVJZID0gIkZpcm13YXJlIGZpbGVzIGZvciB1
c2Ugd2l0aCBMaW51eCBrZXJuZWwiCiBIT01FUEFHRSA9ICJodHRwczovL3d3dy5rZXJuZWwub3Jn
LyIKIERFU0NSSVBUSU9OID0gIkxpbnV4IGZpcm13YXJlIGlzIGEgcGFja2FnZSBkaXN0cmlidXRl
ZCBhbG9uZ3NpZGUgdGhlIExpbnV4IGtlcm5lbCBcCkBAIC0xNDcsNyArMzE0LDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5DRS5BYmlsaXM7bWQ1PWI1ZWUzZjQxMDc4MGU1Njcx
MWFkNDhlYWRjMjJiOGJjIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM0
MDAwO21kNT0wZmY1MWQyZGM0OWZjZTA0ODE0YzkxNTUwODEwOTJmMCBcCiAgICAgICAgICAgICAg
ICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhjNTAwMDttZDU9MWUxNzBjMTMxNzUzMjNjMzJjN2Y0ZDA5
OThkNTNmNjYgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54YzUwMDBjO21k
NT0xMmIwMmVmYTMwNDlkYjY1ZDUyNGFlYjQxOGRkODdjYSBcCi0gICAgICAgICAgICAgICAgICAg
IGZpbGU6Ly9XSEVOQ0U7bWQ1PSR7V0hFTkNFX0NIS1NVTX0gXAorICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vV0hFTkNFO21kNT00Yjk0MDA3ZWJjMzUwMDlkNWU2NTdkZGQ0YjYzMDA1ZSBcCiAg
ICAgICAgICAgICAgICAgICAgICIKICMgV0hFTkNFIGNoZWNrc3VtIGlzIGRlZmluZWQgc2VwYXJh
dGVseSB0byBlYXNlIG92ZXJyaWRpbmcgaXQgaWYKICMgY2xhc3MtZGV2dXBzdHJlYW0gaXMgc2Vs
ZWN0ZWQuCkBAIC0yMzcsNyArNDA0LDcgQEAgU1JDX1VSSTpjbGFzcy1kZXZ1cHN0cmVhbSA9ICJn
aXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmlybXcKICMgUGlu
IHRoaXMgdG8gdGhlIDIwMjIwNTA5IHJlbGVhc2UsIG92ZXJyaWRlIHRoaXMgaW4gbG9jYWwuY29u
ZgogU1JDUkVWOmNsYXNzLWRldnVwc3RyZWFtID89ICJiMTljYmRjYTc4YWIyYWRmZDIxMGM5MWJl
MTVhMjI1NjhlOGI4Y2FlIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzk4ZDIwMGZjNGEzMTIw
ZGUxYTU5NDcxM2NlMzRlMTM1ODE5ZGZmMjNlODgzYTRlZDM4Nzg2M2JhMjU2NzljNyIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI4ZDQ5NTljMTI5M2ZmOGE2ZTQwYWMzZDI2NTIwNTI5N2EzZTkzZTRm
ZTVlOGUyNWE3ZDE2Y2ZlZDc4Y2JiMDk4IgogCiBpbmhlcml0IGFsbGFyY2gKIAotLSAKMi4zOS4y
Cgo=

--===============6868400554884132772==--

