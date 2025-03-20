Return-Path: <jarsoper@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252C6C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:12:04 +0000 (UTC)
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
 by mx.groups.io with SMTP id smtpd.web11.1916.1742494316902448245
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 11:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aMGc8U5A;
 spf=pass (domain: gmail.com, ip: 209.85.219.194, mailfrom: jarsoper@gmail.com)
Received: by mail-yb1-f194.google.com with SMTP id 3f1490d57ef6-e64165ae78cso843911276.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 11:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742494316; x=1743099116; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MJQ7sTPr7BmGxCaOnJKA6c0Ml8Kxr+1ovJRYmIrS/mE=;
        b=aMGc8U5ANYDmGn5wqsfonf7pOSfW+EH+kx6wIghUxn+hrpqAkpp0TkWVlIcFC1GEwX
         SZfn66S5eL+AP6znBTSH2e8a+1QO9LQScL6wJAONKNIF4wvqOyKFGh3CeSVaQul/lGiY
         5TS7mNFB2cOHWqO3GBpP/s0eTQWUnxn3cIfc8E/Cr46Dv28+SjUgsjFKxCufaWaMxJXT
         b8IQ/lfqb1a+cKJwHhahK/wCRjCnW9MRu5TqpVGTooBWDo50otE8q3YB4RTnxo95ndwX
         mqjB/aUj5OEonYuf/+wA2v55rhZY4RHAImIMJZB5zL9KIUl51MXcSaClPG23rb+LRrxS
         3aJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742494316; x=1743099116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJQ7sTPr7BmGxCaOnJKA6c0Ml8Kxr+1ovJRYmIrS/mE=;
        b=gPCUDDJF0/PiU58Oxg32kAQj7AJbKP5xzoeo0aj5HnRFLUydBmKtMmGbrvcDcrhv6o
         UIq1/871xWYVWq7eFlCNB1jQpRWpVjalcJm0J3QnGPkiLNvijPeqzRWCeILuQunY35A9
         OhvQ4avUsEbIXTF4321TMCfBKhOG8yzSdtYffqRfkzJDiYYNyXFcwDD324ry6VjMi6Ga
         XBUjoIgrC0RTXZEUZiUmV8S93LB2nZLGI0KX/s3C5eehTwGgoMjmlqJ1EF3UYYlgnnc4
         hoYqQLaRYfEWTH7U2pHLKTy2AwwWj/M3JNYS1Q+cEWaa1rkJbEFVa4Irtp1ANV57lxOh
         o6+A==
X-Forwarded-Encrypted: i=1; AJvYcCVpbN/fVx3sKLcsHesHzJndqlmCiRJPT0aNLJCJQZKlAIVdvK/gooayprvKIK+8CQqRNKH5e5GEoiJ3HtLZ8BYQNw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzn6UxfEAA51k1oQF4rj0blnbRUBMWs/b0c61T6HGnMSsmSn4Ip
	h47pOIrCnlFhsqAR5RSqJzXLLC3FxTcfwCnQYGgcCz+alugCvbp3gDIzgUU5zb6XcaYFDgTicGx
	gqrewASO2pYK7EYB1SsTpnZXOMXE=
X-Gm-Gg: ASbGncv/j5a/QNyGvbqxQo3tMq+H9BEoU9/f9A3AfeRwA98z2rZf+xYQfoPneonojCX
	e38SFTMRobABfSFpxp/hetKqeuePDVAR5dYU9pMI3EpWoTLMWmEQzJRHCZq0wzzfDlbsXGDBRPg
	/vixNMiEQdwRel7Izb+oMy+RnVAV5gRkIuwuySSdm/yt+1Si6vZRYkI7kLQs504oIhOgGVv3w=
X-Google-Smtp-Source: AGHT+IHf5QT/4ZMpoS4HCYKC7RcUQbbuQ/rSWUU+dVCA0oRbBPYX2jskcSz2WbmPotZ75xp4H95YYzAkf2N09s2A4HE=
X-Received: by 2002:a05:6902:2786:b0:e61:1dab:3b68 with SMTP id
 3f1490d57ef6-e66a4d7ea73mr154188276.12.1742494315685; Thu, 20 Mar 2025
 11:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250320165517.129442-1-martin.jansa@gmail.com>
 <182E912DEB60EF95.20788@lists.openembedded.org> <CA+chaQdD7i8xjuz9iPSNMfETo-5BNxsN=LibdZPrgdTYatccfw@mail.gmail.com>
 <182E91CCE4A2B275.19116@lists.openembedded.org> <d3f1a6601b2438007a963b69bf41d647672f78eb.camel@linuxfoundation.org>
 <CA+chaQc4kxzLcbFkZswbftUevsjcO4aYDzNVh6hMxj4miv9m1A@mail.gmail.com>
