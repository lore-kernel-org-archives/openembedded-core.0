Return-Path: <limon.anibal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19E8C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 13:35:17 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.32503.1659015308113337748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 06:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kulRkKjl;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: limon.anibal@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id t1so2866321lft.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 06:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BOynjgi2Lti92ryasjIQc65tqnPOwqoOGJ04Yn3RdYY=;
        b=kulRkKjlXwavOL8qqNRHUbWzMLgPh4JBLIYTb9BDC36FLOOgEhI6GsySyqO9Urrest
         qsnvKdBhUnqG/EQZJ7Ic0RBtKvQgfnUEQ8z4B4udY5nIIwe8CEGaEvWFaMadULV0aR/g
         QE9iZ+ssELoF23ZdQFWRXYg2O7JOpbSFOjpQUXNPwX/kXLtWttJ02c4uofcrWV6KQ5ct
         ozqIg8nA0m66bwOZOVdaMKyb8Wr80K063wiG4mhptKKggr2iZfxw1IHaQCMWBHdja8pe
         VF1+xUoGyJTuFpZavq2uVOn+BSNQdOkjTwBMHbR28+MA2NVO/pH3BhswOl3tmjHJvZ4d
         WI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BOynjgi2Lti92ryasjIQc65tqnPOwqoOGJ04Yn3RdYY=;
        b=lI2CoJWV/y2PvSzVQJy8kMzNni1IYQYzO7iwNEVBlr0KcvFKilVZTZr3RkaOqPSqEn
         dy+aVVpB1gq0cqQsNU6ymjUqiypfGo5nsVlFf8cm0tcdm/NqdPr9KcmfOcyO4WyrZ2Rm
         5nqceWihuzCj52KJM4dbXvAbds8yVelgL30w/+1ye8I2JYORC8L/8xP4889hL37LzIiw
         kzAGfJBy55N9vSobD5RlIR2a9vEUatyxG91a+KWwWhyx/Cuiz++kqu6s6FbCf5VnwMEG
         sF7yncvQovrjuyHBrvG+yntIShIa1uZ8Y4ntUyAKTXr1juj6eEumyiKIiE3Ca2YP3YeQ
         Vthg==
X-Gm-Message-State: AJIora8IwAiIuS3+a2tNThvf/KgxQbH5QoQbtucQMUdpQiwrXfoRI8zm
	FOH6oLmdcSWBvO2soY3whwqSixnlT8EuyKI4T1w=
X-Google-Smtp-Source: 
 AGRyM1vTcwQ7Rz54ZfqpM4P56Br24cNeFBoMci/O1ucmdWfnoC82eDB/ErNYgK5VcvWj6vwJDhPBEGZtGpfQuf9SrEY=
X-Received: by 2002:a05:6512:6c5:b0:48a:84c1:ba71 with SMTP id
 u5-20020a05651206c500b0048a84c1ba71mr8070918lff.362.1659015305968; Thu, 28
 Jul 2022 06:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220726193322.1569574-1-limon.anibal@gmail.com>
 <20220727124406.4f7bc8ec@booty>
 <CAPS-YPA4qwJu_3dJ+5X+HEzE1ZGzT6H4Y2urbCKzT14ZPOOiKg@mail.gmail.com>
 <593d8723-658b-181f-084b-0f310d83c519@gmail.com>
In-Reply-To: <593d8723-658b-181f-084b-0f310d83c519@gmail.com>
From: =?UTF-8?Q?Anibal_Lim=C3=B3n?= <limon.anibal@gmail.com>
Date: Thu, 28 Jul 2022 08:34:54 -0500
Message-ID: 
 <CAPS-YPDMK55oLPgYPFSRwh8jH9+scB8stz50m3vu=N=j4WyLqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2]] recipes-support: rng-tools change systemd
 service name
To: Khem Raj <raj.khem@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
 otavio.salvador@ossystems.com.br,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000fd411705e4dd99c5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 13:35:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168605

