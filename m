Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 46D646EF77
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 17:17:26 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id g15so1189152eak.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Mar 2014 09:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cEsDEQIjgOcQOLcpGSvZ1PRTpO4ykZfyOJl0paS9xKE=;
	b=XSNJhf+WXe6440niLW/39w9CX/+MF3UxmiCL1ezlv6Nya5Zbn1G3KlpC/gtQVPo3S/
	C0LJXhL1vKVluulovHn4BrjaPpWoQ9yA/0wBC7rFhyjdm9mujWhxrMoYzZXCIUw2UWmz
	LfcuEavophia/8ZVSEv/TkgM0ns0Q3sTAdveqGnbt/6AFXV2u90un1N637eIsff3/yT5
	YwrxcKViNGu/nR9ypPTc8KY29u8pbnaJS2YQ3q75QAFwJ6RYV0OzcL8dt6unc6HjI3W8
	Ej2cFF96sc4FgxegZ8sTz79cJD4VNb3S01tdkRmvaTaAQ55xi8I5/f1mYgG33ZrB21kH
	Ms8g==
X-Received: by 10.14.109.201 with SMTP id s49mr4205371eeg.88.1394039847406;
	Wed, 05 Mar 2014 09:17:27 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y51sm11304396eeu.0.2014.03.05.09.17.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Mar 2014 09:17:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Mar 2014 18:17:18 +0100
Message-Id: <1394039838-8933-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1394039838-8933-1-git-send-email-Martin.Jansa@gmail.com>
References: <1394039838-8933-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] recipes: bump PRs
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
X-List-Received-Date: Wed, 05 Mar 2014 17:17:28 -0000

* resolves following warnings:
  WARNING: Use of PRINC 17 was detected in the recipe meta-openembedded/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe meta-openembedded/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe meta-openembedded/meta-gpe/recipes-support/fbreader/fbreader_git.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe meta-openembedded/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe meta-smartphone/meta-android/recipes-bsp/chroot-script/chroot-script_1.0.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-connectivity/bind/bind_9.8.1.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-core/systemd/systemd-serialgetty.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-extended/screen/screen_4.0.3.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb (or one of its .bbappends)
  WARNING: Use of PRINC 1 was detected in the recipe openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb (or one of its .bbappends)
  WARNING: Use of PRINC 11 was detected in the recipe openembedded-core/meta/recipes-bsp/keymaps/keymaps_1.0.bb (or one of its .bbappends)
  WARNING: Use of PRINC 11 was detected in the recipe openembedded-core/meta/recipes-core/systemd/systemd-compat-units.bb (or one of its .bbappends)
  WARNING: Use of PRINC 12 was detected in the recipe openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb (or one of its .bbappends)
  WARNING: Use of PRINC 13 was detected in the recipe openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb (or one of its .bbappends)
  WARNING: Use of PRINC 2 was detected in the recipe meta-openembedded/meta-oe/recipes-navigation/navit/navit_svn.bb (or one of its .bbappends)
  WARNING: Use of PRINC 2 was detected in the recipe meta-openembedded/meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb (or one of its .bbappends)
  WARNING: Use of PRINC 2 was detected in the recipe openembedded-core/meta/recipes-connectivity/portmap/portmap_6.0.bb (or one of its .bbappends)
  WARNING: Use of PRINC 2 was detected in the recipe openembedded-core/meta/recipes-extended/pam/libpam_1.1.6.bb (or one of its .bbappends)
  WARNING: Use of PRINC 2 was detected in the recipe openembedded-core/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb (or one of its .bbappends)
  WARNING: Use of PRINC 3 was detected in the recipe meta-openembedded/meta-efl/recipes-efl/efl/entrance_svn.bb (or one of its .bbappends)
  WARNING: Use of PRINC 3 was detected in the recipe meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb (or one of its .bbappends)
  WARNING: Use of PRINC 3 was detected in the recipe openembedded-core/meta/recipes-bsp/formfactor/formfactor_0.0.bb (or one of its .bbappends)
  WARNING: Use of PRINC 3 was detected in the recipe openembedded-core/meta/recipes-connectivity/avahi/avahi_0.6.31.bb (or one of its .bbappends)
  WARNING: Use of PRINC 3 was detected in the recipe openembedded-core/meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb (or one of its .bbappends)
  WARNING: Use of PRINC 3 was detected in the recipe openembedded-core/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb (or one of its .bbappends)
  WARNING: Use of PRINC 3 was detected in the recipe openembedded-core/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb (or one of its .bbappends)
  WARNING: Use of PRINC 5 was detected in the recipe meta-openembedded/meta-oe/recipes-core/meta/distro-feed-configs.bb (or one of its .bbappends)
  WARNING: Use of PRINC 5 was detected in the recipe openembedded-core/meta/recipes-connectivity/bluez/bluez4_4.101.bb (or one of its .bbappends)
  WARNING: Use of PRINC 6 was detected in the recipe openembedded-core/meta/recipes-core/packagegroups/packagegroup-base.bb (or one of its .bbappends)
  WARNING: Use of PRINC 6 was detected in the recipe openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-boot.bb (or one of its .bbappends)
  WARNING: Use of PRINC 6 was detected in the recipe openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb (or one of its .bbappends)
  WARNING: Use of PRINC 7 was detected in the recipe meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb (or one of its .bbappends)
  WARNING: Use of PRINC 7 was detected in the recipe openembedded-core/meta/recipes-core/udev/udev-extraconf_1.0.bb (or one of its .bbappends)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-bsp/formfactor/formfactor_0.0.bb                        | 2 +-
 meta/recipes-bsp/keymaps/keymaps_1.0.bb                              | 2 +-
 meta/recipes-connectivity/avahi/avahi.inc                            | 2 +-
 meta/recipes-connectivity/bind/bind_9.8.1.bb                         | 2 +-
 meta/recipes-connectivity/bluez/bluez4_4.101.bb                      | 2 +-
 meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb                      | 2 +-
 meta/recipes-connectivity/portmap/portmap_6.0.bb                     | 2 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb                    | 2 +-
 meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb                 | 2 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb                     | 2 +-
 meta/recipes-core/packagegroups/packagegroup-base.bb                 | 2 +-
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb            | 2 +-
 meta/recipes-core/systemd/systemd-compat-units.bb                    | 2 +-
 meta/recipes-core/systemd/systemd-serialgetty.bb                     | 2 +-
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb               | 2 +-
 meta/recipes-core/udev/udev-extraconf_1.0.bb                         | 2 +-
 meta/recipes-extended/pam/libpam_1.1.6.bb                            | 2 +-
 meta/recipes-extended/screen/screen_4.0.3.bb                         | 2 +-
 meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb             | 2 +-
 meta/recipes-extended/shadow/shadow.inc                              | 2 +-
 meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb | 2 +-
 meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb         | 2 +-
 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb     | 2 +-
 meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb        | 2 +-
 meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb     | 2 +-
 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb             | 2 +-
 meta/recipes-support/libcap/libcap_2.22.bb                           | 2 +-
 27 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-bsp/formfactor/formfactor_0.0.bb b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
