Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com [209.85.222.68])
 by mx.groups.io with SMTP id smtpd.web08.17317.1603570942827586022
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2020 13:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WAEYTS4P;
 spf=pass (domain: gmail.com, ip: 209.85.222.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f68.google.com with SMTP id x11so1663913uav.1;
        Sat, 24 Oct 2020 13:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zXj+aCbeW7Oz3pnsElgHzpcmirexNOqC3yVTeCP3LPM=;
        b=WAEYTS4PbLxZLSJf5Iv8708uc7wAmAIPPDIKFlL78Mdd2ghj4i3f522Y1aMl1zU6jC
         XiOMUZl2LiglgMnuZxIlVgwhVaUwqefTggYnZDQ7gwO+rYxfLkUHW9flUBQaB2jkAMO+
         NKfMAI+95FkFeAQrDTiTtPodQnSKLgyDpOOzJ/OzMmwmbafj1/qbQlYoNnt5i/LohrhZ
         YROhf11aX0V+YTszxW/pGhw59iUD37M+/yk8AWDgJEYpiQ+3O6+gU+dj2WX6cE9xWclv
         hFVub2DNUr22e0FV8H4nyjUK3iDwDq8oy6MDAv1yXMdo6G9jgmaz3Pc/OnisjvZApZr5
         u1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zXj+aCbeW7Oz3pnsElgHzpcmirexNOqC3yVTeCP3LPM=;
        b=pweGlNu6qBYv04+jk4YpvhfxNoou29QQFOsx57xIWnoWUmhfj1IRrV0zXNQeKW0n+s
         QO+hujv6bBKsP1jjkuTEZm4ZfVRBUarl1jIkVRdawFbIBp5g+WfcvN3JK4A/hiPADzFT
         VZyWhca+vSbMYNJBc5yqUDY04TwaBmOmCSyr9ZAiDF80ZrZ/opos4tQC4zopOYJous06
         j9D5SO8rX2yUj4gbULJuG0Zmk+1wAiQae1ZQMplGxiM/LbnRy76ynf2I8t5yyqtmyzaz
         /caD2ifrEsaQg49t7DLokHRgDAi6DlXOFHPu+EpVeJB+OHFg7TXFLVZoylVBRR36PI6M
         W3YQ==
X-Gm-Message-State: AOAM533ZgKe19xRNt4OOWdBVh79DWmpzp59BsB4AqSlA2nk1QzoLA8V8
	1mzn6CALGH0LJMzF3AArtMjr7JtiagwFVUE2OY4=
X-Google-Smtp-Source: ABdhPJxg4VP+SQPmo5lv8eUvERjtmPbqRcoj0r4zK5x7eTnjONAKAGuPNYqa+4aR7jhmBe4/1+M0UjQ4qAY9Qe9Jzzs=
X-Received: by 2002:ab0:7143:: with SMTP id k3mr8450123uao.93.1603570942007;
 Sat, 24 Oct 2020 13:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <CANx9H-DFtcdnZwDqHEPg4t5ySyJe++KS8hO9QDFX5r31KLz3Ww@mail.gmail.com>
 <1640E842B1461A14.10923@lists.yoctoproject.org> <CAGAf8LwEANwgRoXr39xJ1BP5t3XYb9B_8Sf2fYBx_-CfiRAB9Q@mail.gmail.com>
In-Reply-To: <CAGAf8LwEANwgRoXr39xJ1BP5t3XYb9B_8Sf2fYBx_-CfiRAB9Q@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 24 Oct 2020 22:22:09 +0200
Message-ID: <CANNYZj_g=0mt7d+f4Gu0HhmikgZ8M6gpGStZLtsDgRqSBXH+vQ@mail.gmail.com>
Subject: Re: [yocto] Let me tell you how I really feel. Zero filter. If you need meta-python2, you need to become a maintainer. Immediately. Period.
To: Zoran Stojsavljevic <zoran.stojsavljevic@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>, yocto@lists.yoctoproject.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org" <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005ede9a05b270747a"

--0000000000005ede9a05b270747a
Content-Type: text/plain; charset="UTF-8"

I am not complaining or bragging. I only want to set expectations, in
public, and clearly. Otherwise some people will treat the project
contributors as their unpaid contractors, and get upset when help is not
given, or work is not done for them.

Alex

On Sat, 24 Oct 2020 at 19:38, Zoran Stojsavljevic <
zoran.stojsavljevic@gmail.com> wrote:

> Alex,
>
> Either do it voluntarily, either do not.
>
> Do not complain, or brag about it.
>
> We all understand Open Source rules, or we do not, do we???
>
> Thank you,
> Zoran Stojsavljevic
> _______
>
>
>
>
>
> On Sat, Oct 24, 2020 at 12:54 PM Zoran via lists.yoctoproject.org
> <zoran.stojsavljevic=gmail.com@lists.yoctoproject.org> wrote:
> >
> > > I have absolutely no need for python2, I made this abundantly
> > > clear when I created the meta-python2 layer.
> >
> > WTH? Let me tell you how I really feel.
> >
> > I  have absolutely no need for python2, as well.
> >
> > > You are not paying me to do this. You cannot pay me enough
> > > to do this. Period. Support yourself.
> >
> > What is the amount of cash for you, you'll consider it enough to
> > do that???
> >
> > Better... What is the real message behind this/yours "announcement"?
> >
> > Thank you,
> > Zoran
> > _______
> >
> > On Wed, Oct 21, 2020 at 2:48 AM Tim Orling <ticotimo@gmail.com> wrote:
> > >
> > > I have absolutely no need for python2, I made this abundantly clear
> when I created the meta-python2 layer.
> > >
> > > If you depend upon continuing support of python2 via the meta-python2
> layer, this is your call to arms.
> > >
> > > I was originally intending to abdicate any support after the 3.1
> "dunfell" release, but managed to somehow continue supporting it into the
> crest of the 3.2 "gatesgarth" release.
> > >
> > > I will stop all support and actively refuse lo respond to any emails
> and this layer will be dead and I have zero care in the world that it stops
> being useful. I do not use it. I do not depend upon it. You are not paying
> me to do this. You cannot pay me enough to do this. Period. Support
> yourself.
> > >
> > > If this is not clear enough, I am happy to have a virtual video call
> with you that you will not like.
> > >
> > > --moto-timo
> > >
> > >
> >
> > 
> >
>

--0000000000005ede9a05b270747a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am not complaining or bragging. I only want to set =
expectations, in public, and clearly. Otherwise some people will treat the =
project contributors as their unpaid contractors, and get upset when help i=
s not given, or work is not done for them.</div><div><br></div><div>Alex<br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, 24 Oct 2020 at 19:38, Zoran Stojsavljevic &lt;<a href=3D"mai=
lto:zoran.stojsavljevic@gmail.com">zoran.stojsavljevic@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Alex,<br>
<br>
Either do it voluntarily, either do not.<br>
<br>
Do not complain, or brag about it.<br>
<br>
We all understand Open Source rules, or we do not, do we???<br>
<br>
Thank you,<br>
Zoran Stojsavljevic<br>
_______<br>
<br>
<br>
<br>
<br>
<br>
On Sat, Oct 24, 2020 at 12:54 PM Zoran via <a href=3D"http://lists.yoctopr=
oject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a><=
br>
&lt;zoran.stojsavljevic=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.o=
rg" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; I have absolutely no need for python2, I made this abundantly<br=
>
&gt; &gt; clear when I created the meta-python2 layer.<br>
&gt;<br>
&gt; WTH? Let me tell you how I really feel.<br>
&gt;<br>
&gt; I=C2=A0 have absolutely no need for python2, as well.<br>
&gt;<br>
&gt; &gt; You are not paying me to do this. You cannot pay me enough<br>
&gt; &gt; to do this. Period. Support yourself.<br>
&gt;<br>
&gt; What is the amount of cash for you, you&#39;ll consider it enough to<=
br>
&gt; do that???<br>
&gt;<br>
&gt; Better... What is the real message behind this/yours &quot;announceme=
nt&quot;?<br>
&gt;<br>
&gt; Thank you,<br>
&gt; Zoran<br>
&gt; _______<br>
&gt;<br>
&gt; On Wed, Oct 21, 2020 at 2:48 AM Tim Orling &lt;<a href=3D"mailto:tico=
timo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; I have absolutely no need for python2, I made this abundantly cl=
ear when I created the meta-python2 layer.<br>
&gt; &gt;<br>
&gt; &gt; If you depend upon continuing support of python2 via the meta-py=
thon2 layer, this is your call to arms.<br>
&gt; &gt;<br>
&gt; &gt; I was originally intending to abdicate any support after the 3.1=
 &quot;dunfell&quot; release, but managed to somehow continue supporting it=
 into the crest of the 3.2 &quot;gatesgarth&quot; release.<br>
&gt; &gt;<br>
&gt; &gt; I will stop all support and actively refuse lo respond to any em=
ails and this layer will be dead and I have zero care in the world that it =
stops being useful. I do not use it. I do not depend upon it. You are not p=
aying me to do this. You cannot pay me enough to do this. Period. Support y=
ourself.<br>
&gt; &gt;<br>
&gt; &gt; If this is not clear enough, I am happy to have a virtual video =
call with you that you will not like.<br>
&gt; &gt;<br>
&gt; &gt; --moto-timo<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--0000000000005ede9a05b270747a--
