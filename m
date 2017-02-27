Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E466071989
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 13:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8020F182CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 14:02:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id XQRKszcif0iV
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 14:02:52 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id C7D9618105
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 14:02:52 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABAA51A086
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 14:02:52 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A0B441A082
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 14:02:52 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 14:02:52 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 9508B784
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 14:02:52 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v1RD2qqg009902
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 14:02:52 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v1RD2qEv009901
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2017 14:02:52 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2017 14:02:49 +0100
Message-Id: <cover.1488200489.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
X-TM-AS-GCONF: 00
Subject: [PATCH 0/1] Make use of bb.utils.filter()
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
X-List-Received-Date: Mon, 27 Feb 2017 13:02:55 -0000

This is an updated version of my patch that was previously sent to the
bitbake-devel list accompanying my change to introduce the new
bb.utils.filter() function. It is intended to replace b754cb5bf1 on
master-next.

Compared to what is on master-next now it:

* updates iptables abd xauth that were skipped due to conflicts,
* adds a couple of uses for bb.utils.filter() with TUNE_FEATURES and
  PACKAGECONFIG that I had previously missed, and
* simplifies a couple of if statements in shell code that use the
  result of bb.utils.filter().

//Peter

The following changes since commit 653283be9a5060f7bf5589a92bb3748606996eef:

  sanity: Require bitbake 1.33.2 (2017-02-24 13:20:39 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/bb.utils.filter
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/bb.utils.filter

Peter Kjellerstedt (1):
  recipes: Make use of the new bb.utils.filter() function

 meta/classes/testimage.bbclass                                  | 2 +-
 meta/conf/machine/include/mips/arch-mips.inc                    | 4 ++--
 meta/conf/machine/include/tune-ppce500.inc                      | 2 +-
 meta/conf/machine/include/tune-ppce500v2.inc                    | 2 +-
 meta/recipes-bsp/u-boot/u-boot.inc                              | 2 +-
 meta/recipes-connectivity/connman/connman.inc                   | 4 +---
 meta/recipes-connectivity/libpcap/libpcap.inc                   | 2 +-
 meta/recipes-connectivity/neard/neard_0.16.bb                   | 2 +-
 meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb          | 2 +-
 meta/recipes-connectivity/ofono/ofono.inc                       | 2 +-
 meta/recipes-connectivity/openssh/openssh_7.4p1.bb              | 4 ++--
 meta/recipes-connectivity/openssl/openssl.inc                   | 4 ++--
 meta/recipes-core/coreutils/coreutils_6.9.bb                    | 2 +-
 meta/recipes-core/coreutils/coreutils_8.26.bb                   | 3 +--
 meta/recipes-core/dbus/dbus_1.10.14.bb                          | 4 +---
 meta/recipes-core/dropbear/dropbear.inc                         | 6 +++---
 meta/recipes-core/kbd/kbd_2.0.3.bb                              | 2 +-
 meta/recipes-core/libxml/libxml2_2.9.4.bb                       | 2 +-
 meta/recipes-core/systemd/systemd_232.bb                        | 4 +---
 meta/recipes-core/util-linux/util-linux.inc                     | 4 ++--
 meta/recipes-devtools/gdb/gdb_7.12.1.bb                         | 2 +-
 meta/recipes-devtools/mtd/mtd-utils_git.bb                      | 2 +-
 meta/recipes-devtools/patch/patch_2.7.5.bb                      | 2 +-
 meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb              | 2 +-
 meta/recipes-devtools/python/python-smartpm_git.bb              | 4 ++--
 meta/recipes-devtools/qemu/qemu.inc                             | 3 +--
 meta/recipes-devtools/rsync/rsync_2.6.9.bb                      | 2 +-
 meta/recipes-devtools/rsync/rsync_3.1.2.bb                      | 2 +-
 meta/recipes-devtools/ruby/ruby_2.3.3.bb                        | 2 +-
 meta/recipes-extended/at/at_3.1.20.bb                           | 2 +-
 meta/recipes-extended/cronie/cronie_1.5.1.bb                    | 2 +-
 meta/recipes-extended/cups/cups.inc                             | 3 +--
 meta/recipes-extended/iptables/iptables_1.6.1.bb                | 3 +--
 meta/recipes-extended/libarchive/libarchive_3.2.2.bb            | 4 +---
 meta/recipes-extended/lighttpd/lighttpd_1.4.45.bb               | 2 +-
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb              | 5 +----
 meta/recipes-extended/psmisc/psmisc.inc                         | 2 +-
 meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb                  | 2 +-
 meta/recipes-extended/screen/screen_4.4.0.bb                    | 2 +-
 meta/recipes-extended/shadow/shadow.inc                         | 2 +-
 meta/recipes-extended/sudo/sudo_1.8.18p1.bb                     | 2 +-
 meta/recipes-extended/wget/wget.inc                             | 2 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb              | 2 +-
 meta/recipes-gnome/gtk+/gtk+.inc                                | 4 +---
 meta/recipes-gnome/gtk+/gtk+3.inc                               | 6 ++----
 meta/recipes-graphics/cairo/cairo.inc                           | 2 +-
 meta/recipes-graphics/clutter/clutter-1.0.inc                   | 2 +-
 meta/recipes-graphics/libepoxy/libepoxy_1.4.0.bb                | 2 +-
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb                   | 9 +++------
 meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb                  | 7 ++-----
 meta/recipes-graphics/libva/libva_1.7.3.bb                      | 3 +--
 meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb                  | 2 +-
 meta/recipes-graphics/mesa/mesa-gl_13.0.4.bb                    | 2 +-
 meta/recipes-graphics/mesa/mesa.inc                             | 3 +--
 meta/recipes-graphics/pango/pango_1.40.3.bb                     | 2 +-
 meta/recipes-graphics/wayland/weston_1.11.1.bb                  | 6 ++----
 meta/recipes-graphics/xorg-app/xauth_1.0.10.bb                  | 2 +-
 meta/recipes-graphics/xorg-app/xhost_1.0.7.bb                   | 2 +-
 meta/recipes-graphics/xorg-lib/libice_1.0.9.bb                  | 2 +-
 meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb                   | 2 +-
 meta/recipes-graphics/xorg-lib/libxfont2_2.0.1.bb               | 2 +-
 meta/recipes-graphics/xorg-lib/libxfont_1.5.2.bb                | 2 +-
 meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.1.bb            | 2 +-
 meta/recipes-graphics/xorg-lib/libxmu_1.1.2.bb                  | 2 +-
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc             | 4 ++--
 meta/recipes-kernel/latencytop/latencytop_0.5.bb                | 2 +-
 meta/recipes-multimedia/alsa/alsa-plugins_1.1.1.bb              | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc  | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc | 3 +--
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 3 +--
 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc        | 5 ++---
 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.27.bb        | 2 +-
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb              | 2 +-
 meta/recipes-multimedia/mpg123/mpg123_1.23.8.bb                 | 9 ++-------
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc               | 4 +---
 meta/recipes-support/apr/apr_1.5.2.bb                           | 2 +-
 meta/recipes-support/boost/boost.inc                            | 4 ++--
 meta/recipes-support/consolekit/consolekit_0.4.6.bb             | 3 +--
 meta/recipes-support/curl/curl_7.52.1.bb                        | 2 +-
 meta/recipes-support/libcap/libcap_2.25.bb                      | 2 +-
 meta/recipes-support/nspr/nspr_4.13.1.bb                        | 2 +-
 81 files changed, 97 insertions(+), 137 deletions(-)

-- 
2.9.0


