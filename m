Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70334C433FE
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 19:43:47 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web11.1977.1638906225898162252
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 11:43:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jFT6VLLT;
 spf=pass (domain: gmail.com, ip: 209.85.221.170,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id j1so104994vkr.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 11:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WlXoa9QvPEygIKomfVS0uP3OD2YYNUdNB+zyHnRBKiU=;
        b=jFT6VLLTxn/s8Vdo2W0DNk0pRyBwZ3DLucIxWkXTd6c4Qy8FDwDA58iPFLtWnY5iXb
         0GgZMqHA5k8iIh0pnYtimtdfc3pEfa0zUYngBq9o/AJ7t1jIHsh4DvEacvduoZJ4MuDn
         DOsRvGSOb03zqLTFST8/tvQ4IJNjEcWZTnq4nUAOFkCOkvkbBxsqk9d+dgpqoSoNEhPN
         bXs1KIvKdAsdAgwNXYydI/EY//re8uY8gAK8tBI4sfbWTw2zeLQtTVhyuXCyGhVehJGE
         9zsgzCebTQyEptnPPLZ6npI8DZW8r0reFiQ2NghoH1ZI8kAeisgAhP6mxlomlUpw3esU
         x0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WlXoa9QvPEygIKomfVS0uP3OD2YYNUdNB+zyHnRBKiU=;
        b=XkTROA0Kv/hTE0IDtAZpPKAbkqqpHiMsmoRPZ5Cn2vT3d2jsXdRsFvASEQTy3DJnoi
         tB6hlrvB1Fjl6pZgepaa8pdX6wKp65TsiSgP2uhfSdtjy/X+nHSaCiadmHWoe1+pbNc1
         IJgGBCJ+rJkap6p0SKpt+Wzg8dr+LkQGD7MXikwKUM7P1leGCq/QX6y8H/MTfXfCVJrL
         1bazC0gva6L9JPyS0EB/YVIXIeJVVJrSwnfhQB4UbvxiM+EpydPo55srDKN+uavEBIZO
         f5v5Y8+tUMqPqP6FfjbDB1n5x62PdOWw53ITE/PXrayoFvuDHscarokmhWL2UE6/3PnP
         KP6w==
X-Gm-Message-State: AOAM531YHSU7xi8cco7wexxl6iYUbgd9lgUo7Wns4w9fw9mZT9y0Z4u8
	XhFDMrxmM+fjc+BGZBTfrQm/iWmh143pH5QD4ZI=
X-Google-Smtp-Source: 
 ABdhPJyuwqi4qM8Y7SXf1JVGrEKq+g5T9TwDCjZb/pht+tQhaaFp+EFwKdQFOJWzyz4KjuNT12mpzcBUOszMVJ3Un/E=
X-Received: by 2002:a05:6122:c6f:: with SMTP id
 i47mr54249385vkr.20.1638906225031;
 Tue, 07 Dec 2021 11:43:45 -0800 (PST)
MIME-Version: 1.0
References: <1638804078-8183-1-git-send-email-wangmy@fujitsu.com>
 <f206d7acc80b1d4f4425898539f06b33dfd091b8.camel@linuxfoundation.org>
 <CAAnfSTtKWk0njrZQm_a0awBXyRWxGea8GCZ2tzgRfpy96F1zCg@mail.gmail.com>
 <CAAnfSTu24bK18-k3Wr2=qDP00ptnV+WFoAerpgz7kHGV1O5aqg@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTu24bK18-k3Wr2=qDP00ptnV+WFoAerpgz7kHGV1O5aqg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Dec 2021 20:43:33 +0100
Message-ID: 
 <CANNYZj_kEnxJ9K6Van9VGzNUmQrSLv2ck745VW0=MXX9PTL0XQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pango: upgrade 1.48.10 -> 1.50.0
To: Ross Burton <ross@burtonini.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 wangmy <wangmy@fujitsu.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005cfde705d29397a8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 19:43:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159332

--0000000000005cfde705d29397a8
Content-Type: text/plain; charset="UTF-8"

Upstream seems to have merged a bunch of related fixes, so let's wait for
1.50.1:
https://gitlab.gnome.org/GNOME/pango/-/commits/main

Alex

On Tue, 7 Dec 2021 at 17:52, Ross Burton <ross@burtonini.com> wrote:

> And
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2624/steps/12/logs/stdio
> ,
> so that's x86-64 and arm64.
>
> Ross
>
> On Tue, 7 Dec 2021 at 16:51, Ross Burton <ross@burtonini.com> wrote:
> >
> > Not just x32:
> >
> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2898/steps/12/logs/stdio
> >
> > Ross
> >
> > On Tue, 7 Dec 2021 at 13:36, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Mon, 2021-12-06 at 23:21 +0800, wangmy wrote:
> > > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > > ---
> > > >  .../pango/{pango_1.48.10.bb => pango_1.50.0.bb}                 |
> 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >  rename meta/recipes-graphics/pango/{pango_1.48.10.bb =>
> pango_1.50.0.bb} (94%)
> > > >
> > > > diff --git a/meta/recipes-graphics/pango/pango_1.48.10.bb
> b/meta/recipes-graphics/pango/pango_1.50.0.bb
> > > > similarity index 94%
> > > > rename from meta/recipes-graphics/pango/pango_1.48.10.bb
> > > > rename to meta/recipes-graphics/pango/pango_1.50.0.bb
> > > > index 40df7042e6..db17158d20 100644
> > > > --- a/meta/recipes-graphics/pango/pango_1.48.10.bb
> > > > +++ b/meta/recipes-graphics/pango/pango_1.50.0.bb
> > > > @@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
> > > >
> > > >  SRC_URI += "file://run-ptest"
> > > >
> > > > -SRC_URI[archive.sha256sum] =
> "21e1f5798bcdfda75eabc4280514b0896ab56f656d4e7e66030b9a2535ecdc98"
> > > > +SRC_URI[archive.sha256sum] =
> "dba8b62ddf86e10f73f93c3d2256b73238b2bcaf87037ca229b40bdc040eb3f3"
> > > >
> > > >  DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype
> virtual/libiconv cairo harfbuzz fribidi"
> > > >
> > >
> > > Seems to break x32 unfortunately:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/4403
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > >
> > >
> > >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159317):
> https://lists.openembedded.org/g/openembedded-core/message/159317
> Mute This Topic: https://lists.openembedded.org/mt/87541909/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000005cfde705d29397a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Upstream seems to have merged a bunch of related fixe=
s, so let&#39;s wait for 1.50.1:</div><div><a href=3D"https://gitlab.gnome.=
org/GNOME/pango/-/commits/main">https://gitlab.gnome.org/GNOME/pango/-/comm=
its/main</a></div><div><br></div><div>Alex<br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 7 Dec 2021 at 1=
7:52, Ross Burton &lt;<a href=3D"mailto:ross@burtonini.com">ross@burtonini.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">And <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/8=
2/builds/2624/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">htt=
ps://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2624/steps/1=
2/logs/stdio</a>,<br>
so that&#39;s x86-64 and arm64.<br>
<br>
Ross<br>
<br>
On Tue, 7 Dec 2021 at 16:51, Ross Burton &lt;<a href=3D"mailto:ross@burtoni=
ni.com" target=3D"_blank">ross@burtonini.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Not just x32:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/81/=
builds/2898/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https=
://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2898/steps/12/=
logs/stdio</a><br>
&gt;<br>
&gt; Ross<br>
&gt;<br>
&gt; On Tue, 7 Dec 2021 at 13:36, Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Mon, 2021-12-06 at 23:21 +0800, wangmy wrote:<br>
&gt; &gt; &gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fuji=
tsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 .../pango/{<a href=3D"http://pango_1.48.10.bb" rel=3D"=
noreferrer" target=3D"_blank">pango_1.48.10.bb</a> =3D&gt; <a href=3D"http:=
//pango_1.50.0.bb" rel=3D"noreferrer" target=3D"_blank">pango_1.50.0.bb</a>=
}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; &gt;=C2=A0 rename meta/recipes-graphics/pango/{<a href=3D"http://=
pango_1.48.10.bb" rel=3D"noreferrer" target=3D"_blank">pango_1.48.10.bb</a>=
 =3D&gt; <a href=3D"http://pango_1.50.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">pango_1.50.0.bb</a>} (94%)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-graphics/pango/<a href=3D"http://p=
