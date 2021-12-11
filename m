Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EECAC433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 08:44:24 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web10.19417.1639212263577375425
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 00:44:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SYeXV76r;
 spf=pass (domain: gmail.com, ip: 209.85.221.179,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id 70so7426887vkx.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 00:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KHUcXX7DZeOJMJxPFzgQ1Z73pH4srv/VlzbKnRFEfs0=;
        b=SYeXV76r/x0x72imQaipzRqJGSZatavwzXJe+WPAgZFgwktRIuGMyfSXqGw9D+gsCL
         GC+rbB97lQjoitwJdHDCPxGvFaenmJAuXSvxR1aNp0Jknx+yUotSLd6MLwG/8sfHiuAK
         TEO3+GCwhIa74JavkIIepjXiEHB+IgEbhnpst5paEioGkr5O51KfNE96QMyUPCMdIjEx
         HoX6h4wtQp590P+XQmWMHKoOXqrTYekrhaX+e7TpCYoxOEBGxmnzpy5+P6RjcxfL1pnL
         boEXAUGq7AMzyqeTXZUtgJXSPLauXyxrH75zM8kv3aH5/lckcQGDE25WWsj1noJ4TV2v
         fw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KHUcXX7DZeOJMJxPFzgQ1Z73pH4srv/VlzbKnRFEfs0=;
        b=dHxG4fiSCodeblLiTeJSB7KSndN4o8adMGFiF3Ni6KOZo2ZGItA82zvJ9FlQduJ4xr
         da3RkmGsKjWJIsBeKCWOCaaLr+mi9TpPBzBLYCnOLPUovfu1HCsQlqGzNzXByUd/XGnx
         upQ7JFf/yPSzwAvQqt0RclYDuZ8WiXfhFF3kkY81Xoor/3OZOZW5n8mxvj09WK8ETIw9
         d5Wz2NQpwhvy7ABl2hqt2V0V6g/FkUpkgAWZ4xaeXvRtvQCmnEUCsc4CpWLFyNjRa+W1
         /bcOUlVzUtyRqa+A1J3TZvyZaqVHubOgb+To6wBJDBqEkXbgbiPsMQMb/ex9YA0mkYSs
         e3hA==
X-Gm-Message-State: AOAM531lC7ZhMvc/rqlOYvkkNHAQjDKwe1A7D1VbiqJ3ZAs7Vc0e0w8e
	cnMfEWbxQRBSjjp6J7q9mzf6XC+RMqqxZRxV04c=
X-Google-Smtp-Source: 
 ABdhPJwGmDsEJjUTWIsLFPHILfNRrZ3ZWWu2Ur77YE8m9RhkajcPYrcDICOrjZ9ujnOvkrPill+ISW1WHIWTmdGgzlY=
X-Received: by 2002:a05:6122:2005:: with SMTP id
 l5mr24901574vkd.4.1639212262597;
 Sat, 11 Dec 2021 00:44:22 -0800 (PST)
MIME-Version: 1.0
References: <20211208215947.1979470-1-alex@linutronix.de>
 <20211208215947.1979470-10-alex@linutronix.de>
 <CAMKF1sqMoz=MSVWu=3nnWAMu9Z5VTt4JwrTv6A-OLAa_h4T2Bg@mail.gmail.com>
 <CAMKF1srOg-TWoVFNXe5BXmm=ZK4V5VA25+F57GqtmdDE8+WO3A@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srOg-TWoVFNXe5BXmm=ZK4V5VA25+F57GqtmdDE8+WO3A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 11 Dec 2021 09:44:11 +0100
Message-ID: 
 <CANNYZj9E5D5ge5KzTAj-nOxBTsj0oCQMsUDZHBPg_0bA8eJL2g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/29] meson: upgrade 0.60.1 -> 0.60.2
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009fa98d05d2dad886"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Dec 2021 08:44:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159560

--0000000000009fa98d05d2dad886
Content-Type: text/plain; charset="UTF-8"

Perhaps meta-oe build in the AB should be adjusted?

https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n907

Alex

