Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BECCFC77B6E
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 11:50:52 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.10283.1681386642767371468
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 04:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VT6IEoUr;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id z26so14626545ljq.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 04:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681386641; x=1683978641;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rWwLUwGzvCLtdHsDj4JvvppOzUOUjLHYSpU0Ta+w83c=;
        b=VT6IEoUrGPUvuVU1fIqKAbFl6ALF/TOd7yN8KmND3FL1/XHZGJOng/Krl+0VGE0kx+
         lIa9XiEARre+CjbiLPWcg2LcBzgxRnF30OJJGZIptYjMP5QWys5Mw09fe7vM35jf3bh3
         BSQWo77sQVIZHwtTtDH9nCovImXUDAO6faGabOjgDjMYHj+qSZqEYGqStRA+NuM92oqt
         4Q3n2BZAG25cHFspxUvHcWcukDgg01CikpR5tfmssuBCFrqPNmbYTowMoISZdcU8dt6d
         T6bjYJI/MzW/A6F8ND5zDJVtu1ZclskgmfSJY3zOBRp5H6GUOL07xiP7Hf5g2RQG1TBH
         KxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681386641; x=1683978641;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWwLUwGzvCLtdHsDj4JvvppOzUOUjLHYSpU0Ta+w83c=;
        b=NSVBkUjcyhJcbzwXorGSb8gjw1yKjmmMKqLWw8wR8Nu/SW8xbwH4H6GXhT5Skxoyyb
         TlPcw7iWAKtgNvGizGCF0ys8FeywXXtUNZ1Hby3MIGfp7Dizfqn62S3bT082vHgjeNSg
         cXjxtTfIhj6EhOsAXWBtmcg7W07NXCkWP1Lt9aBzdt2+0GvhCPUsng1ilWp519vUVGcZ
         GchR3CyptYZhdoZFnJwwwYp8ReVi8gynCM7CifQLIurERsSwcVhQst2IfR66hB908ZdJ
         h7RyJu3eV2pe8vdSCFoh/FHf4ZqCilvB6E8d/90H9lRaTwBaXG9Ml1gXYdm4QslP2Azv
         2q2A==
X-Gm-Message-State: AAQBX9fde33qg3z7ys7o+QtXAl8+TC3YMxgZdxw3BGwBDTpioTwNmqol
	/p5NiMxGZI72PVBTW27/+wFSWksHugeGHbR4aYs=
X-Google-Smtp-Source: AKy350aWvC9sXebD0z4Aej68BlMkqdGc9C3xdqkBWAi8aG4Ig3UAt0c7eXve5R9ODp6v9MTGsJSaW5HuH/Vx8qOdnwM=
X-Received: by 2002:a2e:7d13:0:b0:29a:a76a:194b with SMTP id
 y19-20020a2e7d13000000b0029aa76a194bmr655785ljc.3.1681386640544; Thu, 13 Apr
 2023 04:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <17557BAACB05F534.10127@lists.openembedded.org>
In-Reply-To: <17557BAACB05F534.10127@lists.openembedded.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 13 Apr 2023 13:50:28 +0200
Message-ID: <CA+cAkep_grZ5_Jsmnm6GeQ2BBbeaxC_XVOWEzgjhY+8oKJU9VA@mail.gmail.com>
Subject: Re: [OE-core] cargo patching git path
To: frederic.martinsons@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000007096ee05f9365520"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 11:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179975

--0000000000007096ee05f9365520
Content-Type: text/plain; charset="UTF-8"

By the way, it was way simpler to update my cargo to 1.68.2 and I confirm
the patching still works like a charm.

On Thu, 13 Apr 2023 at 13:40, Frederic Martinsons via lists.openembedded.org
<frederic.martinsons=gmail.com@lists.openembedded.org> wrote:

