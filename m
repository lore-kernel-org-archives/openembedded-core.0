Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C01BE65FE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 01:32:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4J1WxUK003153
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 18 May 2014 18:33:00 -0700 (PDT)
Received: from [128.224.162.149] (128.224.162.149) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Sun, 18 May 2014 18:32:59 -0700
Message-ID: <53795F49.5000407@windriver.com>
Date: Mon, 19 May 2014 09:32:57 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1400201782.git.rongqing.li@windriver.com>
	<6339757.ULFiZ01mb2@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <6339757.ULFiZ01mb2@peggleto-mobl5.ger.corp.intel.com>
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
X-List-Received-Date: Mon, 19 May 2014 01:33:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/16/2014 07:09 PM, Paul Eggleton wrote:
> Hi Roy,
>
> On Friday 16 May 2014 10:12:08 rongqing.li@windriver.com wrote:
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> Diff with V1: use ffmpeg as prefix of commit header
>>
>> The following changes since commit e273301efa0037a13c3a60b4414140364d9c9873:
>>
>>    gstreamer/lame: Better gcc 4.9 fix (2014-05-15 23:27:41 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib roy/ffmpeg-2
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/ffmpeg-2
>>
>> Yue Tao (12):
>>    ffmpeg: fix for Security Advisory CVE-2014-2263
>>    ffmpeg: fix for Security Advisory CVE-2013-0865
>>    ffmpeg: fix for Security Advisory CVE-2014-2099
>>    ffmpeg: fix for Security Advisory CVE-2013-0868
>>    ffmpeg: fix for Security Advisory CVE-2013-0845
>>    ffmpeg: fix for Security Advisory CVE-2013-0852
>>    ffmpeg: fix for Security Advisory CVE-2013-0858
>>    ffmpeg: fix for Security Advisory CVE-2013-0851
>>    ffmpeg: fix for Security Advisory CVE-2013-0854
>>    ffmpeg: fix for Security Advisory CVE-2013-0856
>>    ffmpeg: fix for Security Advisory CVE-2013-0850
>>    ffmpeg: fix for Security Advisory CVE-2013-0849
>
> This should really be "gst-ffmpeg:" rather than just "ffmpeg:" since that's the
> recipe being modified.
>

Ok, I update it

=====================
The following changes since commit e273301efa0037a13c3a60b4414140364d9c9873:

   gstreamer/lame: Better gcc 4.9 fix (2014-05-15 23:27:41 +0100)

are available in the git repository at:

   git://git.pokylinux.org/poky-contrib roy/ffmpeg-2
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/ffmpeg-2

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
  ...01-huffyuvdec-Check-init_vlc-return-codes.patch |   87 
++++++++++++++++++++
  .../0001-huffyuvdec-Skip-len-0-cases.patch         |   59 +++++++++++++
  .../0001-mjpegdec-check-SE.patch                   |   32 +++++++
  ...heck-RLE-size-before-copying.-Fix-out-of-.patch |   34 ++++++++
  ...001-roqvideodec-check-dimensions-validity.patch |   36 ++++++++
  ...o-check-chunk-sizes-before-reading-chunks.patch |   51 ++++++++++++
  .../gstreamer/gst-ffmpeg_0.10.13.bb                |   13 +++
  14 files changed, 617 insertions(+)
  create mode 100644 
meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-alac-fix-nb_samples-order-case.patch
  create mode 100644 
meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-alsdec-check-block-length.patch
  create mode 100644 
meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-atrac3dec-Check-coding-mode-against-channels.patch
  create mode 100644 
meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-msrle-use-av_image_get_linesize-to-calculate.patch
  create mode 100644 
meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avformat-mpegtsenc-Check-data-array-size-in-mpegts_w.patch
  create mode 100644 
meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-eamad-fix-out-of-array-accesses.patch
  create mode 100644 
meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-correct-ref-count-check-and-limit-fix-out-of-ar.patch
  create mode 100644 
meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-Check-init_vlc-return-codes.patch
  create mode 100644 
meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-Skip-len-0-cases.patch
  create mode 100644 
meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-mjpegdec-check-SE.patch
  create mode 100644 
meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pgssubdec-check-RLE-size-before-copying.-Fix-out-of-.patch



> Also, I'm not sure if you got my message yesterday (since there was a problem
> with the email transmission) however I'll repeat it here just in case:
>
>> Note that whilst we should apply these patches, they won't actually have any
>> effect on unmodified builds because we do not use gst-ffmpeg's internal
>> copy of ffmpeg, we use libav instead. So if any of these fixes apply to
>> libav (or if there are equivalent fixes) we will need to apply them to
>> libav.
>
> Would you be able to take care of the corresponding patches to libav?
>

I did not see the CVE patches on libav

-Roy


> Thanks,
> Paul
>

-- 
Best Reagrds,
Roy | RongQing Li

