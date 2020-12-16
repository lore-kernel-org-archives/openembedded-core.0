Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.6326.1608120717821208246
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 04:11:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=iHmRAsLw;
 spf=pass (domain: burtonini.com, ip: 209.85.167.52, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f52.google.com with SMTP id x20so28210327lfe.12
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Dec 2020 04:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2Ry2sqzQ9kadF4evoWM0rFMhc9jvgbRZn9TpM3FcV6I=;
        b=iHmRAsLw+8aJzc7d6cOTfD2/J9Q8kyjJGuHJGvL5BScNa9RZOUpLDeXZWvGXgP8NHd
         JWBT7J8DdJttdgmN8v+7aNtJOGTNxM4Z4SKfhi2IrJCf/mo5+1sIexPqQgW7FoevxdDw
         F77RSB0hurXtleda0FhB6izX+NXHd4bClcl+HB3IllIip9obZ39K/liyaTzjRq7YqEAq
         NVPo9SdMyyGdMx/AqxjQ4hKRIbnpIBG7WWNJ1l+fJ3dV+IX4+hycgsoLG4oQJ6cWwTeS
         SojnIhy6zRyT2S2RqSbfT1SVxczpJwa6aOYp2rMZTXKFghMGIs7DS0z77RSJpDnveKq2
         TzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Ry2sqzQ9kadF4evoWM0rFMhc9jvgbRZn9TpM3FcV6I=;
        b=Ypf3Mil1nqEmQ6AkQbl0RcRr8kUE1tkmgqe7aKCYGxqrEVQzUuMfzAyar63pDeMIt5
         SsHhlOzF58RAvLzXmhwfMVmoPTa30krmeHx18h9eX/uBng9CxpRNO8Gs4MVurxlDGFvt
         QU3ZtiQ0ORUtvRr+o+1npMAl2YfIUd5fmeLQgzOl6yA77vxCgL0sQU77MVV3JNmEsaqn
         EFQnt37QjiXsKVfdffkKFM6JpnCyt4sr5pvfxOAWpQDT5fp1gx479FbJMeS6CEtOnG6j
         9FVGThLXeUJktYdzLvqhvrDgRe3ncyDgVwwuTHTu39hEFHnqwvMycA7w8LTArOYQhrlv
         MXNA==
X-Gm-Message-State: AOAM533uYrQfl7aORjiNEKAIspVo8lr2qxWT5Jyk3muCFuSIzo8nxwmJ
	bYt4dmVF1fMZVO2SObF97qsz5nE/DZhR+RzWvZuBNQ==
X-Google-Smtp-Source: ABdhPJzsze6ayo/6G+v8O6VYkehYuiaSHhdYyGwfmu40IImmRMSxy16Ri4Grw1oMPfnw85KV/lLuqNfDxvxuECh297k=
X-Received: by 2002:a2e:6a14:: with SMTP id f20mr1186583ljc.6.1608120715653;
 Wed, 16 Dec 2020 04:11:55 -0800 (PST)
MIME-Version: 1.0
References: <e4085caa6fe95c5d09a23a850fe8748c93323af4.camel@iki.fi>
In-Reply-To: <e4085caa6fe95c5d09a23a850fe8748c93323af4.camel@iki.fi>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 16 Dec 2020 12:11:44 +0000
Message-ID: <CAAnfSTu0t+OOFy6gakZ6UiKUhxf862W5t89B_tHd=Byko=4efQ@mail.gmail.com>
Subject: Re: [OE-core] I wish to drop my recipe maintainer duties
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Thanks for all the work over the years, it's been much appreciated!

Cheers,
Ross

On Mon, 14 Dec 2020 at 19:07, Tanu Kaskinen <tanuk@iki.fi> wrote:
>
> Hello,
>
> I haven't lately had time to do OE work, or maybe the lack of time is
> more rooted in lack of motivation since I don't objectively have a very
> busy life, but in any case, I think it's time for me to step down as a
> recipe maintainer. When in 2015 I transitioned from being paid for the
> work to a volunteer, I had plans to use OE in hobby projects, but those
> projects haven't materialized, so I don't really have any connection to
> OE other than being a recipe maintainer. My experience of the community
> has been very positive, it has always been nice to work with you, thank
> you for that!
>
> Should I post a maintainers.inc patch that changes all my recipes to to
> unassigned, or should they or some of them be directly transferred to
> someone else?
>
> I will still post some patches for pulseaudio that convert the recipe
> from autotools to meson. I've had them ready since the last feature
> freeze, and I intended to submit them today, but I found out (as I read
> the mailing list for the first time in three months) that the recipe
> has had a major version update, so I'll have to redo some tests first.
>
> --
> Tanu
>
>
> 
>
