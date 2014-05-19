Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8ABB865F1F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 09:58:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 May 2014 02:58:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,866,1392192000"; d="scan'208";a="541333689"
Received: from akagikob-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.55])
	by fmsmga002.fm.intel.com with ESMTP; 19 May 2014 02:58:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Rongqing Li <rongqing.li@windriver.com>
Date: Mon, 19 May 2014 10:58 +0100
Message-ID: <3709235.f54P8fLhiD@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.3-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <53795F49.5000407@windriver.com>
References: <cover.1400201782.git.rongqing.li@windriver.com>
	<6339757.ULFiZ01mb2@peggleto-mobl5.ger.corp.intel.com>
	<53795F49.5000407@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/12 v2] ffmpeg: backport 12 CVE patches
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
X-List-Received-Date: Mon, 19 May 2014 09:58:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 19 May 2014 09:32:57 Rongqing Li wrote:
> On 05/16/2014 07:09 PM, Paul Eggleton wrote:
> > Hi Roy,
> > 
> > On Friday 16 May 2014 10:12:08 rongqing.li@windriver.com wrote:
> >> From: Roy Li <rongqing.li@windriver.com>
> >> 
> >> Diff with V1: use ffmpeg as prefix of commit header
> >> 
> >> The following changes since commit 
e273301efa0037a13c3a60b4414140364d9c9873:
> >>    gstreamer/lame: Better gcc 4.9 fix (2014-05-15 23:27:41 +0100)
> >> 
> >> are available in the git repository at:
> >>    git://git.pokylinux.org/poky-contrib roy/ffmpeg-2
> >>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/ffmpeg-2
> >> 
> >> Yue Tao (12):
> >>    ffmpeg: fix for Security Advisory CVE-2014-2263
> >>    ffmpeg: fix for Security Advisory CVE-2013-0865
> >>    ffmpeg: fix for Security Advisory CVE-2014-2099
> >>    ffmpeg: fix for Security Advisory CVE-2013-0868
> >>    ffmpeg: fix for Security Advisory CVE-2013-0845
> >>    ffmpeg: fix for Security Advisory CVE-2013-0852
> >>    ffmpeg: fix for Security Advisory CVE-2013-0858
> >>    ffmpeg: fix for Security Advisory CVE-2013-0851
> >>    ffmpeg: fix for Security Advisory CVE-2013-0854
> >>    ffmpeg: fix for Security Advisory CVE-2013-0856
> >>    ffmpeg: fix for Security Advisory CVE-2013-0850
> >>    ffmpeg: fix for Security Advisory CVE-2013-0849
> > 
> > This should really be "gst-ffmpeg:" rather than just "ffmpeg:" since
> > that's the recipe being modified.
> 
> Ok, I update it
> 
> =====================
> The following changes since commit e273301efa0037a13c3a60b4414140364d9c9873:
> 
>    gstreamer/lame: Better gcc 4.9 fix (2014-05-15 23:27:41 +0100)
> 
> are available in the git repository at:
> 
>    git://git.pokylinux.org/poky-contrib roy/ffmpeg-2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/ffmpeg-2
> 
> Yue Tao (12):
>    gst-ffmpeg: fix for Security Advisory CVE-2014-2263
>    gst-ffmpeg: fix for Security Advisory CVE-2013-0865
>    gst-ffmpeg: fix for Security Advisory CVE-2014-2099
>    gst-ffmpeg: fix for Security Advisory CVE-2013-0868
>    gst-ffmpeg: fix for Security Advisory CVE-2013-0845
>    gst-ffmpeg: fix for Security Advisory CVE-2013-0852
>    gst-ffmpeg: fix for Security Advisory CVE-2013-0858
>    gst-ffmpeg: fix for Security Advisory CVE-2013-0851
>    gst-ffmpeg: fix for Security Advisory CVE-2013-0854
>    gst-ffmpeg: fix for Security Advisory CVE-2013-0856
>    gst-ffmpeg: fix for Security Advisory CVE-2013-0850
>    gst-ffmpeg: fix for Security Advisory CVE-2013-0849
> 
>   .../0001-alac-fix-nb_samples-order-case.patch      |   30 +++++++
>   .../0001-alsdec-check-block-length.patch           |   61 ++++++++++++++
>   ...ac3dec-Check-coding-mode-against-channels.patch |   37 +++++++++
>   ...le-use-av_image_get_linesize-to-calculate.patch |   50 +++++++++++
>   ...egtsenc-Check-data-array-size-in-mpegts_w.patch |   69 ++++++++++++++++
> .../0001-eamad-fix-out-of-array-accesses.patch     |   29 +++++++
> ...t-ref-count-check-and-limit-fix-out-of-ar.patch |   29 +++++++
> ...01-huffyuvdec-Check-init_vlc-return-codes.patch |   87
> ++++++++++++++++++++
>   .../0001-huffyuvdec-Skip-len-0-cases.patch         |   59 +++++++++++++
>   .../0001-mjpegdec-check-SE.patch                   |   32 +++++++
>   ...heck-RLE-size-before-copying.-Fix-out-of-.patch |   34 ++++++++
>   ...001-roqvideodec-check-dimensions-validity.patch |   36 ++++++++
>   ...o-check-chunk-sizes-before-reading-chunks.patch |   51 ++++++++++++
>   .../gstreamer/gst-ffmpeg_0.10.13.bb                |   13 +++
>   14 files changed, 617 insertions(+)
>   create mode 100644
> meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-alac-fix-nb_sample
> s-order-case.patch create mode 100644
> meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-alsdec-check-block
> -length.patch create mode 100644
> meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-atrac3dec-Check-co
> ding-mode-against-channels.patch create mode 100644
> meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-msrle-use-
> av_image_get_linesize-to-calculate.patch create mode 100644
> meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avformat-mpegtsenc
> -Check-data-array-size-in-mpegts_w.patch create mode 100644
> meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-eamad-fix-out-of-a
> rray-accesses.patch create mode 100644
> meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-correct-ref-c
> ount-check-and-limit-fix-out-of-ar.patch create mode 100644
> meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-Check-i
> nit_vlc-return-codes.patch create mode 100644
> meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-Skip-le
> n-0-cases.patch create mode 100644
> meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-mjpegdec-check-SE.
> patch create mode 100644
> meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pgssubdec-check-RL
> E-size-before-copying.-Fix-out-of-.patch
> > Also, I'm not sure if you got my message yesterday (since there was a
> > problem> 
> > with the email transmission) however I'll repeat it here just in case:
> >> Note that whilst we should apply these patches, they won't actually have
> >> any effect on unmodified builds because we do not use gst-ffmpeg's
> >> internal copy of ffmpeg, we use libav instead. So if any of these fixes
> >> apply to libav (or if there are equivalent fixes) we will need to apply
> >> them to libav.
> > 
> > Would you be able to take care of the corresponding patches to libav?
> 
> I did not see the CVE patches on libav

If they are applicable to the built-in copy of ffmpeg, at least some of them 
should be applicable to libav.

Actually I've noticed we're a couple of releases behind on libav 0.8 upgrades 
(libav 0.8 is the version we are using with gst-ffmpeg), and we also need to do 
a libav 9 upgrade. I will take care of at least doing the upgrades, but we 
should double-check that these fixes are either not applicable or already 
applied after that is done.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