--000000000000fd411705e4dd99c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2022 at 11:03 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 7/27/22 10:51 AM, An?bal Lim?n wrote:
> >
> >
> > On Wed, Jul 27, 2022 at 5:44 AM Luca Ceresoli <luca.ceresoli@bootlin.co=
m
> > <mailto:luca.ceresoli@bootlin.com>> wrote:
> >
> >     Hello An=C3=ADbal,
> >
> >     On Tue, 26 Jul 2022 14:33:22 -0500
> >     "An?bal Lim?n" <limon.anibal@gmail.com
> >     <mailto:limon.anibal@gmail.com>> wrote:
> >
> >      > From: An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com
> >     <mailto:limon.anibal@gmail.com>>
> >      >
> >      > Change systemd service name from rngd -> rng-tools to avoid load
> >     twice
> >      > the service when sysvinit compatibility is enabled,
> >      >
> >      > ...
> >      > root@:~# ps  | grep rng
> >      >    23 root         0 SW   [hwrng]
> >      > 13109 root      3528 R    /usr/sbin/rngd -f -r /dev/hwrng
> >      > 13117 root      2348 S    grep rng
> >      > 29418 root     12756 S    /usr/sbin/rngd -r /dev/hwrng
> >      > ...
> >      >
> >      > Signed-off-by: An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com
> >     <mailto:limon.anibal@gmail.com>>
> >      > ---
> >      >  .../rng-tools/{rngd.service =3D> rng-tools.service}    |  0
> >      >  meta/recipes-support/rng-tools/rng-tools_6.15.bb
> >     <http://rng-tools_6.15.bb>     | 12 ++++++------
> >      >  2 files changed, 6 insertions(+), 6 deletions(-)
> >      >  rename meta/recipes-support/rng-tools/rng-tools/{rngd.service =
=3D>
> >     rng-tools.service} (100%)
> >      >
> >      > diff --git
> >     a/meta/recipes-support/rng-tools/rng-tools/rngd.service
> >     b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> >      > similarity index 100%
> >      > rename from meta/recipes-support/rng-tools/rng-tools/rngd.servic=
e
> >      > rename to
> meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> >      > diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> >     <http://rng-tools_6.15.bb>
> >     b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> >     <http://rng-tools_6.15.bb>
> >      > index 0696351903..efc08b5e0a 100644
> >      > --- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> >     <http://rng-tools_6.15.bb>
> >      > +++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> >     <http://rng-tools_6.15.bb>
> >      > @@ -11,7 +11,7 @@ DEPENDS =3D "sysfsutils openssl"
> >      >  SRC_URI =3D
> >     "git://github.com/nhorman/rng-tools.git;branch=3Dmaster;protocol=3D=
https
> >     <
> http://github.com/nhorman/rng-tools.git;branch=3Dmaster;protocol=3Dhttps>=
 \
> >      >             file://init \
> >      >             file://default \
> >      > -           file://rngd.service \
> >      > +           file://rng-tools.service \
> >
> >     This feels strange to me: "rng-tools" does not look like a daemon
> name,
> >     but rather a, well, tools name. Maybe "rng-daemon" would clarify?
> >
> >
> > Another option is to change the init daemon to be called rngd.
>
> I think yet another way is to check for condition when sysvinit
> compatibility is enabled during install time and decide if we need to
> install both sysvinit script and systemd service or not. I do not think
> renaming .service file is a good solution here.
>

I have that solution on the first version of this patch,

https://lists.openembedded.org/g/openembedded-core/message/167841?p=3D%2C%2=
C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Crng-tools%2C20%2C2%2C0%2C92278770

Regards,
Anibal


