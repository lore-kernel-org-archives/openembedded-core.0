Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1Shplq-0000GK-5h; Fri, 22 Jun 2012 00:22:34 +0200
Received: by ghbz2 with SMTP id z2so983087ghb.6
	for <multiple recipients>; Thu, 21 Jun 2012 15:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=AcvlNSM710Fp6QFny1jFIAFmfhGas9RHM1gn6t8QrL8=;
	b=CmWAXFMpA/FdY08+T0dX0kDOyJiyQz5bPdFDbRPxrwjtdBBPTH1z5iibHR3+0k6vgK
	+bdUu5W649/hm7lIudO00CnFBId9wipxoBdMxKG7InjNBHWYgvzdCHdD+MLwPpWlthDX
	+Cs9A+ZYkfYi5bm+oZKA/eU14EU52ws+s7ZDe/gc5VPuzbcvuTrtGgAoSqsBQTXRrGQX
	gT3NugAbxxpn8nCSgYj6ZRggnTIQhkcts9lEojySqXL9hI7KsQY4PfYbfEpU/j6inK9r
	/IRKm92ZT3bH3J2X2jLMvGlQJHLmL9ClCSbRzfrE7V/bwwSZddI80YhrbF3YZiwVJJXh
	EhKA==
MIME-Version: 1.0
Received: by 10.42.148.196 with SMTP id s4mr14320887icv.19.1340316706603; Thu,
	21 Jun 2012 15:11:46 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Thu, 21 Jun 2012 15:11:46 -0700 (PDT)
