Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B3CC433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 21:47:20 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.1403.1633297639829893844
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 14:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kBKGggFg;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id x27so63449729lfu.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 14:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RablWZhncDg+IH+mFDgko5cGLNgdci2tWi84kRwf5t4=;
        b=kBKGggFgzZI9kR3WdblZnrktsYlvPySyEBhA1Ta3H3dn55FKviJfKGOW6ELEkPcWjD
         Lj601rge/aKoDfoZSxa1tIF4XjQxe/UbCF5LvZUNN3EeLjM36GqhpZ0ZSpA3bm5LNzhY
         X/UcRGA/NuMkeT85LqcTpm/Dbu2JysEZzjeXiMLvijDZZ5UBVH6Qb6UO/8f5yPY7+1QT
         c4OEfbTOtikycB/6vY6eH9EZevHhD/MwMiJ+hERj2VtJwVLSa+XLhKGXXbjk5fonI/ss
         v+V1v+eZ+DfrQggUdRccMXj7rxM0gxQJMy/1Nv0qCpVs4qRZs1umLWxh5B2G5D9a20U9
         ODhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RablWZhncDg+IH+mFDgko5cGLNgdci2tWi84kRwf5t4=;
        b=jlDKo6rg65hoI90Ogvzm2sPbMM7CGap4Aqm2wn+s1Bn5pUDFyzJu4nBLa3bwqDW3dm
         OVjR/byIhoGYwM+BkrGckZRhT9bJNE51DWKuqEznOAiJ2baA1mALs3oyDit/LiR9BfTL
         /5cNX31v+Oy9Db5gneLRb95pEk75tsN6vApz/l+0yLQNHihQKGDzL8zoJ+SYIGpmmEQQ
         +QAXTVljYzwynGA/ids0E53iuNhAAAT9B7tvuz9nvQNHhjc7IWBuSF5boIrXnuJwB4H6
         N/lk3/XVe+gh9/4Qvht5yAiknwiGjkyxetGRSxSM5P+mMwWm/8DnGbQ0/9zsCn8E3rN3
         fL3w==
X-Gm-Message-State: AOAM532SOrXQfyyJvrdnNXEUDMu6auw30Ft33VXyo/GvU5GK566od7EC
	3DCRBBPrNPveMB50mpt3uqPXmcauO7li4frHEzc=
X-Google-Smtp-Source: 
 ABdhPJxqt+ykFpzURRFwbzHgEOcdBJvTb11QqeWNs8dOXcf/1xgMii42ho298vppQlvEB6ZgbFe4quCd6NsIcMX/VUU=
X-Received: by 2002:a2e:87ca:: with SMTP id
 v10mr12377313ljj.369.1633297637585;
 Sun, 03 Oct 2021 14:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211002221803.2283254-1-richard.purdie@linuxfoundation.org>
 <20211002221803.2283254-4-richard.purdie@linuxfoundation.org>
 <CANPvuRktteqc9ttumqAPR+iPFN=xibHMqoNEzfHKFiOwzGyU2Q@mail.gmail.com>
 <bd33a274ed681346e646d72958989125027d5a5b.camel@linuxfoundation.org>
In-Reply-To: 
 <bd33a274ed681346e646d72958989125027d5a5b.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Sun, 3 Oct 2021 22:47:10 +0100
Message-ID: 
 <CANPvuRmNbY01axyhsOc0aRtDPHeD52KZ5SmqcZEajSQompbjfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] abi_version/sstate: Bump HASH_VERSION and
 SSTATE_VERSION
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000080383105cd79bdcf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 21:47:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156562

--00000000000080383105cd79bdcf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
domingo, 3/10/2021 =C3=A0(s) 11:28:

