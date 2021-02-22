Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web11.2326.1614024032333315953
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 12:00:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H0ygDoap;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id n8so3052381vso.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 12:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I+CNH1k/bF0l2fkc5/iSnaiyiUGtM7fOrQQLeohpZtw=;
        b=H0ygDoap8hpnNK8sD2d0Gi8yCgj+kCx2tJmjZaw8FSE6lX0yn2Vm+n4g39z6Fl9mGH
         MylEOgmVB9YcXK1IjgtvkUlXF/3uOxTvUgxmBs616Dyej5CpdVXTDYdPvasgU3a+l/Xi
         9KrH1m2gu8MnW7y0ZB5PXW+oab/fD/Eafegq+UDHALmh5D+cHn4kuYVDngmj+XPcRcE8
         KlvkZ9OYsf8NZQhnRxSOrXff+XCRhDABobWGKNKd20aFO2is7/tVB411WVYUs96JpJI9
         7oKQEiqu/Zh29vf2daTj997647GeHxRmRFNh4r65/emGphzTTIGmgjrmBh6WzO/5iTrT
         zGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I+CNH1k/bF0l2fkc5/iSnaiyiUGtM7fOrQQLeohpZtw=;
        b=DUWyKv90HXphq+vxgomF+FqSqGu06l0bRUqM4iuApO/Q0cR0OLBpoRkaS8dvHubE9A
         bvZ9JzUtiLi5rE6cdm1ukrS4Iyr/DpHpcfL69g6iFf20wweS9IhB3q2xyu4QXYl8sqpT
         CJDtmQKaBPDvQCHcAseZkeXhPZ9433HyZuDyndSG6RCBLNkPH//VVGICFr0n2auvlFRr
         tvjfPbuUK4h75qaFiuAxtFGNnaLlnVrgqHIIcocbOMr3pgJpBQrnDzC3wCfmobPlSUEL
         Bfq9tiP0LBII7MDvrIz9C9bIo+vGXFW3iNTubVDG2zadAAButKoJemXQYAgHJwgHmgWe
         VxKQ==
X-Gm-Message-State: AOAM531SuAYmpoF4JuRaO6b8sow15MBZSWRzn0wPkoC0feWp8rEunF18
	z/djN8KB4lvi5mKdLOJbRCnh0O439siHzkZS0eU=
X-Google-Smtp-Source: ABdhPJzdDw7USTG3d251Hy2je0d81B0ix3cjNeKCCiA55WKNlu+kafvPxxaqmhve01Bmx25kHcz5JS0DCKUo/NuK8AI=
X-Received: by 2002:a67:f318:: with SMTP id p24mr13604871vsf.54.1614024031532;
 Mon, 22 Feb 2021 12:00:31 -0800 (PST)
MIME-Version: 1.0
References: <20210222154956.27267-1-andrej.valek@siemens.com>
 <4462ffe940c0fa879486300e5d7d358045604133.camel@linuxfoundation.org>
 <CANNYZj_1RL9rSJxaaRTQf__mnzEr49Eze5gW44TBtJn7FEhN0Q@mail.gmail.com>
 <9ea4df35-c70e-e03e-7fea-e56960ef17c6@gmail.com> <CANNYZj9xb3q+b4Mqng_RQoR+NvstzwOXeHRfCMrKuyCyxzyNEQ@mail.gmail.com>
 <CAMKF1sr0cHysY1wjfmXTsKVQ-1nhzx3=avprqfMC+AVU1QWzYA@mail.gmail.com>
In-Reply-To: <CAMKF1sr0cHysY1wjfmXTsKVQ-1nhzx3=avprqfMC+AVU1QWzYA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 22 Feb 2021 21:00:20 +0100
Message-ID: <CANNYZj_JMoBs4KzZtRToeUuJEUorVe4fw9_j-txZah6+XAMBkA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] busybox: search stable versions for AUH
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Andrej Valek <andrej.valek@siemens.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Content-Type: multipart/alternative; boundary="0000000000000ef78205bbf24151"

--0000000000000ef78205bbf24151
Content-Type: text/plain; charset="UTF-8"

I am also not sure if there's actual meaning behind this unstable marker.
It's not explained anywhere, there are no release announcements where it's
explicitly mentioned, and the branch in git has no commits since 1.33.0
https://git.busybox.net/busybox/log/?h=1_33_stable

I am leaning towards just taking the .0 versions.

Alex

