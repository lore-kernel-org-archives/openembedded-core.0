Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web08.437.1619548150813567767
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 11:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pXNN982E;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id d25so23904189vsp.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Apr 2021 11:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2/7mQtMM2yYxL4m4OZdJpRXan71JgI/E6/k6JJI0t4Y=;
        b=pXNN982Eb0iOrnZuzzVIx1tQIVetSpvHzogBtIMOE0vzGBeaKL3+RvixexmRwy3STA
         PJq4y23s+Bwy9n26gdH1KGNH+CS5/ZCcct+0dxV2BYbGimvlBcqf1gDpp8smFg/8NDtB
         Nt+3DPK5O78Fkvbp6gKX5gemO3LA01s0u8v9gm3GUUV8B+6jqnQSGVjWmpRV4p4ibwu/
         EYFdEWP1bv5lwm++owcG+EEhUV8MZBeiyB5XQ8UlAZ7SSIDm5hN5mXAWincLBVsUc0wQ
         BXkVWOOuwZ37x7vu34s7Zmv/qvu0ABAqQF1rSHGrR2k2oI0DySB/VFQbyINGZYOXPHI/
         ogBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2/7mQtMM2yYxL4m4OZdJpRXan71JgI/E6/k6JJI0t4Y=;
        b=IG4e8byHZ50ngJ570kifABk04em4kquE+ORV+Dikdr+jIz2cFH/WiFHNMwhu4X0a6n
         SpMc6oYWvBWTzsaB1mzX3PKdO1LLP+5LBiKjI3NXOqmKO1fBtShOkFomglBTAXObhxtl
         VQ5K53TuToVYp8IdGw+cWSYcQza52fSYezK8KLXL66nklEmbtyXEo4uigR83mKDfysc6
         f8cdvEKCWjTOCDYF8Hq/zRKoyEMl9ERX2pMYyi34uiQuwWOZo9tIfZMhdbkiYPmXio7N
         drsn79xt6VPmBGLqCJxEx8BUqv3c3pmfuYTMBw88LcmOdSIm31LcxeHIFpeXcS9N/Agt
         l0Fg==
X-Gm-Message-State: AOAM532ZUSPo0koTdEXtyJqYFaQtD5iUUOvOYoKPVkmMymkYfk7pqkM+
	Wa7ELBwroDAEb+LAcMzXimAZYPFA7xl7K64PWgM=
X-Google-Smtp-Source: ABdhPJwGxAwDMjCVtrSqnnsaAhDMrvec43yXs+ne0WElGBmW53bJEmhuJsNdQ7eeDWvbGLyywOR5p6NaqGK8lklq3XA=
X-Received: by 2002:a67:483:: with SMTP id 125mr19632779vse.51.1619548149915;
 Tue, 27 Apr 2021 11:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210423180254.706537-1-alex.kanavin@gmail.com>
 <20210423180254.706537-6-alex.kanavin@gmail.com> <8295040a-2b00-92f2-7ad5-95e2941f0dd6@windriver.com>
 <CAP9ODKqCevEQXOLn4xW0vQkrUOP3xgnQBLiRoG3d9rz3tY6znQ@mail.gmail.com>
In-Reply-To: <CAP9ODKqCevEQXOLn4xW0vQkrUOP3xgnQBLiRoG3d9rz3tY6znQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 27 Apr 2021 20:28:58 +0200
Message-ID: <CANNYZj-AYJsw46=a8JmC4r4WVx9tZR8UqAF2irgovdKWeBTDTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/7] default-distrovars.inc: add wayland/opengl to default distro features
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Randy MacLeod <randy.macleod@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"Wei, Yunguo (Bryan)" <Yunguo.Wei@windriver.com>, Kevin Hao <kexin.hao@windriver.com>, 
	Yocto discussion list <yocto@yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000002c220f05c0f8704a"

--0000000000002c220f05c0f8704a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wait a moment, I am not sure I understand the argument about software
rendering. Can you please elaborate?

What is the scenario where enabling opengl would regress from something
hw-accelerated to software rendering?

Alex

