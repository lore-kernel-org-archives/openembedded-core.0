Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF9F9C0015E
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 20:52:51 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.2636.1691614367279627792
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 13:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Cxes4bcF;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6bca6c06e56so220408a34.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 13:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691614366; x=1692219166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IuLFF5loHhABvB/AbWKdoGOXGJtP/9DjNXnEeaH74TQ=;
        b=Cxes4bcFrpsMoZxb1Xmv5cy/agjUiFSTO9Jd0DzSz5O78cJ0VOVWiAXyDPHue+S+qB
         wXSweQPFggPmOspG0r2bJGLuXYE8ZPgZr7fb9uwq70+8li9kXJw+J8cBkX+1mASdZ13G
         uHJXWcdhhqug2G37v1WxGkxktNjZmgNsVK9+SCfLbaV7TZhGRhnpVyMXf7yZWvHcvcKc
         n44QgdYGZxhz4pFJ3NzwIumdNsgUj60ZfdRnl+JQK5HkJFPZJKiW9ZDkCYl8N0F91P3E
         HstzUXtWh4HY00vaqXV7OTZfhSGrQOv6X7KXAKvy4Oox3HKySM93n5HI30zjAoqTl4YD
         uftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691614366; x=1692219166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IuLFF5loHhABvB/AbWKdoGOXGJtP/9DjNXnEeaH74TQ=;
        b=j2Pb8vPG+aWik3LQTzhyRRq0ReunwHofWdU1XOdePiSMfW014F08iudSiLY0KWrbko
         FutMPjwQZLdcPV+jLu9tKQyDtf4QdDB2I7nAuwMmS1fYyuqrfZ4QSAL0CGbIwNblhXB4
         DJ0sJ5ZnvLOnYz++DZkBo6++YJf7EFGh7kJtkM31VAjU8OOKffoxETcpmGHjFmo/2wG1
         TTWL6ERkHNuVxz1TXtspeaMHVWpC5BGMLreqQtD/P9KKEhokFV+e2Y2FKBz1QGkMk4qh
         +DHSQQwMeNCTDDAffcZdKiRLANfSRpL/oP8eIFQT6rWB39oYYzzT+Hfcknjpkn1fAyRt
         ABiw==
X-Gm-Message-State: AOJu0Yw9Q1W+MbIxFTvwlVeR/27CyyEtHuABiuHCpo9t8SO0/KDyr62h
	fqkaU8ANmOIu9EGyD0R89WlFoHpUufeTDj/fZWImPS4chmny6A==
X-Google-Smtp-Source: AGHT+IE5FywK3C28EdiYbfqEJMGWWuQv5SeT0o9Wgclg4/NPJcJbZ9CyMs9KlTeAYilrbusAaTGmN5teM7E0vXGP7L4=
X-Received: by 2002:a05:6358:5e01:b0:134:eed0:3bc5 with SMTP id
 q1-20020a0563585e0100b00134eed03bc5mr452828rwn.9.1691614366291; Wed, 09 Aug
 2023 13:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <1779200FA9E646B9.10230@lists.openembedded.org>
 <CANPvuR=Z0GVLXWLLm2LciS2FumJFRRCyAdovQHeTPjod3VS==g@mail.gmail.com> <20230809202545e0e3244d@mail.local>
In-Reply-To: <20230809202545e0e3244d@mail.local>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 9 Aug 2023 21:52:35 +0100
Message-ID: <CANPvuR=RSHSkP9a5yusT7iRKqc=H+6xej2Mris3DDCEjRnoqUQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] systemd: fix efi dependency
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000665cc5060283a942"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 20:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185716

--000000000000665cc5060283a942
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

Alexandre Belloni <alexandre.belloni@bootlin.com> escreveu no dia quarta,
9/08/2023 =C3=A0(s) 21:25:

> Hello,
>
> On 09/08/2023 00:02:08+0100, Jose Quaresma wrote:
> > Ping!
>
> We developed the same patch at the same time, I confirm yours is working
> but it was not enough to solve all the systemd v254 related issues. I've
> just sent the hopefully last patch to fix the remaining issue.
>

Thanks for your support and we hope your wic fix is the last one
for the systemd-boot.

Anyway please note that this patch is not for the systemd-boot but
it is for systemd to fix the build when the efi packageconfig is enabled.

