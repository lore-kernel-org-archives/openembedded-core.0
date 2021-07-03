Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.23656.1625326414344806118
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Jul 2021 08:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QJGKEElp;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: tolvupostur@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id f30so23963010lfj.1
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Jul 2021 08:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zlb0zCmoBI2Ch4ksC5hJKSULZoq+Pi5UNDME4/YsPpY=;
        b=QJGKEElp1+BoYG72LHx5FnpfEL8dfJgZmiL0L2ROnwkInJdne0bV5lIf6WqBDqHx8/
         FnjCU212vD2RDUH+aiEn/dEslfgH697tsT44/o/qd7kUG452W3lmVXaRRJyU3jUyohYX
         TTCGAtnCe5u84TT3bXR2K/7cwEBre79oAa3fC+3bHdHkCKqkRBmvpJSnvrjISKCWt9Nd
         25BfsyHxoabS09qtld+RGB22Qi8X0LcHxGf34RDWEfs7b3+t/cPMgFsZWQgVqtHbqWDn
         8yep+uCBM0xXFF85bF8rqEeLfI2qOn/JqsZr+YMPLMeLMXV/07yWdpGpjgP7U7jQ1TiU
         5+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zlb0zCmoBI2Ch4ksC5hJKSULZoq+Pi5UNDME4/YsPpY=;
        b=skMV+7uZqtIcN+zUxaMW39W9rFRV5sv7E7XMP/th+oemN8HN8pRoUH0waKzZXBZij6
         /ybH+WqEICGzLC4ph/WL2zlFLZ9an5NKL92OPfxlx2IbosJ3BIWo93vcLLopYAC7zCjR
         J2sWc/yEORCD/SFrZbTYAw56Q8HqWMqhmIOWGOM/mSRlX25XJNsrC3X46jm1nSPZ0pjR
         waMK+JjSxba8jo/hKkVMB2Cc6DwG5iycCt0QLQJRbnXfmVjL59FPAHhdokqUjGifXEal
         wteAp3enh7fbJ6LBSabmFWy7JTZ7Qtv1eH+XGuatZvYhHXKxO39Z1rwKCf7ct0QYg7Qy
         YHTg==
X-Gm-Message-State: AOAM5314aiR1kU7oKQKHh7liZjdZVdd0ifZavalfxAmw2W4xQJPq762T
	SaimqTJ5VerzTpkAOCD2xtb79gWmp6JaboKFnjs=
X-Google-Smtp-Source: ABdhPJx5ujZ4PgWM6aBtOuq+v7fwiXb8dRnYhfe5ZWIQxC0WnmTeuBjQUDb2T2bjMwJfouuVoFtol1trMCpfuq7O2vs=
X-Received: by 2002:a05:6512:3da0:: with SMTP id k32mr3822756lfv.568.1625326412474;
 Sat, 03 Jul 2021 08:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <168DFB55CCAE8B91.30759@lists.openembedded.org>
 <CABhNV22NUYR0EU4Dr4zPKoNPcEK-QcOPZNWaTe8fWsGZrJnKFQ@mail.gmail.com> <YN+JKnHwZ1WCkArT@piout.net>
In-Reply-To: <YN+JKnHwZ1WCkArT@piout.net>
From: "Einar Gunnarsson" <tolvupostur@gmail.com>
Date: Sat, 3 Jul 2021 17:33:21 +0200
Message-ID: <CABhNV21nkHkQf3DrmZtc2fh+xMTxc5_0yFMG_cjbYdH77bhbBg@mail.gmail.com>
Subject: Re: [OE-core] [update-rc.d][PATCH] update-rc.d: Fix enable/disable command
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000075ab6705c639cb6a"

--00000000000075ab6705c639cb6a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok.
I messed up the prefix, so the mail is separate...
https://lists.openembedded.org/g/openembedded-core/message/153509