On Tue, 27 Apr 2021 at 19:09, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> Em ter., 27 de abr. de 2021 =C3=A0s 13:10, Randy MacLeod
> <randy.macleod@windriver.com> escreveu:
> >
> > Cross-posting to yocto since this is of general interest.
> >
> > On 2021-04-23 2:02 p.m., Alexander Kanavin wrote:
> > > This puts them on equal terms with x11 distro feature
> > > (which I think is due).
> > >
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >   meta/conf/distro/include/default-distrovars.inc | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/conf/distro/include/default-distrovars.inc
> b/meta/conf/distro/include/default-distrovars.inc
> > > index 9fcc10f83a..384ee7fc98 100644
> > > --- a/meta/conf/distro/include/default-distrovars.inc
> > > +++ b/meta/conf/distro/include/default-distrovars.inc
> > > @@ -10,7 +10,7 @@ LOCALE_UTF8_ONLY ?=3D "0"
> > >   LOCALE_UTF8_IS_DEFAULT ?=3D "1"
> > >   LOCALE_UTF8_IS_DEFAULT_class-nativesdk =3D "0"
> > >
> > > -DISTRO_FEATURES_DEFAULT ?=3D "acl alsa argp bluetooth debuginfod ext=
2
> ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci =
3g
> nfc x11 vfat"
> > > +DISTRO_FEATURES_DEFAULT ?=3D "acl alsa argp bluetooth debuginfod ext=
2
> ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci =
3g
> nfc x11 vfat wayland opengl"
> > >   DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}"
> > >   IMAGE_FEATURES ?=3D ""
> > >
> > >
> >
> > We (Wind River) already drop the x11 DF from some of our distros and
> > we'd likely do the same for wayland and opengl so while this seems
> > like the wrong change for headless systems it is one we could deal with=
.
>
> Adding wayland seems Ok but forcing the opengl support doesn't seems a
> good default. Especially because we just also ensure software
> rendering is also wrong (slow or not).
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>

--0000000000002c220f05c0f8704a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Wait a moment, I am not sure I understand the argumen=
t about software rendering. Can you please elaborate?</div><div><br></div><=
div>What is the scenario where enabling opengl would regress from something=
 hw-accelerated to software rendering?<br></div><div><br></div><div>Alex<br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 27 Apr 2021 at 19:09, Otavio Salvador &lt;<a href=3D"mailto:=
otavio.salvador@ossystems.com.br">otavio.salvador@ossystems.com.br</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Em ter., =
27 de abr. de 2021 =C3=A0s 13:10, Randy MacLeod<br>
&lt;<a href=3D"mailto:randy.macleod@windriver.com" target=3D"_blank">randy.=
macleod@windriver.com</a>&gt; escreveu:<br>
&gt;<br>
&gt; Cross-posting to yocto since this is of general interest.<br>
&gt;<br>
&gt; On 2021-04-23 2:02 p.m., Alexander Kanavin wrote:<br>
&gt; &gt; This puts them on equal terms with x11 distro feature<br>
&gt; &gt; (which I think is due).<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanav=
in@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0meta/conf/distro/include/default-distrovars.inc | 2 +=
-<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/conf/distro/include/default-distrovars.inc b/me=
ta/conf/distro/include/default-distrovars.inc<br>
&gt; &gt; index 9fcc10f83a..384ee7fc98 100644<br>
&gt; &gt; --- a/meta/conf/distro/include/default-distrovars.inc<br>
&gt; &gt; +++ b/meta/conf/distro/include/default-distrovars.inc<br>
&gt; &gt; @@ -10,7 +10,7 @@ LOCALE_UTF8_ONLY ?=3D &quot;0&quot;<br>
&gt; &gt;=C2=A0 =C2=A0LOCALE_UTF8_IS_DEFAULT ?=3D &quot;1&quot;<br>
&gt; &gt;=C2=A0 =C2=A0LOCALE_UTF8_IS_DEFAULT_class-nativesdk =3D &quot;0&qu=
ot;<br>
&gt; &gt;<br>
&gt; &gt; -DISTRO_FEATURES_DEFAULT ?=3D &quot;acl alsa argp bluetooth debug=
infod ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zero=
conf pci 3g nfc x11 vfat&quot;<br>
&gt; &gt; +DISTRO_FEATURES_DEFAULT ?=3D &quot;acl alsa argp bluetooth debug=
infod ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zero=
conf pci 3g nfc x11 vfat wayland opengl&quot;<br>
&gt; &gt;=C2=A0 =C2=A0DISTRO_FEATURES ?=3D &quot;${DISTRO_FEATURES_DEFAULT}=
&quot;<br>
&gt; &gt;=C2=A0 =C2=A0IMAGE_FEATURES ?=3D &quot;&quot;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; We (Wind River) already drop the x11 DF from some of our distros and<b=
r>
&gt; we&#39;d likely do the same for wayland and opengl so while this seems=
<br>
&gt; like the wrong change for headless systems it is one we could deal wit=
h.<br>
<br>
Adding wayland seems Ok but forcing the opengl support doesn&#39;t seems a<=
br>
good default. Especially because we just also ensure software<br>
rendering is also wrong (slow or not).<br>
<br>
-- <br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: +55 (53) 9 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile: +1 (=
347) 903-9750<br>
</blockquote></div>

--0000000000002c220f05c0f8704a--
