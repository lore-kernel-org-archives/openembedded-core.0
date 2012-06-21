Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1ShpDc-0007jJ-Am; Thu, 21 Jun 2012 23:47:12 +0200
Received: by ghbz2 with SMTP id z2so949661ghb.6
	for <multiple recipients>; Thu, 21 Jun 2012 14:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=2K7RZiEMu9u+exaI1tSXEdGunp0JXyVIcHBXvLcVUG8=;
	b=hTgc2CO7Xxaj6u3T7anbtyKSfJ5ve3p3czayX/sas2SnbL/54l+qrDliJaL7FyHwn0
	KfP5qTB1K1F7Y5TxzosJHUafZ07FFfBYdsC7B4SHnm+A2swAbO4Ldr8U9S50iIERZSrX
	X3T26Hpzkx2FCH/6XFjZWBq9KhWUki2zrmfiNQlox9Fg1bZLu0xnpsSW26p4N33lAw5o
	7RkvpbVJp+/miZL5gtslCe0B7RbXHoNgQSsiQIchzr2Vm9ZI1sKExPsuBaYMp9JxcD/2
	GSaSD+vX2lEiLC+VmeBZczDq3pkjKY3v3jVRkNh7ZJROg1QiSFsTPF8zTg2T0kL6GcGt
	R2rg==
MIME-Version: 1.0
Received: by 10.50.236.97 with SMTP id ut1mr8960008igc.50.1340314585181; Thu,
	21 Jun 2012 14:36:25 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Thu, 21 Jun 2012 14:36:25 -0700 (PDT)
Date: Thu, 21 Jun 2012 23:36:25 +0200
Message-ID: <CALbNGRQaXTcnNPX+W04tnZzchkTZDvYdUJd2CYT03CWbW6pF9g@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core@lists.openembedded.org
Subject: (No subject)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2012 21:47:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

