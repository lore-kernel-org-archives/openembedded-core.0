Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830D4CA0FED
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 17:37:46 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.1629.1693589858383133157
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 10:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TmredBir;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2bcbfb3705dso38445971fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 10:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693589856; x=1694194656; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UU5scUa4jNRs+3YpJHViCNhFnMQaNDibgKxTovebRYY=;
        b=TmredBirSce9AsHeAPWSpmBoe45Qt49B+Si2tbZxhmjQ2pBq7pJ6fXs/i4PBQ8K1Ry
         vDbrAMJC0q8/0TkRs2GIAvui//NBn9XYdJwj6Dnq0w8WW1cAiY9EiNrbBj15NFCYmUMG
         oC/EodXjOl5yqtrIcjLlvUFmZAA+JcAiP/GtxgrQg1qE/kGuk2TqclHPG6RcOrcP148S
         TzxvxjD7Dp2UB4dfNQfSdzSS9ViCKR1ZRJjj2P7LSufXKYtcDk/FkBSls2ILPfbsIcpY
         dWTvkFZ6BBTPljtmwoaSl9Zx54gt2r2P2r51aB2k2Gc9WQUgJw6vXd1ujspJYrMqDXu6
         oWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693589856; x=1694194656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UU5scUa4jNRs+3YpJHViCNhFnMQaNDibgKxTovebRYY=;
        b=VAig1Iepvq9v+YgSJTAGnm1IYDz286maDGXBOKfmca+Xz/vB3WiN/Gopp6v/u8Tx9a
         jHikA7ybAZUKvIeH26C2KMMn4d+3d+pZTVNdW4cmvIDuEFLnZTunV7JeiWN7bD0F0bwf
         oyQNBor88EhEgK3paCi/WstyPGNyXTBOBEAElRnmAh7DnZqNVZFdBiXLSUZUilxsJokl
         6jNgKjbuXDcEj+OLETwUkyCrS7Hxk0LpLFU2hTFZsVpMI+QFb7IOyyy5lX8l9Vq7hRf9
         5GXSbm6HdGOqUJ9gw3h1hNOmUCZik2XUkO/uxYV7iJvCd30URbMiC3jvfhnJWnZmDh8M
         vSlg==
X-Gm-Message-State: AOJu0Yzaq63ZB/gUozC6ZNENJHKG6VqMHzt0RNj8amJoiq+XXnmyoobO
	1j9zOrA9l2GoH+h+8Zw35KxU/Gn98tK91oH46Tg=
X-Google-Smtp-Source: AGHT+IHaID58+mWj7orGodEpPRll7sOTh/DRxQgXpl6vGGKez5U9uYL/otCzpYToFDH73xCwuW9Z1YCFZhRaDNWYs3s=
X-Received: by 2002:a2e:90d6:0:b0:2bc:c21d:311f with SMTP id
 o22-20020a2e90d6000000b002bcc21d311fmr2053994ljg.52.1693589855668; Fri, 01
 Sep 2023 10:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <lyjzt9g8e8.fsf@ensc-pc.intern.sigma-chemnitz.de>
In-Reply-To: <lyjzt9g8e8.fsf@ensc-pc.intern.sigma-chemnitz.de>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Fri, 1 Sep 2023 19:37:24 +0200
Message-ID: <CA+cAkeq_Z+1bWZR2=M8bigTvOtExDeBKdEyYYDR5A3B9OxsH4Q@mail.gmail.com>
Subject: Re: [OE-core] rust: why is it built in do_install()
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000be0e7106044f9de8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 17:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187014

--000000000000be0e7106044f9de8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Enrico,

Le ven. 1 sept. 2023, 18:34, Enrico Scholz via lists.openembedded.org
<enrico.scholz=3Dsigma-chemnitz.de@lists.openembedded.org> a =C3=A9crit :

