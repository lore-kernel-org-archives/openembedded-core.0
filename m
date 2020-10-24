Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web09.10540.1603538379277024792
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2020 04:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QlwVnPQx;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id x11so1390240uav.1;
        Sat, 24 Oct 2020 04:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3aPa7KJV90OYdyxdAZirKnG+aN8dFky5AeGXtcNx8JQ=;
        b=QlwVnPQx0Y5FhCEWgev/+vxnq4TPRg6laXUXCsRNHKCM6m5D3liblL8wGVKBGglvKB
         c24+BO4NwrkXGb4pCqc1Bpz037uSq3SXV0icq0d1w2JyHtdLRx05fES6FHCZa8/4p+Z4
         qmGt/SmE08Sp+vWX55v6+KTEkxCzVyqiiLVTAY4/6NuL/5QPWtKUQZ18mZD7YXSKsUmb
         2y0rHB7G/U7oppN84F+88jSply3rDx8U0m+pk39V4GLRAccBMWpZznKB3CUPaRY7cBcu
         9e+T8oqUNUSGTfjmZbn7006ur9eH5fDP2GYZFBgFKe/yfm6SKvJAhOFXM2ftx5khIUbT
         fhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3aPa7KJV90OYdyxdAZirKnG+aN8dFky5AeGXtcNx8JQ=;
        b=mDqHQ314hAuNUn84gQracDIoJGvHt2gEQZMI88j37idENdpem/7VZ363Z5zGaeWpLC
         fysDUlMQWEy4jIQQU+t/gBfqOHgab+kmIfiu8lARkQzHDOdNNQ4zJrd6QRSN9xB63v1W
         DW4T/K8Hdhe6EzKdiixWTb6PWlMMs1tubX5YdPFIrcxUhQ69oEbB/9QI1I/3slYg2DRT
         UUOP+bIsva4rCZzBc6Yty4CG9JfpZUiHRWm36FibH5ypaF/kLieeMmOLPwvixSQx92RW
         wig+cH6yYkwC1MZfdcSVmHqaiTmPBf/iRXzGNx7vqpLI6XR/Zx47/4gXpFXGLrRpy+6I
         dh6g==
X-Gm-Message-State: AOAM533qNMu6XcPMutK/MuXAmsUmRmda2jvcwo5CCJIt9h0x06LvnVQ+
	9gs8ctlJDV7unG2PQGAqQH+i/ueXeTdxL4ArPQU=
X-Google-Smtp-Source: ABdhPJzVbd6DeZdc85AHxA3ChE8feFiGmS3J5pcoqvEVuyyZ5y1yz7iefQwIxymjkGPCi9KYwjQBJ+UTnklNnztZHbM=
X-Received: by 2002:ab0:2156:: with SMTP id t22mr6244445ual.71.1603538378370;
 Sat, 24 Oct 2020 04:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <CANx9H-DFtcdnZwDqHEPg4t5ySyJe++KS8hO9QDFX5r31KLz3Ww@mail.gmail.com>
 <CAGAf8Lxi0r2ak62JMAGwRbsO=9b5yXWQyDj5PH4g8uauSDZDYw@mail.gmail.com>
In-Reply-To: <CAGAf8Lxi0r2ak62JMAGwRbsO=9b5yXWQyDj5PH4g8uauSDZDYw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 24 Oct 2020 13:19:27 +0200
Message-ID: <CANNYZj9jwk5kH2CAfUNXp7VmufS2rd6R1ZpHJBJiUZ5uzvSGVA@mail.gmail.com>
Subject: Re: [yocto] Let me tell you how I really feel. Zero filter. If you need meta-python2, you need to become a maintainer. Immediately. Period.
To: Zoran <zoran.stojsavljevic@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org" <Openembedded-devel@lists.openembedded.org>, yocto@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000006d309505b268df4c"

--0000000000006d309505b268df4c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I guess some people or companies somehow felt entitled to Tim doing
continuing python2 layer support for them in a particularly annoying way,
and this was a reality check for them.
We are all volunteers and we owe nothing to anyone. If you don=E2=80=99t l=
ike this
proposition, get a commercial support contract or hire more people to do
the work you want to be done.

