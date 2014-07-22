Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EC6A97020E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 06:16:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6M6GCoo024391
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 23:16:13 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 21 Jul 2014 23:16:12 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 14:16:01 +0800
Message-ID: <cover.1406006666.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 00/16] gst-ffmpeg: merge several CVE patches
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
X-List-Received-Date: Tue, 22 Jul 2014 06:16:19 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

The following changes since commit 6bc3696d8451a23d743daf03ee98c4ba54ce4551:

  wget: Remove unneeded DEPENDS line (2014-07-21 19:10:30 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/ffmpeg-7-21
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/ffmpeg-7-21

Yue Tao (16):
  gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0866
  gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0875
  gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0860
  gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3934
  gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3946
  gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-7023
  gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-7009
  gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0855
  gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-4351
  gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0848
  gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3944
  gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-7010
  gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3941
  gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0846
  gst-ffmpeg: Security Advisory - ffmpeg - CVE-2012-6618
  gst-ffmpeg: Security Advisory - ffmpeg - CVE-2012-6617

 .../0001-aacdec-check-channel-count.patch          |   34 ++++
 ...util-fix-signedness-in-sizeof-comparissio.patch |   38 ++++
 ...c-parser-reset-indexes-on-realloc-failure.patch |   50 ++++++
 ...a-Perform-pointer-advance-and-checks-befo.patch |   81 +++++++++
 ...-error-concealment-initialize-block-index.patch |   29 ++++
 ...alment-Check-that-the-picture-is-not-in-a.patch |   37 ++++
 .../0001-ffserver-set-oformat.patch                |   36 ++++
 .../0001-h264_sei-Fix-infinite-loop.patch          |   39 +++++
 ...check-width-more-completely-avoid-out-of-.patch |   30 ++++
 ...f-compute-probe-buffer-size-more-reliably.patch |   45 +++++
 ...er-dont-access-out-of-array-elements-at-t.patch |   44 +++++
 ...array-index-before-use-fix-out-of-array-a.patch |   30 ++++
 .../0001-qdm2dec-fix-buffer-overflow.patch         |   58 +++++++
 ...Check-that-the-last-indexes-are-within-th.patch |   32 ++++
 ...-vp3-Copy-all-3-frames-for-thread-updates.patch |   32 ++++
 ...-read-for-negative-tokens-and-memleaks-on.patch |  183 ++++++++++++++++++++
 .../gst-ffmpeg-CVE-2013-0855.patch                 |  100 +++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |   17 ++
 18 files changed, 915 insertions(+)
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

-- 
1.7.10.4


