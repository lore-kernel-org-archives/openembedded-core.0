Return-Path: <limon.anibal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C2DC19F2B
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 14:51:51 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web12.20571.1658933509260073087
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 07:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QmFLGMUC;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: limon.anibal@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id t17so15216400lfk.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 07:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VgW8x+/ChfAChM7vTtrtyG1Rro0owRGLk+8leHd5Mr8=;
        b=QmFLGMUCS0JeFRyD06nv71xLAFNdmCkPpbLS0kCeilNrnYRzfPQwBo+8oxja6bvcdB
         jn9b9Dn/14GgglvFrYmzsDbJj61L4GnHTW1YmNAalcfINHp8911ZS8r58qyV1mupnYAC
         tp705mhiX+83WQXtrm9XhCb2SDl3loEkIY8p1Lzocduy1EQCpD/eL5aYyuYEorSY/Cqo
         543xzluF6BZRXr5S/7Wf6uvBh5qnFB2jGovCpHdbR4LOLLIN6DQ0aZLLXJIVvWL6x05c
         hFVfe4k1B5rARXtdhCHMxFQIAfWpFF8W2/g/j0Oxv/DFpheyGVlunPBSXrwKKalzpvvY
         Lmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VgW8x+/ChfAChM7vTtrtyG1Rro0owRGLk+8leHd5Mr8=;
        b=vvU6H9ImUrHdwj0uT815o8tyX8l3Zkts/DdmN99rnuId+9UF+Kie+PWD2L5Dk1RvB1
         P52AX1jLpw8wng5WZLtTMnJzOsMS0CjTwoWnD3PX3MRRAO7nwEGGVYLuHZljs+dmO3uI
         GwNfefL2ecqssMlnJp6gJL6acfGCPFqnkLa6NM4q++ajd39t3Hmj8A4y8T5e7dctuA9b
         D9DeyDTRqC16BbyBEZHkWOS74yRlMCGCvQaEE1/EQLgFeNSyruvkiMB+EN3qqK/DdrkW
         qwzqWZxREV+DXHIrWe9dpCHFjD12Cy/YAbc/N+dsaVxV88esjrzriWafFeJnF3VuBU2I
         cFcg==
X-Gm-Message-State: AJIora89m+nzUpttg/VbHJkS5CaDhhOtLJMJgiMK+SHWT+m8S9sCtvsq
	mvv1QJcpSxJVYTbin08ZblnKw843VvRqYJJhhTY=
X-Google-Smtp-Source: 
 AGRyM1sOuGlMoNqJW9OrAcLCSf0+/zAlpqaf0nFBxE4Wpnln/eKrLQXJlGW0nLCuub8u4f3fNHh7Vd/ScM23Fl2/lRc=
X-Received: by 2002:a05:6512:3d10:b0:48a:a72d:d5fd with SMTP id
 d16-20020a0565123d1000b0048aa72dd5fdmr3150921lfv.556.1658933507424; Wed, 27
 Jul 2022 07:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220726193322.1569574-1-limon.anibal@gmail.com>
 <20220727124406.4f7bc8ec@booty>
In-Reply-To: <20220727124406.4f7bc8ec@booty>
From: =?UTF-8?Q?Anibal_Lim=C3=B3n?= <limon.anibal@gmail.com>
Date: Wed, 27 Jul 2022 09:51:36 -0500
Message-ID: 
 <CAPS-YPA4qwJu_3dJ+5X+HEzE1ZGzT6H4Y2urbCKzT14ZPOOiKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2]] recipes-support: rng-tools change systemd
 service name
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	otavio.salvador@ossystems.com.br,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000006a853905e4ca8ebf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 14:51:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168566

--0000000000006a853905e4ca8ebf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2022 at 5:44 AM Luca Ceresoli <luca.ceresoli@bootlin.com>
wrote:

> Hello An=C3=ADbal,
>
> On Tue, 26 Jul 2022 14:33:22 -0500
> "An?bal Lim?n" <limon.anibal@gmail.com> wrote:
>
> > From: An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com>
> >
> > Change systemd service name from rngd -> rng-tools to avoid load twice
> > the service when sysvinit compatibility is enabled,
> >
> > ...
> > root@:~# ps  | grep rng
> >    23 root         0 SW   [hwrng]
> > 13109 root      3528 R    /usr/sbin/rngd -f -r /dev/hwrng
> > 13117 root      2348 S    grep rng
> > 29418 root     12756 S    /usr/sbin/rngd -r /dev/hwrng
> > ...
> >
> > Signed-off-by: An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com>
> > ---
> >  .../rng-tools/{rngd.service =3D> rng-tools.service}    |  0
> >  meta/recipes-support/rng-tools/rng-tools_6.15.bb     | 12 ++++++------
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> >  rename meta/recipes-support/rng-tools/rng-tools/{rngd.service =3D>
> rng-tools.service} (100%)
> >
> > diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service
> b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> > similarity index 100%
> > rename from meta/recipes-support/rng-tools/rng-tools/rngd.service
> > rename to meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> > diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> > index 0696351903..efc08b5e0a 100644
> > --- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> > +++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> > @@ -11,7 +11,7 @@ DEPENDS =3D "sysfsutils openssl"
> >  SRC_URI =3D "git://
> github.com/nhorman/rng-tools.git;branch=3Dmaster;protocol=3Dhttps \
> >             file://init \
> >             file://default \
> > -           file://rngd.service \
> > +           file://rng-tools.service \
>
> This feels strange to me: "rng-tools" does not look like a daemon name,
> but rather a, well, tools name. Maybe "rng-daemon" would clarify?
>