Alex

On Sat 24. Oct 2020 at 12.54, Zoran <zoran.stojsavljevic@gmail.com> wrote:

> > I have absolutely no need for python2, I made this abundantly
> > clear when I created the meta-python2 layer.
>
> WTH? Let me tell you how I really feel.
>
> I  have absolutely no need for python2, as well.
>
> > You are not paying me to do this. You cannot pay me enough
> > to do this. Period. Support yourself.
>
> What is the amount of cash for you, you'll consider it enough to
> do that???
>
> Better... What is the real message behind this/yours "announcement"?
>
> Thank you,
> Zoran
> _______
>
> On Wed, Oct 21, 2020 at 2:48 AM Tim Orling <ticotimo@gmail.com> wrote:
> >
> > I have absolutely no need for python2, I made this abundantly clear wh=
en
> I created the meta-python2 layer.
> >
> > If you depend upon continuing support of python2 via the meta-python2
> layer, this is your call to arms.
> >
> > I was originally intending to abdicate any support after the 3.1
> "dunfell" release, but managed to somehow continue supporting it into th=
e
> crest of the 3.2 "gatesgarth" release.
> >
> > I will stop all support and actively refuse lo respond to any emails a=
nd
> this layer will be dead and I have zero care in the world that it stops
> being useful. I do not use it. I do not depend upon it. You are not payi=
ng
> me to do this. You cannot pay me enough to do this. Period. Support
> yourself.
> >
> > If this is not clear enough, I am happy to have a virtual video call
> with you that you will not like.
> >
> > --moto-timo
> >
> >
>
>=20
>
>

--0000000000006d309505b268df4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I guess some people or companies somehow felt entitled to=
 Tim doing continuing python2 layer support for them in a particularly anno=
ying way, and this was a reality check for them.=C2=A0</div><div dir=3D"aut=
o">We are all volunteers and we owe nothing to anyone. If you don=E2=80=99t=
 like this proposition, get a commercial support contract or hire more peop=
le to do the work you want to be done.</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat 24. Oct 2020 at 12.54, Zoran &lt;<a href=3D"=
mailto:zoran.stojsavljevic@gmail.com">zoran.stojsavljevic@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)">&gt; I have absolutely no need for python=
2, I made this abundantly<br>
&gt; clear when I created the meta-python2 layer.<br>
<br>
WTH? Let me tell you how I really feel.<br>
<br>
I=C2=A0 have absolutely no need for python2, as well.<br>
<br>
&gt; You are not paying me to do this. You cannot pay me enough<br>
&gt; to do this. Period. Support yourself.<br>
<br>
What is the amount of cash for you, you&#39;ll consider it enough to<br>
do that???<br>
<br>
Better... What is the real message behind this/yours &quot;announcement&qu=
ot;?<br>
<br>
Thank you,<br>
Zoran<br>
_______<br>
<br>
On Wed, Oct 21, 2020 at 2:48 AM Tim Orling &lt;<a href=3D"mailto:ticotimo@=
gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I have absolutely no need for python2, I made this abundantly clear w=
hen I created the meta-python2 layer.<br>
&gt;<br>
&gt; If you depend upon continuing support of python2 via the meta-python2=
 layer, this is your call to arms.<br>
&gt;<br>
&gt; I was originally intending to abdicate any support after the 3.1 &quo=
t;dunfell&quot; release, but managed to somehow continue supporting it into=
 the crest of the 3.2 &quot;gatesgarth&quot; release.<br>
&gt;<br>
&gt; I will stop all support and actively refuse lo respond to any emails =
and this layer will be dead and I have zero care in the world that it stops=
 being useful. I do not use it. I do not depend upon it. You are not paying=
 me to do this. You cannot pay me enough to do this. Period. Support yourse=
lf.<br>
&gt;<br>
&gt; If this is not clear enough, I am happy to have a virtual video call =
with you that you will not like.<br>
&gt;<br>
&gt; --moto-timo<br>
&gt;<br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000006d309505b268df4c--
