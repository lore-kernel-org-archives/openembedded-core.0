Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.5307.1608196683241938854
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 01:18:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=blzV5mva;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id n26so36798523eju.6
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 01:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=re0pc9V3NygtnHzrGMjqA98LyE/9Mbk5N2lnJztEkeg=;
        b=blzV5mvaXXK0q6J1E945/BoZJph254B3uyboNPDruPb/6XcOe66ugYOWre9wL8WxBS
         dp5myVBoACEbJHcjTK6Edf0KIVWntI/Z5hV/njWZ9NWRa82a0aybjsEGKloxNUfYkph2
         Q/110LaJTBLHdhDnEFoR88AcEKln7ADDnQkDQuV9SYUpJRXVe9NrtHuDupDwX58Jsp+4
         FmcmppUWiBULnsaz79OjXa8bQMkJcDIut3sn4Tt0SjFvMjNXIoUXl/efYJ200a+l2SM1
         TrXJBs7zZ80fFSsZyQBT2iUIEnTxUi8VsJZAJbAlvwL4c7A6Le9PS5GVE1/fApDlbrEj
         k6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=re0pc9V3NygtnHzrGMjqA98LyE/9Mbk5N2lnJztEkeg=;
        b=oBfrMvlbZhxD8Rwp3WAVTnVK3Ce+791b6R8IHGVlCAZ3vKMfAE6O84OE+phggIlVF/
         eSGIiJaZVP7SIYz9flQa+xM5/wo5xE93wsIWE+FPv3rDu6c1327iGxinord5XDjbFUSo
         +xCfziev6diE1Y1O5BNWd3iUIlKKvsr344+CDkBhyIJRNEgHj8nBAJKZe3DdHR2BF1Pe
         2HHZYKlFaf2+Zp42c1K/tBdifXp1p9vTxfw1M4mO/5Y5XSM5XakhGWMi+irM0TAAzgNO
         qT0+5wCEhPPwn5GIHK1A3bgx/h853YJJAi5/8wDdVHAYG7w7AnZA3FoeqFeHv18IzKcq
         AY4w==
X-Gm-Message-State: AOAM5304fnYqsX3a+GyOc2dRmeM9V2E2vmi5y/UfsdNtc/j2ANXfmJWS
	Ce54u3jDLmDH6oyhPn4+kQ4kjQFK5bFoKSU5XZs=
X-Google-Smtp-Source: ABdhPJyXHF/cYvVLLFhrKrQhBhhI/6PsQ9dlNBsieuxKv8DklNdNfgobT82kd8YaJh88oL7qE8Sz0ZwY2b6TYOMiIJY=
X-Received: by 2002:a17:906:76c9:: with SMTP id q9mr34965006ejn.484.1608196681613;
 Thu, 17 Dec 2020 01:18:01 -0800 (PST)
MIME-Version: 1.0
References: <20201208161257.949716-1-quaresma.jose@gmail.com>
 <164EC9D39D4D4B41.7121@lists.openembedded.org> <CANPvuRkBwC0SborxcEtzRmYOFVT8w1iiZw+S4RfM=U8LhAWZjw@mail.gmail.com>
 <4f88fbfa2d42b363ea92e7ce6b396f9075ea85f0.camel@linuxfoundation.org>
In-Reply-To: <4f88fbfa2d42b363ea92e7ce6b396f9075ea85f0.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 17 Dec 2020 09:17:54 +0000
Message-ID: <CANPvuRmytXzxt2cEq-SpYgVJK2uMHQaH=SQg0L6QS97qYZbZ9A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 8/8] gstreamer1.0-plugins-bad: remove meson option for plugins with dependencies always present
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000efc3bb05b6a577c1"

--000000000000efc3bb05b6a577c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Thanks for overview of the merge process.

Jose

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia ter=C3=
=A7a,
15/12/2020 =C3=A0(s) 23:02:

> Hi Jose,
>
> On Fri, 2020-12-11 at 21:13 +0000, Jose Quaresma wrote:
> > I have think about this patch and probably is better to drop it.
> > It is now on master-next
> >
> > Without this we have meson options for all the gstreamer plugins that
> > have external dependencies.
> >
> > Probably its better to have it explicity enabled than don't have this
> > options at all and falback to meson auto discovery dependencies.
>
> FWIW, I agree. I put things in master-next to run through the
> autobuilder in parallel with other review so just because something
> makes it there, it doesn't mean its definitely going to be merged. I've
> dropped this one, thanks for highlighting!
>
> Cheers,
>
> Richard
>
>

--=20
best regards,
Jos=C3=A9 Quaresma

--000000000000efc3bb05b6a577c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Rich=
ard,<div dir=3D"auto"><br style=3D"color:rgb(0,0,0)"></div><div>Thanks for =
overview of the merge process.<br></div></div><div dir=3D"ltr"><br></div>Jo=
se</div><div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linu=
xfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&g=
t; escreveu no dia ter=C3=A7a, 15/12/2020 =C3=A0(s) 23:02:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hi Jose,<br>
<br>
On Fri, 2020-12-11 at 21:13 +0000, Jose Quaresma wrote:<br>
&gt; I have think about this patch and probably is better to drop it.<br>
&gt; It is now on master-next<br>
&gt; <br>
&gt; Without this we have meson options for all the gstreamer plugins that<=
br>
&gt; have external dependencies.<br>
&gt; <br>
&gt; Probably its better to have it explicity enabled than don&#39;t have t=
his<br>
&gt; options at all and falback to meson auto discovery dependencies.<br>
<br>
FWIW, I agree. I put things in master-next to run through the<br>
autobuilder in parallel with other review so just because something<br>
makes it there, it doesn&#39;t mean its definitely going to be merged. I&#3=
9;ve<br>
dropped this one, thanks for highlighting!<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">best regards,<br>Jos=C3=A9 Quaresma</div></div></div></di=
v></div>

--000000000000efc3bb05b6a577c1--
