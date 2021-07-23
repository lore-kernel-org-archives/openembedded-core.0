Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web08.1972.1626998436579128482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 17:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TPvPur5F;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id h10so580915qth.5
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 17:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e1ZITzb2oajUl5h21sfB1hfo/oZ0Mqvsa3ZZIC5RvMw=;
        b=TPvPur5FDIyiohRMWlLJ5ZWNxuhCmDWTbinXPp3i59l8vovf/FYFH/mCA3qSYwVvrh
         qYHy+Go7ICxVs80Mkcqe1Oe6jomAEQ3nNzX82y55MLYIqCBiy0G4srqdoc92LBZ6ZTRw
         erX9VVIrp2DV0G8fT5w8o0MkRuAh5sq1WmZRB+in7zvgeUmbnw3jEZ2fY7QJ4dIq43s7
         X2isWX7sLkdJSDWiTAyoQFVDOsFvVyvA7ZCnFiUArlrVdXZY7qsJlUQ/tVHxQvrVF34x
         Yh+MiYz7nHmFJoM35qgRZoew76/seMQWDJ036KfDGpR4oppuC6d/s+hJ9kdOw2v/gAPI
         elMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e1ZITzb2oajUl5h21sfB1hfo/oZ0Mqvsa3ZZIC5RvMw=;
        b=a50VDRLHWBE6irh+3aPQLPiXOk+SJhGochsWiA81EFfBRRp9fLM1VhRoz/fIdOLT5m
         me8lqNvioO6qbMYdrAfWZpYkOk+LmFvQCZKl5tfrEv2YzsV13WBURVOiW7Y7ZZ7rc8ej
         QuNjXitH9l9SkiHxsf11PnhKEWzP3+7KU2KExIG9XWvLeftODSxe8jGwELAFPjtXcTjy
         VNDVh4tiVHNZ9wfbgwgeKG8TjoYKRSbDRoy4/TGV7hQwZgSpbIJYsFcfBQ5DQMijITIW
         RmBDD2Fy/gALNbwwWl6HlRJNLrv81CcWI7QD4mqf1eJKwy77mZuWnNqdCgV2TTMWHEoT
         8WSg==
X-Gm-Message-State: AOAM532aK7yf2djEGAtTA5lFplFwclNLGLqkXbbA7trkQTrO1Mr9Y/o4
	ixlxC5C0ANl8/Koq774on1HZ5eoPHixXx3Rb0PU=
X-Google-Smtp-Source: ABdhPJzps3ehzE4HDfpVmLzlab6ed2CmnD+BFbHmWCt1SxhSh39LcLCHCE6JlzBYtukmSnou+SOvx0khusALbcTpsB0=
X-Received: by 2002:a05:622a:10d:: with SMTP id u13mr1964988qtw.369.1626998435705;
 Thu, 22 Jul 2021 17:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210624165421.32088-1-raj.khem@gmail.com> <CAMKF1soqvCNDPaZtAStEyT6W1S_KdQyyfuu_L0inj3re9AQosQ@mail.gmail.com>
 <CAMKF1sqMvVhVK4j6k5Y7dUp7=jnh6xrwQNPtSDrf6L07FFpLWA@mail.gmail.com> <b5db19ce0db64893e7aa0e2d678584244347a4c9.camel@linuxfoundation.org>
In-Reply-To: <b5db19ce0db64893e7aa0e2d678584244347a4c9.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 22 Jul 2021 17:00:25 -0700
Message-ID: <CAMKF1sqEYW8vEOOCib6hOxbwZbcgo=+nQY_8qAHaMWfYRy7Cqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] esdk: locked sig mismatch warnings when build from esdk env
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cf775505c7bf1703"

--000000000000cf775505c7bf1703
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 22, 2021 at 1:12 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2021-07-22 at 12:36 -0700, Khem Raj wrote:
> > ping^2, this helps with installing ESDK which has components using
> > multiple git repos in SRC_URI
> > if there is any issue with this patch, please reply here.
>
> I think it may break when you add repos like meta-selftest which exist
> alongside meta in OE-Core. I haven't had time to prove/disprove that
> thought though...
>

Ok so how can we validate that I can help test that out

>
> Cheers,
>
> Richard
>
>

--000000000000cf775505c7bf1703
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jul 22, 2021 at 1:12 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, 2021-=
07-22 at 12:36 -0700, Khem Raj wrote:<br>
&gt; ping^2, this helps with installing ESDK which has components using<br>
&gt; multiple git repos in SRC_URI<br>
&gt; if there is any issue with this patch, please reply here.<br>
<br>
I think it may break when you add repos like meta-selftest which exist=C2=
=A0<br>
alongside meta in OE-Core. I haven&#39;t had time to prove/disprove that<br=
>
thought though...<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ok so how can we=
 validate that I can help test that out=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000cf775505c7bf1703--