Another option is to change the init daemon to be called rngd.

Regards,
Anibal


>
> Still I'm taking this patch for testing, I'll replace it with v2 should
> you send one.
>
> However please note there is an extra ']' in the subject: [PATCHv2]]
> should be [PATCHv2]. This leads 'git am' to produce a commit starting
> with a "] " prefix. I fixed it while applying, however you should check
> that in the future.
>
> Best regards.
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000006a853905e4ca8ebf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 5:44 AM Luca =
Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@bootlin.com">luca.ceresoli@boo=
tlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Hello An=C3=ADbal,<br>
<br>
On Tue, 26 Jul 2022 14:33:22 -0500<br>
&quot;An?bal Lim?n&quot; &lt;<a href=3D"mailto:limon.anibal@gmail.com" targ=
et=3D"_blank">limon.anibal@gmail.com</a>&gt; wrote:<br>
<br>
&gt; From: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:limon.anibal@gmail.=
com" target=3D"_blank">limon.anibal@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Change systemd service name from rngd -&gt; rng-tools to avoid load tw=
ice<br>
&gt; the service when sysvinit compatibility is enabled,<br>
&gt; <br>
&gt; ...<br>
&gt; root@:~# ps=C2=A0 | grep rng<br>
&gt;=C2=A0 =C2=A0 23 root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 SW=C2=A0 =C2=
=A0[hwrng]<br>
&gt; 13109 root=C2=A0 =C2=A0 =C2=A0 3528 R=C2=A0 =C2=A0 /usr/sbin/rngd -f -=
r /dev/hwrng<br>
&gt; 13117 root=C2=A0 =C2=A0 =C2=A0 2348 S=C2=A0 =C2=A0 grep rng<br>
&gt; 29418 root=C2=A0 =C2=A0 =C2=A012756 S=C2=A0 =C2=A0 /usr/sbin/rngd -r /=
dev/hwrng<br>
&gt; ...<br>
&gt; <br>
&gt; Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:limon.anib=
al@gmail.com" target=3D"_blank">limon.anibal@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../rng-tools/{rngd.service =3D&gt; rng-tools.service}=C2=A0 =C2=
=A0 |=C2=A0 0<br>
&gt;=C2=A0 meta/recipes-support/rng-tools/<a href=3D"http://rng-tools_6.15.=
bb" rel=3D"noreferrer" target=3D"_blank">rng-tools_6.15.bb</a>=C2=A0 =C2=A0=
 =C2=A0| 12 ++++++------<br>
&gt;=C2=A0 2 files changed, 6 insertions(+), 6 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-support/rng-tools/rng-tools/{rngd.service =
=3D&gt; rng-tools.service} (100%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/m=
eta/recipes-support/rng-tools/rng-tools/rng-tools.service<br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-support/rng-tools/rng-tools/rngd.service<br>
&gt; rename to meta/recipes-support/rng-tools/rng-tools/rng-tools.service<b=
r>
&gt; diff --git a/meta/recipes-support/rng-tools/<a href=3D"http://rng-tool=
s_6.15.bb" rel=3D"noreferrer" target=3D"_blank">rng-tools_6.15.bb</a> b/met=
a/recipes-support/rng-tools/<a href=3D"http://rng-tools_6.15.bb" rel=3D"nor=
eferrer" target=3D"_blank">rng-tools_6.15.bb</a><br>
&gt; index 0696351903..efc08b5e0a 100644<br>
&gt; --- a/meta/recipes-support/rng-tools/<a href=3D"http://rng-tools_6.15.=
bb" rel=3D"noreferrer" target=3D"_blank">rng-tools_6.15.bb</a><br>
&gt; +++ b/meta/recipes-support/rng-tools/<a href=3D"http://rng-tools_6.15.=
bb" rel=3D"noreferrer" target=3D"_blank">rng-tools_6.15.bb</a><br>
&gt; @@ -11,7 +11,7 @@ DEPENDS =3D &quot;sysfsutils openssl&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/nhorman/rng=
-tools.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">github.com/nhorman/rng-tools.git;branch=3Dmaster;protocol=3Dhttps</a=
> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://init \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://default \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://rngd.service \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://rng-tools.service \<b=
r>
<br>
This feels strange to me: &quot;rng-tools&quot; does not look like a daemon=
 name,<br>
but rather a, well, tools name. Maybe &quot;rng-daemon&quot; would clarify?=
<br></blockquote><div><br></div><div>Another option is to change the init d=
aemon to be called rngd.</div><div><br></div><div>Regards,</div><div>Anibal=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Still I&#39;m taking this patch for testing, I&#39;ll replace it with v2 sh=
ould<br>
you send one.<br>
<br>
However please note there is an extra &#39;]&#39; in the subject: [PATCHv2]=
]<br>
should be [PATCHv2]. This leads &#39;git am&#39; to produce a commit starti=
ng<br>
with a &quot;] &quot; prefix. I fixed it while applying, however you should=
 check<br>
that in the future.<br>
<br>
Best regards.<br>
-- <br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--0000000000006a853905e4ca8ebf--