Jose


>
> >
> > Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
> > gmail.com@lists.openembedded.org> escreveu no dia segunda, 7/08/2023
> =C3=A0(s)
> > 15:26:
> >
> > > Last version of systemd dpends now on pyelftools to build the efi
> support
> > > but the required tool is the native ones and not the target.
> > > The systemd-boot has the corrected dependencie so fix this in the mai=
n
> > > recipe.
> > >
> > > | Program python3 (jinja2) found: YES
> > >
> (/build/tmp-lmp/work/corei7-64-lmp-linux/systemd/1_254-r0/recipe-sysroot-=
native/usr/bin/python3-native/python3)
> > > modules: jinja2
> > > | Checking if "32bit build possible" : links: NO
> > > | Program python3 (elftools) found: NO
> > > |
> > > | ../git/meson.build:2147:8: ERROR: Problem encountered: EFI bootload=
er
> > > support requires pyelftools.
> > > |
> > > | A full log can be found at
> > >
> /build/tmp-lmp/work/corei7-64-lmp-linux/systemd/1_254-r0/build/meson-logs=
/meson-log.txt
> > >
> > > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > > ---
> > >  meta/recipes-core/systemd/systemd_254.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-core/systemd/systemd_254.bb
> > > b/meta/recipes-core/systemd/systemd_254.bb
> > > index ea1a4f02f0..cd2a021da2 100644
> > > --- a/meta/recipes-core/systemd/systemd_254.bb
> > > +++ b/meta/recipes-core/systemd/systemd_254.bb
> > > @@ -142,7 +142,7 @@ PACKAGECONFIG[default-compression-lz4] =3D
> "-Dlz4=3Dtrue
> > > -Ddefault-compression=3Dlz4,,
> > >  PACKAGECONFIG[default-compression-xz] =3D "-Dxz=3Dtrue
> > > -Ddefault-compression=3Dxz,,xz"
> > >  PACKAGECONFIG[default-compression-zstd] =3D "-Dzstd=3Dtrue
> > > -Ddefault-compression=3Dzstd,,zstd"
> > >  PACKAGECONFIG[dbus] =3D "-Ddbus=3Dtrue,-Ddbus=3Dfalse,dbus"
> > > -PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Dtrue,-Defi=3Dfal=
se
> > > -Dbootloader=3Dfalse,python3-pyelftools"
> > > +PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Dtrue,-Defi=3Dfal=
se
> > > -Dbootloader=3Dfalse,python3-pyelftools-native"
> > >  PACKAGECONFIG[elfutils] =3D "-Delfutils=3Dtrue,-Delfutils=3Dfalse,el=
futils"
> > >  PACKAGECONFIG[firstboot] =3D "-Dfirstboot=3Dtrue,-Dfirstboot=3Dfalse=
"
> > >  PACKAGECONFIG[repart] =3D "-Drepart=3Dtrue,-Drepart=3Dfalse"
> > > --
> > > 2.34.1
> > >
> > >
> > >
> > >
> > >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#185679):
> https://lists.openembedded.org/g/openembedded-core/message/185679
> > Mute This Topic: https://lists.openembedded.org/mt/100600508/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000665cc5060283a942
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alexandre,</div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">Alexandre Belloni &lt;<a href=3D"mailto:=
alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</a>&gt; escrev=
eu no dia quarta, 9/08/2023 =C3=A0(s) 21:25:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hello,<br>
<br>
On 09/08/2023 00:02:08+0100, Jose Quaresma wrote:<br>
&gt; Ping!<br>
<br>
We developed the same patch at the same time, I confirm yours is working<br=
>
but it was not enough to solve all the systemd v254 related issues. I&#39;v=
e<br>
just sent the hopefully last patch to fix the remaining issue.<br></blockqu=
ote><div><br></div><div>Thanks for=C2=A0your support and we hope your wic f=
ix is the last one</div><div>for the systemd-boot.<br><br>Anyway please not=
e that this patch is not for the systemd-boot but</div><div>it is for syste=
md to fix the=C2=A0build when the efi packageconfig is enabled.</div><div><=
br></div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
&gt; <br>
&gt; Jose Quaresma via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.openembedded.org</a> &lt;quaresma.jose=3D<=
br>
&gt; <a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">=
gmail.com@lists.openembedded.org</a>&gt; escreveu no dia segunda, 7/08/2023=
 =C3=A0(s)<br>
