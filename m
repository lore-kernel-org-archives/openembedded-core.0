Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web12.18341.1604082501167869979
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 11:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fh+EFFpU;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id x11so2016733uav.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 11:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RZCD352CnMV9PfXC8zik6jd2N8wkiyvFtgJ+HKyqAfg=;
        b=Fh+EFFpU5W1J4T0gLCJF8RSZ8dqrQF8Ou3fTAvqor5fBgFgyBk+FaM4raiAw0GcxuX
         2+SsVp06qSiLPAOnxmTxlWEfF/OeXTGj54VRM6QvLjJq65mO1vJU4IPt8leN5/tMvRIG
         xgmvLhn06AKYQa2Nxk1JgUNJRWIzjaZcYY97Y/ZpoUZInzxElyQWIkoG/TrWxlYmwIcv
         rnKf3fe1ZQL3K+qAquluy1PkDIQTUG/PQz0XLpZBV7QHHietNVPbPfx4zw/xaLcM2rYv
         9HAKI6tEYl/BIMcODErlQzWclxbaS7QkWvkIvlpLnA6VDRoY3dpFbUm4+duCWEpIEO3M
         RtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RZCD352CnMV9PfXC8zik6jd2N8wkiyvFtgJ+HKyqAfg=;
        b=PaLjz7nniGaOCtsY4t3nvwQc+JQaydAU8J9xmuvL8Tkhg91SMPWI+ZuNT+vQUCsew7
         Ii7uvgQ5AJV07BotRmcP/5h6rN87/6jVDrJM2b8EFKvJsWjMbqrVbmeghKj2f3YjDDD0
         ObDoM9ubZ12wH6h4pwyqYqQ7ywSBgHXrpzygjBNJSu9FDok5qvQiGWujmhl3RLMS6vAh
         ivcDuapZhl9fO6ikw4hODAF6jsDiUGA3Sjz7au4oHAvR/GtpelynSo5s/KeGnZtIfprD
         IKicaSJoVLVK2orGiExF4/HOpKWtJfuYw0dF9ZfNL0QQ8Pjc5R6ybxfGOI/0p2/Qw8qp
         X3iQ==
X-Gm-Message-State: AOAM5326+e3MNvUuUwP7KGh5k75da6yka7jmcYN3cUJWaSRPjxDnkeG1
	ulWNlrxqVTcRy10huRfMEMbPWbWK011NoQLzfKw=
X-Google-Smtp-Source: ABdhPJz5DT2mb6rfdrzbUzjRRNS7k9YdvaT5lHqIXSUZJvTH+r+UUHDdb24UoF0ltTXwu20UggLDcUwmkWasmbC1Sbs=
X-Received: by 2002:ab0:22d1:: with SMTP id z17mr2547809uam.22.1604082500316;
 Fri, 30 Oct 2020 11:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
 <20201029142806.1830504-6-quaresma.jose@gmail.com> <88cd1831e021c2384219da4223981fa004551498.camel@linuxfoundation.org>
 <1642964F5C513D13.27950@lists.openembedded.org> <1642987B07D196A5.27950@lists.openembedded.org>
 <CANPvuRkKDPM8h5d8wjzdvQ95vY_kYHXkxvW0Uvqw8rTYj0yWCQ@mail.gmail.com>
 <f5f3fe375a9174e401c283431de0fca1634539a1.camel@linuxfoundation.org>
 <1642D6DB2EF0C3ED.10902@lists.openembedded.org> <CANPvuRnjYPZabjLDTW7rttaaH6qUW7sV_ZEyS31bGZHsZHjXsQ@mail.gmail.com>
In-Reply-To: <CANPvuRnjYPZabjLDTW7rttaaH6qUW7sV_ZEyS31bGZHsZHjXsQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 30 Oct 2020 19:28:08 +0100
Message-ID: <CANNYZj8kDD=1rWuzA9=rV5f=1Ed+xuFwR7HU5wTeve56KRdY2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 05/22] gstreamer1.0-plugins-good: upgrade to version 1.18.0
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009f30df05b2e78f02"

--0000000000009f30df05b2e78f02
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Since the patches are already in master-next, and will likely not cause any
problems, maybe it's easier to create small followup patches, and send the=
m
once the main set merges, instead of sending a massive full set again.

Alex

On Fri, 30 Oct 2020 at 19:23, Jose Quaresma <quaresma.jose@gmail.com> wrot=
e:

> Hi Richard,
>
> I see your fix:
>
> -PACKAGECONFIG[asm] =3D "-Dasm=3Denabled,-Dasm=3Ddisabled,nasm"
> +PACKAGECONFIG[asm] =3D "-Dasm=3Denabled,-Dasm=3Ddisabled,nasm nasm-nati=
ve"
>
> and only nasm-native is needed,
> because nasm is not needed on target and it's only needed at build time.
>
> I can fix it and send v6 series and I have another fix for this series
> that remove
> 0004-capfix.patc in gstreamer1.0: upgrade to version 1.18.0
> What do you think?
>
> I hope this is the last version and I will be more careful next time I
> submit a big patch series.
>
> Jose Quaresma via lists.openembedded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
> sexta, 30/10/2020 =C3=A0(s) 17:57:
> >
> > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> > sexta, 30/10/2020 =C3=A0(s) 17:45:
> > >
> > > On Fri, 2020-10-30 at 16:47 +0000, Jose Quaresma wrote:
> > > > nasm is present on sysroot
> > > >
> > > > The build log
> > > > https://errors.yoctoproject.org/Errors/Details/510826/
> > > >
> > > > Countain:
> > > >
> > > > NOTE: Direct dependencies are:
> > > > '/home/pokybuild/yocto-worker/qemux86-64-ltp/build/meta/recipes-
> > > > devtools/nasm/nasm_2.15.05.bb:do_populate_sysroot'
> > > >
> > > > NOTE: Skipping as already exists in sysroot:
> > > > 'nasm'
> > > >
> > > > I don't have a build it on qemux86-64 and only build on arm
> > > > and on arm it is builded without nasm because -Dasm=3Ddisabled
> > > > Otherwise I think everything is correct with this patch
> > >
> > > I was able to reproduce by building qemux86-64, it readily fails. Th=
e
> > > issue is that it needs nasm-native. If I add nasm-native to the
> > > dependency line it seems to build fine.
> >
> > Big mistake and I don't see it, of course it was the native nasm that
> > is needed to build.
> > Sorry for that and thanks for looking into this.
> >
> > >
> > > I'll add that and retest on the autobuilder. If that works I'll squa=
sh
> > > it in.
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> >
> >
> > --
> > best regards,
> > Jos=C3=A9 Quaresma
> >
> >
> >
>
>
> --
> best regards,
> Jos=C3=A9 Quaresma
>
>=20
>
>

--0000000000009f30df05b2e78f02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Since the patches are already in master-next, and wil=
l likely not cause any problems, maybe it&#39;s easier to create small foll=
owup patches, and send them once the main set merges, instead of sending a =
massive full set again.</div><div><br></div><div>Alex<br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 30 O=
ct 2020 at 19:23, Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.c=
om">quaresma.jose@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Hi Richard,<br>
<br>
I see your fix:<br>
<br>
-PACKAGECONFIG[asm] =3D &quot;-Dasm=3Denabled,-Dasm=3Ddisabled,nasm&quot;<=
br>
+PACKAGECONFIG[asm] =3D &quot;-Dasm=3Denabled,-Dasm=3Ddisabled,nasm nasm-n=
ative&quot;<br>
<br>
and only nasm-native is needed,<br>
because nasm is not needed on target and it&#39;s only needed at build tim=
e.<br>
<br>
I can fix it and send v6 series and I have another fix for this series<br>
that remove<br>
0004-capfix.patc in gstreamer1.0: upgrade to version 1.18.0<br>
What do you think?<br>
<br>
I hope this is the last version and I will be more careful next time I<br>
submit a big patch series.<br>
<br>
Jose Quaresma via <a href=3D"http://lists.openembedded.org" rel=3D"norefer=
rer" target=3D"_blank">lists.openembedded.org</a><br>
&lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" ta=
rget=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; escreveu no dia<br=
>
sexta, 30/10/2020 =C3=A0(s) 17:57:<br>
&gt;<br>
&gt; Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; escreveu n=
o dia<br>
&gt; sexta, 30/10/2020 =C3=A0(s) 17:45:<br>
&gt; &gt;<br>
&gt; &gt; On Fri, 2020-10-30 at 16:47 +0000, Jose Quaresma wrote:<br>
&gt; &gt; &gt; nasm is present on sysroot<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The build log<br>
&gt; &gt; &gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/5=
10826/" rel=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.or=
g/Errors/Details/510826/</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Countain:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; NOTE: Direct dependencies are:<br>
&gt; &gt; &gt; &#39;/home/pokybuild/yocto-worker/qemux86-64-ltp/build/meta=
/recipes-<br>
&gt; &gt; &gt; devtools/nasm/<a href=3D"http://nasm_2.15.05.bb" target=3D"=
_blank">nasm_2.15.05.bb</a>:do_populate_sysroot&#39;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; NOTE: Skipping as already exists in sysroot:<br>
&gt; &gt; &gt; &#39;nasm&#39;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I don&#39;t have a build it on qemux86-64 and only build on=
 arm<br>
&gt; &gt; &gt; and on arm it is builded without nasm because -Dasm=3Ddisab=
led<br>
&gt; &gt; &gt; Otherwise I think everything is correct with this patch<br>
&gt; &gt;<br>
&gt; &gt; I was able to reproduce by building qemux86-64, it readily fails=
. The<br>
&gt; &gt; issue is that it needs nasm-native. If I add nasm-native to the<=
br>
&gt; &gt; dependency line it seems to build fine.<br>
&gt;<br>
&gt; Big mistake and I don&#39;t see it, of course it was the native nasm =
that<br>
&gt; is needed to build.<br>
&gt; Sorry for that and thanks for looking into this.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ll add that and retest on the autobuilder. If that works I=
&#39;ll squash<br>
&gt; &gt; it in.<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt;<br>
&gt; &gt; Richard<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; best regards,<br>
&gt; Jos=C3=A9 Quaresma<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
best regards,<br>
Jos=C3=A9 Quaresma<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000009f30df05b2e78f02--
