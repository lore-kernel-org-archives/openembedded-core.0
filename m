Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LAP-0000do-Jv
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:37:14 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2012 17:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="139655764"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2012 17:28:24 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:15 +0800
Message-Id: <cover.1331859046.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 00/60] Package Upgrade
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
X-List-Received-Date: Fri, 16 Mar 2012 00:37:14 -0000

Upgrade recipes for M4. Please review.

The following changes since commit bd2d8904181aa67258b6be8a7bbeaf8d12a8dd5a:

  xorg-xserver: Explictly disable dtrace, its not in DEPENDS (2012-03-12 17:45:41 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib shane/m4upgrade
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/m4upgrade

Dongxiao Xu (1):
  dbus-glib: upgrade to 0.98

Shane Wang (59):
  distro_tracking: update the recipe info for manual check
  glib-2.0: upgrade to 2.30.3
  gdk-pixbuf: upgrade to 2.24.1
  glproto: update its info in distro tracking
  libvorbis: upgrade to 1.3.3
  tremor: upgrade to 18221
  alsa-lib: upgrade to 1.0.25
  alsa-utils: upgrade to 1.0.25
  telepathy-glib: upgrade to 0.17.5
  telepathy-mission-control: upgrade to 5.11.0
  ofono: upgrade to 1.5
  bluez4: upgrade to 4.99
  bluez-hcidump: upgrade to 2.3
  gst-plugin-bluetooth: upgrade to 4.99
  gstreamer: upgrade to 0.10.36
  gst-plugins-base: upgrade to 0.10.36
  gst-plugins-good: upgrade to 0.10.31
  gst-plugins-bad: upgrade to 0.10.23
  gst-plugins-ugly: upgrade to 0.10.19
  libpcap: upgrade to 1.2.1
  busybox: upgrade to 1.19.4
  curl: upgrade to 7.24.0
  dropbear: upgrade to 2012.55
  avahi: upgrade to 0.6.31
  avahi-ui: upgrade to 0.6.31
  apr: upgrade to 1.4.6
  minicom: upgrade to 2.6.1
  tzdata: upgrade to 2012b
  util-macros: upgrade to 1.17
  libxcursor: upgrade to 1.1.13
  libxinerama: upgrade to 1.1.2
  libsm: upgrade to 1.2.1
  libxkbfile: upgrade to 1.0.8
  libice: upgrade to 1.0.8
  pixman: upgrade to 0.25.2
  libxdmcp: upgrade to 1.1.1
  libXxf86vm: upgrade to 1.1.2
  libXrender: upgrade to 0.9.7
  libxpm: upgrade to 3.5.10
  libXext: upgrade to 1.3.1
  libXv: upgrade to 1.0.7
  libxt: upgrade to 1.1.2
  libXmu: upgrade to 1.1.1
  libfontenc: upgrade to 1.1.1
  libxscrnsaver: upgrade to 1.2.2
  libxau: upgrade to 1.0.7
  libdmx: upgrade to 1.1.2
  libxft: upgrade to 2.3.0
  libxtst: upgrade to 1.2.1
  libpciaccess: upgrade to 0.13
  libXvMC: upgrade to 1.0.7
  libxfont: upgrade to 1.4.5
  libxres: upgrade to 1.0.6
  inputproto: upgrade to 2.2
  font-util: upgrade to 1.3.0
  libxcb: upgrade to 1.8.1
  libxi: upgrade to 1.4.5
  distro_tracking: update the info of the recipes upgraded in the round
  distro_tracking: update those NOT UPDATE REASON

 .../conf/distro/include/distro_tracking_fields.inc |  394 ++++++++++----------
 .../{avahi-ui_0.6.30.bb => avahi-ui_0.6.31.bb}     |    6 +-
 meta/recipes-connectivity/avahi/avahi.inc          |    2 +-
 .../avahi/{avahi_0.6.30.bb => avahi_0.6.31.bb}     |    4 +-
 .../avahi/files/fix_for_automake_1.11.2.patch      |   24 +-
 .../{bluez-hcidump_2.2.bb => bluez-hcidump_2.3.bb} |    4 +-
 .../{bluez4-4.98 => bluez4-4.99}/bluetooth.conf    |    0
 .../{bluez4-4.98 => bluez4-4.99}/sbc_mmx.patch     |    0
 .../bluez/{bluez4_4.98.bb => bluez4_4.99.bb}       |    6 +-
 ...etooth_4.98.bb => gst-plugin-bluetooth_4.99.bb} |    4 +-
 .../{libpcap-1.2.0 => libpcap-1.2.1}/aclocal.patch |    0
 .../ieee80215-arphrd.patch                         |    0
 .../libpcap/{libpcap_1.2.0.bb => libpcap_1.2.1.bb} |    4 +-
 .../ofono/{ofono_1.3.bb => ofono_1.5.bb}           |    4 +-
 ...thy-glib_0.17.4.bb => telepathy-glib_0.17.5.bb} |    6 +-
 ...10.1.bb => telepathy-mission-control_5.11.0.bb} |    6 +-
 .../busybox-1.19.3/busybox-1.19.3-getty.patch      |   17 -
 .../B921600.patch                                  |    0
 .../busybox-appletlib-dependency.patch             |    0
 .../busybox-udhcpc-no_deconfig.patch               |    0
 .../{busybox-1.19.3 => busybox-1.19.4}/defconfig   |    0
 .../get_header_tar.patch                           |    0
 .../run-parts.in.usr-bin.patch                     |    0
 .../udhcpc-fix-nfsroot.patch                       |    0
 .../udhcpscript.patch                              |    0
 .../{busybox_1.19.3.bb => busybox_1.19.4.bb}       |    7 +-
 .../no-examples.patch                              |    0
 meta/recipes-core/dbus/dbus-glib_0.92.bb           |    6 -
 meta/recipes-core/dbus/dbus-glib_0.98.bb           |    6 +
 .../configure.patch                                |    0
 meta/recipes-core/dropbear/dropbear_2011.54.bb     |    6 -
 meta/recipes-core/dropbear/dropbear_2012.55.bb     |    6 +
 .../{glib-2.0_2.30.2.bb => glib-2.0_2.30.3.bb}     |    8 +-
 .../gcc4-scope.patch                               |    0
 .../rename-conflicting-functions.patch             |    0
 .../minicom/{minicom_2.5.bb => minicom_2.6.1.bb}   |    6 +-
 .../tzdata/{tzdata_2011n.bb => tzdata_2012b.bb}    |    6 +-
 .../configure_fix.patch                            |    0
 .../configure_nm.patch                             |    0
 .../hardcoded_libtool.patch                        |    0
 .../{gdk-pixbuf_2.24.0.bb => gdk-pixbuf_2.24.1.bb} |   10 +-
 .../xcb/{libxcb_1.8.bb => libxcb_1.8.1.bb}         |    4 +-
 .../{font-util_1.2.0.bb => font-util_1.3.0.bb}     |    6 +-
 .../xorg-lib/{libdmx_1.1.1.bb => libdmx_1.1.2.bb}  |    4 +-
 .../{libfontenc_1.1.0.bb => libfontenc_1.1.1.bb}   |    6 +-
 .../xorg-lib/{libice_1.0.7.bb => libice_1.0.8.bb}  |    4 +-
 .../fix_deletion_of_last_handle.patch              |   51 ---
 ...bpciaccess_0.12.902.bb => libpciaccess_0.13.bb} |    6 +-
 .../xorg-lib/{libsm_1.2.0.bb => libsm_1.2.1.bb}    |    8 +-
 .../xorg-lib/{libxau_1.0.6.bb => libxau_1.0.7.bb}  |    4 +-
 .../{libxcursor_1.1.12.bb => libxcursor_1.1.13.bb} |    4 +-
 .../{libxdmcp_1.1.0.bb => libxdmcp_1.1.1.bb}       |    4 +-
 .../{libxext_1.3.0.bb => libxext_1.3.1.bb}         |    6 +-
 .../{libxfont_1.4.4.bb => libxfont_1.4.5.bb}       |    6 +-
 .../xorg-lib/{libxft_2.2.0.bb => libxft_2.3.0.bb}  |    6 +-
 .../xorg-lib/{libxi_1.4.3.bb => libxi_1.4.5.bb}    |    4 +-
 .../{libxinerama_1.1.1.bb => libxinerama_1.1.2.bb} |    6 +-
 .../{libxkbfile_1.0.7.bb => libxkbfile_1.0.8.bb}   |    8 +-
 .../xorg-lib/{libxmu_1.1.0.bb => libxmu_1.1.1.bb}  |    6 +-
 .../xorg-lib/{libxpm_3.5.9.bb => libxpm_3.5.10.bb} |    6 +-
 .../{libxrender_0.9.6.bb => libxrender_0.9.7.bb}   |    6 +-
 .../{libxres_1.0.5.bb => libxres_1.0.6.bb}         |    4 +-
 ...bxscrnsaver_1.2.1.bb => libxscrnsaver_1.2.2.bb} |    4 +-
 .../xorg-lib/{libxt_1.1.1.bb => libxt_1.1.2.bb}    |    6 +-
 .../{libxtst_1.2.0.bb => libxtst_1.2.1.bb}         |    6 +-
 .../xorg-lib/{libxv_1.0.6.bb => libxv_1.0.7.bb}    |    6 +-
 .../{libxvmc_1.0.6.bb => libxvmc_1.0.7.bb}         |    6 +-
 .../{libxxf86vm_1.1.1.bb => libxxf86vm_1.1.2.bb}   |    6 +-
 .../{pixman_0.24.4.bb => pixman_0.25.2.bb}         |    4 +-
 .../{inputproto_2.0.2.bb => inputproto_2.2.bb}     |    4 +-
 .../{util-macros_1.16.1.bb => util-macros_1.17.bb} |    4 +-
 .../fix-tstamp-declaration.patch                   |    0
 .../unbreak_plugindir.patch                        |    0
 .../{alsa-lib_1.0.24.1.bb => alsa-lib_1.0.25.bb}   |    6 +-
 ...-t-let-systemd-unit-restore-the-volume-wh.patch |   27 +-
 .../ncursesfix.patch                               |    0
 .../uclibc-exp10-replacement.patch                 |    0
 ...alsa-utils_1.0.24.2.bb => alsa-utils_1.0.25.bb} |    8 +-
 ...s-bad_0.10.22.bb => gst-plugins-bad_0.10.23.bb} |    6 +-
 .../gst-plugins-base-tremor.patch                  |   13 +-
 ...base_0.10.35.bb => gst-plugins-base_0.10.36.bb} |    6 +-
 ...good_0.10.30.bb => gst-plugins-good_0.10.31.bb} |    6 +-
 ...ugly_0.10.18.bb => gst-plugins-ugly_0.10.19.bb} |    6 +-
 .../check_fix.patch                                |    0
 .../gst-inspect-check-error.patch                  |    0
 .../gstregistrybinary.c                            |    0
 .../gstregistrybinary.h                            |    0
 .../{gstreamer_0.10.35.bb => gstreamer_0.10.36.bb} |    6 +-
 .../{libvorbis_1.3.2.bb => libvorbis_1.3.3.bb}     |    4 +-
 .../{tremor_20120122.bb => tremor_20120314.bb}     |    2 +-
 .../apr/{apr_1.4.5.bb => apr_1.4.6.bb}             |    6 +-
 .../curl/{curl_7.23.1.bb => curl_7.24.0.bb}        |    6 +-
 92 files changed, 391 insertions(+), 458 deletions(-)
 rename meta/recipes-connectivity/avahi/{avahi-ui_0.6.30.bb => avahi-ui_0.6.31.bb} (93%)
 rename meta/recipes-connectivity/avahi/{avahi_0.6.30.bb => avahi_0.6.31.bb} (80%)
 rename meta/recipes-connectivity/bluez/{bluez-hcidump_2.2.bb => bluez-hcidump_2.3.bb} (83%)
 rename meta/recipes-connectivity/bluez/{bluez4-4.98 => bluez4-4.99}/bluetooth.conf (100%)
 rename meta/recipes-connectivity/bluez/{bluez4-4.98 => bluez4-4.99}/sbc_mmx.patch (100%)
 rename meta/recipes-connectivity/bluez/{bluez4_4.98.bb => bluez4_4.99.bb} (86%)
 rename meta/recipes-connectivity/bluez/{gst-plugin-bluetooth_4.98.bb => gst-plugin-bluetooth_4.99.bb} (77%)
 rename meta/recipes-connectivity/libpcap/{libpcap-1.2.0 => libpcap-1.2.1}/aclocal.patch (100%)
 rename meta/recipes-connectivity/libpcap/{libpcap-1.2.0 => libpcap-1.2.1}/ieee80215-arphrd.patch (100%)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.2.0.bb => libpcap_1.2.1.bb} (73%)
 rename meta/recipes-connectivity/ofono/{ofono_1.3.bb => ofono_1.5.bb} (66%)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.17.4.bb => telepathy-glib_0.17.5.bb} (78%)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.10.1.bb => telepathy-mission-control_5.11.0.bb} (91%)
 delete mode 100644 meta/recipes-core/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch
 rename meta/recipes-core/busybox/{busybox-1.19.3 => busybox-1.19.4}/B921600.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.3 => busybox-1.19.4}/busybox-appletlib-dependency.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.3 => busybox-1.19.4}/busybox-udhcpc-no_deconfig.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.3 => busybox-1.19.4}/defconfig (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.3 => busybox-1.19.4}/get_header_tar.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.3 => busybox-1.19.4}/run-parts.in.usr-bin.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.3 => busybox-1.19.4}/udhcpc-fix-nfsroot.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.3 => busybox-1.19.4}/udhcpscript.patch (100%)
 rename meta/recipes-core/busybox/{busybox_1.19.3.bb => busybox_1.19.4.bb} (82%)
 rename meta/recipes-core/dbus/{dbus-glib-0.92 => dbus-glib-0.98}/no-examples.patch (100%)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib_0.92.bb
 create mode 100644 meta/recipes-core/dbus/dbus-glib_0.98.bb
 rename meta/recipes-core/dropbear/{dropbear-2011.54 => dropbear-2012.55}/configure.patch (100%)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2011.54.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2012.55.bb
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.30.2.bb => glib-2.0_2.30.3.bb} (88%)
 rename meta/recipes-extended/minicom/{minicom-2.5 => minicom-2.6.1}/gcc4-scope.patch (100%)
 rename meta/recipes-extended/minicom/{minicom-2.5 => minicom-2.6.1}/rename-conflicting-functions.patch (100%)
 rename meta/recipes-extended/minicom/{minicom_2.5.bb => minicom_2.6.1.bb} (75%)
 rename meta/recipes-extended/tzdata/{tzdata_2011n.bb => tzdata_2012b.bb} (98%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.24.0 => gdk-pixbuf-2.24.1}/configure_fix.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.24.0 => gdk-pixbuf-2.24.1}/configure_nm.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.24.0 => gdk-pixbuf-2.24.1}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.24.0.bb => gdk-pixbuf_2.24.1.bb} (92%)
 rename meta/recipes-graphics/xcb/{libxcb_1.8.bb => libxcb_1.8.1.bb} (59%)
 rename meta/recipes-graphics/xorg-font/{font-util_1.2.0.bb => font-util_1.3.0.bb} (84%)
 rename meta/recipes-graphics/xorg-lib/{libdmx_1.1.1.bb => libdmx_1.1.2.bb} (79%)
 rename meta/recipes-graphics/xorg-lib/{libfontenc_1.1.0.bb => libfontenc_1.1.1.bb} (70%)
 rename meta/recipes-graphics/xorg-lib/{libice_1.0.7.bb => libice_1.0.8.bb} (81%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess-0.12.902/fix_deletion_of_last_handle.patch
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.12.902.bb => libpciaccess_0.13.bb} (64%)
 rename meta/recipes-graphics/xorg-lib/{libsm_1.2.0.bb => libsm_1.2.1.bb} (69%)
 rename meta/recipes-graphics/xorg-lib/{libxau_1.0.6.bb => libxau_1.0.7.bb} (77%)
 rename meta/recipes-graphics/xorg-lib/{libxcursor_1.1.12.bb => libxcursor_1.1.13.bb} (79%)
 rename meta/recipes-graphics/xorg-lib/{libxdmcp_1.1.0.bb => libxdmcp_1.1.1.bb} (81%)
 rename meta/recipes-graphics/xorg-lib/{libxext_1.3.0.bb => libxext_1.3.1.bb} (76%)
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.4.4.bb => libxfont_1.4.5.bb} (76%)
 rename meta/recipes-graphics/xorg-lib/{libxft_2.2.0.bb => libxft_2.3.0.bb} (87%)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.4.3.bb => libxi_1.4.5.bb} (82%)
 rename meta/recipes-graphics/xorg-lib/{libxinerama_1.1.1.bb => libxinerama_1.1.2.bb} (79%)
 rename meta/recipes-graphics/xorg-lib/{libxkbfile_1.0.7.bb => libxkbfile_1.0.8.bb} (61%)
 rename meta/recipes-graphics/xorg-lib/{libxmu_1.1.0.bb => libxmu_1.1.1.bb} (78%)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.9.bb => libxpm_3.5.10.bb} (78%)
 rename meta/recipes-graphics/xorg-lib/{libxrender_0.9.6.bb => libxrender_0.9.7.bb} (73%)
 rename meta/recipes-graphics/xorg-lib/{libxres_1.0.5.bb => libxres_1.0.6.bb} (77%)
 rename meta/recipes-graphics/xorg-lib/{libxscrnsaver_1.2.1.bb => libxscrnsaver_1.2.2.bb} (83%)
 rename meta/recipes-graphics/xorg-lib/{libxt_1.1.1.bb => libxt_1.1.2.bb} (90%)
 rename meta/recipes-graphics/xorg-lib/{libxtst_1.2.0.bb => libxtst_1.2.1.bb} (77%)
 rename meta/recipes-graphics/xorg-lib/{libxv_1.0.6.bb => libxv_1.0.7.bb} (67%)
 rename meta/recipes-graphics/xorg-lib/{libxvmc_1.0.6.bb => libxvmc_1.0.7.bb} (61%)
 rename meta/recipes-graphics/xorg-lib/{libxxf86vm_1.1.1.bb => libxxf86vm_1.1.2.bb} (66%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.24.4.bb => pixman_0.25.2.bb} (84%)
 rename meta/recipes-graphics/xorg-proto/{inputproto_2.0.2.bb => inputproto_2.2.bb} (78%)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.16.1.bb => util-macros_1.17.bb} (75%)
 rename meta/recipes-multimedia/alsa/{alsa-lib-1.0.24.1 => alsa-lib-1.0.25}/fix-tstamp-declaration.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-lib-1.0.24.1 => alsa-lib-1.0.25}/unbreak_plugindir.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.0.24.1.bb => alsa-lib_1.0.25.bb} (92%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.24.2 => alsa-utils-1.0.25}/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch (57%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.24.2 => alsa-utils-1.0.25}/ncursesfix.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.24.2 => alsa-utils-1.0.25}/uclibc-exp10-replacement.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.0.24.2.bb => alsa-utils_1.0.25.bb} (93%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-bad_0.10.22.bb => gst-plugins-bad_0.10.23.bb} (85%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-base-0.10.35 => gst-plugins-base-0.10.36}/gst-plugins-base-tremor.patch (53%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-base_0.10.35.bb => gst-plugins-base_0.10.36.bb} (85%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-good_0.10.30.bb => gst-plugins-good_0.10.31.bb} (84%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-ugly_0.10.18.bb => gst-plugins-ugly_0.10.19.bb} (84%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.35 => gstreamer-0.10.36}/check_fix.patch (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.35 => gstreamer-0.10.36}/gst-inspect-check-error.patch (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.35 => gstreamer-0.10.36}/gstregistrybinary.c (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.35 => gstreamer-0.10.36}/gstregistrybinary.h (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer_0.10.35.bb => gstreamer_0.10.36.bb} (90%)
 rename meta/recipes-multimedia/libvorbis/{libvorbis_1.3.2.bb => libvorbis_1.3.3.bb} (86%)
 rename meta/recipes-multimedia/tremor/{tremor_20120122.bb => tremor_20120314.bb} (88%)
 rename meta/recipes-support/apr/{apr_1.4.5.bb => apr_1.4.6.bb} (91%)
 rename meta/recipes-support/curl/{curl_7.23.1.bb => curl_7.24.0.bb} (92%)

-- 
1.7.6



