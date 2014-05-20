Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A139965F69
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 01:52:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4K1qHqD005650
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 18:52:18 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 19 May 2014 18:52:17 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 May 2014 09:52:05 +0800
Message-ID: <cover.1400550433.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 00/12 v3] gst-ffmpeg: backport 12 CVE patches
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
X-List-Received-Date: Tue, 20 May 2014 01:52:18 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Diff with V1: fix the commit header and prefix
Diff with V2: add Upstream-status for fix of CVE-2013-0868

The following changes since commit e273301efa0037a13c3a60b4414140364d9c9873:

  gstreamer/lame: Better gcc 4.9 fix (2014-05-15 23:27:41 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/ffmpeg-3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/ffmpeg-3

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

 .../0001-alac-fix-nb_samples-order-case.patch      |   30 +++++++
 .../0001-alsdec-check-block-length.patch           |   61 ++++++++++++++
 ...ac3dec-Check-coding-mode-against-channels.patch |   37 +++++++++
 ...le-use-av_image_get_linesize-to-calculate.patch |   50 +++++++++++
 ...egtsenc-Check-data-array-size-in-mpegts_w.patch |   69 ++++++++++++++++
 .../0001-eamad-fix-out-of-array-accesses.patch     |   29 +++++++
 ...t-ref-count-check-and-limit-fix-out-of-ar.patch |   29 +++++++
 ...01-huffyuvdec-Check-init_vlc-return-codes.patch |   87 ++++++++++++++++++++
 .../0001-huffyuvdec-Skip-len-0-cases.patch         |   61 ++++++++++++++
 .../0001-mjpegdec-check-SE.patch                   |   32 +++++++
 ...heck-RLE-size-before-copying.-Fix-out-of-.patch |   34 ++++++++
 ...001-roqvideodec-check-dimensions-validity.patch |   36 ++++++++
 ...o-check-chunk-sizes-before-reading-chunks.patch |   51 ++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |   13 +++
 14 files changed, 619 insertions(+)
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
1.7.10.4


