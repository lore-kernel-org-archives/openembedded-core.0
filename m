Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.469.1614639149959423448
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 14:52:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Glnk74pN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id o2so243080wme.5
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 14:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=AqxLQdRKPMrMnkCEusgYQnDjfTYADfpn1mXxJXJ2RCc=;
        b=Glnk74pNPi3sIM5OyNljPhUAUctqut6dPxk/TzZe9re9Cdbb6W0jkILLIx4JHXSWLa
         qAjycdTWtnyCjCK/rPDKibdYD70HDyc7OKoycl+czUJB6J/ULPwaRGhflPTG18X00Q7Q
         8i199ubhusXaQ9Kz+sw9yQCdwCjSR/kdMHY3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AqxLQdRKPMrMnkCEusgYQnDjfTYADfpn1mXxJXJ2RCc=;
        b=LM16aB5tzKapgRd+wJJQgndx4At/cA38Ck0KA7uE3xGzZKdG41Cz4qHswOQf9nu/ep
         VSAAzCU3BwfWlMZ/rpWRSAYdXUxdtdPwnIOSUI0k3OEPL20SYXfHlEjOfyMeDogqCY46
         oGmlG77tPbudIkKVlWLLgPLCxaf9Tjv98rtzKXupjPdD2WjDEOQzTNwPck31HvuAKLfK
         EwupOAawj+uAGYBIE83xaAs1CtaJa9ngL/mYjetH4fhOUxE8KV8c7ZmLEvHPcIzejYuv
         B0BswnzNc17YimzOojacbAtXrQi5qhMkF2exwGkE0bqYwHL4c2UI8tvn+xnTiue8pUU3
         3m6w==
X-Gm-Message-State: AOAM5305x6mcPj6Abp5+3igwr7ZjZa4wVBT8L3CQspGOB62/f1V6b5NM
	h1chdMWfqFBzVawXqeWD1+6nSg==
X-Google-Smtp-Source: ABdhPJyFa0ZXAMDycHhXhbKdXGYVdDBs2bEJAJU34gFVqVDK1qVwo88xHIka84NMnMw+ank9OFnbmw==
X-Received: by 2002:a7b:c3cd:: with SMTP id t13mr922502wmj.109.1614639148332;
        Mon, 01 Mar 2021 14:52:28 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d6b6:68f5:94dd:1b3a? ([2001:8b0:aba:5f3c:d6b6:68f5:94dd:1b3a])
        by smtp.gmail.com with ESMTPSA id u4sm19014186wrm.24.2021.03.01.14.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 14:52:28 -0800 (PST)
Message-ID: <2ffe759924616581107cf3681b0e713edb65c9b7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/6] recipes-multimedia: Add missing HOMEPAGE and DESCRIPTION for recipes.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Meh Mbeh Ida Delphine <idadelm@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 01 Mar 2021 22:52:27 +0000
In-Reply-To: <20210301135738.12541-4-idadelm@gmail.com>
References: <20210301135738.12541-1-idadelm@gmail.com>
	 <20210301135738.12541-4-idadelm@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-03-01 at 14:57 +0100, Meh Mbeh Ida Delphine wrote:
> Fixes: [YOCTO #13471]
> 
> Signed-off-by: Ida Delphine <idadelm@gmail.com>
> ---
>  meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb              | 2 ++
>  meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb          | 3 +++
>  meta/recipes-multimedia/alsa/alsa-tools_1.2.2.bb            | 3 +++
>  meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb    | 3 +++
>  meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb         | 3 +++
>  meta/recipes-multimedia/alsa/alsa-utils.inc                 | 2 ++
>  meta/recipes-multimedia/gstreamer/gst-examples_1.18.1.bb    | 3 +++
>  .../gstreamer/gstreamer1.0-libav_1.18.1.bb                  | 2 ++
>  .../recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.1.bb | 2 ++
>  .../gstreamer/gstreamer1.0-plugins-bad_1.18.1.bb            | 4 ++++
>  .../gstreamer/gstreamer1.0-plugins-base_1.18.1.bb           | 3 +++
>  .../gstreamer/gstreamer1.0-plugins-good_1.18.1.bb           | 4 ++++
>  .../gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb           | 4 ++++
>  .../gstreamer/gstreamer1.0-python_1.18.1.bb                 | 2 ++
>  meta/recipes-multimedia/lame/lame_3.100.bb                  | 3 ++-
>  meta/recipes-multimedia/liba52/liba52_0.7.4.bb              | 3 +++
>  meta/recipes-multimedia/libpng/libpng_1.6.37.bb             | 3 +++
>  .../libsamplerate/libsamplerate0_0.1.9.bb                   | 1 +
>  meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb    | 3 +++
>  meta/recipes-multimedia/libtiff/tiff_4.1.0.bb               | 4 ++++
>  meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb          | 6 +++++-
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc           | 2 ++
>  22 files changed, 63 insertions(+), 2 deletions(-)

This series has some really good changes and I want to change them. 
Unfortunately it is based on an old revision of poky and the changes 
no longer apply. I did manage to get patches 1-3 to apply with some 
work in updating the versions and other changes. When I tried to
build it, there were parsing errors from clutter-gst and libhandy
where there are bad line wrapping issues but they're embedded in
valid diffs, its not an email issue.

I've fixed those and have patches 1-3 queued in master-next but there
are a load more errors for patches 4-6. Could you rebase those last 
three against master or master-next and resend please. Please do 
test patches before sending too!

Thanks,

Richard