>
> >
> > Regards,
> > Anibal
> >
> >
> >     Still I'm taking this patch for testing, I'll replace it with v2
> should
> >     you send one.
> >
> >     However please note there is an extra ']' in the subject: [PATCHv2]=
]
> >     should be [PATCHv2]. This leads 'git am' to produce a commit starti=
ng
> >     with a "] " prefix. I fixed it while applying, however you should
> check
> >     that in the future.
> >
> >     Best regards.
> >     --
> >     Luca Ceresoli, Bootlin
> >     Embedded Linux and Kernel engineering
> >     https://bootlin.com <https://bootlin.com>
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#168566):
> https://lists.openembedded.org/g/openembedded-core/message/168566
> > Mute This Topic: https://lists.openembedded.org/mt/92635255/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000fd411705e4dd99c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 11:03 PM Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 7/27/22 10:51 AM, An?bal Lim?n wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Wed, Jul 27, 2022 at 5:44 AM Luca Ceresoli &lt;<a href=3D"mailto:lu=
ca.ceresoli@bootlin.com" target=3D"_blank">luca.ceresoli@bootlin.com</a> <b=
r>
&gt; &lt;mailto:<a href=3D"mailto:luca.ceresoli@bootlin.com" target=3D"_bla=
nk">luca.ceresoli@bootlin.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hello An=C3=ADbal,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Tue, 26 Jul 2022 14:33:22 -0500<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;An?bal Lim?n&quot; &lt;<a href=3D"mailto:limo=
n.anibal@gmail.com" target=3D"_blank">limon.anibal@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:limon.anibal@gmail.com=
" target=3D"_blank">limon.anibal@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; From: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"m=
ailto:limon.anibal@gmail.com" target=3D"_blank">limon.anibal@gmail.com</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:limon.anibal@gmail.com=
" target=3D"_blank">limon.anibal@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Change systemd service name from rngd -&gt; r=
ng-tools to avoid load<br>
&gt;=C2=A0 =C2=A0 =C2=A0twice<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; the service when sysvinit compatibility is en=
abled,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; root@:~# ps=C2=A0 | grep rng<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 23 root=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 SW=C2=A0 =C2=A0[hwrng]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 13109 root=C2=A0 =C2=A0 =C2=A0 3528 R=C2=A0 =
=C2=A0 /usr/sbin/rngd -f -r /dev/hwrng<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 13117 root=C2=A0 =C2=A0 =C2=A0 2348 S=C2=A0 =
=C2=A0 grep rng<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 29418 root=C2=A0 =C2=A0 =C2=A012756 S=C2=A0 =
=C2=A0 /usr/sbin/rngd -r /dev/hwrng<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a =
href=3D"mailto:limon.anibal@gmail.com" target=3D"_blank">limon.anibal@gmail=
.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:limon.anibal@gmail.com=
" target=3D"_blank">limon.anibal@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 .../rng-tools/{rngd.service =3D&gt; rng=
-tools.service}=C2=A0 =C2=A0 |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 meta/recipes-support/rng-tools/<a href=
=3D"http://rng-tools_6.15.bb" rel=3D"noreferrer" target=3D"_blank">rng-tool=
s_6.15.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://rng-tools_6.15.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://rng-tools_6.15.bb</a>&gt;=C2=A0 =C2=A0 =
=C2=A0| 12 ++++++------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 2 files changed, 6 insertions(+), 6 del=
etions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 rename meta/recipes-support/rng-tools/r=
ng-tools/{rngd.service =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0rng-tools.service} (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-support/rng-tools/rng-tools/rngd.ser=
vice<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-support/rng-tools/rng-tools/rng-tool=
s.service<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; similarity index 100%<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename from meta/recipes-support/rng-tools/rn=
g-tools/rngd.service<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename to meta/recipes-support/rng-tools/rng-=
tools/rng-tools.service<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/meta/recipes-support/rng-tools/<=
a href=3D"http://rng-tools_6.15.bb" rel=3D"noreferrer" target=3D"_blank">rn=
g-tools_6.15.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://rng-tools_6.15.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://rng-tools_6.15.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-support/rng-tools/<a href=3D"http://=
rng-tools_6.15.bb" rel=3D"noreferrer" target=3D"_blank">rng-tools_6.15.bb</=
a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://rng-tools_6.15.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://rng-tools_6.15.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 0696351903..efc08b5e0a 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/meta/recipes-support/rng-tools/<a href=
=3D"http://rng-tools_6.15.bb" rel=3D"noreferrer" target=3D"_blank">rng-tool=
s_6.15.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://rng-tools_6.15.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://rng-tools_6.15.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/meta/recipes-support/rng-tools/<a href=
=3D"http://rng-tools_6.15.bb" rel=3D"noreferrer" target=3D"_blank">rng-tool=
s_6.15.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://rng-tools_6.15.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://rng-tools_6.15.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -11,7 +11,7 @@ DEPENDS =3D &quot;sysfsutil=
s openssl&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;git://<a href=3D"http://github.com/nhorman/rn=
g-tools.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"=
_blank">github.com/nhorman/rng-tools.git;branch=3Dmaster;protocol=3Dhttps</=
a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://github.com/nhorman/rng-tools.=
git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">=
http://github.com/nhorman/rng-tools.git;branch=3Dmaster;protocol=3Dhttps</a=
>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://init \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://default \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fil=
e://rngd.service \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fil=
e://rng-tools.service \<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This feels strange to me: &quot;rng-tools&quot; doe=
s not look like a daemon name,<br>
&gt;=C2=A0 =C2=A0 =C2=A0but rather a, well, tools name. Maybe &quot;rng-dae=
mon&quot; would clarify?<br>
&gt; <br>
&gt; <br>
&gt; Another option is to change the init daemon to be called rngd.<br>
<br>
I think yet another way is to check for condition when sysvinit <br>
compatibility is enabled during install time and decide if we need to <br>
install both sysvinit script and systemd service or not. I do not think<br>
renaming .service file is a good solution here.<br></blockquote><div><br></=
div><div>I have that solution on the first version of this patch,</div><div=
><br></div><div><a href=3D"https://lists.openembedded.org/g/openembedded-co=
re/message/167841?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Crng-tools%=
2C20%2C2%2C0%2C92278770">https://lists.openembedded.org/g/openembedded-core=
/message/167841?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Crng-tools%2C=
20%2C2%2C0%2C92278770</a><br></div><div><br></div><div>Regards,</div><div>A=
nibal</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
&gt; <br>
&gt; Regards,<br>
&gt; Anibal<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Still I&#39;m taking this patch for testing, I&#39;=
ll replace it with v2 should<br>
&gt;=C2=A0 =C2=A0 =C2=A0you send one.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0However please note there is an extra &#39;]&#39; i=
n the subject: [PATCHv2]]<br>
&gt;=C2=A0 =C2=A0 =C2=A0should be [PATCHv2]. This leads &#39;git am&#39; to=
 produce a commit starting<br>
&gt;=C2=A0 =C2=A0 =C2=A0with a &quot;] &quot; prefix. I fixed it while appl=
ying, however you should check<br>
&gt;=C2=A0 =C2=A0 =C2=A0that in the future.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Best regards.<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0Luca Ceresoli, Bootlin<br>
&gt;=C2=A0 =C2=A0 =C2=A0Embedded Linux and Kernel engineering<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://bootlin.com" rel=3D"noreferrer" =
target=3D"_blank">https://bootlin.com</a> &lt;<a href=3D"https://bootlin.co=
m" rel=3D"noreferrer" target=3D"_blank">https://bootlin.com</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#168566): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/168566" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/168566</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92635255=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/92635255/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>

--000000000000fd411705e4dd99c5--

