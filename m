Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web09.110.1615905386297647470
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 07:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G5R+muXk;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id p7so61223061eju.6
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 07:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5GQbLvQ2XMfoCEfz20nYXUTYL3difkE2uJKbVhrjCU0=;
        b=G5R+muXklv61S2YLOWPCsFzud7s5FKMe+UBwD41e2ZTuhGK2Fi10jzhSmMVduinpH5
         /3TC0SxmB77ROL5Fg20j5J9KyCCy/+HMjdcMnyiXS0CM4NYiQ4jfDVCo4J0lYVMfJAHL
         zI5MduWnO3EVkdi76SrXqEaOSor5VRwDN+I8/KIepbIkxJVWsRgHjZVT/dM6UD2WEADp
         IFGcpKJBRD5cZOXUjRQbmscPjdlumEWoET79LoD1DEYwKH3rs2kflF3eBTPDSm5+jdrX
         XAgz8acI6gosFzWdSttEqvS/Efpcz4WL0p8q0X7EPR4t9u6HX9iCg4jLyo098zAB4k6U
         Wtew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5GQbLvQ2XMfoCEfz20nYXUTYL3difkE2uJKbVhrjCU0=;
        b=DHeXh9dLBe7nxt+pAT3csY5SuD2YWoP84F8TOOI6jZKnH3UkeSprzXN/ZrHy/2BMOa
         cVpHbjQBPi2DmFE+JxjNPQBvLk3NlagVTNzLWQYero6mi2Jo/cP9xCELu1ilYWGhC7no
         yMsSyEk5hn3oUYP3KjJ4xMQFuyxGe5yJUqWe39Xyc0vbtBDspBFV5IfGULg0XYSWcaBL
         /EPRYrvD9o4+69ktgsiJGIMtxrowhpOooU99Cyv12Hg8QUuABS3+8i+BCULTz6R4SR54
         KYY2GhmLuLBpuCvc1p6SfbbUoqti1HOQa4Yzr8ZiGrkoJaqGaUKZs/ApGnXmxneh7jNz
         u+ng==
X-Gm-Message-State: AOAM532F3hpuh9cjBe4Dxrsr02Nu/QvsRQpFteXO2zEEJcyKoE9mbnIn
	l/yV6n82JZphUnaTzrH90r3nmD/OU0uN+EphWo8=
X-Google-Smtp-Source: ABdhPJxkBO6w7GPsKT9Jt+iB3IJfeHBuvheR6MpYhj5esYwIbO63meyE0Zr/VS76JwMH8BfweroyQWs0grYkmAiJiVw=
X-Received: by 2002:a17:907:f97:: with SMTP id kb23mr29750334ejc.33.1615905384767;
 Tue, 16 Mar 2021 07:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <JR2X.1615680903774027513.CgiZ@lists.openembedded.org> <faf97fd0-5d5c-d30b-6871-4d2b7d2ed93a@windriver.com>
In-Reply-To: <faf97fd0-5d5c-d30b-6871-4d2b7d2ed93a@windriver.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 16 Mar 2021 14:36:28 +0000
Message-ID: <CANPvuRkCaWA0CsA1NPVF6txoZZSGAdtL7si=_xfsKyNNPNB-bg@mail.gmail.com>
Subject: Re: [OE-core] Gstreamer
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: manoun92@gmail.com, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007326e705bda84a6d"

--0000000000007326e705bda84a6d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You can try to add the meta-gstreamer layer that have a more recent version
of gstreamer
https://github.com/OSSystems/meta-gstreamer1.0

Randy MacLeod <randy.macleod@windriver.com> escreveu no dia domingo,
14/03/2021 =C3=A0(s) 15:53:

> On 2021-03-13 7:15 p.m., manoun92@gmail.com wrote:
> > Hello, can anyone please tell me how can I add a recipe to my image
> > without it being avaliable in Openembedded? I want to add Gstreamer fr=
om
> > git and not the 1.14.1 version avaliable on openembedded(warrior)
> >
> > Thanks!
>
> Can you just clone the recipe and change it to fetch from git?
>
> https://stackoverflow.com/questions/49535881/how-to-setup-an-yocto-recip=
e-to-build-from-a-local-git-source
>
> ../Randy
>
> >
> >
> >
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>=20
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000007326e705bda84a6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You can try to add the meta-gstreamer layer that have=
 a more recent version of gstreamer<br></div><div><a href=3D"https://github=
.com/OSSystems/meta-gstreamer1.0">https://github.com/OSSystems/meta-gstream=
er1.0</a></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windrive=
r.com">randy.macleod@windriver.com</a>&gt; escreveu no dia domingo, 14/03/2=
021 =C3=A0(s) 15:53:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 2021-03-13 7:15 p.m., <a href=3D"mailto:manoun92@gmail.com" target=
=3D"_blank">manoun92@gmail.com</a> wrote:<br>
&gt; Hello, can anyone please tell me how can I add a recipe to my image <=
br>
&gt; without it being avaliable in Openembedded? I want to add Gstreamer f=
rom <br>
&gt; git and not the 1.14.1 version avaliable on openembedded(warrior)<br>
&gt; <br>
&gt; Thanks!<br>
<br>
Can you just clone the recipe and change it to fetch from git?<br>
<a href=3D"https://stackoverflow.com/questions/49535881/how-to-setup-an-yo=
cto-recipe-to-build-from-a-local-git-source" rel=3D"noreferrer" target=3D"_=
blank">https://stackoverflow.com/questions/49535881/how-to-setup-an-yocto-r=
ecipe-to-build-from-a-local-git-source</a><br>
<br>
../Randy<br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma<=
/div></div></div>

--0000000000007326e705bda84a6d--