after updating all my repos (angstrom+few extra layers) I get

  /home/Superandy/data/oe-core/sources/meta-intel/meta-sugarbay/recipes-kernel/linux/linux-yocto_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-crownbay/recipes-kernel/linux/linux-yocto_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-kernel/linux/linux-yocto_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-fishriver/recipes-kernel/linux/linux-yocto_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-fri2/recipes-kernel/linux/linux-yocto_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-jasperforest/recipes-kernel/linux/linux-yocto_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-n450/recipes-kernel/linux/linux-yocto_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-handheld/recipes-kernel/linux/linux-yocto_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-sugarbay/recipes-bsp/formfactor/formfactor_0.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-crownbay/recipes-bsp/formfactor/formfactor_0.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-bsp/formfactor/formfactor_0.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-fishriver/recipes-bsp/formfactor/formfactor_0.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-fri2/recipes-bsp/formfactor/formfactor_0.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-jasperforest/recipes-bsp/formfactor/formfactor_0.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-n450/recipes-bsp/formfactor/formfactor_0.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-nokia/recipes-bsp/formfactor/formfactor_0.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-handheld/recipes-bsp/formfactor/formfactor_0.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-ti/recipes-bsp/formfactor/formfactor_0.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-nokia/recipes-multimedia/mplayer/mplayer2_git.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/recipes-multimedia/mplayer/mplayer2_git.bbappend
  /home/Superandy/data/oe-core/sources/meta-angstrom/recipes-core/update-rc.d/update-rc.d_0.7.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-sugarbay/recipes-kernel/linux/linux-yocto-rt_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-crownbay/recipes-kernel/linux/linux-yocto-rt_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-kernel/linux/linux-yocto-rt_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-fishriver/recipes-kernel/linux/linux-yocto-rt_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-fri2/recipes-kernel/linux/linux-yocto-rt_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-jasperforest/recipes-kernel/linux/linux-yocto-rt_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-n450/recipes-kernel/linux/linux-yocto-rt_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-palm/recipes-bsp/x-load/x-load_git.bbappend
  /home/Superandy/data/oe-core/sources/meta-gumstix/recipes-bsp/x-load/x-load_git.bbappend
  /home/Superandy/data/oe-core/sources/meta-angstrom/recipes-extended/zypper/zypper_git.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-sugarbay/recipes-kernel/linux/linux-yocto-rt_3.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-crownbay/recipes-kernel/linux/linux-yocto-rt_3.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-kernel/linux/linux-yocto-rt_3.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-fishriver/recipes-kernel/linux/linux-yocto-rt_3.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-fri2/recipes-kernel/linux/linux-yocto-rt_3.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-jasperforest/recipes-kernel/linux/linux-yocto-rt_3.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-n450/recipes-kernel/linux/linux-yocto-rt_3.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer/recipes-devtools/gcc/gcc-runtime_4.6.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-qt/qt4/qt4-x11-free_4.8.1.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.1.bbappend
  /home/Superandy/data/oe-core/sources/meta-kde/recipes-misc-support/qt4-x11-free_4.8.1.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-fri2/recipes-bsp/alsa-state/alsa-state.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-n450/recipes-bsp/alsa-state/alsa-state.bbappend
  /home/Superandy/data/oe-core/sources/meta-ti/recipes-bsp/alsa-state/alsa-state.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-palm/recipes-graphics/tslib/tslib_git.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend
  /home/Superandy/data/oe-core/sources/meta-handheld/recipes-bsp/kexecboot/kexecboot-klibc_git.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-gnome/tasks/task-core-sdk-gmae.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-sugarbay/recipes-kernel/linux/linux-yocto_3.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-crownbay/recipes-kernel/linux/linux-yocto_3.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-kernel/linux/linux-yocto_3.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-fishriver/recipes-kernel/linux/linux-yocto_3.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-fri2/recipes-kernel/linux/linux-yocto_3.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-jasperforest/recipes-kernel/linux/linux-yocto_3.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-n450/recipes-kernel/linux/linux-yocto_3.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer/recipes-devtools/gcc/gcc_4.6.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-qt/tasks/task-qte-toolchain-target.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.1.bbappend
  /home/Superandy/data/oe-core/sources/meta-angstrom/recipes-core/base-files/base-files_3.0.14.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-nokia/recipes-core/base-files/base-files_3.0.14.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/recipes-core/base-files/base-files_3.0.14.bbappend
  /home/Superandy/data/oe-core/sources/meta-kde/recipes-misc-support/qt4-native_4.8.1.bbappend
  /home/Superandy/data/oe-core/sources/meta-ti/recipes-core/netbase/netbase_4.47.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/recipes-graphics/drm/libdrm_2.4.34.bbappend
  /home/Superandy/data/oe-core/sources/meta-gumstix/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer/recipes-devtools/gcc/gcc-cross_4.6.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/recipes-multimedia/mplayer/mplayer-common.bbappend
  /home/Superandy/data/oe-core/sources/meta-freescale/recipes-bsp/u-boot/u-boot_git.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-sugarbay/recipes-core/tasks/task-core-tools-profile.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-crownbay/recipes-core/tasks/task-core-tools-profile.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-core/tasks/task-core-tools-profile.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-fishriver/recipes-core/tasks/task-core-tools-profile.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-fri2/recipes-core/tasks/task-core-tools-profile.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-jasperforest/recipes-core/tasks/task-core-tools-profile.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-n450/recipes-core/tasks/task-core-tools-profile.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-sugarbay/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-crownbay/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-fishriver/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-fri2/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-jasperforest/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-n450/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-htc/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-nokia/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-palm/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
  /home/Superandy/data/oe-core/sources/meta-handheld/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
  /home/Superandy/data/oe-core/sources/meta-ti/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-nokia/recipes-core/initscripts/initscripts_1.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/recipes-core/initscripts/initscripts_1.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-palm/recipes-core/initscripts/initscripts_1.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtk-update-icon-cache-runonce.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-nokia/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-gumstix/recipes-kernel/linux/linux_3.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-handheld/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-gnome/tasks/task-core-standalone-gmae-sdk-target.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/recipes-core/tasks/task-base.bbappend
  /home/Superandy/data/oe-core/sources/meta-handheld/recipes-bsp/kexecboot/kexecboot_git.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-nokia/recipes-core/systemd/systemd-machine-units_1.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/recipes-core/systemd/systemd-machine-units_1.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/meta-gnome/recipes-gnome/gtk+/gtk+_2.24.8.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-connectivity/connman/connman_0.79.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-palm/recipes-support/lvm2/lvm2_2.02.85.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/recipes-graphics/mesa/mesa-dri_7.11.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.bbappend
  /home/Superandy/data/oe-core/sources/meta-browser/recipes-support/nspr/nspr_4.8.9.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/pixman_0.25.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-angstrom/recipes-core/sysvinit/sysvinit_2.88dsf.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/recipes-navigation/gpsd/gpsd_3.4.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-smartphone/meta-nokia/recipes-bsp/keymaps/keymaps_1.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-handheld/recipes-bsp/keymaps/keymaps_1.0.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/common/recipes-kernel/linux-firmware/linux-firmware_git.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk_4.6.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer/recipes-devtools/gcc/gcc-cross-initial_4.6.bbappend
  /home/Superandy/data/oe-core/sources/meta-gumstix/recipes-kernel/linux/linux-mainline_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer/recipes-devtools/gcc/libgcc_4.6.bbappend
  /home/Superandy/data/oe-core/sources/meta-handheld/recipes-core/udev/udev_164.bbappend

Strange: many recipes are available. Anybody else with similar experience?

Andreas


