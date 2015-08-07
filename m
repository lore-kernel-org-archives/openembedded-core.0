Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id ED21976731
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 12:36:58 +0000 (UTC)
Received: by igr7 with SMTP id 7so30139362igr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Aug 2015 05:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=DZwtACxdEWgkhl2DcVgaCOxiVTxt312Qupw5OSmGlHE=;
	b=ZkO0Skxuq842kJiImNkYcCA/q/Q3XjzMxqB/c+JvDiIAOHkICPmUFx0oPyH1KCXeIC
	XoyuQ84OgFgmyExTP0Zt+F/PT+IKzFOtNgnlZQF3oJQL3fegWCfHzTjFXiGub6Ay8y6n
	9Gy9PXh4w0h/6RfN/YmRSa7sW593vwfckD21GXzc0YQQ4v49pytpf7A3+IBjwOkn4/Gi
	W3+grBDWzoGspegS4DShLhbl71sAkN/70AuEIQKC37fa8kCMuVSrODIpQDN7XWN7rF5L
	rjcLfiNVdw3mxWbiHpFcuwIKJLumLR2CejuVamojeqii5fCd28hK5VJ2TaQ+fbbsJn/+
	F8rg==
X-Gm-Message-State: ALoCoQlVpYqGmS5lRV+KJ0LMkeE0/SPMQs1t7iTDz4Fqpfr5MPBEZS85yzuNdwWs/ZVTASqnjap9
X-Received: by 10.50.30.226 with SMTP id v2mr2623534igh.3.1438951018782;
	Fri, 07 Aug 2015 05:36:58 -0700 (PDT)
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com.
	[209.85.213.176]) by smtp.gmail.com with ESMTPSA id
	e33sm3587032ioi.12.2015.08.07.05.36.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Aug 2015 05:36:57 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbij6 with SMTP id ij6so30079859igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Aug 2015 05:36:57 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.178.133 with SMTP id cy5mr2690557igc.5.1438951017413;
	Fri, 07 Aug 2015 05:36:57 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 7 Aug 2015 05:36:57 -0700 (PDT)
In-Reply-To: <1438928203-12256-1-git-send-email-b54851@freescale.com>
References: <1438928203-12256-1-git-send-email-b54851@freescale.com>
Date: Fri, 7 Aug 2015 09:36:57 -0300
Message-ID: <CAP9ODKqpE7bd2Q2CGEJN5YiFZZuPuqEJZ-+==1mVBAkcdCamMg@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v7 00/11] gstreamer1.0-plugins-base: Add patches for Gstreamer 1.4.5 base
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
X-List-Received-Date: Fri, 07 Aug 2015 12:36:59 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 7, 2015 at 3:16 AM, Yuqing Zhu <b54851@freescale.com> wrote:
> -Fix id3demux issue
>
> -Handle audio/video decoder error
>
> -Update video alignment after video alignment
>
> -Gstvideofilter use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF
>  Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF, keeping buffer writable
>  Don't ref buffers twice when mapping
>
> -Keep sticky events around when doing a soft reset
>
> -gststreamsynchronizer: Sending EOS event instead of GAP event as GAP event has issue when A/V have
>  different duration.
>  Stop sending second track EOS event if sending the first track EOS return fail.
>
> -basetextoverlay: Make memory copy when video buffer's memory is read only.
>
> -gstplaysink: Don't set async of custom text-sink to false.
>
> -ssaparse: Enhance SSA text lines parsing.
>
> -subparse: Set need_segment after sink pad receive GST_EVENT_SEGMENT.
>
> -encodebin: Need more buffers in output queue for better performance.
>
> Yuqing Zhu (11):
>   gstreamer1.0-plugins-base: Bug fix for id3demux issue
>   gstreamer1.0-plugins-base: handle audio/video decoder error
>   gstreamer1.0-plugins-base: update video alignment after video
>     alignment

Those three patches are fine for me; I think them could be merged.

>   gstreamer1.0-plugins-base: Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF related
>     patch
>   gstreamer1.0-plugins-base: Add videoencoder related patch
>   gstreamer1.0-plugins-base: Add gststreamsynchronizer related patch
>   gstreamer1.0-plugins-base: Add basetextoverlay related patch
>   gstreamer1.0-plugins-base: Add gstplaysink related patch
>   gstreamer1.0-plugins-base: Add ssaparse related patch
>   gstreamer1.0-plugins-base: Add subparse related patch
>   gstreamer1.0-plugins-base: Add encodebin related patch

Related patch ... this says nothing. Please improve the commit logs.

>  ...rlay-make-memory-copy-when-video-buffer-s.patch | 129 ++++++++++++
>  ...rame-Don-t-ref-buffers-twice-when-mapping.patch |  26 +++
>  ...-don-t-set-async-of-custom-text-sink-to-f.patch |  31 +++
>  ...frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch |  87 ++++++++
>  ...3-ssaparse-enhance-SSA-text-lines-parsing.patch | 225 +++++++++++++++++++++
>  ...r-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch |  69 +++++++
>  ...t-need_segment-after-sink-pad-received-GS.patch |  69 +++++++
>  .../do-not-change-eos-event-to-gap-event2.patch    |  49 +++++
>  .../do-not-change-eos-event-to-gap-event3.patch    |  31 +++
>  ...eed-more-buffers-in-output-queue-for-bett.patch |  32 +++
>  .../fix-id3demux-utf16-to-utf8-issue.patch         |  54 +++++
>  .../handle-audio-video-decoder-error.patch         |  64 ++++++
>  .../videobuffer_updata_alignment_update.patch      |  53 +++++
>  ...p-sticky-events-around-when-doing-a-soft-.patch |  46 +++++
>  .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  14 ++
>  15 files changed, 979 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
>  create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event2.patch
>  create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event3.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch
>  create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
>  create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
>  create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

