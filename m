Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9DAA87589E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 14:51:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t59Epvqp015170
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jun 2015 07:51:58 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Jun 2015 07:51:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jun 2015 07:51:45 -0700
Message-ID: <cover.1433842738.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/12] Packages Upgrade
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
X-List-Received-Date: Tue, 09 Jun 2015 14:52:04 -0000
Content-Type: text/plain

The following changes since commit de6a26b95a7f7bd8f9dc47ab35d8b07ba671f4eb:

  x264: use x86 over-ride instead of i586 (2015-06-08 17:32:46 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/PU
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/PU

Robert Yang (12):
  libpfm4: 4.3.0 -> 4.6.0
  clutter-gst-3.0: 3.0.4 -> 3.0.6
  augeas: 1.2.0 -> 1.4.0
  dropbear: 2014.66 -> 2015.67
  gpgme: 1.4.3 -> 1.5.4
  libav: 9.18 -> 11.4
  gstreamer1.0-libav: fix build for i586 with gcc
  qmmp: 0.7.7 -> 0.8.5
  libevdev: 1.3 -> 1.4.2
  blktrace: 1.0.5 -> 1.1.0
  yasm: 1.2.0 -> 1.3.0
  x264: r2265 -> r2491

 meta/recipes-core/dropbear/dropbear_2014.66.bb     |    4 -
 meta/recipes-core/dropbear/dropbear_2015.67.bb     |    4 +
 meta/recipes-devtools/yasm/yasm_1.2.0.bb           |   13 ---
 meta/recipes-devtools/yasm/yasm_1.3.0.bb           |   14 +++
 meta/recipes-extended/augeas/augeas_1.2.0.bb       |    5 -
 meta/recipes-extended/augeas/augeas_1.4.0.bb       |    4 +
 ...mple-binary-needed-for-core-image-clutter.patch |    0
 .../enable-tests.patch                             |    0
 ...r-gst-3.0_3.0.4.bb => clutter-gst-3.0_3.0.6.bb} |    4 +-
 meta/recipes-kernel/blktrace/blktrace_git.bb       |    3 +-
 .../libpfm/{libpfm4_4.3.0.bb => libpfm4_4.6.0.bb}  |    7 +-
 ...ound-to-build-gst-libav-for-i586-with-gcc.patch |   26 +++++
 .../gstreamer/gstreamer1.0-libav_1.4.5.bb          |    1 +
 meta/recipes-multimedia/libav/libav.inc            |    4 +-
 .../libav/libav/libav-fix-CVE-2014-9676.patch      |   98 ----------------
 ...rkaround-to-build-libav-for-i586-with-gcc.patch |   26 +++++
 meta/recipes-multimedia/libav/libav_11.4.bb        |    4 +
 meta/recipes-multimedia/libav/libav_9.18.bb        |    6 -
 .../don-t-default-to-cortex-a9-with-neon.patch     |   21 +++-
 meta/recipes-multimedia/x264/x264_git.bb           |    4 +-
 .../qt-apps/{qmmp_0.7.7.bb => qmmp_0.8.5.bb}       |    6 +-
 .../gpgme-1.4.3/gpgme-fix-CVE-2014-3564.patch      |   56 ----------
 .../gpgme/{gpgme-1.4.3 => gpgme}/gpgme.pc          |    0
 .../gpgme/{gpgme-1.4.3 => gpgme}/pkgconfig.patch   |  117 ++++++++++----------
 .../gpgme/{gpgme_1.4.3.bb => gpgme_1.5.4.bb}       |   10 +-
 .../{libevdev_1.3.bb => libevdev_1.4.2.bb}         |    5 +-
 26 files changed, 174 insertions(+), 268 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2014.66.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2015.67.bb
 delete mode 100644 meta/recipes-devtools/yasm/yasm_1.2.0.bb
 create mode 100644 meta/recipes-devtools/yasm/yasm_1.3.0.bb
 delete mode 100644 meta/recipes-extended/augeas/augeas_1.2.0.bb
 create mode 100644 meta/recipes-extended/augeas/augeas_1.4.0.bb
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0-3.0.4 => clutter-gst-3.0}/0001-Install-example-binary-needed-for-core-image-clutter.patch (100%)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0-3.0.4 => clutter-gst-3.0}/enable-tests.patch (100%)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0_3.0.4.bb => clutter-gst-3.0_3.0.6.bb} (58%)
 rename meta/recipes-kernel/libpfm/{libpfm4_4.3.0.bb => libpfm4_4.6.0.bb} (78%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch
 delete mode 100644 meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch
 create mode 100644 meta/recipes-multimedia/libav/libav/workaround-to-build-libav-for-i586-with-gcc.patch
 create mode 100644 meta/recipes-multimedia/libav/libav_11.4.bb
 delete mode 100644 meta/recipes-multimedia/libav/libav_9.18.bb
 rename meta/recipes-qt/qt-apps/{qmmp_0.7.7.bb => qmmp_0.8.5.bb} (92%)
 delete mode 100644 meta/recipes-support/gpgme/gpgme-1.4.3/gpgme-fix-CVE-2014-3564.patch
 rename meta/recipes-support/gpgme/{gpgme-1.4.3 => gpgme}/gpgme.pc (100%)
 rename meta/recipes-support/gpgme/{gpgme-1.4.3 => gpgme}/pkgconfig.patch (84%)
 rename meta/recipes-support/gpgme/{gpgme_1.4.3.bb => gpgme_1.5.4.bb} (74%)
 rename meta/recipes-support/libevdev/{libevdev_1.3.bb => libevdev_1.4.2.bb} (74%)

-- 
1.7.9.5


