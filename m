Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.10013.1621608257799792882
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 May 2021 07:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y0nav7Fj;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id gb17so12821662ejc.8
        for <openembedded-core@lists.openembedded.org>; Fri, 21 May 2021 07:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r/2BAzrXMT0knnJ/j2KrRd/dYYhpScnV0MYjEk2uQFg=;
        b=Y0nav7FjEWmjA2Xv/I2wpzeTn6muGv37IJXBbF/rwRV/wte789Tyzbqlh3H1YhC4CF
         pmN9BcT4lfIfWtpVQJ+hLAITQBrm2Ibn2U+nbefBXOVZyPdxZoxLXMnO5MpuG6Z2u+0D
         vr94Jj5KZDKS/Ixer4M619ecI3zBSAGWZd4WxeBVw9AswIATHtEGcN67dRhr7tztY+ze
         EPpx7pExMRtZrjEV1T0E0GsYaiKUGHU0qcIPnOoMhWYtUlUWM9MVffFif3/DoVRMf1kN
         /8g58CghjDsBHRsVIQDh8GCiQqS0hpmdk1DEsnksA3CTv+2+m8rT+yt3BhxDJ21IO8wq
         2NXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r/2BAzrXMT0knnJ/j2KrRd/dYYhpScnV0MYjEk2uQFg=;
        b=Hidn+8qkyO+SsXXRJjRTz84WciUWRuxvSJmLfOvsmAobMGzUpPy/tn0DX2b1F16Llf
         7qBaucT4bQxhF6sOuJclhbtTdwwnQIZmeBFyjaRd3FAmiKr83j4whZEbWbBPQWz30Ymu
         yWETI+/3JTR/zh7qrmEysAzf2Mw+fBbdqKp4qVYELOYtrrStE/sb2UmsBvXw0iABICHo
         Z9SQwZepNjBf5TsgB2cn8rPeu2HQ2fMwV1PDZw5fEDYAT7N+/NFjuvc0PRu8BI5pZhip
         9Zq0hPTuyLFaxitKj8ZEKz/vnsee0WyC0fiLwsdMRMVW8xvzV3G1pSiSZJ+xQQGSz+JI
         gLZQ==
X-Gm-Message-State: AOAM532jtRHEh+pK2PrSEoOYhpVQhrXWJwu+cJBcFHUDTZqw7UJPA7HL
	S8B1L55V9Qr8lIK+O2ZXzrSQmZSX/tur/dhNEXo=
X-Google-Smtp-Source: ABdhPJzMIdn5vBDGo6UK0lfzXRkKi151CNsGbKFsV4mFq1O1BaX/YU4j5iI4C9CFntDF5d1sz/QV8AQUC1LPEiU7vW0=
X-Received: by 2002:a17:906:5617:: with SMTP id f23mr10257964ejq.298.1621608256264;
 Fri, 21 May 2021 07:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210521122032.196712-1-liu.ming50@gmail.com> <74350fb1207d2596a5fe555461392408147f78ae.camel@linuxfoundation.org>
In-Reply-To: <74350fb1207d2596a5fe555461392408147f78ae.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 21 May 2021 10:44:05 -0400
Message-ID: <CADkTA4PmzCobkfMARy-xMerRdNH-ZiR_g0VFjw_bjsAqUOHvLg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-fitimage.bbclass: fix wrong separators
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ming Liu <liu.ming50@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 21, 2021 at 10:28 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2021-05-21 at 14:20 +0200, Ming Liu wrote:
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > Change to use '-' rather than '@' as separators.
>
> Why? The commit message needs more information.
>

I had exactly the same question/comment!

Bruce

> Cheers,
>
> Richard
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