On Sat, 11 Dec 2021 at 03:42, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Dec 10, 2021 at 9:01 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > this breaks gjs also see https://github.com/mesonbuild/meson/issues/9472
> >
>
> I have a fix for gjs [1] but I was thinking meta-gnome is a good
> testcase for meson. So when upgrading meson it will be good to add
> this layer
> to test and build world.
>
>
> [1]
> https://lore.kernel.org/openembedded-devel/20211210173603.2826515-1-raj.khem@gmail.com/T/#u
>
> > On Wed, Dec 8, 2021 at 2:00 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> > >
> > > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > >
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >  meta/recipes-devtools/meson/meson.inc                           | 2 +-
> > >  .../recipes-devtools/meson/{meson_0.60.1.bb => meson_0.60.2.bb} | 0
> > >  .../{nativesdk-meson_0.60.1.bb => nativesdk-meson_0.60.2.bb}    | 0
> > >  3 files changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta/recipes-devtools/meson/{meson_0.60.1.bb =>
> meson_0.60.2.bb} (100%)
> > >  rename meta/recipes-devtools/meson/{nativesdk-meson_0.60.1.bb =>
> nativesdk-meson_0.60.2.bb} (100%)
> > >
> > > diff --git a/meta/recipes-devtools/meson/meson.inc
> b/meta/recipes-devtools/meson/meson.inc
> > > index f383ad9f74..7fbb246b87 100644
> > > --- a/meta/recipes-devtools/meson/meson.inc
> > > +++ b/meta/recipes-devtools/meson/meson.inc
> > > @@ -15,7 +15,7 @@ SRC_URI = "
> https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
> > >             file://0002-Support-building-allarch-recipes-again.patch \
> > >             file://0001-is_debianlike-always-return-False.patch \
> > >             "
> > > -SRC_URI[sha256sum] =
> "5add789c953d984b500858b2851ee3d7add0460cf1a6f852f0a721af17384e13"
> > > +SRC_URI[sha256sum] =
> "64e6968565bf1b8152f4f9d6ca8154efb9e14caa9aabf7b22e71e6c5d053e921"
> > >
> > >  UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
> > >  UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
> > > diff --git a/meta/recipes-devtools/meson/meson_0.60.1.bb
> b/meta/recipes-devtools/meson/meson_0.60.2.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/meson/meson_0.60.1.bb
> > > rename to meta/recipes-devtools/meson/meson_0.60.2.bb
> > > diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.60.1.bb
> b/meta/recipes-devtools/meson/nativesdk-meson_0.60.2.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/meson/nativesdk-meson_0.60.1.bb
> > > rename to meta/recipes-devtools/meson/nativesdk-meson_0.60.2.bb
> > > --
> > > 2.20.1
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#159376):
> https://lists.openembedded.org/g/openembedded-core/message/159376
> > > Mute This Topic: https://lists.openembedded.org/mt/87599646/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [raj.khem@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
>