Date: Fri, 22 Jun 2012 00:11:46 +0200
Message-ID: <CALbNGRQCVUeZFX_xxVe=3ixZMm7MRt3WWB5VxemNs0Bi+qCHcQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core@lists.openembedded.org, meta-ti@yoctoproject.org
Subject: massive fallout after updates / was (no subject)
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
X-List-Received-Date: Thu, 21 Jun 2012 22:22:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 21, 2012 at 11:36 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> after updating all my repos (angstrom+few extra layers) I get
>
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-sugarbay/recipes-=
kernel/linux/linux-yocto_3.2.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-crownbay/recipes-=
kernel/linux/linux-yocto_3.2.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-k=
ernel/linux/linux-yocto_3.2.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-fishriver/recipes=
-kernel/linux/linux-yocto_3.2.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-fri2/recipes-kern=
el/linux/linux-yocto_3.2.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-jasperforest/reci=
pes-kernel/linux/linux-yocto_3.2.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-n450/recipes-kern=
el/linux/linux-yocto_3.2.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-handheld/recipes-kernel/linu=
x/linux-yocto_3.2.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes=
-connectivity/dhcp/dhcp_4.2.3-P2.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-sugarbay/recipes-=
bsp/formfactor/formfactor_0.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-crownbay/recipes-=
bsp/formfactor/formfactor_0.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-b=
sp/formfactor/formfactor_0.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-fishriver/recipes=
-bsp/formfactor/formfactor_0.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-fri2/recipes-bsp/=
formfactor/formfactor_0.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-jasperforest/reci=
pes-bsp/formfactor/formfactor_0.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-n450/recipes-bsp/=
formfactor/formfactor_0.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-nokia/recipe=
s-bsp/formfactor/formfactor_0.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-handheld/recipes-bsp/formfac=
tor/formfactor_0.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-ti/recipes-bsp/formfactor/fo=
rmfactor_0.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-nokia/recipe=
s-multimedia/mplayer/mplayer2_git.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/rec=
ipes-multimedia/mplayer/mplayer2_git.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-angstrom/recipes-core/update=
-rc.d/update-rc.d_0.7.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-sugarbay/recipes-=
kernel/linux/linux-yocto-rt_3.2.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-crownbay/recipes-=
kernel/linux/linux-yocto-rt_3.2.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-k=
ernel/linux/linux-yocto-rt_3.2.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-fishriver/recipes=
-kernel/linux/linux-yocto-rt_3.2.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-fri2/recipes-kern=
el/linux/linux-yocto-rt_3.2.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-jasperforest/reci=
pes-kernel/linux/linux-yocto-rt_3.2.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-n450/recipes-kern=
el/linux/linux-yocto-rt_3.2.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes=
-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-palm/recipes=
-bsp/x-load/x-load_git.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-gumstix/recipes-bsp/x-load/x=
-load_git.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-angstrom/recipes-extended/zy=
pper/zypper_git.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-sugarbay/recipes-=
kernel/linux/linux-yocto-rt_3.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-crownbay/recipes-=
kernel/linux/linux-yocto-rt_3.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-k=
ernel/linux/linux-yocto-rt_3.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-fishriver/recipes=
-kernel/linux/linux-yocto-rt_3.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-fri2/recipes-kern=
el/linux/linux-yocto-rt_3.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-jasperforest/reci=
pes-kernel/linux/linux-yocto-rt_3.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-n450/recipes-kern=
el/linux/linux-yocto-rt_3.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer=
/recipes-devtools/gcc/gcc-runtime_4.6.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-q=
t/qt4/qt4-x11-free_4.8.1.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes=
-qt/qt4/qt4-x11-free_4.8.1.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-kde/recipes-misc-support/qt4=
-x11-free_4.8.1.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-fri2/recipes-bsp/=
alsa-state/alsa-state.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-n450/recipes-bsp/=
alsa-state/alsa-state.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-ti/recipes-bsp/alsa-state/al=
sa-state.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-palm/recipes=
-graphics/tslib/tslib_git.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes=
-connectivity/openssh/openssh_6.0p1.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-handheld/recipes-bsp/kexecbo=
ot/kexecboot-klibc_git.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-g=
nome/tasks/task-core-sdk-gmae.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer=
/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-sugarbay/recipes-=
kernel/linux/linux-yocto_3.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-crownbay/recipes-=
kernel/linux/linux-yocto_3.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-k=
ernel/linux/linux-yocto_3.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-fishriver/recipes=
-kernel/linux/linux-yocto_3.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-fri2/recipes-kern=
el/linux/linux-yocto_3.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-jasperforest/reci=
pes-kernel/linux/linux-yocto_3.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-n450/recipes-kern=
el/linux/linux-yocto_3.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer=
/recipes-devtools/gcc/gcc_4.6.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes=
-qt/tasks/task-qte-toolchain-target.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes=
-qt/qt4/qt4-embedded_4.8.1.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-angstrom/recipes-core/base-f=
iles/base-files_3.0.14.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-nokia/recipe=
s-core/base-files/base-files_3.0.14.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/rec=
ipes-core/base-files/base-files_3.0.14.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-kde/recipes-misc-support/qt4=
-native_4.8.1.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-ti/recipes-core/netbase/netb=
ase_4.47.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes=
-extended/lighttpd/lighttpd_1.4.30.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes=
-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/rec=
ipes-graphics/drm/libdrm_2.4.34.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-gumstix/recipes-bsp/powervr-=
drivers/omap3-sgx-modules_4.05.00.03.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes=
-core/dropbear/dropbear_2012.55.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer=
/recipes-devtools/gcc/gcc-cross_4.6.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/rec=
ipes-multimedia/mplayer/mplayer-common.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-freescale/recipes-bsp/u-boot=
/u-boot_git.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-sugarbay/recipes-=
core/tasks/task-core-tools-profile.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-crownbay/recipes-=
core/tasks/task-core-tools-profile.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-c=
ore/tasks/task-core-tools-profile.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-fishriver/recipes=
-core/tasks/task-core-tools-profile.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-fri2/recipes-core=
/tasks/task-core-tools-profile.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-jasperforest/reci=
pes-core/tasks/task-core-tools-profile.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-n450/recipes-core=
/tasks/task-core-tools-profile.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-sugarbay/recipes-=
graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-crownbay/recipes-=
graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-g=
raphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-fishriver/recipes=
-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-fri2/recipes-grap=
hics/xorg-xserver/xserver-xf86-config_0.1.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-jasperforest/reci=
pes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-n450/recipes-grap=
hics/xorg-xserver/xserver-xf86-config_0.1.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-htc/recipes-=
graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-nokia/recipe=
s-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/rec=
ipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-palm/recipes=
-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-handheld/recipes-graphics/xo=
rg-xserver/xserver-xf86-config_0.1.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-ti/recipes-graphics/xorg-xse=
rver/xserver-xf86-config_0.1.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes=
-extended/cronie/cronie_1.4.8.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-nokia/recipe=
s-core/initscripts/initscripts_1.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/rec=
ipes-core/initscripts/initscripts_1.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-palm/recipes=
-core/initscripts/initscripts_1.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes=
-gnome/gtk+/gtk-update-icon-cache-runonce.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes=
-extended/polkit/polkit_0.104.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer=
/recipes-devtools/gcc/gcc-cross-canadian_4.6.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-nokia/recipe=
s-graphics/xinput-calibrator/pointercal-xinput_0.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/rec=
ipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-gumstix/recipes-kernel/linux=
/linux_3.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-handheld/recipes-kernel/linu=
x/linux-yocto-tiny-kexecboot_3.2.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-g=
nome/tasks/task-core-standalone-gmae-sdk-target.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/rec=
ipes-core/tasks/task-base.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-handheld/recipes-bsp/kexecbo=
ot/kexecboot_git.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-nokia/recipe=
s-core/systemd/systemd-machine-units_1.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/rec=
ipes-core/systemd/systemd-machine-units_1.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/meta-gnome/reci=
pes-gnome/gtk+/gtk+_2.24.8.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes=
-connectivity/connman/connman_0.79.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-palm/recipes=
-support/lvm2/lvm2_2.02.85.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/rec=
ipes-graphics/mesa/mesa-dri_7.11.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer=
/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-browser/recipes-support/nspr=
/nspr_4.8.9.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes=
-graphics/xorg-lib/pixman_0.25.2.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-angstrom/recipes-core/sysvin=
it/sysvinit_2.88dsf.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-openmoko/rec=
ipes-navigation/gpsd/gpsd_3.4.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes=
-bsp/keymaps/keymaps_1.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-smartphone/meta-nokia/recipe=
s-bsp/keymaps/keymaps_1.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-handheld/recipes-bsp/keymaps=
/keymaps_1.0.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes=
-core/busybox/busybox_1.19.4.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer=
/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-intel/common/recipes-kernel/=
linux-firmware/linux-firmware_git.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer=
/recipes-devtools/gcc/gcc-crosssdk_4.6.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer=
/recipes-devtools/gcc/gcc-cross-initial_4.6.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-gumstix/recipes-kernel/linux=
/linux-mainline_3.2.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-openembedded/toolchain-layer=
/recipes-devtools/gcc/libgcc_4.6.bbappend
> =A0/home/Superandy/data/oe-core/sources/meta-handheld/recipes-core/udev/u=
dev_164.bbappend
>
> Strange: many recipes are available. Anybody else with similar experience=
?
>

