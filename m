Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 957F77D8FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:10 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id w15so2530119wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yyde0t1bhaY8+D3kzIVbKN+CZKXV1ydZoul8ZekF0G0=;
	b=qINKqi4vmgD+x1QmLL7NQQIioRxRpMXzOpZOlb30QpT9u9lIhhaNVMLhDkx45poR5R
	TICK/fCkDoI6KrrA2OWdg9jGxbrU6EoAk36uTAbVGAYqD1Lqd98dlABIzhwtS98Sqwi/
	OlN2cXvM31nGAeTfz4+n8LCSvSTRSPPmImSyFI/jfF6hWh0EmPGJInaC9seBnRzbnxqM
	rfJ0SOJmrOC9cnNJiJJAoZ0JRewRwXc1KnWc7n4gOTEVUEUBodu3/O+rn5QyHVjaC5Wh
	QSpi5lc60WnYG6A4SX/ojvUFw44sT0oqwwtMl3Ly0ojJH9P69k1CQA5jVF+cYK86qtev
	l/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yyde0t1bhaY8+D3kzIVbKN+CZKXV1ydZoul8ZekF0G0=;
	b=JnrPgo3Idrm1sijuoxNc+LxtMe+Yr077Bo9gwukuUTplR+XJzQXlAz2VtjViBzLwle
	AqTN++vgudlJ+L3wb2hBta1rvuYJ8ClInmMcXhJxCRh4Bm7my83LovNTuJIM4w7B/D+e
	2brHJBxMfoLT5aR7oIX0/NoD6RvRD/gMsfoPlCwdN1ziYEsxU1Y2t1izjqTUPZsdAJ77
	/p3Kk5KJRt7Gcq8Oc6RWe+0L4J22MfqoAcYrt0Uu4QegbV7YyYFmL00vUZlmld840KTg
	b7iaoua2c9RM9DLGjtJKqtSoUaVz9fb19ATX2OWMfnLsKCd1cx2cpQthJdA8tJFe4/Eb
	bUkw==
X-Gm-Message-State: APjAAAVBYFzXSG2V9DWjj+IPCUFbjRTOncEG41gGZ32WUpbHhRaAdCf9
	sjW/lWoMn+TPMP7BCTjP++hllJqxrY0=
X-Google-Smtp-Source: APXvYqy3nLdSR/lGHFa0/6EtaT9esioatSkA7zW5KKuzDiE65ngsC419IYy5LuFplaZuwH+6OYeZ5w==
X-Received: by 2002:a1c:20c1:: with SMTP id g184mr2825541wmg.137.1554901930864;
	Wed, 10 Apr 2019 06:12:10 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:27 +0530
Message-Id: <862c96a98d2087cf05fbfeeafb57dcef1225d978.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 08/33] oeqa/manual/bsp-hw.json: test id updated and obsolete test cases removed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2019 13:12:11 -0000

From: sangeeta jain <sangeeta.jain@intel.com>

Two changes made in oeqa/manual/bsp-hw.json:

1. All test id (eg. @alias) inside manual testcase file shall follow the same test id naming
convention from oeqa automated tests (eg. selftest, runtime, sdk, etc), where the
test id consists of  <test_module>.<test_suite>.<test_function>. Furthermore,
there shall be only 1 unique test_module per each manual testcases file.

This file was using more than 1 unique test_module for testcases.
Furthermore, some of the testcases were defined using different test_suite where it was not
needed. This patch fix the manual testcases file to have only 1 unique
test_module as well as test_suite to simplify test id naming.

2. As per review by Intel and Windriver team, 7 testcases were found obsolete. Removed 7 testcases.

