Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web12.23655.1605870645840746249
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 03:10:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=FZi3lDYs;
 spf=pass (domain: burtonini.com, ip: 209.85.167.54, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f54.google.com with SMTP id w142so12882698lff.8
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 03:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FuYI3fsjCaJGcISaNewkahmHiA60RcQynA7VPrg6AGA=;
        b=FZi3lDYsNTRz+Xo3cOs6bwAqdC1k3sXkk2KvNKMuohFOeyWXHBff6R8t+mrpxKnNiJ
         uyXRHCySYPxCnmWEJoutHyclh4Hp9ieQFavLFgiJrHvZKSeTON3uL7V9PodjukrG5LAL
         klMbRYCDfYM988Jp9hTJlaSWtY0NiFIiBMEOaXWYA8Dq5rw7Do96tXFBXaP3JnhAkz9b
         dGtT5o0Y2khwbp0IcKegyGEgBsxu9U2RXrQqzTSVek4WJ81hr4gER+eTQTNcFX7zmCjt
         ksv/LvGbrAv8FYSid/dN5ut9SapVKltlwuQ98uXzuXZ065TkKOJ60dfOBoggiywbnL2D
         N+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FuYI3fsjCaJGcISaNewkahmHiA60RcQynA7VPrg6AGA=;
        b=h0kfN8AJaHUvj3w6BU6gc/wsPPFI8VqYLiSrOPJT7AyGLvFcJHgvliqG5nupd8mCGu
         qY5MIewz4O7JcFfcHOqnMqtfN7TuaBZRfZjjQMJAZm+psieJljdh9dLijQ60di6KRysu
         vAx5KDocj5D1dwinGI7xD92jjS5RnkvMUUc76EWQWSmwVvU5OHT9KKvYFTOLxK0tLVjO
         NMhMteviXmtwPywW1A3lieCLxD5iC4YSsEux5b0iXY/PzWiq1E40cvzLs3FNj2+GNVFC
         EZmp8vP8RheVBLF5m95CBut2lwvoURPnBg4aSwntrwT3Fks8XCoKSbWs0KcAUDsAlNsK
         tFww==
X-Gm-Message-State: AOAM533loBTdmxu+3+GklL6HRVGbQvNLNDZopM+wWLPuawzTsfj5F5RF
	Y44dsFuFgEVaDP6FBYjKT1kNVAroSlr5pGMZa8iFBA==
X-Google-Smtp-Source: ABdhPJzNXp81ODvSjomAVP0y7L71El+7dQUB3e1PMcXf9I8uKF5nTh/U6a2i7pWkxAf6dZJOfGJxoylJTEowMxHAZJA=
X-Received: by 2002:a19:6a07:: with SMTP id u7mr8381726lfu.252.1605870643894;
 Fri, 20 Nov 2020 03:10:43 -0800 (PST)
MIME-Version: 1.0
References: <20201119103813.2726273-1-ross.burton@arm.com> <20201119103813.2726273-2-ross.burton@arm.com>
 <CAOSpxdabzQb6ivRAjTSrePVUJUm35VvhSKWqwJjKyPVez7hPmg@mail.gmail.com>
In-Reply-To: <CAOSpxdabzQb6ivRAjTSrePVUJUm35VvhSKWqwJjKyPVez7hPmg@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 20 Nov 2020 11:10:32 +0000
Message-ID: <CAAnfSTuMDRLKxR-e-A+wnoLCeQdeGUAr+MVuStOHGrohOOs42g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/5] python3: add CVE-2007-4559 to whitelist
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Yes.

Ross

On Thu, 19 Nov 2020 at 15:03, Steve Sakoman <steve@sakoman.com> wrote:
>
> Is this also suitable for dunfell?
>
> Steve
>
> On Thu, Nov 19, 2020 at 12:38 AM Ross Burton <ross@burtonini.com> wrote:
> >
> > This issue describes expected behaviour, do not use tarfile with
> > untrusted data.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/recipes-devtools/python/python3_3.9.0.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/python/python3_3.9.0.bb b/meta/recipes-devtools/python/python3_3.9.0.bb
> > index 8fe60ea0160..86077bb1ca8 100644
> > --- a/meta/recipes-devtools/python/python3_3.9.0.bb
> > +++ b/meta/recipes-devtools/python/python3_3.9.0.bb
> > @@ -45,6 +45,8 @@ UPSTREAM_CHECK_URI = "https://www.python.org/downloads/source/"
> >
> >  CVE_PRODUCT = "python"
> >
> > +# Upstream consider this expected behaviour
> > +CVE_CHECK_WHITELIST += "CVE-2007-4559"
> >  # This is not exploitable when glibc has CVE-2016-10739 fixed.
> >  CVE_CHECK_WHITELIST += "CVE-2019-18348"
> >
> > --
> > 2.25.1
> >
> >
> > 
> >