ango_1.48.10.bb" rel=3D"noreferrer" target=3D"_blank">pango_1.48.10.bb</a> =
b/meta/recipes-graphics/pango/<a href=3D"http://pango_1.50.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">pango_1.50.0.bb</a><br>
&gt; &gt; &gt; similarity index 94%<br>
&gt; &gt; &gt; rename from meta/recipes-graphics/pango/<a href=3D"http://pa=
ngo_1.48.10.bb" rel=3D"noreferrer" target=3D"_blank">pango_1.48.10.bb</a><b=
r>
&gt; &gt; &gt; rename to meta/recipes-graphics/pango/<a href=3D"http://pang=
o_1.50.0.bb" rel=3D"noreferrer" target=3D"_blank">pango_1.50.0.bb</a><br>
&gt; &gt; &gt; index 40df7042e6..db17158d20 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-graphics/pango/<a href=3D"http://pango_1.=
48.10.bb" rel=3D"noreferrer" target=3D"_blank">pango_1.48.10.bb</a><br>
&gt; &gt; &gt; +++ b/meta/recipes-graphics/pango/<a href=3D"http://pango_1.=
50.0.bb" rel=3D"noreferrer" target=3D"_blank">pango_1.50.0.bb</a><br>
&gt; &gt; &gt; @@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG =3D &quot;disabled&=
quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 SRC_URI +=3D &quot;file://run-ptest&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -SRC_URI[archive.sha256sum] =3D &quot;21e1f5798bcdfda75eabc4=
280514b0896ab56f656d4e7e66030b9a2535ecdc98&quot;<br>
&gt; &gt; &gt; +SRC_URI[archive.sha256sum] =3D &quot;dba8b62ddf86e10f73f93c=
3d2256b73238b2bcaf87037ca229b40bdc040eb3f3&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 DEPENDS =3D &quot;glib-2.0 glib-2.0-native fontconfig =
freetype virtual/libiconv cairo harfbuzz fribidi&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Seems to break x32 unfortunately:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/57/builds/4403" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/typhoon/#/builders/57/builds/4403</a><br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt;<br>
&gt; &gt; Richard<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159317): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159317" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159317</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87541909/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87541909/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000005cfde705d29397a8--

