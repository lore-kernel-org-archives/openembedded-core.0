Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2768F72207
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 13:58:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2015 06:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,453,1427785200"; d="scan'208";a="495065418"
Received: from linux-8hqz.fi.intel.com (HELO linux-8hqz.site.fi.intel.com)
	([10.237.68.142])
	by FMSMGA003.fm.intel.com with ESMTP; 18 May 2015 06:58:21 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 16:58:34 +0300
Message-Id: <1431957520-14510-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/6] Remove unsupported GStreamer 0.10
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
X-List-Received-Date: Mon, 18 May 2015 13:58:22 -0000

These patches remove the unsupported GStreamer 0.10 framework from oe-core.
GStreamer 0.10 will still be available from meta-oe, but is no longer recommended to use.

Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=6294

Alexander Kanavin (6):
  python-gst: remove obsolete Python gstreamer 0.10 bindings
  clutter-gst: update to latest upstream version 3.0.4
  qt4: remove Qt Mobility
  qt4: disable Phonon framework
  webkitgtk: disable audio and video support
  gstreamer: remove 0.10 recipes

 .../python/python-gst/python-path.patch            |   28 -
 meta/recipes-devtools/python/python-gst_0.10.22.bb |   29 -
 .../clutter/clutter-gst-1.0-1.6.0/cogl-1.14.patch  |   48 -
 .../clutter-gst-1.0-1.6.0/enable-tests.patch       |   23 -
 meta/recipes-graphics/clutter/clutter-gst-1.0.inc  |   18 -
 .../clutter/clutter-gst-1.0_1.6.0.bb               |    9 -
 ...mple-binary-needed-for-core-image-clutter.patch |   33 +
 .../clutter-gst-3.0-3.0.4/enable-tests.patch       |   23 +
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc  |   18 +
 .../clutter/clutter-gst-3.0_3.0.4.bb               |    7 +
 .../packagegroups/packagegroup-core-clutter.bb     |    2 +-
 .../0001-aacdec-check-channel-count.patch          |   34 -
 .../0001-alac-fix-nb_samples-order-case.patch      |   30 -
 .../0001-alsdec-check-block-length.patch           |   61 -
 ...ac3dec-Check-coding-mode-against-channels.patch |   37 -
 ...util-fix-signedness-in-sizeof-comparissio.patch |   40 -
 ...le-use-av_image_get_linesize-to-calculate.patch |   50 -
 ...c-parser-reset-indexes-on-realloc-failure.patch |   50 -
 ...a-Perform-pointer-advance-and-checks-befo.patch |   81 -
 .../0001-avcodec-smc-fix-off-by-1-error.patch      |   32 -
 ...egtsenc-Check-data-array-size-in-mpegts_w.patch |   69 -
 .../0001-eamad-fix-out-of-array-accesses.patch     |   29 -
 ...-error-concealment-initialize-block-index.patch |   29 -
 ...alment-Check-that-the-picture-is-not-in-a.patch |   37 -
 .../0001-ffserver-set-oformat.patch                |   36 -
 ...t-ref-count-check-and-limit-fix-out-of-ar.patch |   29 -
 ...t-parameters-from-SPS-whenever-it-changes.patch |  145 -
 ...rror-concealment-when-SPS-and-slices-are-.patch |   33 -
 .../0001-h264_sei-Fix-infinite-loop.patch          |   39 -
 ...01-huffyuvdec-Check-init_vlc-return-codes.patch |   87 -
 .../0001-huffyuvdec-Skip-len-0-cases.patch         |   61 -
 ...f-compute-probe-buffer-size-more-reliably.patch |   45 -
 .../0001-mjpegdec-check-SE.patch                   |   32 -
 ...heck-RLE-size-before-copying.-Fix-out-of-.patch |   34 -
 ...er-dont-access-out-of-array-elements-at-t.patch |   44 -
 ...array-index-before-use-fix-out-of-array-a.patch |   30 -
 .../0001-qdm2dec-fix-buffer-overflow.patch         |   58 -
 ...001-roqvideodec-check-dimensions-validity.patch |   36 -
 ...Check-that-the-last-indexes-are-within-th.patch |   32 -
 ...-vp3-Copy-all-3-frames-for-thread-updates.patch |   32 -
 ...-read-for-negative-tokens-and-memleaks-on.patch |  183 -
 ...o-check-chunk-sizes-before-reading-chunks.patch |   51 -
 ...egdec-check-bits-per-pixel-for-changes-si.patch |   68 -
 .../gst-ffmpeg-0.10.13/configure-fix.patch         |   22 -
 .../gst-ffmpeg-CVE-2013-0855.patch                 |  100 -
 .../gst-ffmpeg-CVE-2013-3674.patch                 |   26 -
 .../gst-ffmpeg-0.10.13/h264_qpel_mmx.patch         |   57 -
 .../gstreamer/gst-ffmpeg-0.10.13/libav-9.patch     | 9304 --------------------
 .../gst-ffmpeg-0.10.13/libav_e500mc.patch          |   21 -
 .../gstreamer/gst-ffmpeg-0.10.13/libav_e5500.patch |   19 -
 .../gstreamer/gst-ffmpeg-0.10.13/lower-rank.diff   |   16 -
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |   90 -
 .../gstreamer/gst-fluendo-mp3_0.10.31.bb           |   14 -
 .../gstreamer/gst-fluendo-mpegdemux_0.10.85.bb     |   12 -
 meta/recipes-multimedia/gstreamer/gst-fluendo.inc  |   14 -
 .../gstreamer/gst-meta-base_0.10.bb                |   73 -
 .../gstreamer/gst-openmax/gcc_4.6.patch            |   18 -
 .../gstreamer/gst-openmax/ptr-array.patch          |   46 -
 .../gstreamer/gst-openmax_0.10.1.bb                |   35 -
 .../gstreamer/gst-plugins-bad_0.10.23.bb           |   50 -
 ...le-Fix-build-on-x86-if-emmintrin.h-is-ava.patch |   37 -
 .../configure.ac-fix-subparse-plugin.patch         |   27 -
 .../gst-plugins-base-tremor.patch                  |   20 -
 .../gstreamer/gst-plugins-base_0.10.36.bb          |   39 -
 ...-conditional-gl-framebuffer-undefined-use.patch |   35 -
 .../gstreamer/gst-plugins-gl_0.10.3.bb             |   25 -
 ...ild-with-recent-kernels-the-v4l2_buffer-i.patch |   33 -
 ...define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch |   45 -
 .../0407-mulawdec-fix-integer-overrun.patch        |   47 -
 .../gstreamer/gst-plugins-good_0.10.31.bb          |   47 -
 .../gstreamer/gst-plugins-ugly_0.10.19.bb          |   29 -
 meta/recipes-multimedia/gstreamer/gst-plugins.inc  |   28 -
 ...ix-self-comparison-always-evaluates-to-tr.patch |   32 -
 .../gstreamer/gstreamer-0.10.36/check_fix.patch    |   19 -
 .../gst-inspect-check-error.patch                  |   16 -
 ...mer-change-priv_gst_parse_yylex-arguments.patch |   33 -
 .../gstreamer-0.10.36/gstregistrybinary.c          |  487 -
 .../gstreamer-0.10.36/gstregistrybinary.h          |  194 -
 .../gstreamer/gstreamer_0.10.36.bb                 |   51 -
 ...embedded-usage-doesn-t-work-outside-of-Qt.patch |   73 -
 ...stvideoconnector-fixed-buffers-allocation.patch |   34 -
 ...nnecessary-rpaths-from-qml_device-example.patch |   28 -
 .../fix-compile-error-no-bluez.patch               |  338 -
 .../fix_metaobjectbuilder_build_err.patch          | 4707 ----------
 .../qt4/qt-mobility-1.2.0/gcc-scope.patch          |   48 -
 .../qt-mobility-1.2.0/qt-mobility-configure.patch  |   17 -
 .../qt-mobility-1.2.0/qt-mobility-no-opengl.patch  |   38 -
 .../qt-mobility-1.2.0/qt-mobility-no-xvideo.patch  |   26 -
 meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb  |   11 -
 meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb       |   10 -
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |  112 -
 meta/recipes-qt/qt4/qt4.inc                        |    4 +-
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |    6 +-
 93 files changed, 89 insertions(+), 18416 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-gst/python-path.patch
 delete mode 100644 meta/recipes-devtools/python/python-gst_0.10.22.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.0-1.6.0/cogl-1.14.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.0-1.6.0/enable-tests.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.0.inc
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.0_1.6.0.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-3.0-3.0.4/0001-Install-example-binary-needed-for-core-image-clutter.patch
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-3.0-3.0.4/enable-tests.patch
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-3.0.inc
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.4.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-aacdec-check-channel-count.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-alac-fix-nb_samples-order-case.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-alsdec-check-block-length.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-atrac3dec-Check-coding-mode-against-channels.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-dsputil-fix-signedness-in-sizeof-comparissio.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-msrle-use-av_image_get_linesize-to-calculate.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-parser-reset-indexes-on-realloc-failure.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-rpza-Perform-pointer-advance-and-checks-befo.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-smc-fix-off-by-1-error.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avformat-mpegtsenc-Check-data-array-size-in-mpegts_w.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-eamad-fix-out-of-array-accesses.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-error-concealment-initialize-block-index.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-error_concealment-Check-that-the-picture-is-not-in-a.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-ffserver-set-oformat.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-correct-ref-count-check-and-limit-fix-out-of-ar.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-set-parameters-from-SPS-whenever-it-changes.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-skip-error-concealment-when-SPS-and-slices-are-.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264_sei-Fix-infinite-loop.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-Check-init_vlc-return-codes.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-Skip-len-0-cases.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-lavf-compute-probe-buffer-size-more-reliably.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-mjpegdec-check-SE.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pgssubdec-check-RLE-size-before-copying.-Fix-out-of-.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pngdec-filter-dont-access-out-of-array-elements-at-t.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm2-check-array-index-before-use-fix-out-of-array-a.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm2dec-fix-buffer-overflow.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-roqvideodec-check-dimensions-validity.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-smackerdec-Check-that-the-last-indexes-are-within-th.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3-Copy-all-3-frames-for-thread-updates.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3-fix-oob-read-for-negative-tokens-and-memleaks-on.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vqavideo-check-chunk-sizes-before-reading-chunks.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0002-avcodec-mjpegdec-check-bits-per-pixel-for-changes-si.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-CVE-2013-0855.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-CVE-2013-3674.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/h264_qpel_mmx.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav-9.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav_e500mc.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav_e5500.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/lower-rank.diff
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.31.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.85.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-fluendo.inc
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-openmax/gcc_4.6.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-openmax/ptr-array.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/configure.ac-fix-subparse-plugin.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/gst-plugins-base-tremor.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-gl/0001-conditional-gl-framebuffer-undefined-use.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0407-mulawdec-fix-integer-overrun.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins.inc
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/check_fix.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/gst-inspect-check-error.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstreamer-change-priv_gst_parse_yylex-arguments.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstregistrybinary.c
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstregistrybinary.h
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
 delete mode 100644 meta/recipes-qt/qt4/qt-mobility-1.2.0/0001-fix-embedded-usage-doesn-t-work-outside-of-Qt.patch
 delete mode 100644 meta/recipes-qt/qt4/qt-mobility-1.2.0/0001-gstvideoconnector-fixed-buffers-allocation.patch
 delete mode 100644 meta/recipes-qt/qt4/qt-mobility-1.2.0/0002-Remove-unnecessary-rpaths-from-qml_device-example.patch
 delete mode 100644 meta/recipes-qt/qt4/qt-mobility-1.2.0/fix-compile-error-no-bluez.patch
 delete mode 100644 meta/recipes-qt/qt4/qt-mobility-1.2.0/fix_metaobjectbuilder_build_err.patch
 delete mode 100644 meta/recipes-qt/qt4/qt-mobility-1.2.0/gcc-scope.patch
 delete mode 100644 meta/recipes-qt/qt4/qt-mobility-1.2.0/qt-mobility-configure.patch
 delete mode 100644 meta/recipes-qt/qt4/qt-mobility-1.2.0/qt-mobility-no-opengl.patch
 delete mode 100644 meta/recipes-qt/qt4/qt-mobility-1.2.0/qt-mobility-no-xvideo.patch
 delete mode 100644 meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb
 delete mode 100644 meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
 delete mode 100644 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc

-- 
2.1.4


