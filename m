Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.868.1599318266844227383
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2020 08:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G8TtIl5S;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id o21so9386153wmc.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2020 08:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=962FGi6fU5yJg9n1+3vB6KxzUETrOUqfcld57Bw2KWg=;
        b=G8TtIl5Sfch1EA1kJ9ISRbZeh5xzyamEc3vxm3jxOETLnXOFxZI2vw3lJy8a2+F0WX
         LcM/0J1Yax4EWyP4/8fTirWWU5jjiGMEhOlMTDVghW5Nw99szxxH+LIdLsW68z3ti4ID
         jNwh5ldmskAJ05A5abtikGoC5xES4NIW0LCoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=962FGi6fU5yJg9n1+3vB6KxzUETrOUqfcld57Bw2KWg=;
        b=ujcHLTwUyUUV+bzSgLPS6oo/WRzwRyW2KLzd9IWjF4qBNObH32zFCwQN3XFNh1p+gs
         j6ZdXb3CH6n+fE+ZuF4Fa3++KiixsRigX8ZfJkPETNYoGsLfKxslr708XT8A0ixkyuT2
         sNNNf/bAkiTx2zY499cuDZHcwpx8NWhtp6uI1W5CYfGcaYN6uo+hK7BxkyFUl7K/A2b1
         bPI/3kFnapL9owimDEPhV5rJQzuyPFr0jRqbmqb3SVzJ874W4CJ3HAeucUhiJ4elTy1M
         odAIXhKMLYRnmPYCrCHekXeoB1N0HY51b0QNGwGI1xAukec9sfEfwZQvDeNan/SMgtNT
         hfRw==
X-Gm-Message-State: AOAM531J2l3SdM/Leys+EWOPSoH3jY8pzaCvCq+wcTNegqlG4b/H5frg
	+bB6ZTXUIHjYluP5PPyFnG8lMQ==
X-Google-Smtp-Source: ABdhPJw+Yca3G+k+RgwOsYcBc61ScRJvJSuTV0SrGgBxIrDA0BQmT+xzBt3nccEREs/y0Q8t5lsnoA==
X-Received: by 2002:a1c:80d7:: with SMTP id b206mr12506875wmd.161.1599318265083;
        Sat, 05 Sep 2020 08:04:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.f.d.f.5.0.6.0.0.2.6.1.6.b.c.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.f.d.f.5.0.6.0.0.2.6.1.6.b.c.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7cb6:1620:605:fdfd])
        by smtp.gmail.com with ESMTPSA id f3sm17942345wmb.35.2020.09.05.08.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 08:04:24 -0700 (PDT)
Message-ID: <234ef013cc44a254c590e867df3e1317beb4d1b4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] weston: upgrade 8.0.0 -> 9.0.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, 
	openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@ti.com>
Date: Sat, 05 Sep 2020 16:04:23 +0100
In-Reply-To: <1599291707-36225-1-git-send-email-denis@denix.org>
References: <1599291707-36225-1-git-send-email-denis@denix.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-09-05 at 03:41 -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Weston 9.0.0 is released! This release cycle has been pretty quiet,
> with just a few new features:
> 
> - A new kiosk shell allows to display regular desktop apps in an
>   always-fullscreen mode
> - Improved testing infrastructure: the test harness has been
>   redesigned, DRM tests are now supported, DRM and OpenGL tests are
> now
>   enabled in our CI
> - DRM panel orientation property support
> 
> As always, a number of bug fixes are included as well.
> https://lists.freedesktop.org/archives/wayland-devel/2020-September/041595.html
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Looks like it fails on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/2414

Cheers,

Richard