> Hello,
>
> Since I didn't manage to make any progress on the reproducibility issue of
> zvariant (https://bugzilla.yoctoproject.org/show_bug.cgi?id=15090) i
> decided to try another rust project to see their reproducibility state.
>
> I went with zbus (https://github.com/zeenix/zbus) which use zvariant
> (because one of my hypothesis is that zvariant was not aimed to be build
> standalone) and I came into another issue which is the subject of this
> mail. I cannot make the zbus recipe to be built:
>
> | error: failed to get `glib` as a dependency of package `zvariant v3.12.0
> (/home/jenkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/git/zvariant)`
> |
> | Caused by:
> |   failed to load source for dependency `glib`
> |
> | Caused by:
> |   Unable to update https://github.com/gtk-rs/glib?rev=c9ee583cea0
> |
> | Caused by:
> |   can't checkout from 'https://github.com/gtk-rs/glib': you are in the
> offline mode (--offline)
>
> I looked at the patching process of cargo_common.class and it is correctly
> applied and the cargo config file contains the following content:
>
> [patch."https://github.com/gtk-rs/glib"]
> glib = { path =
> "/home/jenkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/glib"
> }
> glib-macros = { path =
> "/home/jenkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/glib-macros"
> }
>
> [patch."https://github.com/gtk-rs/sys"]
> glib-sys = { path =
> "/home/jenkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/glib-sys"
> }
> gobject-sys = { path =
> "/home/jenkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/gobject-sys"
> }
>
> I first think about what @Alex Kiernan <alex.kiernan@gmail.com> said on
> its commit message (
> https://git.openembedded.org/openembedded-core/commit/?id=684a8af41c5bb70db68e75f72bdc4c9b09630810)
> about patching not working with virtual manifest since the zbus project use
> of this.
>
> But I managed to make this patching work with the zbus project locally (by
> the way I notified the upstream about that:
> https://github.com/rust-lang/cargo/issues/4934).
>
> I cannot understand why this does not work under yocto despite the correct
> cargo config file for patching.
>
> On my ubuntu, I used cargo 1.67.1 and oe has 1.68.2, will try a downgrade
> but I feel that this is not the issue.
>
> Any ideas ?
>
>
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179974):
> https://lists.openembedded.org/g/openembedded-core/message/179974
> Mute This Topic: https://lists.openembedded.org/mt/98238501/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000007096ee05f9365520
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">By the way, it was way simpler to update my cargo to 1.68.=
2 and I confirm the patching still works like a charm.</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 13 Apr 2023 =
at 13:40, Frederic Martinsons via <a href=3D"http://lists.openembedded.org"=
>lists.openembedded.org</a> &lt;frederic.martinsons=3D<a href=3D"mailto:gma=
il.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr">Hello,=C2=A0<div><br></div><div>Since I didn&#39;t manage to make any =
progress on the reproducibility issue of zvariant (<a href=3D"https://bugzi=
lla.yoctoproject.org/show_bug.cgi?id=3D15090" target=3D"_blank">https://bug=
zilla.yoctoproject.org/show_bug.cgi?id=3D15090</a>) i decided to try anothe=
r rust project to see their reproducibility state.</div><div><br></div><div=
>I went with zbus (<a href=3D"https://github.com/zeenix/zbus" target=3D"_bl=
ank">https://github.com/zeenix/zbus</a>) which=C2=A0use zvariant (because o=
ne of my hypothesis is that zvariant was not aimed to be build standalone) =
and I came into another issue which is the subject of this mail. I cannot m=
ake the zbus recipe to be built:</div><div><br></div><div>| error: failed t=
o get `glib` as a dependency of package `zvariant v3.12.0 (/home/jenkins/yo=
cto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/git/=
zvariant)`<br>| <br>| Caused by:<br>| =C2=A0 failed to load source for depe=
ndency `glib`<br>| <br>| Caused by:<br>| =C2=A0 Unable to update <a href=3D=
"https://github.com/gtk-rs/glib?rev=3Dc9ee583cea0" target=3D"_blank">https:=
//github.com/gtk-rs/glib?rev=3Dc9ee583cea0</a><br>| <br>| Caused by:<br>| =
=C2=A0 can&#39;t checkout from &#39;<a href=3D"https://github.com/gtk-rs/gl=
ib" target=3D"_blank">https://github.com/gtk-rs/glib</a>&#39;: you are in t=
he offline mode (--offline)<br></div><div><br></div><div>I looked at the pa=
tching process of cargo_common.class and it is correctly applied and the ca=
rgo config file contains the following content:</div><div><br></div><div>[p=
atch.&quot;<a href=3D"https://github.com/gtk-rs/glib" target=3D"_blank">htt=
ps://github.com/gtk-rs/glib</a>&quot;]<br>glib =3D { path =3D &quot;/home/j=
enkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.=
0-r0/glib&quot; }<br>glib-macros =3D { path =3D &quot;/home/jenkins/yocto-p=
oky-master/poky/build/tmp/work/core2-64-poky-linux/zbus/3.11.0-r0/glib-macr=
os&quot; }<br><br>[patch.&quot;<a href=3D"https://github.com/gtk-rs/sys" ta=
rget=3D"_blank">https://github.com/gtk-rs/sys</a>&quot;]<br>glib-sys =3D { =
path =3D &quot;/home/jenkins/yocto-poky-master/poky/build/tmp/work/core2-64=
-poky-linux/zbus/3.11.0-r0/glib-sys&quot; }<br>gobject-sys =3D { path =3D &=
quot;/home/jenkins/yocto-poky-master/poky/build/tmp/work/core2-64-poky-linu=
x/zbus/3.11.0-r0/gobject-sys&quot; }<br></div><div><br></div><div>I first t=
hink about what=C2=A0<a class=3D"gmail_plusreply" id=3D"m_38295940285245204=
93plusReplyChip-0" href=3D"mailto:alex.kiernan@gmail.com" target=3D"_blank"=
>@Alex Kiernan</a>=C2=A0said on its commit message (<a href=3D"https://git.=
openembedded.org/openembedded-core/commit/?id=3D684a8af41c5bb70db68e75f72bd=
c4c9b09630810" target=3D"_blank">https://git.openembedded.org/openembedded-=
core/commit/?id=3D684a8af41c5bb70db68e75f72bdc4c9b09630810</a>) about patch=
ing not working with virtual manifest since the zbus project use of this.</=
div><div><br></div><div>But I managed to make this patching work with the z=
bus project locally (by the way I notified the upstream about that:=C2=A0<a=
 href=3D"https://github.com/rust-lang/cargo/issues/4934" target=3D"_blank">=
https://github.com/rust-lang/cargo/issues/4934</a>).</div><div><br></div><d=
iv>I cannot understand why this does not work under yocto despite the corre=
ct cargo config file for patching.<br></div><div><br></div><div>On my ubunt=
u, I used cargo 1.67.1 and oe has 1.68.2, will try a downgrade but I feel t=
hat this is not the issue.</div><div><br></div><div>Any ideas ?</div><div><=
br></div><div><br></div><div><br></div><div><br></div><div><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179974): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179974" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/179974</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98238501/6213=
388" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98238501/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martinsons@gmail.=
com" target=3D"_blank">frederic.martinsons@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000007096ee05f9365520--

