Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0D2F66017E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 17:00:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Sep 2014 10:00:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,621,1406617200"; d="scan'208";a="580751431"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.13.44])
	by orsmga001.jf.intel.com with ESMTP; 29 Sep 2014 10:00:12 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Sep 2014 10:00:11 -0700
Message-Id: <cover.1412009958.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [Daisy CVEs CONSOLIDATED Pull 00/12] Tested Last Week
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
X-List-Received-Date: Mon, 29 Sep 2014 17:00:21 -0000

Richard,

Here is a batch of Daisy CVEs that have been pending for a while.

Sau!


The following changes since commit e358d20e8ccf1299e8a046e743a31e92546cd239:

  bash: Fix CVE-2014-7169 (2014-09-29 12:15:51 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/daisy-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/daisy-next

Chong Lu (1):
  adt-installer: fix sed input file error

Guillem Jover (2):
  dpkg: Security Advisory - CVE-2014-0471
  dpkg: Security Advisory - CVE-2014-3127

Li Wang (1):
  nss: CVE-2014-1544

Muzaffar Mahmood (1):
  libtiff: fix CVE-2013-1961

Richard Purdie (1):
  binutils: Add fix for recent patch on older gcc

Shan Hai (1):
  pulseaudio: fix CVE-2014-3970

Xufeng Zhang (1):
  nspr: Fix for CVE-2014-1545

Yue Tao (3):
  gst-ffmpeg: Add CVE patches
  libtiff: Security Advisory - CVE-2012-4564
  libpam: Security Advisory - CVE-2014-2583

yanjun.zhu (1):
  perl: fix for CVE-2010-4777

 meta/recipes-devtools/binutils/binutils-2.24.inc   |   1 +
 .../binutils/binutils-uninitialised-warning.patch  |  50 ++
 .../dpkg-1.17.4-CVE-2014-0471-CVE-2014-3127.patch  |  68 ++
 .../dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471.patch      |  97 +++
 meta/recipes-devtools/dpkg/dpkg_1.17.4.bb          |   2 +
 .../adt-installer/scripts/adt_installer_internal   |   1 +
 .../perl-5.14.3-fix-CVE-2010-4777.patch            |  45 ++
 meta/recipes-devtools/perl/perl-native_5.14.3.bb   |   3 +-
 meta/recipes-devtools/perl/perl_5.14.3.bb          |   3 +-
 ...mp-fix-potential-directory-traversal-issu.patch |  63 ++
 meta/recipes-extended/pam/libpam_1.1.6.bb          |   1 +
 .../0001-aacdec-check-channel-count.patch          |  34 +
 ...util-fix-signedness-in-sizeof-comparissio.patch |  40 ++
 ...c-parser-reset-indexes-on-realloc-failure.patch |  50 ++
 ...a-Perform-pointer-advance-and-checks-befo.patch |  81 +++
 ...-error-concealment-initialize-block-index.patch |  29 +
 ...alment-Check-that-the-picture-is-not-in-a.patch |  37 +
 .../0001-ffserver-set-oformat.patch                |  36 +
 .../0001-h264_sei-Fix-infinite-loop.patch          |  39 +
 ...check-width-more-completely-avoid-out-of-.patch |  30 +
 ...f-compute-probe-buffer-size-more-reliably.patch |  45 ++
 ...er-dont-access-out-of-array-elements-at-t.patch |  44 ++
 ...array-index-before-use-fix-out-of-array-a.patch |  30 +
 .../0001-qdm2dec-fix-buffer-overflow.patch         |  58 ++
 ...Check-that-the-last-indexes-are-within-th.patch |  32 +
 ...-vp3-Copy-all-3-frames-for-thread-updates.patch |  32 +
 ...-read-for-negative-tokens-and-memleaks-on.patch | 183 +++++
 .../gst-ffmpeg-CVE-2013-0855.patch                 | 100 +++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |  17 +
 .../libtiff/files/libtiff-CVE-2013-1961.patch      | 786 +++++++++++++++++++++
 .../libtiff/files/tiff-CVE-2012-4564.patch         |  99 +++
 meta/recipes-multimedia/libtiff/tiff_4.0.3.bb      |   4 +-
 .../pulseaudio/pulseaudio/CVE-2014-3970.patch      |  52 ++
 .../pulseaudio/pulseaudio_5.0.bb                   |   4 +-
 .../nspr/nspr/nspr-CVE-2014-1545.patch             |  67 ++
 meta/recipes-support/nspr/nspr_4.10.3.bb           |   1 +
 .../nss/files/nss-CVE-2014-1544.patch              |  41 ++
 meta/recipes-support/nss/nss.inc                   |   1 +
 38 files changed, 2302 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils-uninitialised-warning.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471-CVE-2014-3127.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471.patch
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.3/perl-5.14.3-fix-CVE-2010-4777.patch
 create mode 100644 meta/recipes-extended/pam/libpam/pam_timestamp-fix-potential-directory-traversal-issu.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-aacdec-check-channel-count.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-dsputil-fix-signedness-in-sizeof-comparissio.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-parser-reset-indexes-on-realloc-failure.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-rpza-Perform-pointer-advance-and-checks-befo.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-error-concealment-initialize-block-index.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-error_concealment-Check-that-the-picture-is-not-in-a.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-ffserver-set-oformat.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264_sei-Fix-infinite-loop.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-check-width-more-completely-avoid-out-of-.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-lavf-compute-probe-buffer-size-more-reliably.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pngdec-filter-dont-access-out-of-array-elements-at-t.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm2-check-array-index-before-use-fix-out-of-array-a.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm2dec-fix-buffer-overflow.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-smackerdec-Check-that-the-last-indexes-are-within-th.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3-Copy-all-3-frames-for-thread-updates.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3-fix-oob-read-for-negative-tokens-and-memleaks-on.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-CVE-2013-0855.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-1961.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/tiff-CVE-2012-4564.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/CVE-2014-3970.patch
 create mode 100644 meta/recipes-support/nspr/nspr/nspr-CVE-2014-1545.patch
 create mode 100644 meta/recipes-support/nss/files/nss-CVE-2014-1544.patch

-- 
1.8.3.1