index ae1a759..29d1435 100644
--- a/meta/recipes-bsp/formfactor/formfactor_0.0.bb
+++ b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r41"
+PR = "r44"
 
 SRC_URI = "file://config file://machconfig"
 S = "${WORKDIR}"
diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
index 1876db8..123db3e 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -10,7 +10,7 @@ RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_initscripts} kbd"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-PR = "r20"
+PR = "r31"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index e4ff26a..6f89441 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -14,7 +14,7 @@ SECTION = "network"
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
-INC_PR = "r7"
+INC_PR = "r11"
 
 DEPENDS = "expat libcap libdaemon dbus glib-2.0"
 
diff --git a/meta/recipes-connectivity/bind/bind_9.8.1.bb b/meta/recipes-connectivity/bind/bind_9.8.1.bb
index e12bb39..d59f7e5 100644
--- a/meta/recipes-connectivity/bind/bind_9.8.1.bb
+++ b/meta/recipes-connectivity/bind/bind_9.8.1.bb
@@ -6,7 +6,7 @@ LICENSE = "ISC & BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0fbe2a3ab3c68ac3fea3cad13093877c"
 
 DEPENDS = "openssl libcap"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://conf.patch \
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
index 543f854..ccd230d 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -1,6 +1,6 @@
 require bluez4.inc
 
-PR = "r5"
+PR = "r10"
 
 SRC_URI += "file://bluetooth.conf \
             file://sbc_mmx.patch \
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb
index 08db41b..0c9f0db 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb
@@ -1,6 +1,6 @@
 require dhcp.inc
 
-PR = "r1"
+PR = "r4"
 
 SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://fix-external-bind.patch \
diff --git a/meta/recipes-connectivity/portmap/portmap_6.0.bb b/meta/recipes-connectivity/portmap/portmap_6.0.bb
index 2ec6981..68dd796 100644
--- a/meta/recipes-connectivity/portmap/portmap_6.0.bb
+++ b/meta/recipes-connectivity/portmap/portmap_6.0.bb
@@ -1,6 +1,6 @@
 require portmap.inc
 
-PR = "r7"
+PR = "r9"
 
 SRC_URI = "http://www.sourcefiles.org/Networking/Tools/Miscellanenous/portmap-6.0.tgz \
            file://destdir-no-strip.patch \
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index dbf40fa..cee19a1 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Miscellaneous files for the base system"
 DESCRIPTION = "The base-files package creates the basic system directory structure and provides a small set of key configuration files for the system."
 SECTION = "base"
