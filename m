Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.1964.1626998657483155716
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 17:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qrpQ7HAs;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id jz6so590109qvb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 17:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VC0cd768BNRXwIqV4fWJuCBKNZ8mGYjWvuLGbU8fSQI=;
        b=qrpQ7HAsHt9hdJjGx0TQAq4Gdpoa3z5rujr76PZZTw5LZb+sr3eptV3Ovs9MtcOyAw
         tATlk6ET4KAT7fdNQ5D7Bcs/UBQqgxWw3U222KtljCSNc7+TN/ezLwFaumIzM0bxuWkV
         MUCfVNCz7tzqRlAqWE2lrkQacX0Ui7fdFVPHUodRy5k/0tnVInjPMeA8a73AUHk2sd/p
         ZbjQf5Ls8Qyw9vNvQgFYOQFm4cRcNM6xJBN25S1NC8KEoYyrDBtB3YEbGvexQlWKwrBG
         Expm3k6XmD9HdjqRyYER29gm+mcDnE1ntoQrZ2yFbuIujKjAI6p7I3kbJ1O5xQ00tLxQ
         QS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VC0cd768BNRXwIqV4fWJuCBKNZ8mGYjWvuLGbU8fSQI=;
        b=qFBzEn8bNfhIB8tCZqY8Te2dTXO2X5C0u84e3mhR9KDfrb+Icg1VjdXjIjyjYP1fbu
         2S1II0S6EeVlUfdufTCYyx/Vb6/Y985hgYh5t5B2FOfFYDGysNCDbZVJbpoSz6Vdey5r
         +4f4qXUV4/taUz8yIvSA3ChNm4LaYKnZHMmghgWkY8UhugpX/rZObXN4FKAPa/kfLUi7
         0ocmeOP50sG6KIXQG3KkrnI73isc24oMmqow9kPGVIsAG1uaT/wU0T4Rp4JcYdciAuQL
         LXRGJ9nNcF9ZDb5on/vw0oqZ97kiqMxt92KXgJzDxSwB59jHeUxs8ksVfZSvpFhsrxTg
         AxRw==
X-Gm-Message-State: AOAM530qdzkrdFFrjNPH/bZqmQF8ViLxWTtwNPX6OoFQRXAuMii9PuKn
	mP5BhVTe+Z+BWW8snZ6fT91wO3KKhHahPYxMBm4=
X-Google-Smtp-Source: ABdhPJw9p/5pBg/hdR2c4kh6R1W4bJ48n3j++NyDG5s+6CGtz+bUODw0ikQWXQsiLZL+Ysxl9h04cXoAUT10zxeiuA8=
X-Received: by 2002:a05:6214:767:: with SMTP id f7mr2338970qvz.16.1626998656618;
 Thu, 22 Jul 2021 17:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210721021108.1082410-1-raj.khem@gmail.com> <YPkqwl0OiCwPtuer@piout.net>
 <CAMKF1soNY99BuAgNxgj7U=FukWY14VUa+_axra0zLB1bqe9u3A@mail.gmail.com> <YPnlN0HaML6IFFLy@piout.net>
In-Reply-To: <YPnlN0HaML6IFFLy@piout.net>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 22 Jul 2021 17:04:06 -0700
Message-ID: <CAMKF1soqM8gybY4qmMMb_u9prm3FrzGYpPr0djYq3A5HWZhfyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] binutils: Upgrade to 2.37 branch
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fa550005c7bf24c4"

--000000000000fa550005c7bf24c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 22, 2021 at 2:38 PM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> On 22/07/2021 07:56:11-0700, Khem Raj wrote:
> > On Thu, Jul 22, 2021 at 1:22 AM Alexandre Belloni <
> > alexandre.belloni@bootlin.com> wrote:
> >
> > > Hi Khem,
> > >
> > > On 20/07/2021 19:11:08-0700, Khem Raj wrote:
> > > > This izOs next/latest release branch for binutils
> > > > Drop backports and CVE fixes which already are applied upstream
> > > >
> > > > bfd_stdint.h has been removed in favor of using stdint.h
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > > V2: Fixes SDK builds for mingw and glew build with GLES
> > > >
> > >
> > > This didn't apply properly, I fixed it up, can you check
> > >
> > >
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dabello=
ni/master-next&id=3Defb06e3e03c750944bfa40314dae70c054bdaed4
> > >
> >
> > What portion did not apply ? It looks alright to me but want to know so=
 I
> > can correct my branch since I have few other patches lined up before it=
 I
> > wonder if that=E2=80=99s the issue or something else
>
> Almost none of it applied, it is most likely caused by whitespace
> changes as this was the main difference between v1 and v2. What I did is


Interesting I wonder why it happened

>
> take v1 and changed the SRCREV to be the one of v2.


Ok if it was just that Change then we are fine here


>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000fa550005c7bf24c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jul 22, 2021 at 2:38 PM Alexandre Belloni &lt;<a hr=
ef=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 22/07/2021 07:56:1=
1-0700, Khem Raj wrote:<br>
&gt; On Thu, Jul 22, 2021 at 1:22 AM Alexandre Belloni &lt;<br>
&gt; <a href=3D"mailto:alexandre.belloni@bootlin.com" target=3D"_blank">ale=
xandre.belloni@bootlin.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Hi Khem,<br>
&gt; &gt;<br>
&gt; &gt; On 20/07/2021 19:11:08-0700, Khem Raj wrote:<br>
&gt; &gt; &gt; This izOs next/latest release branch for binutils<br>
&gt; &gt; &gt; Drop backports and CVE fixes which already are applied upstr=
eam<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; bfd_stdint.h has been removed in favor of using stdint.h<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; V2: Fixes SDK builds for mingw and glew build with GLES<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; This didn&#39;t apply properly, I fixed it up, can you check<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://git.openembedded.org/openembedded-core-contrib=
/commit/?h=3Dabelloni/master-next&amp;id=3Defb06e3e03c750944bfa40314dae70c0=
54bdaed4" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org=
/openembedded-core-contrib/commit/?h=3Dabelloni/master-next&amp;id=3Defb06e=
3e03c750944bfa40314dae70c054bdaed4</a><br>
&gt; &gt;<br>
&gt; <br>
&gt; What portion did not apply ? It looks alright to me but want to know s=
o I<br>
&gt; can correct my branch since I have few other patches lined up before i=
t I<br>
&gt; wonder if that=E2=80=99s the issue or something else<br>
<br>
Almost none of it applied, it is most likely caused by whitespace<br>
changes as this was the main difference between v1 and v2. What I did is</b=
lockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Interesting I wonde=
r why it happened=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><b=
r>
take v1 and changed the SRCREV to be the one of v2.</blockquote><div dir=3D=
"auto"><br></div><div dir=3D"auto">Ok if it was just that Change then we ar=
e fine here</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
 dir=3D"auto"><br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000fa550005c7bf24c4--
