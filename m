Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TDzGF-0005qB-V7
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 16:58:52 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Sep 2012 07:46:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,442,1344236400"; d="scan'208";a="207029445"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.193])
	by orsmga002.jf.intel.com with ESMTP; 18 Sep 2012 07:46:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2012 07:46:10 -0700
Message-Id: <cover.1347979466.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED REQUEST 0/9] PR Bumps & fixes (cover letter only)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 14:58:52 -0000

Richard,

This contains the PR bumps for the libffi update along 
with some fixes.

Please pull.

I am gathering the next bacth of changes up.


Thanks
	Sau!


The following changes since commit 7887b99646d8e1e736ad6e4a306e47df9955221e:

  local.conf.sample: change valgrind support architecture comment (2012-09-14 17:05:59 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrei Gherzan (1):
  util-linux: Fix bloken swapoff symlink

Constantin Musca (1):
  grub: disable lzma, device-mapper, zfs and nvpair

Khem Raj (2):
  eglibc: Fix fcntl.h for powerpc
  eglibc: Do not use fsqrt in libm when building for fsl ppc with fpu

Martin Jansa (3):
  recipes: bump PR to rebuild after libffi5 -> libffi6
  recipes: few more PR bumps to rebuild after libffi5 -> libffi6
  libtelepathy: PR bump to rebuild after libffi5 -> libffi6

Saul Wold (2):
  xserver-xorg: Modify RREPLACES for RCONFLICTS
  nfs-utils: add x32 patch to fix nfsctl issue

 .../grub/files/check-if-liblzma-is-disabled.patch  |   33 ++++++++++
 meta/recipes-bsp/grub/grub-efi-native_2.00.bb      |    6 +-
 meta/recipes-bsp/grub/grub_2.00.bb                 |    6 +-
 meta/recipes-connectivity/avahi/avahi_0.6.31.bb    |    2 +-
 .../bluez/gst-plugin-bluetooth_4.101.bb            |    2 +-
 .../recipes-connectivity/galago/libgalago_0.5.2.bb |    2 +-
 meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb    |    2 +-
 meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb  |    2 +-
 meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb    |    2 +-
 meta/recipes-connectivity/gypsy/gypsy_0.9.bb       |    2 +-
 meta/recipes-connectivity/gypsy/gypsy_git.bb       |    2 +-
 .../nfs-utils/nfs-utils-nfsctl-x32-fix.patch       |   30 +++++++++
 .../nfs-utils/nfs-utils_1.2.3.bb                   |    3 +-
 .../telepathy/libtelepathy_0.3.3.bb                |    2 +-
 .../telepathy/telepathy-glib_0.19.8.bb             |    2 +-
 .../telepathy/telepathy-mission-control_5.13.0.bb  |    2 +-
 meta/recipes-core/dbus/dbus-glib_0.100.bb          |    2 +-
 ..._handle_at-open_by_handle-etc.-to-PowerPC.patch |   65 ++++++++++++++++++++
 .../eglibc/eglibc-2.16/fsl-ppc-no-fsqrt.patch      |   44 +++++++++++++
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    4 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb      |    2 +-
 .../glib-networking/glib-networking_2.28.7.bb      |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |    4 +-
 meta/recipes-core/util-linux/util-linux_2.21.2.bb  |    2 +-
 meta/recipes-devtools/python/python-dbus_1.1.1.bb  |    2 +-
 meta/recipes-devtools/python/python-gst_0.10.22.bb |    2 +-
 .../python/python-pygobject_2.27.91.bb             |    2 +-
 .../recipes-devtools/python/python-pygtk_2.24.0.bb |    2 +
 meta/recipes-extended/polkit/polkit_0.104.bb       |    2 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |    2 +-
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    2 +-
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb             |    2 +-
 .../gtk-engines/gtk-engines_2.20.2.bb              |    2 +-
 meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb        |    2 +-
 meta/recipes-gnome/json-glib/json-glib_0.14.2.bb   |    2 +-
 meta/recipes-gnome/libglade/libglade_2.6.4.bb      |    2 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |    2 +-
 meta/recipes-graphics/cairo/cairo_1.12.2.bb        |    2 +-
 meta/recipes-graphics/pango/pango_1.30.0.bb        |    2 +-
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 +-
 .../gstreamer/gst-plugins-base_0.10.36.bb          |    2 +-
 .../gstreamer/gst-plugins-good_0.10.31.bb          |    2 +-
 .../gstreamer/gst-plugins-ugly_0.10.19.bb          |    2 +-
 .../gstreamer/gstreamer_0.10.36.bb                 |    2 +-
 .../pulseaudio/pulseaudio_2.1.bb                   |    2 +-
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |    2 +-
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    2 +-
 meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb       |    2 +-
 meta/recipes-support/atk/atk_2.4.0.bb              |    2 +-
 meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb |    2 +
 meta/recipes-support/vte/vte_0.28.2.bb             |    2 +-
 53 files changed, 233 insertions(+), 50 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/check-if-liblzma-is-disabled.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-nfsctl-x32-fix.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/fsl-ppc-no-fsqrt.patch

-- 
1.7.7.6



