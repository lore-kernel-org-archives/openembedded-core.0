Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.12673.1601462978195614530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 03:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OANsF5cq;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id z23so2056798ejr.13
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 03:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0HjwWvkOEZ2Il6K9AZI5LvdjY2tJWTuAFNv9JnoR6xs=;
        b=OANsF5cqsKEWYnmEdepehvdyst2kDqbcn7nZUQnxZH7DYwZk1bxZceHRieOJnoa33Y
         +dSjFzY9nN3+/Ai1hZPlEsIq2FYLqcwc8zWmxYYoO1NJMfVTBuSlRyUH4Ofl3Zc5e9ov
         LqfyIIcmdcGBIzSET/AjXIJGZS2Cturz9XL+f3H55AN02fO5JBg2VY8ERvJjJ9JYpPzJ
         f1lm4yfCu763T85aAPv2hi/uIehjY4Uz64IE5j60iTN1XBQ5gLH62a/U5BudAqo2aYVp
         4wX69h9uvTIfawo115ajDhopvAyiEMLKyrbpe9OYC4/yL5djdnFUFqKPe+nCIVdtWecX
         jJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0HjwWvkOEZ2Il6K9AZI5LvdjY2tJWTuAFNv9JnoR6xs=;
        b=AIY33/jAIZEqxVH8ii5UGSbBidvyCbiwYJ0rCyRk7hgMcKjkZg/6U8XdulPFTQNFWA
         MIqedxMWoPiz6R92htdapIl9V33dJXiMZsOD1aIHvJjVWtEPF7TdT0sAoxfe5I9T9H7C
         VPJAgxmZaNDz3F+oIJuPDS6wlQH385Ib+mMiv+WRoqcgDQ7oNSgDXIoFOEb4aZArTNa+
         9NNDhx9Ihm5Sa/qEIQHCC4djiJhdLchFUyf1v/JgwnakbFy8oWLDVd1JZz2DjLWIqmiS
         fswfr8E2OE0wsFAxIOmn02M2fseLWdj0KH9UMXJ0/Pp+NHKkaPCZMVjRDSuPWxlpGRWU
         +hxA==
X-Gm-Message-State: AOAM532XG4j2kbAHyHT4mHlgoKuwlCmmrkJG1OOSQ/rAeuYnJ2J+E7Kk
	s63SS5eHojLXcWNFUXxVRQcBv4vRHQFXUn4WiaA=
X-Google-Smtp-Source: ABdhPJxnYzVBQrLmQI25wt/5DFAnMhXiQoxxgqZTkfcVLhFxf1UUwT/Ak8/bkF3ipKKPg11NLj6Udv2lTyt/lbozoT0=
X-Received: by 2002:a17:906:9245:: with SMTP id c5mr2284782ejx.54.1601462976549;
 Wed, 30 Sep 2020 03:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <A24DC035FE5F8F4BAE7F63FB1B07D7BC392FA16E@SRV24.hamburg.garz-fricke.de>
 <CAHtQpK7FZk6ZxmkiX30Mm2hg654rw=w9Wpb7-Sgvok+BwWEFPg@mail.gmail.com>
 <163806DA121A433C.4559@lists.openembedded.org> <16392EB84BD69824.17908@lists.openembedded.org>
 <A24DC035FE5F8F4BAE7F63FB1B07D7BC392FAF2C@SRV24.hamburg.garz-fricke.de>
In-Reply-To: <A24DC035FE5F8F4BAE7F63FB1B07D7BC392FAF2C@SRV24.hamburg.garz-fricke.de>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 30 Sep 2020 12:49:25 +0200
Message-ID: <CA+chaQdGpAZGYUfa9RXO6PZpREH10jyAhZz-DatKpvwcvsVCjw@mail.gmail.com>
Subject: Re: [OE-core][Patch] sstate.bbclass: Check file ownership before doing 'touch -a'
To: Norman <norman.stetter@garz-fricke.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d698cd05b085a79b"

--000000000000d698cd05b085a79b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It was merged 2 days ago:
https://git.openembedded.org/openembedded-core/commit/?id=3Df1554e8bd40c64=
0fd58daac18ecf7b458e754109

On Wed, Sep 30, 2020 at 9:17 AM Norman <norman.stetter@garz-fricke.com>
wrote:

> I would be happy to get some feedback on this patch.
>
> Cheers,
>
> Norman
>
> > -----Urspr=C3=BCngliche Nachricht-----
> > Von: openembedded-core@lists.openembedded.org
> > [mailto:openembedded-core@lists.openembedded.org] Im Auftrag von
> > Norman
> > Gesendet: Tuesday, September 29, 2020 8:55 AM
> > An: Andrey Zhizhikin <andrey.z@gmail.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Betreff: Re: [OE-core][Patch] sstate.bbclass: Check file ownership bef=
ore
> > doing 'touch -a'
> >
> > I went through it again:
> >
> > The SSTATE_DIR is set to my local build dir inside my home dir. All
> files here
> > are owned by me.
> > The SSTATE_MIRRORS is set to a locally mounted shared sstate-cache. Fi=
les
> > here are owned by my group, but not my user.
> >
> > All *.siginfo files in the SSTATE_DIR are symlinks to the respective
> files in the
> > SSTATE_MIRRORS dir.
> >
> > The sstate_unpack_package function gets run for every *.siginfo file i=
n
> > SSTATE_DIR.
> > If the ${SSTATE_PKG}.siginfo file already exists and is a symlink it's
> atime is
> > updated (line 850), this affects the destination file of the symlink i=
n
> > SSTATE_MIRRORS, since the --no-dereference switch is not used. The
> > comment in line 849 confirms this is meant to set atime for "local/NFS
> > mirror". But it being a mirror one cannot expect the user running
> bitbake to
> > be the file owner.
> >
> > So in my opinion the proposed patch makes sense.
> >
> >
> > > -----Urspr=C3=BCngliche Nachricht-----
> > > Von: openembedded-core@lists.openembedded.org
> > > [mailto:openembedded-core@lists.openembedded.org] Im Auftrag von
> > > Norman
> > > Gesendet: Friday, September 25, 2020 2:33 PM
> > > An: Andrey Zhizhikin <andrey.z@gmail.com>
> > > Cc: openembedded-core@lists.openembedded.org
> > > Betreff: Re: [OE-core][Patch] sstate.bbclass: Check file ownership
> > > before doing 'touch -a'
> > >
> > > We do use SSTATE_MIRROR, pointing to a locally mounted drive that ge=
ts
> > > populated by CI-builds:
> > >
> > > SSTATE_MIRRORS =3D "file://.* file:///var/cache/yocto/sstate-cache/P=
ATH"
> > >
> > >
> > >
> > > > -----Urspr=C3=BCngliche Nachricht-----
> > > > Von: Andrey Zhizhikin [mailto:andrey.z@gmail.com]
> > > > Gesendet: Friday, September 25, 2020 2:27 PM
> > > > An: Norman Stetter <Norman.Stetter@garz-fricke.com>
> > > > Cc: openembedded-core@lists.openembedded.org
> > > > Betreff: Re: [OE-core][Patch] sstate.bbclass: Check file ownership
> > > > before doing 'touch -a'
> > > >
> > > > On Fri, Sep 25, 2020 at 2:19 PM Norman
> > > > <norman.stetter@garz-fricke.com>
> > > > wrote:
> > > > >
> > > > > From cd51db253c1a81e47532f1afacce385e422d9a73 Mon Sep 17
> > 00:00:00
> > > > 2001
> > > > > From: Norman Stetter <norman.stetter@garz-fricke.com>
> > > > > Date: Fri, 25 Sep 2020 13:49:43 +0200
> > > > > Subject: sstate.bbclass: Check file ownership before doing 'touc=
h
> -a'
> > > > >
> > > > > In contrast to 'touching' a file without parameters 'touch -a' c=
an
> > > > > only be performed by the file owner. In case of a shared
> > > > > sstate-cache served locally (e.g. over NFS),  where the user
> > > > > running bitbake is not the owner of sstate-cache files, even if =
he
> > > > > has write access on group level, the sstate_unpack_package task
> will
> > fail.
> > > >
> > > > Isn't the whole intention of using SSTATE_MIRROR to cover exactly
> > > > those cases? I do not think that reusing sstate between different
> > > > builders via NFS is a proper way to go.
> > > >
> > > > > Checking if the file is owned by the user before attempting to r=
un
> > > > > 'touch -a' on it solves this.
> > > > >
> > > > > Signed-off-by: Norman Stetter <norman.stetter@garz-fricke.com>
> > > > > ---
> > > > >  meta/classes/sstate.bbclass | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta/classes/sstate.bbclass
> > > > > b/meta/classes/sstate.bbclass index 375196ef21..66a96a7603 10064=
4
> > > > > --- a/meta/classes/sstate.bbclass
> > > > > +++ b/meta/classes/sstate.bbclass
> > > > > @@ -847,7 +847,7 @@ python sstate_report_unihash() {
> > > > > sstate_unpack_package () {
> > > > >         tar -xvzf ${SSTATE_PKG}
> > > > >         # update .siginfo atime on local/NFS mirror
> > > > > -       [ -w ${SSTATE_PKG}.siginfo ] && [ -h ${SSTATE_PKG}.sigin=
fo
> ] &&
> > > touch
> > > > -a ${SSTATE_PKG}.siginfo
> > > > > +       [ -O ${SSTATE_PKG}.siginfo ] && [ -w ${SSTATE_PKG}.sigin=
fo
> > > > > + ] && [ -h ${SSTATE_PKG}.siginfo ] && touch -a
> > > > > + ${SSTATE_PKG}.siginfo
> > > > >         # Use "! -w ||" to return true for read only files
> > > > >         [ ! -w ${SSTATE_PKG} ] || touch --no-dereference
> ${SSTATE_PKG}
> > > > >         [ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ]
> > > > > || touch --no-dereference ${SSTATE_PKG}.sig
> > > > > --
> > > > > 2.17.1
> > > > >
> > > > >
> > > > >
> > > > >
> > > >
> > > >
> > > > --
> > > > Regards,
> > > > Andrey.
>
>=20
>
>

--000000000000d698cd05b085a79b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It was merged 2 days ago:<div><a href=3D"https://git.opene=
mbedded.org/openembedded-core/commit/?id=3Df1554e8bd40c640fd58daac18ecf7b45=
8e754109">https://git.openembedded.org/openembedded-core/commit/?id=3Df1554=
e8bd40c640fd58daac18ecf7b458e754109</a><br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 30, 2020 at 9:=
17 AM Norman &lt;<a href=3D"mailto:norman.stetter@garz-fricke.com">norman.s=
tetter@garz-fricke.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">I would be happy to get some feedback on this patch.<=
br>
<br>
Cheers, <br>
<br>
Norman<br>
<br>
&gt; -----Urspr=C3=BCngliche Nachricht-----<br>
&gt; Von: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; [mailto:<a href=3D"mailto:openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">openembedded-core@lists.openembedded.org</a>] Im Auftrag v=
on<br>
&gt; Norman<br>
&gt; Gesendet: Tuesday, September 29, 2020 8:55 AM<br>
&gt; An: Andrey Zhizhikin &lt;<a href=3D"mailto:andrey.z@gmail.com" target=
=
=3D"_blank">andrey.z@gmail.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targe=
t=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Betreff: Re: [OE-core][Patch] sstate.bbclass: Check file ownership be=
fore<br>
&gt; doing &#39;touch -a&#39;<br>
&gt; <br>
&gt; I went through it again:<br>
&gt; <br>
&gt; The SSTATE_DIR is set to my local build dir inside my home dir. All f=
iles here<br>
&gt; are owned by me.<br>
&gt; The SSTATE_MIRRORS is set to a locally mounted shared sstate-cache. F=
iles<br>
&gt; here are owned by my group, but not my user.<br>
&gt; <br>
&gt; All *.siginfo files in the SSTATE_DIR are symlinks to the respective =
files in the<br>
&gt; SSTATE_MIRRORS dir.<br>
&gt; <br>
&gt; The sstate_unpack_package function gets run for every *.siginfo file =
in<br>
&gt; SSTATE_DIR.<br>
&gt; If the ${SSTATE_PKG}.siginfo file already exists and is a symlink it&=
#39;s atime is<br>
&gt; updated (line 850), this affects the destination file of the symlink =
in<br>
&gt; SSTATE_MIRRORS, since the --no-dereference switch is not used. The<br=
>
&gt; comment in line 849 confirms this is meant to set atime for &quot;loc=
al/NFS<br>
&gt; mirror&quot;. But it being a mirror one cannot expect the user runnin=
g bitbake to<br>
&gt; be the file owner.<br>
&gt; <br>
&gt; So in my opinion the proposed patch makes sense.<br>
&gt; <br>
&gt; <br>
&gt; &gt; -----Urspr=C3=BCngliche Nachricht-----<br>
&gt; &gt; Von: <a href=3D"mailto:openembedded-core@lists.openembedded.org"=
 target=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; [mailto:<a href=3D"mailto:openembedded-core@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core@lists.openembedded.org</a>] Im Auft=
rag von<br>
&gt; &gt; Norman<br>
&gt; &gt; Gesendet: Friday, September 25, 2020 2:33 PM<br>
&gt; &gt; An: Andrey Zhizhikin &lt;<a href=3D"mailto:andrey.z@gmail.com" t=
arget=3D"_blank">andrey.z@gmail.com</a>&gt;<br>
&gt; &gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" =
target=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; Betreff: Re: [OE-core][Patch] sstate.bbclass: Check file ownersh=
ip<br>
&gt; &gt; before doing &#39;touch -a&#39;<br>
&gt; &gt;<br>
&gt; &gt; We do use SSTATE_MIRROR, pointing to a locally mounted drive tha=
t gets<br>
&gt; &gt; populated by CI-builds:<br>
&gt; &gt;<br>
&gt; &gt; SSTATE_MIRRORS =3D &quot;file://.* file:///var/cache/yocto/sstat=
e-cache/PATH&quot;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; -----Urspr=C3=BCngliche Nachricht-----<br>
&gt; &gt; &gt; Von: Andrey Zhizhikin [mailto:<a href=3D"mailto:andrey.z@gm=
ail.com" target=3D"_blank">andrey.z@gmail.com</a>]<br>
&gt; &gt; &gt; Gesendet: Friday, September 25, 2020 2:27 PM<br>
&gt; &gt; &gt; An: Norman Stetter &lt;<a href=3D"mailto:Norman.Stetter@gar=
z-fricke.com" target=3D"_blank">Norman.Stetter@garz-fricke.com</a>&gt;<br>
&gt; &gt; &gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.=
org" target=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; &gt; Betreff: Re: [OE-core][Patch] sstate.bbclass: Check file ow=
nership<br>
&gt; &gt; &gt; before doing &#39;touch -a&#39;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Fri, Sep 25, 2020 at 2:19 PM Norman<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:norman.stetter@garz-fricke.com" targe=
t=3D"_blank">norman.stetter@garz-fricke.com</a>&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; From cd51db253c1a81e47532f1afacce385e422d9a73 Mon Sep =
17<br>
&gt; 00:00:00<br>
&gt; &gt; &gt; 2001<br>
&gt; &gt; &gt; &gt; From: Norman Stetter &lt;<a href=3D"mailto:norman.stet=
ter@garz-fricke.com" target=3D"_blank">norman.stetter@garz-fricke.com</a>&g=
t;<br>
&gt; &gt; &gt; &gt; Date: Fri, 25 Sep 2020 13:49:43 +0200<br>
&gt; &gt; &gt; &gt; Subject: sstate.bbclass: Check file ownership before d=
oing &#39;touch -a&#39;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; In contrast to &#39;touching&#39; a file without param=
eters &#39;touch -a&#39; can<br>
&gt; &gt; &gt; &gt; only be performed by the file owner. In case of a shar=
ed<br>
&gt; &gt; &gt; &gt; sstate-cache served locally (e.g. over NFS),=C2=A0 whe=
re the user<br>
&gt; &gt; &gt; &gt; running bitbake is not the owner of sstate-cache files=
, even if he<br>
&gt; &gt; &gt; &gt; has write access on group level, the sstate_unpack_pac=
kage task will<br>
&gt; fail.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Isn&#39;t the whole intention of using SSTATE_MIRROR to cov=
er exactly<br>
&gt; &gt; &gt; those cases? I do not think that reusing sstate between dif=
ferent<br>
&gt; &gt; &gt; builders via NFS is a proper way to go.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Checking if the file is owned by the user before attem=
pting to run<br>
&gt; &gt; &gt; &gt; &#39;touch -a&#39; on it solves this.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Norman Stetter &lt;<a href=3D"mailto:no=
rman.stetter@garz-fricke.com" target=3D"_blank">norman.stetter@garz-fricke.=
com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 meta/classes/sstate.bbclass | 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br=
>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/meta/classes/sstate.bbclass<br>
&gt; &gt; &gt; &gt; b/meta/classes/sstate.bbclass index 375196ef21..66a96a=
7603 100644<br>
&gt; &gt; &gt; &gt; --- a/meta/classes/sstate.bbclass<br>
&gt; &gt; &gt; &gt; +++ b/meta/classes/sstate.bbclass<br>
&gt; &gt; &gt; &gt; @@ -847,7 +847,7 @@ python sstate_report_unihash() {<b=
r>
&gt; &gt; &gt; &gt; sstate_unpack_package () {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar -xvzf ${SSTATE_PK=
G}<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# update .siginfo ati=
me on local/NFS mirror<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -w ${SSTATE_PKG}.siginfo=
 ] &amp;&amp; [ -h ${SSTATE_PKG}.siginfo ] &amp;&amp;<br>
&gt; &gt; touch<br>
&gt; &gt; &gt; -a ${SSTATE_PKG}.siginfo<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -O ${SSTATE_PKG}.siginfo=
 ] &amp;&amp; [ -w ${SSTATE_PKG}.siginfo<br>
&gt; &gt; &gt; &gt; + ] &amp;&amp; [ -h ${SSTATE_PKG}.siginfo ] &amp;&amp;=
 touch -a<br>
&gt; &gt; &gt; &gt; + ${SSTATE_PKG}.siginfo<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Use &quot;! -w ||&q=
uot; to return true for read only files<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -w ${SSTATE_PKG} =
] || touch --no-dereference ${SSTATE_PKG}<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -w ${SSTATE_PKG}.=
sig ] || [ ! -e ${SSTATE_PKG}.sig ]<br>
&gt; &gt; &gt; &gt; || touch --no-dereference ${SSTATE_PKG}.sig<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; 2.17.1<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; Andrey.<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000d698cd05b085a79b--