&gt; 15:26:<br>
&gt; <br>
&gt; &gt; Last version of systemd dpends now on pyelftools to build the efi=
 support<br>
&gt; &gt; but the required tool is the native ones and not the target.<br>
&gt; &gt; The systemd-boot has the corrected dependencie so fix this in the=
 main<br>
&gt; &gt; recipe.<br>
&gt; &gt;<br>
&gt; &gt; | Program python3 (jinja2) found: YES<br>
&gt; &gt; (/build/tmp-lmp/work/corei7-64-lmp-linux/systemd/1_254-r0/recipe-=
sysroot-native/usr/bin/python3-native/python3)<br>
&gt; &gt; modules: jinja2<br>
&gt; &gt; | Checking if &quot;32bit build possible&quot; : links: NO<br>
&gt; &gt; | Program python3 (elftools) found: NO<br>
&gt; &gt; |<br>
&gt; &gt; | ../git/meson.build:2147:8: ERROR: Problem encountered: EFI boot=
loader<br>
&gt; &gt; support requires pyelftools.<br>
&gt; &gt; |<br>
&gt; &gt; | A full log can be found at<br>
&gt; &gt; /build/tmp-lmp/work/corei7-64-lmp-linux/systemd/1_254-r0/build/me=
son-logs/meson-log.txt<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@=
foundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_254.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_254.bb</a> | 2 +-<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_=
254.bb" rel=3D"noreferrer" target=3D"_blank">systemd_254.bb</a><br>
&gt; &gt; b/meta/recipes-core/systemd/<a href=3D"http://systemd_254.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd_254.bb</a><br>
&gt; &gt; index ea1a4f02f0..cd2a021da2 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_254.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_254.bb</a><br>
&gt; &gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_254.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_254.bb</a><br>
&gt; &gt; @@ -142,7 +142,7 @@ PACKAGECONFIG[default-compression-lz4] =3D &q=
uot;-Dlz4=3Dtrue<br>
&gt; &gt; -Ddefault-compression=3Dlz4,,<br>
&gt; &gt;=C2=A0 PACKAGECONFIG[default-compression-xz] =3D &quot;-Dxz=3Dtrue=
<br>
&gt; &gt; -Ddefault-compression=3Dxz,,xz&quot;<br>
&gt; &gt;=C2=A0 PACKAGECONFIG[default-compression-zstd] =3D &quot;-Dzstd=3D=
true<br>
&gt; &gt; -Ddefault-compression=3Dzstd,,zstd&quot;<br>
&gt; &gt;=C2=A0 PACKAGECONFIG[dbus] =3D &quot;-Ddbus=3Dtrue,-Ddbus=3Dfalse,=
dbus&quot;<br>
&gt; &gt; -PACKAGECONFIG[efi] =3D &quot;-Defi=3Dtrue -Dbootloader=3Dtrue,-D=
efi=3Dfalse<br>
&gt; &gt; -Dbootloader=3Dfalse,python3-pyelftools&quot;<br>
&gt; &gt; +PACKAGECONFIG[efi] =3D &quot;-Defi=3Dtrue -Dbootloader=3Dtrue,-D=
efi=3Dfalse<br>
&gt; &gt; -Dbootloader=3Dfalse,python3-pyelftools-native&quot;<br>
&gt; &gt;=C2=A0 PACKAGECONFIG[elfutils] =3D &quot;-Delfutils=3Dtrue,-Delfut=
ils=3Dfalse,elfutils&quot;<br>
&gt; &gt;=C2=A0 PACKAGECONFIG[firstboot] =3D &quot;-Dfirstboot=3Dtrue,-Dfir=
stboot=3Dfalse&quot;<br>
&gt; &gt;=C2=A0 PACKAGECONFIG[repart] =3D &quot;-Drepart=3Dtrue,-Drepart=3D=
false&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.34.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; <br>
&gt; -- <br>
&gt; Best regards,<br>
&gt; <br>
&gt; Jos=C3=A9 Quaresma<br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#185679): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/185679" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/185679</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10060050=
8/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/100600508/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000665cc5060283a942--

