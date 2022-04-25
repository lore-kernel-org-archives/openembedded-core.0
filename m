Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A12C63708
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:14 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web12.31308.1650901158188101842
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K54EnVHd;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id k29so13699097pgm.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=3I459NdE+qU4Gu7vfzDNorBV4GIyNx2yzAam4o//dsY=;
        b=K54EnVHdat/oscCrLGapXz4WY8j/5YNJxlRe/p+I2oit3VUg266tOTdrwrq/VvDpld
         O21+s5MCmclKbEQSCWUibIFOwoMJkZhMmb9BEk/2WWQEDIA7IttyeLBzUymZG4Y8DMt3
         saO1ApixMwmZ7SV31wMVWkRgJfc/tjQ2khohF9FQSyCS1xQ+Qto5j08hoWNn54YdTH7I
         zod7N+1CEW51p2NqiO0UBG5d3KkQNKhcv+uRIQLq7fl0vSBKc23xvFqP07xedBlcwM2b
         ygTtCf+Zq082nRZ4lUNtXM0Jp0I53iaII5WVp+pXxBIgBCCYiVCvvqvrD0SXNyqwZEfj
         1pUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=3I459NdE+qU4Gu7vfzDNorBV4GIyNx2yzAam4o//dsY=;
        b=KlDad66dgXEj4GBLiEcDs4CmqK37XampPsVe6cZl84PWA4NYYyfEcHYVJ9gEfDvufJ
         rjv7jRzYliEiTLbyddCwUye87WjS2scHedE6QxF36caWr7zxG4i7lxPBxolnMRCScm+f
         BoqtgVoZrva0lYipvP9+OPwju6who4/KhgPXxthLcu3dXCoRjZMAwHlK9vmMMWv43/mD
         9enSEES8TDN5KaqqGvCYkj6ByG2Tggp/TGXA+SC9XUvu+tYwGtD05FEYtcXWauXRy25k
         gFjI3x2yE6TtCWZPbsM5PFH4wwJtmNmuuK3G9OMZ/4QwSwCrSc3b8pLQMtqyI+4jiqgK
         9gBA==
X-Gm-Message-State: AOAM530SZ76q8qXGDy6aFYEOzCWRbnr05WjIpDYI9ONDRJIuVCKYnTqr
	MkepX1fXjd8DxqDpNJ2SOn8=
X-Google-Smtp-Source: 
 ABdhPJw5gp+5G/prwD/VxSo66Pyd9Z/jknpHACKWQ94q2vMsW/JvpzHGmw4HqVRPBu48VWJs1LZdQA==
X-Received: by 2002:a63:140f:0:b0:399:3005:baf5 with SMTP id
 u15-20020a63140f000000b003993005baf5mr15845555pgl.193.1650901157609;
        Mon, 25 Apr 2022 08:39:17 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:f836:5900:de4e:9a75?
 ([2601:646:9200:a0f0:f836:5900:de4e:9a75])
        by smtp.gmail.com with ESMTPSA id
 i127-20020a62c185000000b0050d4869918csm2373069pfg.216.2022.04.25.08.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 08:39:17 -0700 (PDT)
Message-ID: <d250366a-40fe-0476-971d-4ff125559eb1@gmail.com>
Date: Mon, 25 Apr 2022 08:39:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [OE-core] [master][kirkstone][PATCH] gstreamer1.0-plugins-good:
 Fix libsoup dependency
Content-Language: en-US
To: crg7475@mailbox.org, openembedded-core@lists.openembedded.org
References: <20220425150104.1001838-1-crg7475@mailbox.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220425150104.1001838-1-crg7475@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164831



On 4/25/22 8:01 AM, Carlos Rafael Giani via lists.openembedded.org wrote:
> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> ---
>   .../gstreamer/gstreamer1.0-plugins-good_1.20.1.bb          | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb
> index 08ff5a0bb5..1f61d9a10e 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb
> @@ -49,7 +49,12 @@ PACKAGECONFIG[libv4l2]    = "-Dv4l2-libv4l2=enabled,-Dv4l2-libv4l2=disabled,v4l-
>   PACKAGECONFIG[mpg123]     = "-Dmpg123=enabled,-Dmpg123=disabled,mpg123"
>   PACKAGECONFIG[pulseaudio] = "-Dpulse=enabled,-Dpulse=disabled,pulseaudio"
>   PACKAGECONFIG[qt5]        = "-Dqt5=enabled,-Dqt5=disabled,qtbase qtdeclarative qtbase-native ${QT5WAYLANDDEPENDS}"
> -PACKAGECONFIG[soup]       = "-Dsoup=enabled,-Dsoup=disabled,libsoup-2.4"
> +# Starting with version 1.20, the GStreamer soup plugin loads libsoup with dlopen()
> +# instead of linking to it. And instead of using the default libsoup C headers, it
> +# uses its own stub header. Consequently, objdump will not show the libsoup .so as
> +# a dependency, and libsoup won't be added to an image. Fix this by setting libsoup
> +# as RDEPEND instead of DEPEND.
> +PACKAGECONFIG[soup]       = "-Dsoup=enabled,-Dsoup=disabled,,libsoup-2.4"

We have soup3 as well. I wonder if that should also be an option ?

>   PACKAGECONFIG[speex]      = "-Dspeex=enabled,-Dspeex=disabled,speex"
>   PACKAGECONFIG[rpi]        = "-Drpicamsrc=enabled,-Drpicamsrc=disabled,userland"
>   PACKAGECONFIG[taglib]     = "-Dtaglib=enabled,-Dtaglib=disabled,taglib"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164825): https://lists.openembedded.org/g/openembedded-core/message/164825
> Mute This Topic: https://lists.openembedded.org/mt/90686912/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