On Mon, 22 Feb 2021 at 20:14, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Feb 22, 2021 at 10:44 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Right here: https://busybox.net/
> >
> I see.
> Gap between 1.32.0 and 1.32.1 release was about 6 months, I am not
> sure if all distros are waiting for dot releases or not. I see that
> upcoming fedora 34 ( due in April )
> is already packaging busybox 1.33.0
>
> > Alex
> >
> >
> > On Mon, 22 Feb 2021 at 18:37, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>
> >>
> >> On 2/22/21 8:39 AM, Alexander Kanavin wrote:
> >> > On Mon, 22 Feb 2021 at 17:02, Richard Purdie
> >> > <richard.purdie@linuxfoundation.org
> >> > <mailto:richard.purdie@linuxfoundation.org>> wrote:
> >> >
> >> >      > +UPSTREAM_CHECK_URI = "https://busybox.net/ <
> https://busybox.net/>"
> >> >      > +UPSTREAM_CHECK_REGEX = "BusyBox\ (?P<pver>\d+\.\d+\.\d+)\
> >> >     \(stable\)"
> >> >     I just realised/wondered whether:
> >> >
> >> >     inherit upstream-version-is-even
> >> >
> >> >     would work here?
> >> >
> >> >
> >> > I don't think so - busybox seems to declare x.y.0 as unstable, and
> >> > everything else as stable.
> >> >
> >>
> >> is it documented somewhere that x.y.0 is unstable ?
> >>
> https://git.busybox.net/busybox/commit/?id=a4c3a341394a1fb25be8c15d2ddfe3ec77cbb83c
> >>
> >> seems to indicate its a normal release.
> >>
> >> > Alex
> >> >
> >> >
> >> > 
> >> >
>

--0000000000000ef78205bbf24151
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am also not sure if there&#39;s actual meaning behi=
nd this unstable marker. It&#39;s not explained anywhere, there are no rele=
ase announcements where it&#39;s explicitly mentioned, and the branch in gi=
t has no commits since 1.33.0</div><div><a href=3D"https://git.busybox.net/=
busybox/log/?h=3D1_33_stable">https://git.busybox.net/busybox/log/?h=3D1_33=
_stable</a></div><div><br></div><div>I am leaning towards just taking the .=
0 versions.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 22 Feb 2021 at 2=
0:14, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Mon, Feb 22, 2021 at 10:44 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Right here: <a href=3D"https://busybox.net/" rel=3D"noreferrer" targe=
t=3D"_blank">https://busybox.net/</a><br>
&gt;<br>
I see.<br>
Gap between 1.32.0 and 1.32.1 release was about 6 months, I am not<br>
sure if all distros are waiting for dot releases or not. I see that<br>
upcoming fedora 34 ( due in April )<br>
is already packaging busybox 1.33.0<br>
<br>
&gt; Alex<br>
&gt;<br>
&gt;<br>
&gt; On Mon, 22 Feb 2021 at 18:37, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 2/22/21 8:39 AM, Alexander Kanavin wrote:<br>
&gt;&gt; &gt; On Mon, 22 Feb 2021 at 17:02, Richard Purdie<br>
&gt;&gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" ta=
rget=3D"_blank">richard.purdie@linuxfoundation.org</a><br>
&gt;&gt; &gt; &lt;mailto:<a href=3D"mailto:richard.purdie@linuxfoundation.=
org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;&gt; wrote=
:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +UPSTREAM_CHECK_URI =3D &quot;<a hr=
ef=3D"https://busybox.net/" rel=3D"noreferrer" target=3D"_blank">https://bu=
sybox.net/</a> &lt;<a href=3D"https://busybox.net/" rel=3D"noreferrer" targ=
et=3D"_blank">https://busybox.net/</a>&gt;&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +UPSTREAM_CHECK_REGEX =3D &quot;Bus=
yBox\ (?P&lt;pver&gt;\d+\.\d+\.\d+)\<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0\(stable\)&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0I just realised/wondered whether:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0inherit upstream-version-is-even<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0would work here?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I don&#39;t think so - busybox seems to declare x.y.0 as uns=
table, and<br>
&gt;&gt; &gt; everything else as stable.<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; is it documented somewhere that x.y.0 is unstable ?<br>
&gt;&gt; <a href=3D"https://git.busybox.net/busybox/commit/?id=3Da4c3a3413=
94a1fb25be8c15d2ddfe3ec77cbb83c" rel=3D"noreferrer" target=3D"_blank">https=
://git.busybox.net/busybox/commit/?id=3Da4c3a341394a1fb25be8c15d2ddfe3ec77c=
bb83c</a><br>
&gt;&gt;<br>
&gt;&gt; seems to indicate its a normal release.<br>
&gt;&gt;<br>
&gt;&gt; &gt; Alex<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt;<br>
</blockquote></div>

--0000000000000ef78205bbf24151--
