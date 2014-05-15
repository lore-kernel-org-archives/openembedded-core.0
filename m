Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EDFA365D0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 02:04:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4F243FY016373
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 19:04:03 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 14 May 2014 19:04:02 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 May 2014 10:03:50 +0800
Message-ID: <cover.1400118419.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 00/12] forward 12 CVE patches for ffmpeg
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
X-List-Received-Date: Thu, 15 May 2014 02:04:09 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

The following changes since commit 58417093d7ce83c8a2f683a356fddc23aaee5e8e:

  wic: Extend indirect string connection to support image names and rootfs (2014-05-13 19:35:06 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/ffmpeg-1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/ffmpeg-1

Yue Tao (12):
  Security Advisory - ffmpeg - CVE-2014-2263
  Security Advisory - ffmpeg - CVE-2013-0865
  Security Advisory - ffmpeg - CVE-2014-2099
  Security Advisory - ffmpeg - CVE-2013-0868
  Security Advisory - ffmpeg - CVE-2013-0845
  Security Advisory - ffmpeg - CVE-2013-0852
  Security Advisory - ffmpeg - CVE-2013-0858
  Security Advisory - ffmpeg - CVE-2013-0851
  Security Advisory - ffmpeg - CVE-2013-0854
  Security Advisory - ffmpeg - CVE-2013-0856
  Security Advisory - ffmpeg - CVE-2013-0850
  Security Advisory - ffmpeg - CVE-2013-0849

 .../0001-alac-fix-nb_samples-order-case.patch      |   30 +++++++
 .../0001-alsdec-check-block-length.patch           |   61 ++++++++++++++
 ...ac3dec-Check-coding-mode-against-channels.patch |   37 +++++++++
 ...le-use-av_image_get_linesize-to-calculate.patch |   48 +++++++++++
 ...egtsenc-Check-data-array-size-in-mpegts_w.patch |   67 +++++++++++++++
 .../0001-eamad-fix-out-of-array-accesses.patch     |   29 +++++++
 ...t-ref-count-check-and-limit-fix-out-of-ar.patch |   29 +++++++
 ...01-huffyuvdec-Check-init_vlc-return-codes.patch |   87 ++++++++++++++++++++
 .../0001-huffyuvdec-Skip-len-0-cases.patch         |   59 +++++++++++++
 .../0001-mjpegdec-check-SE.patch                   |   32 +++++++
 ...heck-RLE-size-before-copying.-Fix-out-of-.patch |   34 ++++++++
 ...001-roqvideodec-check-dimensions-validity.patch |   36 ++++++++
 ...o-check-chunk-sizes-before-reading-chunks.patch |   49 +++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |   13 +++
 14 files changed, 611 insertions(+)
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