The error seems to be caused by meta-ti. When removed, parsing works
as expected. By re-including I get now:

ERROR: ExpansionError during parsing
/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-ti/gstrea=
mer-ti_svn.bb:
Failure expanding variable FILESPATH, expression was
${@base_set_filespath([
"/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-ti/gstre=
amer-ti-svnr962-r85+${MACHINE_KERNEL_PR}",
"/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-ti/gstre=
amer-ti-svnr962",
"/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-ti/gstre=
amer-ti",
"/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-ti/gstre=
amer-ti-svnr962",
"/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-ti/gstre=
amer-ti",
"/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-ti/files=
",
"/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-ti"
], d)} which triggered exception SyntaxError: EOL while scanning
string literal (FILESPATH, line 1)
ERROR: No recipes available for:
  /home/Superandy/data/oe-core/sources/meta-intel/meta-sugarbay/recipes-ker=
nel/linux/linux-yocto_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-crownbay/recipes-ker=
nel/linux/linux-yocto_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-kern=
el/linux/linux-yocto_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-fishriver/recipes-ke=
rnel/linux/linux-yocto_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-fri2/recipes-kernel/=
linux/linux-yocto_3.2.bbappend
  /home/Superandy/data/oe-core/sources/meta-intel/meta-jasperforest/recipes=
-kernel/linux/linux-yocto_3.2.bbappend
  ......

Andreas