In-Reply-To: <CA+chaQc4kxzLcbFkZswbftUevsjcO4aYDzNVh6hMxj4miv9m1A@mail.gmail.com>
From: Jean-Pierre Geslin <jarsoper@gmail.com>
Date: Thu, 20 Mar 2025 19:11:44 +0100
X-Gm-Features: AQ5f1JoQn3OMFJcJXsZhsgIa_jNRZz4KDm6MVoVzprg-dx-o7Hfw58rfa4Sgq9M
Message-ID: <CAAuPjF8oBXzYug4E6HjxicDXbkahs7VXdGubsMi0J0VRho2bNQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cargo.bbclass: allow to avoid appending PACKAGECONFIG_CONFARGS
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	DongJoo Kim <dongjoo.kim@lge.com>
Content-Type: multipart/alternative; boundary="000000000000b5b5420630ca1224"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 18:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213425

--000000000000b5b5420630ca1224
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In my recipe I use it as:

CARGO_BUILD_FLAGS:append =3D " ${PACKAGECONFIG_CONFARGS}"
The recipe is public here:
https://github.com/Jarsop/meta-zenoh/blob/master/meta-zenoh/recipes-connect=
ivity/zenoh/zenoh_git.bb

Best regards

Le jeu. 20 mars 2025 =C3=A0 18:36, Martin Jansa <martin.jansa@gmail.com> a
=C3=A9crit :

> On Thu, Mar 20, 2025 at 6:16=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2025-03-20 at 17:06 +0000, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Thu, 2025-03-20 at 17:59 +0100, Martin Jansa via
> > > lists.openembedded.org wrote:
> > > > This 2nd one was supposed to be sent only as RFC, but I forgot to
> > > > update subject sorry.
> > > >
> > > > And this version also has a typo "=3D ?=3D", will send v2 if we wan=
t to
> > > > do
> > > > something like this (reverting the
> > > >
> https://git.openembedded.org/openembedded-core/commit/?id=3D16745b20452de=
60ae2474433cc1a2fb1ed9f6a64
> > > > is imho better as it doesn't respect the original author from
> > > >
> https://patchwork.yoctoproject.org/project/oe-core/patch/20220606132653.6=
0232-4-brgl@bgdev.pl/
> > > > and with CARGO_BUILD_FLAGS_PACKAGECONFIG it's imho more confusing
> > > > than
> > > > useful as the default)
> > >
> > > I have a strong preference for not carrying things like this. If
> > > there
> > > are existing recipes that break, we should just fix them and move on
> > > rather than letting the past dictate the future IMO.
> > >
> > > I'm trying really hard to simplify things where we can.
> >
> > Martin pointed out I was misreading things.
> >
> > If there are recipes using packageconfig in RUSTFLAGS then this will
> > break that. We probably do need to revert as I really don't like the
> > alternative variable mess. It does mean recipes will specifically need
> > to add the flags to the carbo build parameters but that is the lesser
> > of several evils IMO.
>
> Agreed about the revert being lesser evil.
>
> I know very little about rust/cargo, so it's also possible that we're
> using rust/cargo wrong and there is a better way to achieve
> conditional compilation with flags passed to cargo not by RUSTFLAGS.
>
> I've checked the recipe where we're using:
> RUSTFLAGS:append =3D " ${PACKAGECONFIG_CONFARGS}"
> and it's public as:
>
> https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-=
multimedia/gstreamer/gstreamer1.0-plugins-webosrs.bb
>
> With the RUSTFLAGS then being used as
> PACKAGECONFIG[unifieddecodebin] =3D '--cfg feature=3D\"unifieddecodebin\"=
'
> in the recipe and in code e.g.
>
> https://github.com/webosose/gst-plugins-webos/blob/%40rust/gst-rs/unified=
bin/src/lib.rs
> as:
> #[cfg(feature =3D "unifieddecodebin")]
> ...
>
> Will send revert unless Jean-Pierre or Bartosz have better idea how to
> deal with this.
>
> Cheers,
>

