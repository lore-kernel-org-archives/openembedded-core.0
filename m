Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web10.6868.1602575996316409715
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 00:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bn+VxdI5;
 spf=pass (domain: gmail.com, ip: 209.85.217.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f66.google.com with SMTP id l6so9681275vsr.7
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 00:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+lq5gTq+DXRgLABjNz6WUfwqIDwF2OHO2h7zsQQB0NY=;
        b=Bn+VxdI5uiRjOOTm9keemEpR5lebmKioTYCki3Ju7y4G8LyOtGWrjhdF6Rfq+pIP0f
         klmkyDVV0J6tAXF8CgxVXSetHmK5mYXUGhKZhTq5XdAtBrVx9JrGiP/OuyO2jJVaEUkE
         KHXuRKOatjzFh0qnWQkQV6LKbrjYPI/B62fFxQieq4qgaqMWBuczFv3knvfz+j7g891r
         v/Xa5pyx76powyy1qkjt2CBt5YMtRqVpv51CzwS3JaK1eVpaPOrfM7VjWyUNH7UDCzcU
         HcY3mlXBmdDjQP+pzWywgxhnpsbxOXGMVE3+tfhBjKp5YhtxvfjMbvt3wQ4X7Jd81YOp
         PD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+lq5gTq+DXRgLABjNz6WUfwqIDwF2OHO2h7zsQQB0NY=;
        b=IUCdOePgwUUTs6VyFsewH57ZqwU+Gv1XtwUSznkxpb3nc04tyzLGNz0XSHu5p9BwKw
         gFJg2W7WHCakltng3fjh81uwtqqhUf/aoIG2pI5oAxcRZIpXlDiszGQBFh0STKmMxac+
         Vk8Dz3Bci6hi7SpWvcNU4Qc7tO0/EP3/x5J7fnGfXhXu5AeEDTcuTXv+llZl4PxBz7a1
         YXQRIY5BuDkhjFG3Ims8B/CiB52vpFoJU2tdyNnMWBb9jpeIFMFKoFDTRWL8nDUvEJz8
         fC01nfEXVtkE9vuoQwrlG+rEYRcktJ567gl/dxXGvdECso+U3UJ3Pieooh/TIsIOl64a
         fWFA==
X-Gm-Message-State: AOAM5304uUVtfca8CnnxMnbGiGDStUw8v+W2vlxtBduqfnjw/dGeizfA
	JUvQliwe94HlYK8dZsvoMbKiQxQ83/C2WsfyA0Q=
X-Google-Smtp-Source: ABdhPJxPPNcNJnWnX0YwPsdDK1xfU6PyDdiHKoGLnAwVo2jl+VH/nV5ZG6UprhMZNyflK+0uNf/IsIpyOnLS0BODJUM=
X-Received: by 2002:a67:403:: with SMTP id 3mr2814101vse.54.1602575995471;
 Tue, 13 Oct 2020 00:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201011234937.1041597-1-alistair@alistair23.me>
 <CANNYZj82hb4PyrQYd_SWQVkbEvitomqBmkiOpecvM4o=rTyQ7w@mail.gmail.com> <CAKmqyKMO_dwh=q5+0kdAPR2a0QhkYSSopvsWbSD-eQMPXybsFw@mail.gmail.com>
In-Reply-To: <CAKmqyKMO_dwh=q5+0kdAPR2a0QhkYSSopvsWbSD-eQMPXybsFw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 13 Oct 2020 09:59:44 +0200
Message-ID: <CANNYZj-zkwn1DrhXZJYZ6-=7AL7U5BLxYpn=dj=BUrJ12Ap97Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wayland: Set idle-time to zero
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair <alistair@alistair23.me>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ef8b8205b188ccad"

--000000000000ef8b8205b188ccad
Content-Type: text/plain; charset="UTF-8"

It is however the upstream default, so changing it needs a proper
explanation. Is it something beneficial for the majority of use cases?

Ale

On Tue 13. Oct 2020 at 1.22, Alistair Francis <alistair23@gmail.com> wrote:

> On Mon, Oct 12, 2020 at 2:28 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Why?
>
> It's really annoying when you are working on something and the screen
> turns off.
>
> Alistair
>
> >
> > Alex
> >
> > On Mon, 12 Oct 2020 at 01:49, Alistair <alistair@alistair23.me> wrote:
> >>
> >> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> >> ---
> >>  meta/recipes-graphics/wayland/weston-init/weston.ini | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini
> b/meta/recipes-graphics/wayland/weston-init/weston.ini
> >> index b48726d59c..d1532236af 100644
> >> --- a/meta/recipes-graphics/wayland/weston-init/weston.ini
> >> +++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
> >> @@ -5,6 +5,7 @@
> >>  #shell=desktop-shell.so
> >>  #gbm-format=xrgb2101010
> >>  require-input=false
> >> +idle-time=0
> >>
> >>  #[shell]
> >>  #background-image=/usr/share/backgrounds/gnome/Aqua.jpg
> >> --
> >> 2.28.0
> >>
> >>
> >> 
> >>
>

--000000000000ef8b8205b188ccad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It is however the upstream default, so changing it needs =
a proper explanation. Is it something beneficial for the majority of use ca=
ses?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Ale=C2=A0</div><div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tu=
e 13. Oct 2020 at 1.22, Alistair Francis &lt;<a href=3D"mailto:alistair23@g=
mail.com">alistair23@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On =
Mon, Oct 12, 2020 at 2:28 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Why?<br>
<br>
It&#39;s really annoying when you are working on something and the screen =
turns off.<br>
<br>
Alistair<br>
<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Mon, 12 Oct 2020 at 01:49, Alistair &lt;<a href=3D"mailto:alistair=
@alistair23.me" target=3D"_blank">alistair@alistair23.me</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair@al=
istair23.me" target=3D"_blank">alistair@alistair23.me</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-graphics/wayland/weston-init/weston.ini | 1 +<=
br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini=
 b/meta/recipes-graphics/wayland/weston-init/weston.ini<br>
&gt;&gt; index b48726d59c..d1532236af 100644<br>
&gt;&gt; --- a/meta/recipes-graphics/wayland/weston-init/weston.ini<br>
&gt;&gt; +++ b/meta/recipes-graphics/wayland/weston-init/weston.ini<br>
&gt;&gt; @@ -5,6 +5,7 @@<br>
&gt;&gt;=C2=A0 #shell=3Ddesktop-shell.so<br>
&gt;&gt;=C2=A0 #gbm-format=3Dxrgb2101010<br>
&gt;&gt;=C2=A0 require-input=3Dfalse<br>
&gt;&gt; +idle-time=3D0<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #[shell]<br>
&gt;&gt;=C2=A0 #background-image=3D/usr/share/backgrounds/gnome/Aqua.jpg<b=
r>
&gt;&gt; --<br>
&gt;&gt; 2.28.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
</blockquote></div></div>

--000000000000ef8b8205b188ccad--