> On Sun, 2021-10-03 at 10:59 +0100, Jose Quaresma wrote:
> > Hi Richard,
> >
> > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> s=C3=A1bado,
> > 2/10/2021 =C3=A0(s) 23:18:
> > > At this point the hash equivalence and sstate is 'junk' on the
> autobuilder
> > > unforuntately due to the volume of fixes and also the volume of sligh=
ly
> > > not quite right patches tested during the development of the fixes.
> > >
> > > In order to try and help any remaining sanity I might have, bump the
> > > version numbers to start with a clean slate so we're working from a
> known
> > > good baseline rather than risk chasing phantom issues. For those
> > > upgrading, there wouldn't be much reuse anyway after the changes.
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/classes/sstate.bbclass                          | 2 +-
> > >  meta/conf/abi_version.conf                           | 2 +-
> > >  meta/recipes-devtools/elfutils/elfutils_0.185.bb     | 1 -
> > >  meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb | 1 -
> > >  4 files changed, 2 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclas=
s
> > > index 89e9f561787..06a722c735d 100644
> > > --- a/meta/classes/sstate.bbclass
> > > +++ b/meta/classes/sstate.bbclass
> > > @@ -1,4 +1,4 @@
> > > -SSTATE_VERSION =3D "3"
> > > +SSTATE_VERSION =3D "4"
> > >
> > >  SSTATE_MANIFESTS ?=3D "${TMPDIR}/sstate-control"
> > >  SSTATE_MANFILEPREFIX =3D
> "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-
> > > ${PN}"
> > > diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
> > > index 35faef9a368..515a6def405 100644
> > > --- a/meta/conf/abi_version.conf
> > > +++ b/meta/conf/abi_version.conf
> > > @@ -12,4 +12,4 @@ OELAYOUT_ABI =3D "14"
> > >  # a reset of the equivalence, for example when reproducibility issue=
s
> break
> > > the
> > >  # existing match data. Distros can also append to this value for the
> same
> > > effect.
> > >  #
> > > -HASHEQUIV_HASH_VERSION  =3D "5"
> > > +HASHEQUIV_HASH_VERSION  =3D "7"
> > >
> >
> >
> > Why is it bumped to 7 instead of 6 ?
>
> I'd already managed to break the 6 namespace in testing on the
> autobuilder. I
> don't have any easy way to remove that namespace from the hash equivalenc=
e
> server. I could likely do it with a lot of manual work.
>
> Sadly there is some deeper issue going on and current master on the
> autobuilder
> is corrupted and even after these bumps, there is some problem creeping
> back in
> and corrupting[1] builds. I'm trying to narrow it down but it is
> proving problematic.
>
> [1] the corruption is bad file timestamps so not something really bad but
> it
> does need to be fixed.
>
> Cheers,
>
> Richard
>
>
Thank you for the explanation.

Regarding the corruption of bad file timestamps I have sent a patch that
can be
a little useful, It will show a warning when the timestamp can't be updated=
.

https://lists.openembedded.org/g/openembedded-core/topic/patch_sstate_bbcla=
ss_adds/86052256?p=3D,,,20,0,0,0::recentpostdate/sticky,,,20,2,0,86052256,p=
revid=3D1633297133859036611,nextid=3D1633195100689062135&previd=3D163329713=
3859036611&nextid=3D1633195100689062135

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000080383105cd79bdcf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia domingo, 3/10/2021 =C3=A0(s) 11:28:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Sun, 2021-10-03 at 10:59 +0100, =
Jose Quaresma wrote:<br>
&gt; Hi Richard,<br>
&gt; <br>
&gt; Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; escreveu no=
 dia s=C3=A1bado,<br>
&gt; 2/10/2021 =C3=A0(s) 23:18:<br>
&gt; &gt; At this point the hash equivalence and sstate is &#39;junk&#39; o=
n the autobuilder<br>
&gt; &gt; unforuntately due to the volume of fixes and also the volume of s=
lighly<br>
&gt; &gt; not quite right patches tested during the development of the fixe=
s.<br>
&gt; &gt; <br>
&gt; &gt; In order to try and help any remaining sanity I might have, bump =
the<br>
&gt; &gt; version numbers to start with a clean slate so we&#39;re working =
from a known<br>
&gt; &gt; good baseline rather than risk chasing phantom issues. For those<=
br>
&gt; &gt; upgrading, there wouldn&#39;t be much reuse anyway after the chan=
ges.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org=
</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0meta/classes/sstate.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt; =C2=A0meta/conf/abi_version.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br=
>
&gt; &gt; =C2=A0meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0=
.185.bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.185.bb</a>=C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
&gt; &gt; =C2=A0meta/recipes-devtools/syslinux/<a href=3D"http://syslinux_6=
.04-pre2.bb" rel=3D"noreferrer" target=3D"_blank">syslinux_6.04-pre2.bb</a>=
 | 1 -<br>
