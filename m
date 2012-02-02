Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rt6VP-0002Xg-Ns
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 00:55:56 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2012 15:47:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113485970"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.238])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2012 15:47:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 15:47:39 -0800
Message-Id: <cover.1328226197.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 00/14] Self-Hosted Fixes and Package Updates
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
X-List-Received-Date: Thu, 02 Feb 2012 23:55:56 -0000

Richard,

This is a patch of updates and self-host-image fixes.
I also added the gnupg version that is gplv2 to go along
with the libzypp changes from Steve.

Sau!

The following changes since commit 70e1226e8c10bf07d6c7b1e13d745ad603f2ec73:

  meta-yocto/local.conf.sample.extended: add LICENSE_FLAGS_WHITELIST section (2012-02-02 22:04:54 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (14):
  task-self-hosted: add disk partitioning tools
  task-self-hosted: add python-pkgutil since it's required
  self-hosted-image: add package management for correct installation
  openssl: Update to 1.0.0g
  openssl: Update to 0.9.8t (gplv2)
  gnutls: Update to 2.12.16
  rxvt-unicode: Update to 9.15
  gnupg: Add gplv2 version 1.4.7
  file: Update to version 5.10
  libidn: Update to 1.24
  libdrm: Update to 2.4.30
  xinit: Update to 1.3.2
  xf86-input-keyboard: Update to 1.6.1
  distro_track: Track Updates

 .../conf/distro/include/distro_tracking_fields.inc |   53 ++++++------
 .../configure-targets.patch                        |    0
 .../debian/ca.patch                                |    0
 .../debian/config-hurd.patch                       |    0
 .../debian/debian-targets.patch                    |    0
 .../debian/engines-path.patch                      |    0
 .../debian/kfreebsd-pipe.patch                     |    0
 .../debian/make-targets.patch                      |    0
 .../debian/man-dir.patch                           |    0
 .../debian/man-section.patch                       |    0
 .../debian/no-rpath.patch                          |    0
 .../debian/no-symbolic.patch                       |    0
 .../debian/perl-path.diff                          |    0
 .../debian/pic.patch                               |    0
 .../debian/pkg-config.patch                        |    0
 .../debian/rc4-amd64.patch                         |    0
 .../debian/rehash-crt.patch                        |    0
 .../debian/rehash_pod.patch                        |    0
 .../debian/series                                  |    0
 .../debian/shared-lib-ext.patch                    |    0
 .../debian/stddef.patch                            |    0
 .../debian/version-script.patch                    |    0
 .../parallel-make-fix.patch                        |    0
 .../shared-libs.patch                              |    0
 .../configure-targets.patch                        |    0
 .../debian/c_rehash-compat.patch                   |    0
 .../debian/ca.patch                                |    0
 .../debian/debian-targets.patch                    |    0
 .../debian/make-targets.patch                      |    0
 .../debian/man-dir.patch                           |    0
 .../debian/man-section.patch                       |    0
 .../debian/no-rpath.patch                          |    0
 .../debian/no-symbolic.patch                       |    0
 .../debian/pic.patch                               |    0
 .../debian/pkg-config.patch                        |    0
 .../debian/version-script.patch                    |    0
 .../engines-install-in-libdir-ssl.patch            |    0
 .../oe-ldflags.patch                               |    0
 .../openssl-fix-link.patch                         |    0
 .../openssl_fix_for_x32.patch                      |    0
 .../shared-libs.patch                              |    0
 .../{openssl_0.9.8s.bb => openssl_0.9.8t.bb}       |    0
 .../{openssl_1.0.0f.bb => openssl_1.0.0g.bb}       |    4 +-
 meta/recipes-core/images/self-hosted-image.bb      |    2 +-
 meta/recipes-core/tasks/task-self-hosted.bb        |    9 ++-
 .../file/{file_5.09.bb => file_5.10.bb}            |    4 +-
 .../libidn/{libidn_1.23.bb => libidn_1.24.bb}      |   23 +++--
 .../drm/{libdrm_2.4.29.bb => libdrm_2.4.30.bb}     |    4 +-
 .../xorg-app/{xinit_1.3.1.bb => xinit_1.3.2.bb}    |    6 +-
 ...board_1.6.0.bb => xf86-input-keyboard_1.6.1.bb} |    4 +-
 .../rxvt.desktop                                   |    0
 .../rxvt.png                                       |  Bin 2847 -> 2847 bytes
 .../xwc.patch                                      |    0
 .../{rxvt-unicode_9.14.bb => rxvt-unicode_9.15.bb} |    4 +-
 .../gnupg/gnupg-1.4.7/long-long-thumb.patch        |   12 +++
 .../gnupg/gnupg-1.4.7/mips_gcc4.4.patch            |   42 +++++++++
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |   92 ++++++++++++++++++++
 .../configure-fix.patch                            |    0
 .../correct_rpl_gettimeofday_signature.patch       |    0
 .../fix-gettext-version.patch                      |    0
 .../gnutls-openssl.patch                           |    0
 .../gnutls-texinfo-euro.patch                      |    0
 .../{gnutls_2.12.14.bb => gnutls_2.12.16.bb}       |    6 +-
 63 files changed, 213 insertions(+), 52 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/config-hurd.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/engines-path.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/kfreebsd-pipe.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/make-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/perl-path.diff (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/pkg-config.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/rc4-amd64.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/rehash-crt.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/rehash_pod.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/series (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/shared-lib-ext.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/stddef.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/parallel-make-fix.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/make-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/pkg-config.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/openssl-fix-link.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_0.9.8s.bb => openssl_0.9.8t.bb} (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.0f.bb => openssl_1.0.0g.bb} (90%)
 rename meta/recipes-devtools/file/{file_5.09.bb => file_5.10.bb} (86%)
 rename meta/recipes-extended/libidn/{libidn_1.23.bb => libidn_1.24.bb} (40%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.29.bb => libdrm_2.4.30.bb} (54%)
 rename meta/recipes-graphics/xorg-app/{xinit_1.3.1.bb => xinit_1.3.2.bb} (79%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-keyboard_1.6.0.bb => xf86-input-keyboard_1.6.1.bb} (74%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.14 => rxvt-unicode-9.15}/rxvt.desktop (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.14 => rxvt-unicode-9.15}/rxvt.png (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.14 => rxvt-unicode-9.15}/xwc.patch (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.14.bb => rxvt-unicode_9.15.bb} (94%)
 create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/long-long-thumb.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/mips_gcc4.4.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg_1.4.7.bb
 rename meta/recipes-support/gnutls/{gnutls-2.12.14 => gnutls-2.12.16}/configure-fix.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.14 => gnutls-2.12.16}/correct_rpl_gettimeofday_signature.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.14 => gnutls-2.12.16}/fix-gettext-version.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.14 => gnutls-2.12.16}/gnutls-openssl.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.14 => gnutls-2.12.16}/gnutls-texinfo-euro.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls_2.12.14.bb => gnutls_2.12.16.bb} (77%)

-- 
1.7.6.5



