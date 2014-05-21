Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CACE165EA8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 18:02:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 May 2014 11:02:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,881,1392192000"; d="scan'208";a="535589556"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.101])
	by fmsmga001.fm.intel.com with ESMTP; 21 May 2014 11:01:51 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 May 2014 11:01:50 -0700
Message-Id: <cover.1400694661.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 00/16] CVE Patches and updates
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
X-List-Received-Date: Wed, 21 May 2014 18:02:05 -0000

Richard,

Another set of CVE fixes and some Updates.

Thanks
	Sau!

The following changes since commit 7decf9dce56868e39902dac5957eb72f6e1e9acd:

  cups: fix for cups not building without avahi (2014-05-21 09:08:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Chong Lu (3):
  flex: Update to 2.5.39 version
  byacc: Update to 20140422 version
  guile: Update to 2.0.11 version

Sebastian Wiegand (1):
  distro_features_check.bbclass: fix wrong indentation

Yue Tao (12):
  gst-ffmpeg: fix for Security Advisory CVE-2014-2263
  gst-ffmpeg: fix for Security Advisory CVE-2013-0865
  gst-ffmpeg: fix for Security Advisory CVE-2014-2099
  gst-ffmpeg: fix for Security Advisory CVE-2013-0868
  gst-ffmpeg: fix for Security Advisory CVE-2013-0845
  gst-ffmpeg: fix for Security Advisory CVE-2013-0852
  gst-ffmpeg: fix for Security Advisory CVE-2013-0858
  gst-ffmpeg: fix for Security Advisory CVE-2013-0851
  gst-ffmpeg: fix for Security Advisory CVE-2013-0854
  gst-ffmpeg: fix for Security Advisory CVE-2013-0856
  gst-ffmpeg: fix for Security Advisory CVE-2013-0850
  gst-ffmpeg: fix for Security Advisory CVE-2013-0849

 meta/classes/distro_features_check.bbclass         |  4 +-
 .../flex/{flex_2.5.38.bb => flex_2.5.39.bb}        |  4 +-
 .../guile/files/guile_2.0.9_fix_noreturn.patch     | 65 ----------------
 .../guile/{guile_2.0.9.bb => guile_2.0.11.bb}      |  5 +-
 .../byacc/{byacc_20140101.bb => byacc_20140422.bb} |  4 +-
 .../0001-alac-fix-nb_samples-order-case.patch      | 30 ++++++++
 .../0001-alsdec-check-block-length.patch           | 61 +++++++++++++++
 ...ac3dec-Check-coding-mode-against-channels.patch | 37 +++++++++
 ...le-use-av_image_get_linesize-to-calculate.patch | 50 +++++++++++++
 ...egtsenc-Check-data-array-size-in-mpegts_w.patch | 69 +++++++++++++++++
 .../0001-eamad-fix-out-of-array-accesses.patch     | 29 ++++++++
 ...t-ref-count-check-and-limit-fix-out-of-ar.patch | 29 ++++++++
 ...01-huffyuvdec-Check-init_vlc-return-codes.patch | 87 ++++++++++++++++++++++
 .../0001-huffyuvdec-Skip-len-0-cases.patch         | 61 +++++++++++++++
 .../0001-mjpegdec-check-SE.patch                   | 32 ++++++++
 ...heck-RLE-size-before-copying.-Fix-out-of-.patch | 34 +++++++++
 ...001-roqvideodec-check-dimensions-validity.patch | 36 +++++++++
 ...o-check-chunk-sizes-before-reading-chunks.patch | 51 +++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                | 13 ++++
 19 files changed, 627 insertions(+), 74 deletions(-)
 rename meta/recipes-devtools/flex/{flex_2.5.38.bb => flex_2.5.39.bb} (57%)
 delete mode 100644 meta/recipes-devtools/guile/files/guile_2.0.9_fix_noreturn.patch
 rename meta/recipes-devtools/guile/{guile_2.0.9.bb => guile_2.0.11.bb} (95%)
 rename meta/recipes-extended/byacc/{byacc_20140101.bb => byacc_20140422.bb} (74%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-alac-fix-nb_samples-order-case.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-alsdec-check-block-length.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-atrac3dec-Check-coding-mode-against-channels.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-msrle-use-av_image_get_linesize-to-calculate.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avformat-mpegtsenc-Check-data-array-size-in-mpegts_w.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-eamad-fix-out-of-array-accesses.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-correct-ref-count-check-and-limit-fix-out-of-ar.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-Check-init_vlc-return-codes.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-Skip-len-0-cases.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-mjpegdec-check-SE.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pgssubdec-check-RLE-size-before-copying.-Fix-out-of-.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-roqvideodec-check-dimensions-validity.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vqavideo-check-chunk-sizes-before-reading-chunks.patch

-- 
1.8.3.1


