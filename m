Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.11228.1603987607395145566
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 09:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d/cporyW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id p22so354031wmg.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 09:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=uRJ/GRMqiMfG00r9xdnlYOtXAS7kHEtmpOcKU0Hf9BQ=;
        b=d/cporyWgq2shECwcHpYehZ/d/h/RnXbDXuPXqPBKeaCRADsS62opRrNC8vQsSgC66
         O3jlKWEtltNBuWbPrZMNMElaVIB8SwkDayaGxUHXH6lI7DcNIDGtji7T5eao6SfWuqu5
         in4Ulbl6fSvXN/o84t9Rt2FBGmDofe/iomVcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uRJ/GRMqiMfG00r9xdnlYOtXAS7kHEtmpOcKU0Hf9BQ=;
        b=tgrkA1sndaO9rfeBWv4CLGs+bod4XhvdsIr825DnK4t6GJu0Sz3m9hirBZvFj74K7F
         BPxjUm0/xv2UjdJq19vjC5v+fkJ40tzON8z75w8G6yCwXKfOscGYh6x4ooPJQcwKvFHW
         Fw0LiW6gsFJGp+HSJAg2DC9VivkH+Qt47KapHJqAZ2BJD4HOVDNfQF3Gbu2FwE4R4ol4
         jDNclyMif6rj6TroNYUYniKAeB1LcDxRaHrciMuqL1j3V7xGlcPWrKtF6DV73ngo4dV8
         w4SFNOLu8DpYRuLEsN1IN7DYOXaCtRYixIjtRHsrsIAaKqJan3l8haRc9OCgINcb1tPO
         AZxQ==
X-Gm-Message-State: AOAM530W2XnNp2ocqZ7PJ/poKQ7K2Urlv/nrtZhVjgUBatW01+G8AMPz
	DNKUktUMPeaYHZuoDShs2buO5g==
X-Google-Smtp-Source: ABdhPJzSYPXhJeDHWD8jlEIxejcG8TCX8d5mHRQzQ6YRHf/apOKaKANucGJAvpuTVomCHpszF5xM8A==
X-Received: by 2002:a7b:cf25:: with SMTP id m5mr581337wmg.124.1603987605653;
        Thu, 29 Oct 2020 09:06:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.7.e.c.f.b.4.b.6.c.1.d.5.8.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.7.e.c.f.b.4.b.6.c.1.d.5.8.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b185:d1c6:b4bf:ce77])
        by smtp.gmail.com with ESMTPSA id r28sm6246391wrr.81.2020.10.29.09.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 09:06:45 -0700 (PDT)
Message-ID: <88cd1831e021c2384219da4223981fa004551498.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 05/22] gstreamer1.0-plugins-good: upgrade to version 1.18.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 29 Oct 2020 16:06:44 +0000
In-Reply-To: <20201029142806.1830504-6-quaresma.jose@gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
	 <20201029142806.1830504-6-quaresma.jose@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-29 at 14:27 +0000, Jose Quaresma wrote:
>     * 0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patch
>       Removed since these are included in 1.18.0
> 
> License-Update: remove file://common/coverage/coverage-report.pl
> Upstream dont have it any more.
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  ...defines-GLsync-to-fix-compile-on-som.patch | 70 ---------------
> ----
>  ...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch |  8 +--
>  ...bb => gstreamer1.0-plugins-good_1.18.0.bb} | 14 ++--
>  3 files changed, 10 insertions(+), 82 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-good/0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-
> som.patch
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-
> good_1.16.2.bb => gstreamer1.0-plugins-good_1.18.0.bb} (84%)

Thanks for the updated series, I put it in for testing and this time
we're seeing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/1305

nasm seems to be needed by plugins-good but is missing?

Cheers,

Richard