> Hello,
>
> rust recipe does
>
> | do_compile () {
> | }
> |
> | rust_do_install() {
> |     rust_runx install
> | }
> |
> | rust_do_install:class-nativesdk() {
> |     export PSEUDO_UNLOAD=3D1
> |     rust_runx install
> |     rust_runx install clippy
> |     rust_runx install rustfmt
>
>
> What is the reason to run the expensive "rust_runx" in do_install() and
> not in do_compile().
>
> This:
>
> - is unexpected... do_install is usually expected to run fast
>
> - might interfere with different ${PARALLEL_MAKE} and ${PARALLEL_MAKEINST=
}
>   setup
>
> - might slow down the build process because the 'class-native' variant
>   seems to run with active 'pseudo'
>
>
> I guess it is done in this way because of
>
> |    config.set("install", "prefix",  e(d.getVar("D") +
> d.getVar("prefix")))
>
> where '${D}' is cleared by do_install.
>
>
> Wouldn't it be better to replace this by
>
> |    config.set("install", "prefix",  e(d.getVar("B") + '/_install' +
> d.getVar("prefix")))
>
>
> | do_compile () {
> |     rust_runx install
> |     rust_runx install clippy
> |     rust_runx install rustfmt
> | }
> |
> | rust_do_install() {
> |     cp -a ${B}/_install ${D}
>
> ?
>
>
> [adding 'rustfmt' to 'class-native' would be nice because e.g. 'bindgen'
>  users might expect it]
>
>
I don't know why this was done that way and I lacked xp for telling you if
your suggestion is correct. But I just wanna tell that the
do_install:rust-native is very long (more than 45mn on my machine) so you
may have a point here.

Enrico
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187012):
> https://lists.openembedded.org/g/openembedded-core/message/187012
> Mute This Topic: https://lists.openembedded.org/mt/101098826/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000be0e7106044f9de8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello Enrico,=C2=A0<br><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">Le ven. 1 sept. 2023, 18:34, Enrico=
 Scholz via <a href=3D"http://lists.openembedded.org">lists.openembedded.or=
g</a> &lt;enrico.scholz=3D<a href=3D"mailto:sigma-chemnitz.de@lists.openemb=
edded.org">sigma-chemnitz.de@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">Hello,<br>
<br>
rust recipe does<br>
<br>
| do_compile () {<br>
| }<br>
|=C2=A0 <br>
| rust_do_install() {<br>
|=C2=A0 =C2=A0 =C2=A0rust_runx install<br>
| }<br>
| <br>
| rust_do_install:class-nativesdk() {<br>
|=C2=A0 =C2=A0 =C2=A0export PSEUDO_UNLOAD=3D1<br>
|=C2=A0 =C2=A0 =C2=A0rust_runx install<br>
|=C2=A0 =C2=A0 =C2=A0rust_runx install clippy<br>
|=C2=A0 =C2=A0 =C2=A0rust_runx install rustfmt<br>
<br>
<br>
What is the reason to run the expensive &quot;rust_runx&quot; in do_install=
() and<br>
not in do_compile().<br>
<br>
This:<br>
<br>
- is unexpected... do_install is usually expected to run fast<br>
<br>
- might interfere with different ${PARALLEL_MAKE} and ${PARALLEL_MAKEINST}<=
br>
=C2=A0 setup<br>
<br>
- might slow down the build process because the &#39;class-native&#39; vari=
ant<br>
=C2=A0 seems to run with active &#39;pseudo&#39;<br>
<br>
<br>
I guess it is done in this way because of<br>
<br>
|=C2=A0 =C2=A0 config.set(&quot;install&quot;, &quot;prefix&quot;,=C2=A0 e(=
d.getVar(&quot;D&quot;) + d.getVar(&quot;prefix&quot;)))<br>
<br>
where &#39;${D}&#39; is cleared by do_install.<br>
<br>
<br>
Wouldn&#39;t it be better to replace this by<br>
<br>
|=C2=A0 =C2=A0 config.set(&quot;install&quot;, &quot;prefix&quot;,=C2=A0 e(=
d.getVar(&quot;B&quot;) + &#39;/_install&#39; + d.getVar(&quot;prefix&quot;=
)))<br>
<br>
<br>
| do_compile () {<br>
|=C2=A0 =C2=A0 =C2=A0rust_runx install<br>
|=C2=A0 =C2=A0 =C2=A0rust_runx install clippy<br>
|=C2=A0 =C2=A0 =C2=A0rust_runx install rustfmt<br>
| }<br>
|<br>
| rust_do_install() {<br>
|=C2=A0 =C2=A0 =C2=A0cp -a ${B}/_install ${D}<br>
<br>
?<br>
<br>
<br>
[adding &#39;rustfmt&#39; to &#39;class-native&#39; would be nice because e=
.g. &#39;bindgen&#39;<br>
=C2=A0users might expect it]<br><br></blockquote></div></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">I don&#39;t know why this was done that way=
 and I lacked xp for telling you if your suggestion is correct. But I just =
wanna tell that the do_install:rust-native is very long (more than 45mn on =
my machine) so you may have a point here.=C2=A0</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">Enrico<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#187012): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/187012" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/187012</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101098826/621=
3388" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/101098826/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martin=
sons@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gm=
ail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000be0e7106044f9de8--