--0000000000009fa98d05d2dad886
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Perhaps meta-oe build in the AB should be adjusted?</=
div><div><br></div><div><a href=3D"https://git.yoctoproject.org/yocto-autob=
uilder-helper/tree/config.json#n907">https://git.yoctoproject.org/yocto-aut=
obuilder-helper/tree/config.json#n907</a></div><div><br></div><div>Alex<br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Sat, 11 Dec 2021 at 03:42, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Fri, Dec 10, 2021 at 9:01 AM Khem Raj &lt;=
<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com<=
/a>&gt; wrote:<br>
&gt;<br>
&gt; this breaks gjs also see <a href=3D"https://github.com/mesonbuild/meso=
n/issues/9472" rel=3D"noreferrer" target=3D"_blank">https://github.com/meso=
nbuild/meson/issues/9472</a><br>
&gt;<br>
<br>
I have a fix for gjs [1] but I was thinking meta-gnome is a good<br>
testcase for meson. So when upgrading meson it will be good to add<br>
this layer<br>
to test and build world.<br>
<br>
<br>
[1] <a href=3D"https://lore.kernel.org/openembedded-devel/20211210173603.28=
26515-1-raj.khem@gmail.com/T/#u" rel=3D"noreferrer" target=3D"_blank">https=
://lore.kernel.org/openembedded-devel/20211210173603.2826515-1-raj.khem@gma=
il.com/T/#u</a><br>
<br>
&gt; On Wed, Dec 8, 2021 at 2:00 PM Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; w=
rote:<br>
&gt; &gt;<br>
&gt; &gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanav=
in@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/meson/meson.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-<br>
&gt; &gt;=C2=A0 .../recipes-devtools/meson/{<a href=3D"http://meson_0.60.1.=
bb" rel=3D"noreferrer" target=3D"_blank">meson_0.60.1.bb</a> =3D&gt; <a hre=
f=3D"http://meson_0.60.2.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.6=
0.2.bb</a>} | 0<br>
&gt; &gt;=C2=A0 .../{<a href=3D"http://nativesdk-meson_0.60.1.bb" rel=3D"no=
referrer" target=3D"_blank">nativesdk-meson_0.60.1.bb</a> =3D&gt; <a href=
=3D"http://nativesdk-meson_0.60.2.bb" rel=3D"noreferrer" target=3D"_blank">=
nativesdk-meson_0.60.2.bb</a>}=C2=A0 =C2=A0 | 0<br>
&gt; &gt;=C2=A0 3 files changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/meson/{<a href=3D"http://meson=
_0.60.1.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.60.1.bb</a> =3D&gt=
; <a href=3D"http://meson_0.60.2.bb" rel=3D"noreferrer" target=3D"_blank">m=
eson_0.60.2.bb</a>} (100%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/meson/{<a href=3D"http://nativ=
esdk-meson_0.60.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_=
0.60.1.bb</a> =3D&gt; <a href=3D"http://nativesdk-meson_0.60.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">nativesdk-meson_0.60.2.bb</a>} (100%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes=
-devtools/meson/meson.inc<br>
&gt; &gt; index f383ad9f74..7fbb246b87 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/meson/meson.inc<br>
&gt; &gt; +++ b/meta/recipes-devtools/meson/meson.inc<br>
&gt; &gt; @@ -15,7 +15,7 @@ SRC_URI =3D &quot;<a href=3D"https://github.com=
/mesonbuild/meson/releases/download/$%7BPV%7D/meson-$%7BP" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/mesonbuild/meson/releases/download/=
${PV}/meson-${P</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Suppor=
t-building-allarch-recipes-again.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-is_deb=
ianlike-always-return-False.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt; -SRC_URI[sha256sum] =3D &quot;5add789c953d984b500858b2851ee3d7add=
0460cf1a6f852f0a721af17384e13&quot;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;64e6968565bf1b8152f4f9d6ca8154efb9e=
14caa9aabf7b22e71e6c5d053e921&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/=
mesonbuild/meson/releases" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/mesonbuild/meson/releases</a>&quot;<br>
&gt; &gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;meson-(?P&lt;pver&gt;\d+(\.\=
d+)+)\.tar&quot;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/meson/<a href=3D"http://meson_=
0.60.1.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.60.1.bb</a> b/meta/=
recipes-devtools/meson/<a href=3D"http://meson_0.60.2.bb" rel=3D"noreferrer=
" target=3D"_blank">meson_0.60.2.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/meson/<a href=3D"http://meson_0=
.60.1.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.60.1.bb</a><br>
&gt; &gt; rename to meta/recipes-devtools/meson/<a href=3D"http://meson_0.6=
0.2.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.60.2.bb</a><br>
&gt; &gt; diff --git a/meta/recipes-devtools/meson/<a href=3D"http://native=
sdk-meson_0.60.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0=
.60.1.bb</a> b/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meso=
n_0.60.2.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.60.2.bb=
</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/meson/<a href=3D"http://natives=
dk-meson_0.60.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.=
60.1.bb</a><br>
&gt; &gt; rename to meta/recipes-devtools/meson/<a href=3D"http://nativesdk=
-meson_0.60.2.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.60=
.2.bb</a><br>
&gt; &gt; --<br>
&gt; &gt; 2.20.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#159376): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/159376" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-core/message/159376</a><b=
r>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/875=
99646/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/87599646/1997914</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.c=
om" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</blockquote></div>

--0000000000009fa98d05d2dad886--

