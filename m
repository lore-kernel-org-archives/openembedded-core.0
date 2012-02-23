Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0bC0-0004t7-NN
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 17:06:53 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 07:58:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128652338"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 07:58:30 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 07:58:04 -0800
Message-Id: <cover.1330012543.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [CONSOLIDATED PULL 00/25] Catching up from ELC
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
X-List-Received-Date: Thu, 23 Feb 2012 16:06:53 -0000

Richard,

Here are a batch of changes reviewed and built


The following changes since commit 55f72b98f606c1554eb6edd151292ffdfddf1384:

  texi2html: Fix for multilib (2012-02-22 23:01:45 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andreas Oberritter (5):
  xorg-lib: don't build libs unless requested by DISTRO_FEATURES
  autotools.bbclass: Don't copy into non-existant directory
  busybox: don't create /etc/default
  gst-plugins-base: depend on libx11 and libxv conditionally
  mpeg2dec: depend on libx11 conditionally

Andrei Gherzan (7):
  dhcp: Update to 4.2.3-P2
  nspr: Integrate version 4.8.9
  nspr: Compile nspr with tests
  nspr: Add patch in order to remove rpath from binaries
  e2fsprogs: e2initrd_helper was moved in libdir but not packaged
    correctly in FILES_libext2fs
  dbus: Remove empty ${lindir}dbus-1.0/test directory as we don't build
    tests
  openssl: Move libcrypto to base_libdir

Dexuan Cui (2):
  task-self-hosted: remove duplicate packages
  task-self-hosted: make the package lists alphabetical

Gary Thomas (1):
  initscripts: Make /etc/timestamp consistent again.

Martin Jansa (1):
  wireless-tools: remove ldconfig call from install-libs

Mike Crowe (1):
  e2fsprogs: Cope with ${libdir} and ${base_libdir} being the same

Robert Yang (1):
  A script to clean obsolete sstate cache files

Saul Wold (6):
  syslinux: Use SYSLINUX_TIMEOUT and SYSLINUX_PROMPT to configure
    syslinux
  syslinux: add SYSLINUX_ROOT to APPEND line
  image_types: add vmdk type to use with VMware
  image-live: fix SYSLINUX_TIME and add SYSLINUX_ROOT instead of APPEND
  boot-directdisk: Use correct SYSLINUX_TIMEOUT and SYSLINUX_ROOT
    instead of APPEND
  distro_tracking_fields: fix typos

Yauhen Kharuzhy (1):
  ppp: Fix rp-pppoe plugin compilation

 meta/classes/autotools.bbclass                     |    2 +-
 meta/classes/boot-directdisk.bbclass               |    6 +-
 meta/classes/image-live.bbclass                    |    4 +-
 meta/classes/image_types.bbclass                   |    5 +-
 meta/classes/syslinux.bbclass                      |   11 +-
 .../conf/distro/include/distro_tracking_fields.inc |    4 +-
 .../dhcp-3.0.3-dhclient-dbus.patch                 |    0
 .../fix-client-path.patch                          |    0
 .../fix-external-bind.patch                        |    0
 .../fixincludes.patch                              |    0
 .../dhcp/dhcp-4.2.3-P2/link-with-lcrypto.patch     |   25 +++
 .../{dhcp-4.2.0 => dhcp-4.2.3-P2}/noattrmode.patch |    0
 .../dhcp/{dhcp-4.2.0 => dhcp-4.2.3-P2}/site.h      |    0
 meta/recipes-connectivity/dhcp/dhcp.inc            |    6 +-
 .../dhcp/{dhcp_4.2.0.bb => dhcp_4.2.3-P2.bb}       |    8 +-
 meta/recipes-connectivity/openssl/openssl.inc      |   10 +-
 .../recipes-connectivity/openssl/openssl_1.0.0g.bb |    2 +-
 .../ppp/ppp-2.4.5/update_if_pppol2tp.patch         |   54 +++++++
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |    3 +-
 .../wireless-tools/remove.ldconfig.call.patch      |   19 +++
 .../wireless-tools/wireless-tools_29.bb            |    5 +-
 meta/recipes-core/busybox/busybox.inc              |    1 -
 meta/recipes-core/busybox/busybox_1.19.3.bb        |    2 +-
 meta/recipes-core/dbus/dbus.inc                    |    5 +-
 .../initscripts/initscripts-1.0/bootmisc.sh        |    4 +-
 .../initscripts/initscripts-1.0/save-rtc.sh        |    2 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 meta/recipes-core/tasks/task-self-hosted.bb        |   47 ++----
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb  |   12 +-
 meta/recipes-graphics/xorg-lib/libx11.inc          |    5 -
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    6 +
 .../gstreamer/gst-plugins-base_0.10.35.bb          |    3 +-
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb |    2 +-
 meta/recipes-support/nspr/files/nspr.pc.in         |   11 ++
 .../nspr/files/remove-rpath-from-tests.patch       |   26 +++
 meta/recipes-support/nspr/nspr_4.8.9.bb            |  165 ++++++++++++++++++++
 scripts/sstate-cache-management.sh                 |  135 ++++++++++++++++
 37 files changed, 518 insertions(+), 74 deletions(-)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.0 => dhcp-4.2.3-P2}/dhcp-3.0.3-dhclient-dbus.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.0 => dhcp-4.2.3-P2}/fix-client-path.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.0 => dhcp-4.2.3-P2}/fix-external-bind.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.0 => dhcp-4.2.3-P2}/fixincludes.patch (100%)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/link-with-lcrypto.patch
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.0 => dhcp-4.2.3-P2}/noattrmode.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.0 => dhcp-4.2.3-P2}/site.h (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp_4.2.0.bb => dhcp_4.2.3-P2.bb} (48%)
 create mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/update_if_pppol2tp.patch
 create mode 100644 meta/recipes-connectivity/wireless-tools/wireless-tools/remove.ldconfig.call.patch
 create mode 100644 meta/recipes-support/nspr/files/nspr.pc.in
 create mode 100644 meta/recipes-support/nspr/files/remove-rpath-from-tests.patch
 create mode 100644 meta/recipes-support/nspr/nspr_4.8.9.bb
 create mode 100755 scripts/sstate-cache-management.sh

-- 
1.7.6.5



