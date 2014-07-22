Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00F8B65E3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 07:10:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6M7A7IF009410
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 00:10:07 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 22 Jul 2014 00:10:06 -0700
Message-ID: <53CE0E53.4020501@windriver.com>
Date: Tue, 22 Jul 2014 15:10:11 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <rongqing.li@windriver.com>
References: <cover.1406006666.git.rongqing.li@windriver.com>
In-Reply-To: <cover.1406006666.git.rongqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/16] gst-ffmpeg: merge several CVE patches
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
X-List-Received-Date: Tue, 22 Jul 2014 07:10:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Please drop this batch, the Upstream-status is not correct.
sorry for this noise

-Roy


On 07/22/2014 02:16 PM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> The following changes since commit 6bc3696d8451a23d743daf03ee98c4ba54ce4551:
>
>    wget: Remove unneeded DEPENDS line (2014-07-21 19:10:30 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib roy/ffmpeg-7-21
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/ffmpeg-7-21
>
> Yue Tao (16):
>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0866
>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0875
>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0860
>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3934
>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3946
>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-7023
>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-7009
>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0855
>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-4351
>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0848
>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3944
>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-7010
>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3941
>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0846
>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2012-6618
>    gst-ffmpeg: Security Advisory - ffmpeg - CVE-2012-6617
>
>   .../0001-aacdec-check-channel-count.patch          |   34 ++++
>   ...util-fix-signedness-in-sizeof-comparissio.patch |   38 ++++
>   ...c-parser-reset-indexes-on-realloc-failure.patch |   50 ++++++
>   ...a-Perform-pointer-advance-and-checks-befo.patch |   81 +++++++++
>   ...-error-concealment-initialize-block-index.patch |   29 ++++
>   ...alment-Check-that-the-picture-is-not-in-a.patch |   37 ++++
>   .../0001-ffserver-set-oformat.patch                |   36 ++++
>   .../0001-h264_sei-Fix-infinite-loop.patch          |   39 +++++
>   ...check-width-more-completely-avoid-out-of-.patch |   30 ++++
>   ...f-compute-probe-buffer-size-more-reliably.patch |   45 +++++
>   ...er-dont-access-out-of-array-elements-at-t.patch |   44 +++++
>   ...array-index-before-use-fix-out-of-array-a.patch |   30 ++++
>   .../0001-qdm2dec-fix-buffer-overflow.patch         |   58 +++++++
>   ...Check-that-the-last-indexes-are-within-th.patch |   32 ++++
>   ...-vp3-Copy-all-3-frames-for-thread-updates.patch |   32 ++++
>   ...-read-for-negative-tokens-and-memleaks-on.patch |  183 ++++++++++++++++++++
>   .../gst-ffmpeg-CVE-2013-0855.patch                 |  100 +++++++++++
>   .../gstreamer/gst-ffmpeg_0.10.13.bb                |   17 ++
>   18 files changed, 915 insertions(+)
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-aacdec-check-channel-count.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-dsputil-fix-signedness-in-sizeof-comparissio.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-parser-reset-indexes-on-realloc-failure.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-rpza-Perform-pointer-advance-and-checks-befo.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-error-concealment-initialize-block-index.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-error_concealment-Check-that-the-picture-is-not-in-a.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-ffserver-set-oformat.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264_sei-Fix-infinite-loop.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-check-width-more-completely-avoid-out-of-.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-lavf-compute-probe-buffer-size-more-reliably.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pngdec-filter-dont-access-out-of-array-elements-at-t.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm2-check-array-index-before-use-fix-out-of-array-a.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm2dec-fix-buffer-overflow.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-smackerdec-Check-that-the-last-indexes-are-within-th.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3-Copy-all-3-frames-for-thread-updates.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3-fix-oob-read-for-negative-tokens-and-memleaks-on.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-CVE-2013-0855.patch
>

-- 
Best Reagrds,
Roy | RongQing Li