Signed-off-by: sangeeta jain <sangeeta.jain@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 266 +++++++--------------------------------
 1 file changed, 46 insertions(+), 220 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index 2bbf4b2..4b7c76f 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -1,7 +1,7 @@
 [
     {
         "test": {
-            "@alias": "bsps-hw.bsps-tools.rpm_-__install_dependency_package",
+            "@alias": "bsps-hw.bsps-hw.rpm_-__install_dependency_package",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -27,7 +27,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.boot_and_install_from_USB",
+            "@alias": "bsps-hw.bsps-hw.boot_and_install_from_USB",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -61,7 +61,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.live_boot_from_USB",
+            "@alias": "bsps-hw.bsps-hw.live_boot_from_USB",
             "author": [
                 {
                     "email": "juan.fernandox.ramos.frayle@intel.com",
@@ -87,7 +87,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.boot_from_runlevel_3",
+            "@alias": "bsps-hw.bsps-hw.boot_from_runlevel_3",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -121,7 +121,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.boot_from_runlevel_5",
+            "@alias": "bsps-hw.bsps-hw.boot_from_runlevel_5",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -151,7 +151,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.shutdown_system",
+            "@alias": "bsps-hw.bsps-hw.shutdown_system",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -173,7 +173,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.reboot_system",
+            "@alias": "bsps-hw.bsps-hw.reboot_system",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -195,7 +195,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.switch_among_multi_applications_and_desktop",
+            "@alias": "bsps-hw.bsps-hw.switch_among_multi_applications_and_desktop",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -225,7 +225,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.USB_-_mount",
+            "@alias": "bsps-hw.bsps-hw.USB_-_mount",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -251,7 +251,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.USB_-_read_files",
+            "@alias": "bsps-hw.bsps-hw.USB_-_read_files",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -281,7 +281,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.USB_-_umount",
+            "@alias": "bsps-hw.bsps-hw.USB_-_umount",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -307,7 +307,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.USB_-_write_files",
+            "@alias": "bsps-hw.bsps-hw.USB_-_write_files",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -333,7 +333,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.ethernet_static_ip_set_in_connman",
+            "@alias": "bsps-hw.bsps-hw.ethernet_static_ip_set_in_connman",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -367,7 +367,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.ethernet_get_IP_in_connman_via_DHCP",
+            "@alias": "bsps-hw.bsps-hw.ethernet_get_IP_in_connman_via_DHCP",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -397,7 +397,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-tools.connman_offline_mode_in_connman-gnome",
+            "@alias": "bsps-hw.bsps-hw.connman_offline_mode_in_connman-gnome",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -419,7 +419,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.X_server_can_start_up_with_runlevel_5_boot",
+            "@alias": "bsps-hw.bsps-hw.X_server_can_start_up_with_runlevel_5_boot",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -441,7 +441,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.standby",
+            "@alias": "bsps-hw.bsps-hw.standby",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -475,7 +475,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.check_CPU_utilization_after_standby",
+            "@alias": "bsps-hw.bsps-hw.check_CPU_utilization_after_standby",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -505,7 +505,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.Test_if_LAN_device_works_well_after_resume_from_suspend_state",
+            "@alias": "bsps-hw.bsps-hw.Test_if_LAN_device_works_well_after_resume_from_suspend_state",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -535,7 +535,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.Test_if_usb_hid_device_works_well_after_resume_from_suspend_state",
+            "@alias": "bsps-hw.bsps-hw.Test_if_usb_hid_device_works_well_after_resume_from_suspend_state",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -565,7 +565,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-tools.click_terminal_icon_on_X_desktop",
+            "@alias": "bsps-hw.bsps-hw.click_terminal_icon_on_X_desktop",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -587,7 +587,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-tools.Add_multiple_files_in_media_player",
+            "@alias": "bsps-hw.bsps-hw.Add_multiple_files_in_media_player",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -613,7 +613,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.check_bash_in_image",
+            "@alias": "bsps-hw.bsps-hw.check_bash_in_image",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -631,7 +631,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.MicroSD_-__mount",
+            "@alias": "bsps-hw.bsps-hw.MicroSD_-__mount",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -653,7 +653,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.MicroSD_-__read_files",
+            "@alias": "bsps-hw.bsps-hw.MicroSD_-__read_files",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -683,7 +683,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.MicroSD_-__umount",
+            "@alias": "bsps-hw.bsps-hw.MicroSD_-__umount",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -713,7 +713,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.MicroSD_-__write_files",
+            "@alias": "bsps-hw.bsps-hw.MicroSD_-__write_files",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -743,7 +743,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-tools.video_-_libva_check_(ogg_video_play)",
+            "@alias": "bsps-hw.bsps-hw.video_-_libva_check_(ogg_video_play)",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -769,29 +769,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-tools.media_player_-_unable_to_play_MPEG-1_without_\"commercial\"_flag",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Copy sample MPEG-1 file to a system without the \"commercial\" flag.",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Launch media player and make sure it cannot play the MPEG-1 file.",
-                    "expected_results": "MPEG-1 file can not be played on images without the \"commercial\" flag. "
-                }
-            },
-            "summary": "media_player_-_unable_to_play_MPEG-1_without_\"commercial\"_flag"
-        }
-    },
-    {
-        "test": {
-            "@alias": "bsps-hw.bsps-tools.media_player_-_play_video_(ogv)",
+            "@alias": "bsps-hw.bsps-hw.media_player_-_play_video_(ogv)",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -813,7 +791,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-tools.media_player_-_stop/play_button_(ogv)",
+            "@alias": "bsps-hw.bsps-hw.media_player_-_stop/play_button_(ogv)",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -843,7 +821,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-tools.audio_-_play_(ogg)_with_HDMI",
+            "@alias": "bsps-hw.bsps-hw.audio_-_play_(ogg)_with_HDMI",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -869,7 +847,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-tools.audio_-_play_(wav)_with_HDMI",
+            "@alias": "bsps-hw.bsps-hw.audio_-_play_(wav)_with_HDMI",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -895,7 +873,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-tools.Graphics_-_ABAT",
+            "@alias": "bsps-hw.bsps-hw.Graphics_-_ABAT",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -921,7 +899,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-tools.Graphics_-_x11perf_-_2D",
+            "@alias": "bsps-hw.bsps-hw.Graphics_-_x11perf_-_2D",
             "author": [
                 {
                     "email": "alexandru.c.georgescu@intel.com",
@@ -943,33 +921,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-oe-core.Test_Run_Integrity_-_Check_that_image_is_buildable",
-            "author": [
-                {
-                    "email": "corneliux.stoicescu@intel.com",
-                    "name": "corneliux.stoicescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Check that image can be built using either of the following methods:  \n\n",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Check that image is built by autobuilder \nPlease check at: https://autobuilder.yocto.io/pub/releases/ \nChoose the target release that you are validating.  \n\n",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "Build image yourself \nPreferred to build an core-image-sato-dev to ease the process of the dependent test cases in this run. \nNote: Please set MACHINE in conf/local.conf ",
-                    "expected_results": "If either method fails, this test case will be failed and dependent test cases will be blocked. "
-                }
-            },
-            "summary": "Test_Run_Integrity_-_Check_that_image_is_buildable"
-        }
-    },
-    {
-        "test": {
-            "@alias": "bsps-hw.bsps-runtime.Check_if_SATA_disk_can_work_correctly",
+            "@alias": "bsps-hw.bsps-hw.Check_if_SATA_disk_can_work_correctly",
             "author": [
                 {
                     "email": "yi.zhao@windriver.com",
@@ -999,7 +951,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.Install_and_boot_from_USB-drive_to_HDD-drive",
+            "@alias": "bsps-hw.bsps-hw.Install_and_boot_from_USB-drive_to_HDD-drive",
             "author": [
                 {
                     "email": "david.israelx.rodriguez.castellanos@intel.com",
@@ -1041,7 +993,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.Install_and_boot_from_USB-drive_to_SD-drive",
+            "@alias": "bsps-hw.bsps-hw.Install_and_boot_from_USB-drive_to_SD-drive",
             "author": [
                 {
                     "email": "david.israelx.rodriguez.castellanos@intel.com",
@@ -1083,7 +1035,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.Test_boot_on_serial_communication_SD",
+            "@alias": "bsps-hw.bsps-hw.Test_boot_on_serial_communication_SD",
             "author": [
                 {
                     "email": "juan.fernandox.ramos.frayle@intel.com",
@@ -1101,7 +1053,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.Test_boot_on_serial_communication_HDD",
+            "@alias": "bsps-hw.bsps-hw.Test_boot_on_serial_communication_HDD",
             "author": [
                 {
                     "email": "juan.fernandox.ramos.frayle@intel.com",
@@ -1119,7 +1071,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.Test_boot_on_serial_communication_USB",
+            "@alias": "bsps-hw.bsps-hw.Test_boot_on_serial_communication_USB",
             "author": [
                 {
                     "email": "juan.fernandox.ramos.frayle@intel.com",
@@ -1153,7 +1105,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-runtime.Test_Seek_bar_and_volume_control",
+            "@alias": "bsps-hw.bsps-hw.Test_Seek_bar_and_volume_control",
             "author": [
                 {
                     "email": "juan.fernandox.ramos.frayle@intel.com",
@@ -1199,7 +1151,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-runtime.bsps-runtime.Check_if_watchdog_can_reset_the_target_system",
+            "@alias": "bsps-hw.bsps-hw.Check_if_watchdog_can_reset_the_target_system",
             "author": [
                 {
                     "email": "yi.zhao@windriver.com",
@@ -1217,7 +1169,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-runtime.bsps-runtime.Check_if_RTC_(Real_Time_Clock)_can_work_correctly",
+            "@alias": "bsps-hw.bsps-hw.Check_if_RTC_(Real_Time_Clock)_can_work_correctly",
             "author": [
                 {
                     "email": "yi.zhao@windriver.com",
@@ -1251,7 +1203,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-runtime.bsps-runtime.Check_if_target_can_support_EEPROM",
+            "@alias": "bsps-hw.bsps-hw.Check_if_target_can_support_EEPROM",
             "author": [
                 {
                     "email": "yi.zhao@windriver.com",
@@ -1273,107 +1225,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-tools.bsps-tools.smart_add_rpm-dir_channel_(auto)",
-            "author": [
-                {
-                    "email": "corneliux.stoicescu@intel.com",
-                    "name": "corneliux.stoicescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Build out packages with poky tree and copy the deploy/rpm directory to target directory. ",
-                    "expected_results": "The command should add a rpm-dir channel with smart. "
-                },
-                "2": {
-                    "action": "On target, run \"smart channel --add myrpmdir type=rpm-dir path=/path/to/tmp/deploy/rpm/i586\". ",
-                    "expected_results": "Run \"smart channel --show myrpmdir\" can show the information about the channel:\n[myrpmdir] \ntype = rpm-dir \npath = /path/to/tmp/deploy/rpm/i586"
-                },
-                "3": {
-                    "action": "Run \"smart channel --show myrpmdir\" and check the output. ",
-                    "expected_results": "After disable the channel, run \"smart channel --show myrpmdir\" would show:\n[myrpmdir] \ntype = rpm-dir \ndisabled = yes \npath = /path/to/tmp/deploy/rpm/i586"
-                },
-                "4": {
-                    "action": "Run \"smart channel --disable myrpmdir\" to diable the channel. ",
-                    "expected_results": ""
-                },
-                "5": {
-                    "action": "Run \"smart channel --show myrpmdir\" and check the output.",
-                    "expected_results": ""
-                }
-            },
-            "summary": "smart_add_rpm-dir_channel"
-        }
-    },
-    {
-        "test": {
-            "@alias": "bsps-tools.bsps-tools.smart_install_package_from_a_local_directory_(auto)",
-            "author": [
-                {
-                    "email": "corneliux.stoicescu@intel.com",
-                    "name": "corneliux.stoicescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Copy packages directory to target and add a rpm-dir channel with \nsmart. Make sure this channel and the default rpm-sys channel are \nenabled.",
-                    "expected_results": "The package \"groff\" should be installed."
-                },
-                "2": {
-                    "action": "Run \"smart install package_name\" to install a package from the deploy/rpm/i586 directory. For example, \"smart install groff\".",
-                    "expected_results": ""
-                }
-            },
-            "summary": "smart_install_package_from_a_local_directory"
-        }
-    },
-    {
-        "test": {
-            "@alias": "bsps-tools.bsps-tools.smart_install_package_from_a_remote_repomd_repository_(auto)",
-            "author": [
-                {
-                    "email": "corneliux.stoicescu@intel.com",
-                    "name": "corneliux.stoicescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Follow procedure in \"https://wiki.yoctoproject.org/wiki/Rpm%27s_Repository_Setup_for_QA\" to create a rpm-md-channel and updatechannelinformation with smart. ",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Make sure this channel and the default rpm-sys channel are enabled with \"smart channel --show\". ",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "Run \"smart install \" to install a package from the remote repository. For example, \"smart install groff\" ",
-                    "expected_results": "The package should be installed. At the example \"groff\" should be installed correctly."
-                }
-            },
-            "summary": "smart_install_package_from_a_remote_repomd_repository"
-        }
-    },
-    {
-        "test": {
-            "@alias": "bsps-tools.bsps-tools.smart_remove_package_(auto)",
-            "author": [
-                {
-                    "email": "corneliux.stoicescu@intel.com",
-                    "name": "corneliux.stoicescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Run \"smart remove \" and check the output, for example \"smart remove groff\"",
-                    "expected_results": "The package should be removed . At the example \"groff\" should be removed.\n"
-                }
-            },
-            "summary": "smart_remove_package"
-        }
-    },
-    {
-        "test": {
-            "@alias": "bsps-meta-yocto.bsps-meta-yocto.System_can_boot_up_via_NFS",
+            "@alias": "bsps-hw.bsps-hw.System_can_boot_up_via_NFS",
             "author": [
                 {
                     "email": "yi.zhao@windriver.com",
@@ -1403,33 +1255,7 @@
     },
     {
         "test": {
-            "@alias": "bsps-meta-yocto.bsps-meta-yocto.System_can_boot_up_via_USB",
-            "author": [
-                {
-                    "email": "yi.zhao@windriver.com",
-                    "name": "yi.zhao@windriver.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Copy the kernel and rootfs to the USB stick.  # mount /dev/sda2 /media/sda2  # tar -xvjpf core-image-minimal-XXX.tar.bz2 -C /media/sda2  # cp vmlinux /media/sda2/boot/vmlinux  # umount /media/sda2 ",
-                    "expected_results": "The system should boot up via USB\n"
-                },
-                "2": {
-                    "action": "Reboot the board and press a key on the terminal when prompted to get to the U-Boot command line  # reboot ",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "Load the kernel and boot: => ext2load usb 0:2 $loadaddr boot/vmlinux => bootoctlinux $loadaddr coremask=0x3 root=/dev/sda2 rw rootwait mtdparts=phys_mapped_flash:512k(boot0),512k(boot1),64k@3072k(eeprom)",
-                    "expected_results": ""
-                }
-            },
-            "summary": "System_can_boot_up_via_USB"
-        }
-    },
-    {
-        "test": {
-            "@alias": "bsps-meta-yocto.bsps-meta-yocto.Boot_from_JFFS2_image",
+            "@alias": "bsps-hw.bsps-hw.Boot_from_JFFS2_image",
             "author": [
                 {
                     "email": "yi.zhao@windriver.com",
-- 
2.7.4


