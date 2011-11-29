Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWmi-0001d7-0w
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:08:20 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720769"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:27 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:00 -0800
Message-Id: <cover.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 00/26] Various Package Updates
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
X-List-Received-Date: Tue, 29 Nov 2011 23:08:20 -0000

Richard,

A slew of misc and x related updates.

This includes the openssl RFC, can be pulled from here is needed.

I will have a CONSOLIDATED Pull later with more testing

Thanks
	Sau!

The following changes since commit 177df2c51927f44e3536856f4604364b38695bc2:

  qt-mobility: Add missing patch (2011-11-29 14:36:09 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (26):
  wget: Update to 1.13.4
  json-glib: Update to 0.14.2
  libdrm: Update to 2.4.27
  mkfontscale: Update to 1.0.9
  xdpyinfo: Update to 1.3.0
  xinit: Update to 1.3.1
  xkbcomp: Update to 1.2.3
  xprop: Update to 1.2.1
  xrandr: Update to 1.3.5
  xset: Update to 1.2.2
  xwininfo: Update to 1.1.2
  xf86-input-mouse: Update to 1.7.1
  xf86-input-synaptics: Update to 1.5.0
  xf86-video-intel: Update to 2.17.0
  xserver-xorg*: Update to 1.11.2
  lame: Update to 3.99.3
  gdbm: Update to 1.10
  libtasn1: Update to 2.11
  gnutls: Update to 2.12.14
  libiconv: Update to 1.14
  coreutils: build and install hostname
  ocf-linux: Add ocf-linux to support openssl 1.0
  openssl-0.9.8: move parallel-make fix to 0.9.8
  openssl: Add openssl 1.0
  PR Bump for OpenSSL 1.0
  Distro Tracking: Update Ownership and Update Dates

 .../recipes-sato/claws-mail/claws-mail.inc         |    2 +-
 .../conf/distro/include/distro_tracking_fields.inc |  282 +-
 meta/recipes-connectivity/bind/bind_9.8.1.bb       |    2 +-
 meta/recipes-connectivity/openssh/openssh_5.9p1.bb |    2 +-
 meta/recipes-connectivity/openssl/ocf-linux.inc    |   25 +
 .../openssl/ocf-linux_20100325.bb                  |    6 +
 .../openssl/openssl-1.0.0e/configure-targets.patch |   32 +
 .../openssl-1.0.0e/debian/c_rehash-compat.patch    |   45 +
 .../openssl/openssl-1.0.0e/debian/ca.patch         |   22 +
 .../openssl-1.0.0e/debian/debian-targets.patch     |   54 +
 .../openssl-1.0.0e/debian/make-targets.patch       |   15 +
 .../openssl/openssl-1.0.0e/debian/man-dir.patch    |   15 +
 .../openssl-1.0.0e/debian/man-section.patch        |   34 +
 .../openssl/openssl-1.0.0e/debian/no-rpath.patch   |   15 +
 .../openssl-1.0.0e/debian/no-symbolic.patch        |   15 +
 .../openssl/openssl-1.0.0e/debian/pic.patch        |  242 ++
 .../openssl/openssl-1.0.0e/debian/pkg-config.patch |   36 +
 .../openssl-1.0.0e/debian/version-script.patch     | 4511 ++++++++++++++++++++
 .../engines-install-in-libdir-ssl.patch            |   56 +
 .../openssl/openssl-1.0.0e/oe-ldflags.patch        |   24 +
 .../openssl/openssl-1.0.0e/openssl-fix-link.patch  |   35 +
 .../openssl/openssl-1.0.0e/shared-libs.patch       |   50 +
 meta/recipes-connectivity/openssl/openssl.inc      |   39 +-
 .../recipes-connectivity/openssl/openssl_0.9.8r.bb |    3 +-
 .../recipes-connectivity/openssl/openssl_1.0.0e.bb |   45 +
 .../telepathy/telepathy-idle_0.1.10.bb             |    2 +-
 meta/recipes-core/coreutils/coreutils_8.14.bb      |    8 +-
 meta/recipes-devtools/git/git_1.7.7.bb             |    2 +-
 meta/recipes-devtools/python/python_2.7.2.bb       |    2 +-
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    2 +-
 meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb   |    2 +-
 meta/recipes-extended/iputils/iputils_s20101006.bb |    2 +-
 meta/recipes-extended/libzypp/libzypp_git.bb       |    2 +-
 .../wget/wget-1.12/gnutls.bzr.patch                |  266 --
 .../{wget-1.12 => wget-1.13.4}/fix_makefile.patch  |    0
 .../wget/{wget_1.12.bb => wget_1.13.4.bb}          |    6 +-
 .../{json-glib_0.14.0.bb => json-glib_0.14.2.bb}   |    4 +-
 .../drm/{libdrm_2.4.26.bb => libdrm_2.4.27.bb}     |    6 +-
 meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb      |    2 +-
 .../{mkfontscale_1.0.8.bb => mkfontscale_1.0.9.bb} |    4 +-
 .../xorg-app/xdpyinfo/disable-xkb.patch            |   14 +-
 .../{xdpyinfo_1.2.0.bb => xdpyinfo_1.3.0.bb}       |    4 +-
 .../xorg-app/{xinit_1.3.0.bb => xinit_1.3.1.bb}    |    6 +-
 .../{xkbcomp_1.2.1.bb => xkbcomp_1.2.3.bb}         |    4 +-
 .../xorg-app/{xprop_1.2.0.bb => xprop_1.2.1.bb}    |    4 +-
 .../xorg-app/{xrandr_1.3.4.bb => xrandr_1.3.5.bb}  |    4 +-
 .../xorg-app/{xset_1.2.1.bb => xset_1.2.2.bb}      |    4 +-
 .../{xwininfo_1.1.1.bb => xwininfo_1.1.2.bb}       |    4 +-
 ...ut-mouse_1.7.0.bb => xf86-input-mouse_1.7.1.bb} |    4 +-
 ...tics_1.4.0.bb => xf86-input-synaptics_1.5.0.bb} |    5 +-
 .../xorg-driver/xf86-video-intel/buildfix.patch    |   22 -
 ...-intel_2.16.0.bb => xf86-video-intel_2.17.0.bb} |   14 +-
 ...ver-xorg-1.11.1.inc => xserver-xorg-1.11.2.inc} |    4 +-
 .../crosscompile.patch                             |    0
 .../fix_open_max_preprocessor_error.patch          |    0
 .../macro_tweak.patch                              |    0
 ...-lite_1.11.1.bb => xserver-xorg-lite_1.11.2.bb} |    0
 ...erver-xorg_1.11.1.bb => xserver-xorg_1.11.2.bb} |    0
 .../lame/{lame_3.99.1.bb => lame_3.99.3.bb}        |    4 +-
 meta/recipes-support/gdbm/gdbm_1.10.bb             |   16 +
 .../configure-fix.patch                            |    0
 .../gnutls-openssl.patch                           |    0
 .../gnutls-texinfo-euro.patch                      |    0
 meta/recipes-support/gnutls/gnutls_2.12.11.bb      |    9 -
 meta/recipes-support/gnutls/gnutls_2.12.14.bb      |   10 +
 .../gnutls/{libtasn1_2.10.bb => libtasn1_2.11.bb}  |    6 +-
 .../{libiconv_1.13.1.bb => libiconv_1.14.bb}       |    3 -
 67 files changed, 5549 insertions(+), 509 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/ocf-linux.inc
 create mode 100644 meta/recipes-connectivity/openssl/ocf-linux_20100325.bb
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/configure-targets.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/c_rehash-compat.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/ca.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/debian-targets.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/make-targets.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/man-dir.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/man-section.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/no-rpath.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/no-symbolic.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/pic.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/pkg-config.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/version-script.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/engines-install-in-libdir-ssl.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/oe-ldflags.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/shared-libs.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.0e.bb
 delete mode 100644 meta/recipes-extended/wget/wget-1.12/gnutls.bzr.patch
 rename meta/recipes-extended/wget/{wget-1.12 => wget-1.13.4}/fix_makefile.patch (100%)
 rename meta/recipes-extended/wget/{wget_1.12.bb => wget_1.13.4.bb} (43%)
 rename meta/recipes-gnome/json-glib/{json-glib_0.14.0.bb => json-glib_0.14.2.bb} (78%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.26.bb => libdrm_2.4.27.bb} (51%)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.0.8.bb => mkfontscale_1.0.9.bb} (80%)
 rename meta/recipes-graphics/xorg-app/{xdpyinfo_1.2.0.bb => xdpyinfo_1.3.0.bb} (82%)
 rename meta/recipes-graphics/xorg-app/{xinit_1.3.0.bb => xinit_1.3.1.bb} (80%)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.2.1.bb => xkbcomp_1.2.3.bb} (77%)
 rename meta/recipes-graphics/xorg-app/{xprop_1.2.0.bb => xprop_1.2.1.bb} (79%)
 rename meta/recipes-graphics/xorg-app/{xrandr_1.3.4.bb => xrandr_1.3.5.bb} (73%)
 rename meta/recipes-graphics/xorg-app/{xset_1.2.1.bb => xset_1.2.2.bb} (77%)
 rename meta/recipes-graphics/xorg-app/{xwininfo_1.1.1.bb => xwininfo_1.1.2.bb} (72%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.7.0.bb => xf86-input-mouse_1.7.1.bb} (76%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.4.0.bb => xf86-input-synaptics_1.5.0.bb} (84%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/buildfix.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.16.0.bb => xf86-video-intel_2.17.0.bb} (81%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.1.inc => xserver-xorg-1.11.2.inc} (47%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.1 => xserver-xorg-1.11.2}/crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.1 => xserver-xorg-1.11.2}/fix_open_max_preprocessor_error.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.1 => xserver-xorg-1.11.2}/macro_tweak.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-lite_1.11.1.bb => xserver-xorg-lite_1.11.2.bb} (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.11.1.bb => xserver-xorg_1.11.2.bb} (100%)
 rename meta/recipes-multimedia/lame/{lame_3.99.1.bb => lame_3.99.3.bb} (86%)
 create mode 100644 meta/recipes-support/gdbm/gdbm_1.10.bb
 rename meta/recipes-support/gnutls/{gnutls-2.12.11 => gnutls-2.12.14}/configure-fix.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.11 => gnutls-2.12.14}/gnutls-openssl.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.11 => gnutls-2.12.14}/gnutls-texinfo-euro.patch (100%)
 delete mode 100644 meta/recipes-support/gnutls/gnutls_2.12.11.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_2.12.14.bb
 rename meta/recipes-support/gnutls/{libtasn1_2.10.bb => libtasn1_2.11.bb} (80%)
 rename meta/recipes-support/libiconv/{libiconv_1.13.1.bb => libiconv_1.14.bb} (88%)

-- 
1.7.6.4



