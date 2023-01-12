Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6090C54EBD
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 15:37:48 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.58443.1673537862572150262
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 07:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: aehs29@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-15b9c93848dso10970210fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 07:37:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ya9brjS56h86DYqZYXjcFZzqOq9vVqqyq+rHj78TbKc=;
        b=dcmVVTpBA6ru1z/alEFBUmODwN8bBznhPurr5krwnIseoahZ/fs1daZyWP4X3klGbZ
         CD6T7JMHsDKQ3sjjuesBg8YBJgQy/nb+r6lGFn2u4FKGAtHi4YZYzKapm9xuZBEw1paR
         Z7JfvUCaKfylqkzAmRp4bRMiNVXlatgZHB3TPf9sVwf0KvgwsgKRjTGKuDx3uHoe6iut
         uhJykeROrCenQgybEAez7ZtMNFKGDh8g3f0WvvJmLZRnTp1tQ8rkgX4rrLdpCzrfk/ym
         zCPAeS3JdDx6xFurozQlqccYssWGpoUkfp1NP8N3dJZSYZEA2eq6sd6qzf8xfRoOyEzm
         5t1A==
X-Gm-Message-State: AFqh2kqk3GC3UJczoxwFNWh6f5LFniyCkbeHCSxm9+mFjMGaATRsiDwv
	QoRhDL3Q6xvo/v9uTYgc54B36Dn48KLFgFmk
X-Google-Smtp-Source: AMrXdXt+e+zDHjPuv5yq0f6RH8daYfpd5JPt0pj+rx0OPfsvKGf33g6UIM+HSu8mCvUw+A0Ej2wQtQ==
X-Received: by 2002:a05:6870:f788:b0:150:cc16:a702 with SMTP id fs8-20020a056870f78800b00150cc16a702mr17347798oab.40.1673537861383;
        Thu, 12 Jan 2023 07:37:41 -0800 (PST)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com. [209.85.210.46])
        by smtp.gmail.com with ESMTPSA id g18-20020a056870a71200b001428eb454e9sm9144274oam.13.2023.01.12.07.37.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 07:37:40 -0800 (PST)
Received: by mail-ot1-f46.google.com with SMTP id j16-20020a056830271000b0067202045ee9so10757969otu.7
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 07:37:40 -0800 (PST)
X-Received: by 2002:a05:6830:1258:b0:66c:a1e8:ae7c with SMTP id
 s24-20020a056830125800b0066ca1e8ae7cmr4585854otp.365.1673537860338; Thu, 12
 Jan 2023 07:37:40 -0800 (PST)
MIME-Version: 1.0
References: <20230112043444.900323-1-alejandro@enedino.org> <Y7/WZCgHCr+/neFu@mail.local>
In-Reply-To: <Y7/WZCgHCr+/neFu@mail.local>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Thu, 12 Jan 2023 09:37:29 -0600
X-Gmail-Original-Message-ID: <CAHMutrZ4vb7iDM1BvCrb4SV3k0ieg8-Dksqr7mA7h3a46NSZuA@mail.gmail.com>
Message-ID: <CAHMutrZ4vb7iDM1BvCrb4SV3k0ieg8-Dksqr7mA7h3a46NSZuA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] baremetal-helloworld: Move from skeleton to
 recipes-extended matching what rust-hello-world is doing
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000af0a5c05f212e59f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 15:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175801

--000000000000af0a5c05f212e59f
Content-Type: text/plain; charset="UTF-8"

Understood, thanks

Alejandro

