Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.3936.1602617882503921336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 12:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tu9IuFyt;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id c13so724469qtx.6
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 12:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YhaYePzS71VA/3pFizLOHpoIoHCvUODVMGGYgzSak/0=;
        b=tu9IuFytGnhzaPc/lEI33VUtXx/h2euFdFAc+9qjm8u8+w1dEkR031r6NAKGzcBeZ5
         U8FUTVxbXZqvrGDb1zq/rSs7vDA1o8wwPc4Qyg+neMp9AEk7Yb9qfkWeGwjbKWxGwZ8r
         Eid7MLLVgEi91CyPu6bB4VvyQ7SKsPU4RNNbGDJeGFCC06r/hz58hDG51En4TCx5mZHr
         pWWeEimLUzdPZfL3xiiqZYEZwMiEKW+J3La/rKiBKGBRfK7VoFBBDGXC8Fv5rLBXu6YS
         3gfFnjBehRAEjtBMAmHMaJ5vE5gQ9wq37AmykmM4gUlt5rsfS+9cizEyuKXXuTqjwDub
         sxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YhaYePzS71VA/3pFizLOHpoIoHCvUODVMGGYgzSak/0=;
        b=KX6LY3Jvw+raFDz+aEvlR5fvNX39cawDz6su12ol84xS88kzdIUu04ls0B69qcoQHl
         kl74yuhFzO/lxbXK4RLZFyCiHCeDUKOcqVrRamA33U3stcryOLx0sIRKugaiisLNTNkI
         W3YrDDzQHV2OaA6j1Jf5aj3p7xfqdpwhBSAi6ffOdgjBXoopUDi+TQ+LbCl8SkpWD3Yk
         44J2GmbEHkb+nz/UkfHu/avWAPHtb62WXAYNUXzQZ637WiWv/skFwx1FThFu1EpqP+dB
         MjHPO5dnVMRxmuS9zF1hxYhE9xRCSH6ZdCZC16nZacP/SkqVNUCTX1xUkoZ0VHEozfJp
         Z5Xg==
X-Gm-Message-State: AOAM532Rkq27NcMaDsjuorO+3ExYo0jHzeUbEV4C+iNJRwGw5bqe9aJf
	gyllMYua5UIaV5NcBx2fbhU3Q11d32tGb5DUv4I=
X-Google-Smtp-Source: ABdhPJzkP8G50h8cueBrt9U/NoUBdCXMYqOMsfkxOlNmo9AKGgAAGF1sjDwFr5YvoF3fzUTd2+psknfYt5LKmwwY6SY=
X-Received: by 2002:ac8:5a82:: with SMTP id c2mr1358084qtc.378.1602617881400;
 Tue, 13 Oct 2020 12:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201011234937.1041597-1-alistair@alistair23.me>
 <CANNYZj82hb4PyrQYd_SWQVkbEvitomqBmkiOpecvM4o=rTyQ7w@mail.gmail.com>
 <CAKmqyKMO_dwh=q5+0kdAPR2a0QhkYSSopvsWbSD-eQMPXybsFw@mail.gmail.com> <CANNYZj-zkwn1DrhXZJYZ6-=7AL7U5BLxYpn=dj=BUrJ12Ap97Q@mail.gmail.com>
In-Reply-To: <CANNYZj-zkwn1DrhXZJYZ6-=7AL7U5BLxYpn=dj=BUrJ12Ap97Q@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 13 Oct 2020 12:37:50 -0700
Message-ID: <CAMKF1soucN5ivo2QVOk9UT8LF=ferEeUEeX77_bDgTmo3gwzKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wayland: Set idle-time to zero
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alistair <alistair@alistair23.me>, Alistair Francis <alistair23@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000881ade05b1928d45"

--000000000000881ade05b1928d45
Content-Type: text/plain; charset="UTF-8"

These is no one answer some use cases it is perhaps to keep it always on eg
kiosk kind of devices and for some it may not be eg video player etc

A nicer solution would be turn it into a knob with default perhaps to keep
it default but an easy way to override it when needed perhaps via
packageconfig


On Tue, Oct 13, 2020 at 1:00 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> It is however the upstream default, so changing it needs a proper
> explanation. Is it something beneficial for the majority of use cases?
>
> Ale
>
> On Tue 13. Oct 2020 at 1.22, Alistair Francis <alistair23@gmail.com>
> wrote:
>
>> On Mon, Oct 12, 2020 at 2:28 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > Why?
>>
>> It's really annoying when you are working on something and the screen
>> turns off.
>>
>> Alistair
>>
>> >
>> > Alex
>> >
>> > On Mon, 12 Oct 2020 at 01:49, Alistair <alistair@alistair23.me> wrote:
>> >>
>> >> Signed-off-by: Alistair Francis <alistair@alistair23.me>
>> >> ---
>> >>  meta/recipes-graphics/wayland/weston-init/weston.ini | 1 +
>> >>  1 file changed, 1 insertion(+)
>> >>
>> >> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini
>> b/meta/recipes-graphics/wayland/weston-init/weston.ini
>> >> index b48726d59c..d1532236af 100644
>> >> --- a/meta/recipes-graphics/wayland/weston-init/weston.ini
>> >> +++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
>> >> @@ -5,6 +5,7 @@
>> >>  #shell=desktop-shell.so
>> >>  #gbm-format=xrgb2101010
>> >>  require-input=false
>> >> +idle-time=0
>> >>
>> >>  #[shell]
>> >>  #background-image=/usr/share/backgrounds/gnome/Aqua.jpg
>> >> --
>> >> 2.28.0
>> >>
>> >>
>> >>
>> >>
>>
>
> 
>
>

--000000000000881ade05b1928d45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div dir=3D"auto">These is no one answer some use cases it i=
s perhaps to keep it always on eg kiosk kind of devices and for some it may=
 not be eg video player etc=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=
=3D"auto">A nicer solution would be turn it into a knob with default perha=
ps to keep it default but an easy way to override it when needed perhaps vi=
a packageconfig=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><b=
r><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, Oct 13, 2020 at 1:00 AM Alexander Kanavin &lt;<a href=3D"mailt=
o:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div dir=3D"auto">It is however the upstream d=
efault, so changing it needs a proper explanation. Is it something benefici=
al for the majority of use cases?</div><div dir=3D"auto"><br></div><div dir=
=
=3D"auto">Ale=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue 13. Oct 2020 at 1.22, Alistair Francis &lt;=
<a href=3D"mailto:alistair23@gmail.com" target=3D"_blank">alistair23@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-=
left:1ex;border-left-color:rgb(204,204,204)">On Mon, Oct 12, 2020 at 2:28 A=
M Alexander Kanavin<br>
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
<br>
<br>
<br>
</blockquote></div></div>

--000000000000881ade05b1928d45--