&gt; &gt; =C2=A04 files changed, 2 insertions(+), 4 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bb=
class<br>
&gt; &gt; index 89e9f561787..06a722c735d 100644<br>
&gt; &gt; --- a/meta/classes/sstate.bbclass<br>
&gt; &gt; +++ b/meta/classes/sstate.bbclass<br>
&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; -SSTATE_VERSION =3D &quot;3&quot;<br>
&gt; &gt; +SSTATE_VERSION =3D &quot;4&quot;<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0SSTATE_MANIFESTS ?=3D &quot;${TMPDIR}/sstate-control&quot;<=
br>
&gt; &gt; =C2=A0SSTATE_MANFILEPREFIX =3D &quot;${SSTATE_MANIFESTS}/manifest=
-${SSTATE_MANMACH}-<br>
&gt; &gt; ${PN}&quot;<br>
&gt; &gt; diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.c=
onf<br>
&gt; &gt; index 35faef9a368..515a6def405 100644<br>
&gt; &gt; --- a/meta/conf/abi_version.conf<br>
&gt; &gt; +++ b/meta/conf/abi_version.conf<br>
&gt; &gt; @@ -12,4 +12,4 @@ OELAYOUT_ABI =3D &quot;14&quot;<br>
&gt; &gt; =C2=A0# a reset of the equivalence, for example when reproducibil=
ity issues break<br>
&gt; &gt; the<br>
&gt; &gt; =C2=A0# existing match data. Distros can also append to this valu=
e for the same<br>
&gt; &gt; effect.<br>
&gt; &gt; =C2=A0#<br>
&gt; &gt; -HASHEQUIV_HASH_VERSION=C2=A0 =3D &quot;5&quot;<br>
&gt; &gt; +HASHEQUIV_HASH_VERSION=C2=A0 =3D &quot;7&quot;<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; Why is it bumped to 7 instead=C2=A0of 6 ?<br>
<br>
I&#39;d already managed to break the 6 namespace in testing on the autobuil=
der. I<br>
don&#39;t have any easy way to remove that namespace from the hash equivale=
nce<br>
server. I could likely do it with a lot of manual work.<br>
<br>
Sadly there is some deeper issue going on and current master on the autobui=
lder<br>
is corrupted and even after these bumps, there is some problem creeping bac=
k in<br>
and corrupting[1] builds. I&#39;m trying to narrow it down but it is<br>
proving=C2=A0problematic.<br>
<br>
[1] the corruption is bad file timestamps so not something really bad but i=
t<br>
does need to be fixed.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><div><br></div><div>Thank you for the explanation.<br></=
div><div><br></div><div>Regarding the corruption of bad file timestamps I h=
ave sent a patch=C2=A0that can be</div><div>a little useful, It will show a=
 warning when the timestamp can&#39;t be updated.</div><div><br></div><div>=
<a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/patch_s=
state_bbclass_adds/86052256?p=3D,,,20,0,0,0::recentpostdate/sticky,,,20,2,0=
,86052256,previd=3D1633297133859036611,nextid=3D1633195100689062135&amp;pre=
vid=3D1633297133859036611&amp;nextid=3D1633195100689062135">https://lists.o=
penembedded.org/g/openembedded-core/topic/patch_sstate_bbclass_adds/8605225=
6?p=3D,,,20,0,0,0::recentpostdate/sticky,,,20,2,0,86052256,previd=3D1633297=
133859036611,nextid=3D1633195100689062135&amp;previd=3D1633297133859036611&=
amp;nextid=3D1633195100689062135</a><br></div><div><br></div>-- <br><div di=
r=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>=
Jos=C3=A9 Quaresma</div></div></div></div>

--00000000000080383105cd79bdcf--