On Thu, Jan 12, 2023, 3:44 AM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Hello,
>
> I'm taking that one but please:
>  - version your patches properly, this should be v2
>  - resend the whole series everytime, else I need to go back and fish
>    out the previous patches. This is error prone and time consuming.
>
> Thanks!
>
> On 11/01/2023 21:34:44-0700, Alejandro Hernandez Samaniego wrote:
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> > ---
> >  meta/conf/distro/include/maintainers.inc                         | 1 +
> >  .../baremetal-example}/baremetal-helloworld_git.bb               | 1 +
> >  2 files changed, 2 insertions(+)
> >  rename {meta-skeleton/recipes-baremetal/baremetal-examples =>
> meta/recipes-extended/baremetal-example}/baremetal-helloworld_git.bb (99%)
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index 508d10e091..8c2201c91b 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -54,6 +54,7 @@ RECIPE_MAINTAINER:pn-automake = "Robert Yang <
> liezhi.yang@windriver.com>"
> >  RECIPE_MAINTAINER:pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
> >  RECIPE_MAINTAINER:pn-babeltrace = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER:pn-babeltrace2 = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> > +RECIPE_MAINTAINER:pn-baremetal-helloworld = "Alejandro Hernandez <
> alejandro@enedino.org>"
> >  RECIPE_MAINTAINER:pn-base-files = "Anuj Mittal <anuj.mittal@intel.com>"
> >  RECIPE_MAINTAINER:pn-base-passwd = "Anuj Mittal <anuj.mittal@intel.com
> >"
> >  RECIPE_MAINTAINER:pn-bash = "Hongxu Jia <hongxu.jia@windriver.com>"
> > diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/
> baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-example/
> baremetal-helloworld_git.bb
> > similarity index 99%
> > rename from meta-skeleton/recipes-baremetal/baremetal-examples/
> baremetal-helloworld_git.bb
> > rename to meta/recipes-extended/baremetal-example/
> baremetal-helloworld_git.bb
> > index fede17b0f0..82b2901d51 100644
> > --- a/meta-skeleton/recipes-baremetal/baremetal-examples/
> baremetal-helloworld_git.bb
> > +++ b/meta/recipes-extended/baremetal-example/
> baremetal-helloworld_git.bb
> > @@ -8,6 +8,7 @@ SRCREV = "22016ecbb9fb6c5f3a7a06698aea7ff8a701c166"
> >  PV = "0.1+git${SRCPV}"
> >
> >  SRC_URI = "git://
> github.com/aehs29/baremetal-helloqemu.git;protocol=https;branch=master"
> > +UPSTREAM_VERSION_UNKNOWN="1"
> >
> >  S = "${WORKDIR}/git"
> >
> > --
> > 2.34.1
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#175785):
> https://lists.openembedded.org/g/openembedded-core/message/175785
> > Mute This Topic: https://lists.openembedded.org/mt/96137379/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000af0a5c05f212e59f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Understood, thanks<div dir=3D"auto"><br></div><div dir=3D=
"auto">Alejandro=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jan 12, 2023, 3:44 AM Alexandre Bello=
ni &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@b=
ootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello,<b=
r>
<br>
I&#39;m taking that one but please:<br>
=C2=A0- version your patches properly, this should be v2<br>
=C2=A0- resend the whole series everytime, else I need to go back and fish<=
br>
=C2=A0 =C2=A0out the previous patches. This is error prone and time consumi=
ng.<br>
<br>
Thanks!<br>
<br>
On 11/01/2023 21:34:44-0700, Alejandro Hernandez Samaniego wrote:<br>
&gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"ma=
ilto:alejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">alejandro@=
enedino.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 .../baremetal-example}/<a href=3D"http://baremetal-helloworld_gi=
t.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">baremetal-helloworld_=
git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 2 files changed, 2 insertions(+)<br>
&gt;=C2=A0 rename {meta-skeleton/recipes-baremetal/baremetal-examples =3D&g=
t; meta/recipes-extended/baremetal-example}/<a href=3D"http://baremetal-hel=
loworld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">baremetal-h=
elloworld_git.bb</a> (99%)<br>
&gt; <br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt; index 508d10e091..8c2201c91b 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -54,6 +54,7 @@ RECIPE_MAINTAINER:pn-automake =3D &quot;Robert Yang =
&lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank" rel=3D"n=
oreferrer">liezhi.yang@windriver.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-avahi =3D &quot;Yi Zhao &lt;<a href=3D"mail=
to:yi.zhao@windriver.com" target=3D"_blank" rel=3D"noreferrer">yi.zhao@wind=
river.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-babeltrace =3D &quot;Alexander Kanavin &lt;=
<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferr=
er">alex.kanavin@gmail.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-babeltrace2 =3D &quot;Alexander Kanavin &lt=
;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"norefer=
rer">alex.kanavin@gmail.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER:pn-baremetal-helloworld =3D &quot;Alejandro Hernand=
ez &lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"no=
referrer">alejandro@enedino.org</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-base-files =3D &quot;Anuj Mittal &lt;<a hre=
f=3D"mailto:anuj.mittal@intel.com" target=3D"_blank" rel=3D"noreferrer">anu=
j.mittal@intel.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-base-passwd =3D &quot;Anuj Mittal &lt;<a hr=
ef=3D"mailto:anuj.mittal@intel.com" target=3D"_blank" rel=3D"noreferrer">an=
uj.mittal@intel.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-bash =3D &quot;Hongxu Jia &lt;<a href=3D"ma=
ilto:hongxu.jia@windriver.com" target=3D"_blank" rel=3D"noreferrer">hongxu.=
jia@windriver.com</a>&gt;&quot;<br>
&gt; diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/<a hre=
f=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">baremetal-helloworld_git.bb</a> b/meta/recipes-extended/barem=
etal-example/<a href=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferr=
er noreferrer" target=3D"_blank">baremetal-helloworld_git.bb</a><br>
&gt; similarity index 99%<br>
&gt; rename from meta-skeleton/recipes-baremetal/baremetal-examples/<a href=
=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">baremetal-helloworld_git.bb</a><br>
&gt; rename to meta/recipes-extended/baremetal-example/<a href=3D"http://ba=
remetal-helloworld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">=
baremetal-helloworld_git.bb</a><br>
&gt; index fede17b0f0..82b2901d51 100644<br>
&gt; --- a/meta-skeleton/recipes-baremetal/baremetal-examples/<a href=3D"ht=
tp://baremetal-helloworld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_=
blank">baremetal-helloworld_git.bb</a><br>
&gt; +++ b/meta/recipes-extended/baremetal-example/<a href=3D"http://bareme=
tal-helloworld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">bare=
metal-helloworld_git.bb</a><br>
&gt; @@ -8,6 +8,7 @@ SRCREV =3D &quot;22016ecbb9fb6c5f3a7a06698aea7ff8a701c=
166&quot;<br>
&gt;=C2=A0 PV =3D &quot;0.1+git${SRCPV}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/aehs29/bare=
metal-helloqemu.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">github.com/aehs29/baremetal-helloqemu.git;protoc=
ol=3Dhttps;branch=3Dmaster</a>&quot;<br>
&gt; +UPSTREAM_VERSION_UNKNOWN=3D&quot;1&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#175785): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/175785" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1757=
85</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96137379=
/3617179" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/96137379/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.=
belloni@bootlin.com" target=3D"_blank" rel=3D"noreferrer">alexandre.belloni=
@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div>

--000000000000af0a5c05f212e59f--