On Fri, 2 Jul 2021 at 23:46, Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> On 02/07/2021 15:57:03+0200, Einar Gunnarsson wrote:
> > I forgot the third error in this line:
> > Links numbered 91 or higher will create a single digit link.
> >
> > # update-rc.d -v  -n smack disable
> > rename /etc/rc2.d/S91smack -> /etc/rc2.d/K9smack
> >
> > I guess this fixes all three:
> >
> > printf -v newnn "%02d" $((100-${oldnn#0}))
> >
> > How do I resubmit a patch?
> >
>
> Simply send the new patch with [PATCH v2] instead of [PATCH].
>
> >
> > On Fri, 2 Jul 2021 at 15:10, Einar Gunnarsson via lists.openembedded.o=
rg
> > <tolvupostur=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > > $[] is a bashism and does not work on POSIX shells
> > >
> > > enable/disable on links numbered 08 and 09 gives the error:
> > > 'bash: 100-08: value too great for base (error token is "08")'
> > >
> > > Signed-off-by: Einar Gunnarsson <tolvupostur@gmail.com>
> > > ---
> > >  update-rc.d | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/update-rc.d b/update-rc.d
> > > index c9355d7..24ac752 100644
> > > --- a/update-rc.d
> > > +++ b/update-rc.d
> > > @@ -114,7 +114,7 @@ renamelink()
> > >          # or stop link to start link with a sequence number equal t=
o
> the
> > > difference of 100 minus the original sequence number.
> > >         if ls ${etcd}${lev}.d/${oldstartstop}*${bn} >/dev/null 2>&1;
> then
> > >                 oldnn=3D`basename
> ${etcd}${lev}.d/${oldstartstop}*${bn}|cut
> > > -c2-3`
> > > -               newnn=3D$[100-$oldnn]
> > > +               newnn=3D$((100-${oldnn#0}))
> > >                 [ $verbose -eq 1 ] && echo "rename
> > > ${etcd}${lev}.d/${oldstartstop}${oldnn}${bn} ->
> > > ${etcd}${lev}.d/${newstartstop}${newnn}${bn}"
> > >                 if [ $notreally -eq 0 ];then
> > >                         mv ${etcd}${lev}.d/${oldstartstop}${oldnn}${=
bn}
> > > ${etcd}${lev}.d/${newstartstop}${newnn}${bn}
> > > --
> > > 2.17.1
> > >
> > >
> > >
> > >
> > >
> >
> > --
> > Regards
> > Einar J=C3=B3n
> > +31 610 957234
>
> >
> >=20
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Regards
Einar J=C3=B3n
+31 610 957234

--00000000000075ab6705c639cb6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok.=C2=A0<br>I messed up the prefix, so the mail is separa=
te...<br><a href=3D"https://lists.openembedded.org/g/openembedded-core/mess=
age/153509">https://lists.openembedded.org/g/openembedded-core/message/1535=
09</a><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Fri, 2 Jul 2021 at 23:46, Alexandre Belloni &lt;<a href=3D"mai=
lto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 02/07/20=
21 15:57:03+0200, Einar Gunnarsson wrote:<br>
&gt; I forgot the third error in this line:<br>
&gt; Links numbered 91 or higher will create a single digit link.<br>
&gt; <br>
&gt; # update-rc.d -v=C2=A0 -n smack disable<br>
&gt; rename /etc/rc2.d/S91smack -&gt; /etc/rc2.d/K9smack<br>
&gt; <br>
&gt; I guess this fixes all three:<br>
&gt; <br>
&gt; printf -v newnn &quot;%02d&quot; $((100-${oldnn#0}))<br>
&gt; <br>
&gt; How do I resubmit a patch?<br>
&gt; <br>
<br>
Simply send the new patch with [PATCH v2] instead of [PATCH].<br>
<br>
&gt; <br>
&gt; On Fri, 2 Jul 2021 at 15:10, Einar Gunnarsson via <a href=3D"http://l=
ists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembed=
ded.org</a><br>
&gt; &lt;tolvupostur=3D<a href=3D"mailto:gmail.com@lists.openembedded.org"=
 target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; $[] is a bashism and does not work on POSIX shells<br>
&gt; &gt;<br>
&gt; &gt; enable/disable on links numbered 08 and 09 gives the error:<br>
&gt; &gt; &#39;bash: 100-08: value too great for base (error token is &quo=
t;08&quot;)&#39;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Einar Gunnarsson &lt;<a href=3D"mailto:tolvupostu=
r@gmail.com" target=3D"_blank">tolvupostur@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 update-rc.d | 2 +-<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/update-rc.d b/update-rc.d<br>
&gt; &gt; index c9355d7..24ac752 100644<br>
&gt; &gt; --- a/update-rc.d<br>
&gt; &gt; +++ b/update-rc.d<br>
&gt; &gt; @@ -114,7 +114,7 @@ renamelink()<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # or stop link to start link w=
ith a sequence number equal to the<br>
&gt; &gt; difference of 100 minus the original sequence number.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ls ${etcd}${lev}.d/${oldstar=
tstop}*${bn} &gt;/dev/null 2&gt;&amp;1; then<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old=
nn=3D`basename ${etcd}${lev}.d/${oldstartstop}*${bn}|cut<br>
&gt; &gt; -c2-3`<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newnn=3D=
$[100-$oldnn]<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newnn=3D=
$((100-${oldnn#0}))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ $=
verbose -eq 1 ] &amp;&amp; echo &quot;rename<br>
&gt; &gt; ${etcd}${lev}.d/${oldstartstop}${oldnn}${bn} -&gt;<br>
&gt; &gt; ${etcd}${lev}.d/${newstartstop}${newnn}${bn}&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if =
[ $notreally -eq 0 ];then<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${etcd}${lev}.d/${oldstartstop}${oldnn}${bn}=
<br>
&gt; &gt; ${etcd}${lev}.d/${newstartstop}${newnn}${bn}<br>
&gt; &gt; --<br>
&gt; &gt; 2.17.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; <br>
&gt; -- <br>
&gt; Regards<br>
&gt; Einar J=C3=B3n<br>
&gt; +31 610 957234<br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https=
://bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">Regards<br>Einar J=C3=B3n<br>+31 610 957234</di=
v>

--00000000000075ab6705c639cb6a--
