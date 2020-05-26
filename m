Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.48607.1590491250375150221
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 04:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NYzQRxpw;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: rama.kesi@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id f3so21484110ioj.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 04:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MSG0s2xe+C4ixwV3CfvKrsK4M/wnpGQuNOhbcctOLnY=;
        b=NYzQRxpwFRBhb3yweOTh8v1OfEVDGumrH/6qFfbwTRCX5GhFuItKNmJ33MckDU675H
         EdjO3SPvwKsu0C7VLBRwDFptt7P/3f29Isgn1v/7SWLJ5NZNXbWNw6DG1WfQ3xpo8SN3
         r5HYClt+J1QEYJwhCi79M6D9VJ/j2m267oJmXTly2XxWDT3ok7XifGaU7y453IjdtmV6
         liRniBCgw5yRWUA5aNz5XbGn8/xK/p5Tt+sFXqmpuBwE18w/3zii0pIjHZK9eD+bxDIF
         vb2S2nvYlCAAYapRBwxRey4FuKnpS/0oUUzjsLjW1V9bEMaLlxU6tAIcfHxSM0pf3mAt
         AW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MSG0s2xe+C4ixwV3CfvKrsK4M/wnpGQuNOhbcctOLnY=;
        b=bZQ9rproQxvIVv4ScpElmV8NUv5JrazODzq6lhHCtyofu5x9i1Xjm7dU6cFmejME2T
         vVgdEBMVxC9SPe2eDsxZX2kq/CPospSKe332b7Z+kRa55pw1qWBcPn13lQbmax+VBpHs
         F1cvoSI9fUyCVgTkCVZgokqwmfS8sqmfdpMlbn4xBbaJXuti6XP5m3WyevDNZsuECWAy
         Xk7z5xglpj2QCEFvoyCQdbz2kfCvhRhqKCVhIztpQv41ycV7mf5OESIjrpFRMMiBajq0
         T05Eh6SmR2Y6u3hOZpg+w6kXH1vdUN3KAtDiXylgHvj+GV1ttfdnSGlTHxDS3S5kbClN
         iFrA==
X-Gm-Message-State: AOAM5336MLURSrvOnTW0YRh3+KBet3n6WfTMEqrkvb8Ht8QxWEJ6TQtN
	L6YI1WdF/5hQd0w1p9y8yIB7X2L4xy6tjOcoPXCg4SEP
X-Google-Smtp-Source: ABdhPJxG1m7JF4SAJDktuH0QXnZziBB9/65f8FVOA6sA3AfkzjC/z7NG58e8/wJC1g0Es3IfvGKQaYDvEw+RCFKsRXw=
X-Received: by 2002:a05:6638:b:: with SMTP id z11mr405662jao.114.1590491249535;
 Tue, 26 May 2020 04:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAFi1RNj7=wqUK1ebdfKSpUs8uQkXe_=wDvPJDqPHOHBn7xr5mQ@mail.gmail.com>
 <20200525124703.qrdrgubsxpur2zvh@qschulz>
In-Reply-To: <20200525124703.qrdrgubsxpur2zvh@qschulz>
From: "Ramakanth Kesireddy" <rama.kesi@gmail.com>
Date: Tue, 26 May 2020 16:39:26 +0530
Message-ID: <CAFi1RNixUb9p+Lfp+XfDMdLw21gEv95J9xGg+=ByYcahFPBTTg@mail.gmail.com>
Subject: Re: [OE-core] Meta Qt5 Qt 5.6.3 compatibility with Yocto 2.4(poky)
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f26d6a05a68b195a"

--000000000000f26d6a05a68b195a
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for your mail.
Do we have
 Meta Qt5.6.3 recipes for Yocto 2.4 Rocko branch?

Best Regards,
Ramakanth

On Mon, 25 May, 2020, 18:17 Quentin Schulz, <
quentin.schulz@streamunlimited.com> wrote:

> Hi Ramakanth,
>
> On Mon, May 25, 2020 at 06:06:34PM +0530, Ramakanth Kesireddy wrote:
> > Hi All,
> >
> > Can anyone please  let me know if Qt 5.6.3 LTS is compatible with Yocto
> > project version 2.4 ( poky ) or not to build meta-qt5 recipes of Qt
> 5.6.3 no
> > LTS?
> >
> > If so, where to pick up the meta-15 recipes for Qt 5.6.3 LTS open source?
> >
>
> We're building meta-qt5 from krogoth branch on thud currently. This
> branch has the latest version for qtbase (5.6.3 release).
> We've a few bbappends but they do not seem to exist for fixing build
> issues :)
>
> So, try and check for yourself :)
>
> BR,
> Quentin
>

--000000000000f26d6a05a68b195a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Thanks=C2=A0for your mail.</div><div dir=3D"auto">Do we have</div><div d=
ir=3D"auto">=C2=A0Meta Qt5.6.3 recipes for Yocto 2.4 Rocko branch?</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Best Regards,</div><div dir=3D"a=
uto">Ramakanth<br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, 25 May, 2020, 18:17 Quentin Schulz, &lt;<a=
 href=3D"mailto:quentin.schulz@streamunlimited.com" rel=3D"noreferrer noref=
errer" target=3D"_blank">quentin.schulz@streamunlimited.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Hi Ramakanth,<br>
<br>
On Mon, May 25, 2020 at 06:06:34PM +0530, Ramakanth Kesireddy wrote:<br>
&gt; Hi All,<br>
&gt; <br>
&gt; Can anyone please=C2=A0 let me know if Qt 5.6.3 LTS is compatible with=
 Yocto<br>
&gt; project version 2.4 ( poky ) or not to build meta-qt5 recipes of Qt 5.=
6.3 no<br>
&gt; LTS?=C2=A0<br>
&gt; <br>
&gt; If so, where to pick up the meta-15 recipes for Qt 5.6.3 LTS open sour=
ce?<br>
&gt; <br>
<br>
We&#39;re building meta-qt5 from krogoth branch on thud currently. This<br>
branch has the latest version for qtbase (5.6.3 release).<br>
We&#39;ve a few bbappends but they do not seem to exist for fixing build<br=
>
issues :)<br>
<br>
So, try and check for yourself :)<br>
<br>
BR,<br>
Quentin<br>
</blockquote></div></div></div>

--000000000000f26d6a05a68b195a--