-PR = "r73"
+PR = "r86"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://licenses/GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
 # Removed all license related tasks in this recipe as license.bbclass 
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
index 77e8384..3d88506 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://packages.debian.org/ifupdown"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
-PR = "r3"
+PR = "r7"
 
 inherit update-rc.d
 
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 6cfea1a..62d0eae 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r141"
+PR = "r154"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index e39ccd7..d3e35df 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Merge machine and distro options to create a basic machine task/package"
 LICENSE = "MIT"
-PR = "r76"
+PR = "r82"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 5455899..1154bc0 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -5,7 +5,7 @@
 SUMMARY = "Minimal boot requirements"
 DESCRIPTION = "The minimal set of packages required to boot the system"
 LICENSE = "MIT"
-PR = "r11"
+PR = "r17"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index a9cc15a..6419bc2 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -3,7 +3,7 @@ SUMMARY = "Enhances systemd compatilibity with existing SysVinit scripts"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
-PR = "r18"
+PR = "r29"
 
 DEPENDS = "systemd-systemctl-native"
 
diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 8db3d00..13b2dba 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -2,7 +2,7 @@ SUMMARY = "Serial terminal support for systemd"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
-PR = "r3"
+PR = "r5"
 
 SERIAL_CONSOLE ?= "115200 ttyS0"
 
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index a13d509..30641da 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -2,7 +2,7 @@ SUMMARY = "Inittab configuration for SysVinit"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "file://inittab"
 
diff --git a/meta/recipes-core/udev/udev-extraconf_1.0.bb b/meta/recipes-core/udev/udev-extraconf_1.0.bb
index 0efa83a..abfd9a0 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.0.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r8"
+PR = "r15"
 
 SRC_URI = " \
        file://automount.rules \
diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 8d0a568..6ddfcf4 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -42,7 +42,7 @@ EXTRA_OECONF = "--with-db-uniquename=_pam \
 
 CFLAGS_append = " -fPIC "
 
-PR = "r3"
+PR = "r5"
 
 S = "${WORKDIR}/Linux-PAM-${PV}"
 
diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-extended/screen/screen_4.0.3.bb
index edbf4f2..d83dda0 100644
--- a/meta/recipes-extended/screen/screen_4.0.3.bb
+++ b/meta/recipes-extended/screen/screen_4.0.3.bb
@@ -14,7 +14,7 @@ DEPENDS = "ncurses \
           ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "base-files"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz;name=tarball \
            ${DEBIAN_MIRROR}/main/s/screen/screen_4.0.3-14.diff.gz;name=patch \
diff --git a/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
index 9d2ca4d..0e04100 100644
--- a/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "file://securetty"
 
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index c5534ee..d6bf73b 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -44,7 +44,7 @@ SRC_URI_append_class-nativesdk = " \
 SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
 SRC_URI[sha256sum] = "633f5bb4ea0c88c55f3642c97f9d25cbef74f82e0b4cf8d54e7ad6f9f9caa778"
 
-PR = "r13"
+PR = "r14"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
index f9398fa..d58f743 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
@@ -4,7 +4,7 @@
 
 SUMMARY = "X11 display server"
 LICENSE = "MIT"
-PR = "r39"
+PR = "r40"
 
 inherit packagegroup
 
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index e89df3a..1a51428 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -3,7 +3,7 @@
 #
 
 LICENSE = "MIT"
-PR = "r38"
+PR = "r40"
 
 inherit packagegroup
 
diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
index 7a6f79b..65348c3 100644
--- a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Touchscreen calibration data from xinput-calibrator"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r4"
+PR = "r7"
 
 SRC_URI = "file://pointercal.xinput"
 S = "${WORKDIR}"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index 57b3c0c..3fe72e2 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r12"
+PR = "r19"
 
 SRC_URI = "file://xorg.conf"
 
diff --git a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
index 44a1bfc..125f5fb 100644
--- a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
+++ b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7bf87fc37976e93ec66ad84fac58c098"
 SRC_URI = "file://modutils.sh \
 	   file://PD.patch"
-PR = "r6"
+PR = "r7"
 
 INITSCRIPT_NAME = "modutils.sh"
 INITSCRIPT_PARAMS = "start 05 S ."
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
index d3ec7a8..fe0e397 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
@@ -4,7 +4,7 @@ AUTHOR = "Erik de Castro Lopo"
 DEPENDS = "sqlite3"
 SECTION = "libs/multimedia"
 LICENSE = "LGPLv2.1"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz"
 
diff --git a/meta/recipes-support/libcap/libcap_2.22.bb b/meta/recipes-support/libcap/libcap_2.22.bb
index 560bd69..a989bb6 100644
--- a/meta/recipes-support/libcap/libcap_2.22.bb
+++ b/meta/recipes-support/libcap/libcap_2.22.bb
@@ -1,6 +1,6 @@
 require libcap.inc
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI[md5sum] = "b4896816b626bea445f0b3849bdd4077"
 SRC_URI[sha256sum] = "e1cae65d8febf2579be37c255d2e058715785ead481a4e6a4357a06aff84721f"
-- 
1.9.0


