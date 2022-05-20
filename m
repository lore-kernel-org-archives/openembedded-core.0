Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6416BC433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 12:28:02 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web09.8012.1653049667117282031
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 05:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nlO9on53;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id r3so2627983ljd.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 05:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dT4r+8439auJ2BAUDovmzJIRjr6ER/dnwIb5nFyDxDk=;
        b=nlO9on53XkIgajhoTNVobZbf/0ZS4cjfaPku982LIAQTrA/4fNmzfum+4VX61Wth48
         AHzfSfv2BeQO8SyUAqDjKgGhJtKiakwkla0Q2IMjGQ7V05CasscGF1jmgVWVHMgUPaxB
         pD56wnyFcGv4sy9ekXCCWUQlJTU2WxOpPW8DVP1XNF2trKBzvkzBovzRGfbykH9f7ovx
         Ioor4mvOCPFylT6HzIE6BIfFfgj5ppmA1USaGp7rIQTlYrHb+wUJVUpQ+s3hcpMRP5BB
         vQhTPIuIYd1FF3OnNBkAjReT6sM/G/h/zpav9Pi5gLClz13oqbFnM2LSGKUu2tEx82Lj
         5wQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dT4r+8439auJ2BAUDovmzJIRjr6ER/dnwIb5nFyDxDk=;
        b=UauXiY3EbF7zec3e6aSAcaUKVkgqvXPiLQ7rqIKT9doG0BcfOMGzbYEV06mPW5f6tE
         2+cFBQIt7kimbFVoIa+k9vhvfQbbflI0OTAg0auHqCG9AoTgBx3tDb9Cl10cNk/8Ms0E
         qGjLwRhAPvwPacR42q9LWPrUQB4k4mesRKbREzxNyjNmcmIz8u/9HJAiFhl9xooB2Q9z
         WWB/wOR424EkvZ9fJqZbXdLhkR4qUzMkSgnYrAEJhJ8iO9AtSqbEvvIHA5Pr7jy3+MFA
         67Lio4S/O0NpF8CQhuBmHdd1uCuuByX/UHJeW9M0JLTzG05zMpvk38JANXaRHjDT+6ZY
         amOw==
X-Gm-Message-State: AOAM5310iwOz508+ot+Ju1U4ZI3WQxtSZVbFsbvsYyZRH6bsCwRNUcpU
	TI2swNrHizcEgX/BQZPj1DvSSVapKjpoPnnwnwM=
X-Google-Smtp-Source: 
 ABdhPJxMkr3AvImb+hhJlk8ci6HVQaq3SRFS9dOwuNVITm8wKm7S0dP5CY8+mvmsH5ckmE6PKEFS57Co9r0X8eQMF78=
X-Received: by 2002:a2e:9410:0:b0:253:c996:59fd with SMTP id
 i16-20020a2e9410000000b00253c99659fdmr5424667ljh.41.1653049665314; Fri, 20
 May 2022 05:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220520121617.2993631-1-thomas.perrot@bootlin.com>
 <6eed596f-6ca3-5977-bb1a-4d3d904bb154@gmail.com>
In-Reply-To: <6eed596f-6ca3-5977-bb1a-4d3d904bb154@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 May 2022 14:27:34 +0200
Message-ID: 
 <CANNYZj-V-+YiX4vOEBrEBmaqN6Qdacwwu8soz47WcCQLcpZHeg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] webkitgtk: limit the number of compilation
 threads
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: openembedded-core@lists.openembedded.org, thomas.perrot@bootlin.com
Content-Type: multipart/alternative; boundary="00000000000018e34b05df709eb3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 12:28:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165929

--00000000000018e34b05df709eb3
Content-Type: text/plain; charset="UTF-8"

The correct way to address this is to restrict the amount of webkit make
jobs in site.conf, specific to the build host. Or add RAM.

Ale

On Fri 20. May 2022 at 14.20, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> On 5/20/22 14:16, Thomas Perrot via lists.openembedded.org wrote:
> > Otherwise the compilation may lead to out-of-memories.
> >
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
> >   meta/recipes-sato/webkit/webkitgtk_2.36.1.bb | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
> > index 65757c36a733..e7cfe49e2b87 100644
> > --- a/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
> > +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
> > @@ -80,6 +80,8 @@ setup_python_link() {
> >       fi
> >   }
> >
> > +PARALLEL_MAKE = ""
> > +
> >   EXTRA_OECMAKE = " \
> >               -DPORT=GTK \
> >               ${@bb.utils.contains('GI_DATA_ENABLED', 'True',
> '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
> > @@ -164,4 +166,3 @@ src_package_preprocess () {
> >               ${B}/WebKit2Gtk/DerivedSources/webkit2/*.h
> >
> >   }
> > -
> >
>
> Why punish build machines with lots of RAM ? Maybe it could be set
> depending on available RAM/number of cores ?
>
> Jacob
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165928):
> https://lists.openembedded.org/g/openembedded-core/message/165928
> Mute This Topic: https://lists.openembedded.org/mt/91229473/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000018e34b05df709eb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The correct way to address this is to restrict the amount=
 of webkit make jobs in site.conf, specific to the build host. Or add RAM.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Ale=C2=A0</div><div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 20.=
 May 2022 at 14.20, Jacob Kroon &lt;<a href=3D"mailto:jacob.kroon@gmail.com=
">jacob.kroon@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On 5/20/22=
 14:16, Thomas Perrot via <a href=3D"http://lists.openembedded.org" rel=3D"=
noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Otherwise the compilation may lead to out-of-memories.<br>
&gt; <br>
&gt; Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootl=
in.com" target=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.36.=
1.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.36.1.bb</a> | 3 ++-<=
br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.36=
.1.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.36.1.bb</a> b/meta/=
recipes-sato/webkit/<a href=3D"http://webkitgtk_2.36.1.bb" rel=3D"noreferre=
r" target=3D"_blank">webkitgtk_2.36.1.bb</a><br>
&gt; index 65757c36a733..e7cfe49e2b87 100644<br>
&gt; --- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.36.1.bb" =
rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.36.1.bb</a><br>
&gt; +++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.36.1.bb" =
rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.36.1.bb</a><br>
&gt; @@ -80,6 +80,8 @@ setup_python_link() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +PARALLEL_MAKE =3D &quot;&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0EXTRA_OECMAKE =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DPORT=3DGTK \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.cont=
ains(&#39;GI_DATA_ENABLED&#39;, &#39;True&#39;, &#39;-DENABLE_INTROSPECTION=
=3DON&#39;, &#39;-DENABLE_INTROSPECTION=3DOFF&#39;, d)} \<br>
&gt; @@ -164,4 +166,3 @@ src_package_preprocess () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${B}/WebKit2Gtk/=
DerivedSources/webkit2/*.h<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; <br>
<br>
Why punish build machines with lots of RAM ? Maybe it could be set <br>
depending on available RAM/number of cores ?<br>
<br>
Jacob<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#165928): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/165928" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/165928</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91229473/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91229473/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000018e34b05df709eb3--