--000000000000b5b5420630ca1224
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>In my recipe I use it as:</div><div><br></div><div>CA=
RGO_BUILD_FLAGS:append =3D &quot; ${PACKAGECONFIG_CONFARGS}&quot;</div><div=
>The recipe is public here: <a href=3D"https://github.com/Jarsop/meta-zenoh=
/blob/master/meta-zenoh/recipes-connectivity/zenoh/zenoh_git.bb">https://gi=
thub.com/Jarsop/meta-zenoh/blob/master/meta-zenoh/recipes-connectivity/zeno=
h/zenoh_git.bb</a></div><div><br></div><div>Best regards</div></div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">Le=C2=A0jeu. 20 mars 2025 =C3=A0=C2=A018:36, Martin Jansa &lt;<a h=
ref=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Thu, Mar 20, 2025 at 6:16=E2=80=AFPM Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, 2025-03-20 at 17:06 +0000, Richard Purdie via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; On Thu, 2025-03-20 at 17:59 +0100, Martin Jansa via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; This 2nd one was supposed to be sent only as RFC, but I forg=
ot to<br>
&gt; &gt; &gt; update subject sorry.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; And this version also has a typo &quot;=3D ?=3D&quot;, will =
send v2 if we want to<br>
&gt; &gt; &gt; do<br>
&gt; &gt; &gt; something like this (reverting the<br>
&gt; &gt; &gt; <a href=3D"https://git.openembedded.org/openembedded-core/co=
mmit/?id=3D16745b20452de60ae2474433cc1a2fb1ed9f6a64" rel=3D"noreferrer" tar=
get=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3D=
16745b20452de60ae2474433cc1a2fb1ed9f6a64</a><br>
&gt; &gt; &gt; is imho better as it doesn&#39;t respect the original author=
 from<br>
&gt; &gt; &gt; <a href=3D"https://patchwork.yoctoproject.org/project/oe-cor=
e/patch/20220606132653.60232-4-brgl@bgdev.pl/" rel=3D"noreferrer" target=3D=
"_blank">https://patchwork.yoctoproject.org/project/oe-core/patch/202206061=
32653.60232-4-brgl@bgdev.pl/</a><br>
&gt; &gt; &gt; and with CARGO_BUILD_FLAGS_PACKAGECONFIG it&#39;s imho more =
confusing<br>
&gt; &gt; &gt; than<br>
&gt; &gt; &gt; useful as the default)<br>
&gt; &gt;<br>
&gt; &gt; I have a strong preference for not carrying things like this. If<=
br>
&gt; &gt; there<br>
&gt; &gt; are existing recipes that break, we should just fix them and move=
 on<br>
&gt; &gt; rather than letting the past dictate the future IMO.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m trying really hard to simplify things where we can.<br>
&gt;<br>
&gt; Martin pointed out I was misreading things.<br>
&gt;<br>
&gt; If there are recipes using packageconfig in RUSTFLAGS then this will<b=
r>
&gt; break that. We probably do need to revert as I really don&#39;t like t=
he<br>
&gt; alternative variable mess. It does mean recipes will specifically need=
<br>
&gt; to add the flags to the carbo build parameters but that is the lesser<=
br>
&gt; of several evils IMO.<br>
<br>
Agreed about the revert being lesser evil.<br>
<br>
I know very little about rust/cargo, so it&#39;s also possible that we&#39;=
re<br>
using rust/cargo wrong and there is a better way to achieve<br>
conditional compilation with flags passed to cargo not by RUSTFLAGS.<br>
<br>
I&#39;ve checked the recipe where we&#39;re using:<br>
RUSTFLAGS:append =3D &quot; ${PACKAGECONFIG_CONFARGS}&quot;<br>
and it&#39;s public as:<br>
<a href=3D"https://github.com/webosose/meta-webosose/blob/master/meta-webos=
/recipes-multimedia/gstreamer/gstreamer1.0-plugins-webosrs.bb" rel=3D"noref=
errer" target=3D"_blank">https://github.com/webosose/meta-webosose/blob/mas=
ter/meta-webos/recipes-multimedia/gstreamer/gstreamer1.0-plugins-webosrs.bb=
</a><br>
<br>
With the RUSTFLAGS then being used as<br>
PACKAGECONFIG[unifieddecodebin] =3D &#39;--cfg feature=3D\&quot;unifieddeco=
debin\&quot;&#39;<br>
in the recipe and in code e.g.<br>
<a href=3D"https://github.com/webosose/gst-plugins-webos/blob/%40rust/gst-r=
s/unifiedbin/src/lib.rs" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/webosose/gst-plugins-webos/blob/%40rust/gst-rs/unifiedbin/src/lib.rs<=
/a><br>
as:<br>
#[cfg(feature =3D &quot;unifieddecodebin&quot;)]<br>
...<br>
<br>
Will send revert unless Jean-Pierre or Bartosz have better idea how to<br>
deal with this.<br>
<br>
Cheers,<br>
</blockquote></div>

--000000000000b5b5420630ca1224--

