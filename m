Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.36760.1599998328373799800
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 04:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MWUQysRX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id x14so15673200wrl.12
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2020 04:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=eC3d6abHcZfOhX/p2+TFTInQIJLz6/6FkZ8JNYi7/AQ=;
        b=MWUQysRXeOkZiAqhG7AoCaTcVWNtG4o1ATjwVCsfo123XRAE+C5cpWnlVweXjHZ7xv
         75+PdHqnzwtU9A0Hl4P41+YuZZPpB6ndhjWR4Bh90gkAbqSLpfuNmZwIdau/50u3G18p
         YargRXuRNYD90BeaPXbyUQLnONSAewK0BJ3Z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eC3d6abHcZfOhX/p2+TFTInQIJLz6/6FkZ8JNYi7/AQ=;
        b=pxPdleRvK0pb2ZGFN8GryWZoQkaER8qMEOEpyYDBR8axVn+PGsVypkSKI7lhKolK+S
         PEpcFkGyobzXkLIdndD71u2U+yowwbsjvIUwGYPgyJa2ddO7/nlnuEEKz+QAry9bjbki
         Ix6rJSq664WsJCcYXELkA4FTMw39B8H7BIpLag2dJ7bILjxZ6RJvEUaCb4KTDhmlj3js
         yHj+jLeHAxzseP08CroFeYQj6VIRe1jKv2161Qy05ud/qlE+s4/INZ/4vEmKiSm67/8Z
         vqnFzxnF9WyhEu1ShzI9x5sDVs4QZ3hg12/cjBAXKwye5dYDIuj05Htn7cEiT7dyDQdW
         4V3w==
X-Gm-Message-State: AOAM533+kBM9tpa1CpdasK8vk8aoo9L7GTXIdgcvsiGQtySvdGfrqlot
	RWfeqSGt0w3fCaJXgmwhx6OMEA==
X-Google-Smtp-Source: ABdhPJx5dQDyzZhoAM7HWN16hlAFz+nydsjDguQavE8E/ljaxepQlZWVtbyZgWbxlJsbL62vexHFJg==
X-Received: by 2002:adf:e601:: with SMTP id p1mr11785487wrm.172.1599998326577;
        Sun, 13 Sep 2020 04:58:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6142:eacd:f73a:2991])
        by smtp.gmail.com with ESMTPSA id p3sm13559570wmm.40.2020.09.13.04.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 04:58:46 -0700 (PDT)
Message-ID: <75ceaf59e29205d3c9f5fdd2eab767f2aadb5278.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] core-image-weston: Bump qemu memory to 512M
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sun, 13 Sep 2020 12:58:43 +0100
In-Reply-To: <20200913044921.3457893-2-raj.khem@gmail.com>
References: <20200913044921.3457893-1-raj.khem@gmail.com>
	 <20200913044921.3457893-2-raj.khem@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Khem,


On Sat, 2020-09-12 at 21:49 -0700, Khem Raj wrote:
> It needs openGL and launching two weston instances during weston
> ptest
> needs > 256M ram to work
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/images/core-image-weston.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-graphics/images/core-image-weston.bb
> b/meta/recipes-graphics/images/core-image-weston.bb
> index f5102e1989..fa7e9ef421 100644
> --- a/meta/recipes-graphics/images/core-image-weston.bb
> +++ b/meta/recipes-graphics/images/core-image-weston.bb
> @@ -10,3 +10,5 @@ REQUIRED_DISTRO_FEATURES = "wayland"
>  
>  CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples
> gtk+3-demo clutter-1.0-examples"
>  CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', 'weston-xwayland matchbox-terminal', '', d)}"
> +
> +QB_MEM = "-m 512"

One of the weston patches seems to be causing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2458

(no-x11 build)

Cheers,

Richard

