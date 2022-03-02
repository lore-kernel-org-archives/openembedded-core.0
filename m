Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FA3C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 00:42:19 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.2419.1646181738324908333
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 16:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FLbdOjOc;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id u11so125775lju.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 16:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dn10ez0psjNS3/ZduTHTElyeQddI44mW94xGW5YghxA=;
        b=FLbdOjOcWbO1jyJxg8JK8mPqWuxq+MPuA5qaNV9munlfo+mPdPgg57L9mFkW7wUg07
         WG78aL/UFxHrjkk6Nd0mBIK9vqSEYVor2kLhCMoBucfr+nAsuxDZizBeXBHtXNkNyozF
         4J0JRcScTUZmAgyVB7MFcaJuV1A5kQ7Cs0XHJMyuFBRq9CqO3fwG1VEsbTkn9fqbmAXn
         p2Ttb6mW2jrTta54bVJSs8GBDEiR+gmzciN5QNvVsAcG6t2eyRnsblXhhtgvYVWGuwAW
         LMhAxBnWSLwNMcU6D3EgtFGda3ts3QF9Grofb6DY2p1QuikEYnMlHWHHQDn4hEHEc20n
         6JmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dn10ez0psjNS3/ZduTHTElyeQddI44mW94xGW5YghxA=;
        b=DPYitNWB3FcQ0LmrMOKFBdQ2xYH2WZ6SZYl7s59a8XFY7OfquPZwc88X3Spo/AiQvQ
         bNeZcBtJp275cgfr0/fuwRaREyw0JCdI6mbMk9P3mAss50N7BoZM5nSss0MEJvmCMQok
         s8cKxui5u5YDPKUOWEGXdewwyf7Za5DjeGI5CHE5Xzqrb5KSnrXG4BtGIuchHwqpK6u+
         EXVZ4UDuTHRSK/k4XnNSf6FeT0cvea4E3PUDg9DZDZ1/tIkVTK5lp50P9B+lXaWm7YD4
         CIRpTX0EvD6I5CDucYCCuXkZ+ZbBNnmW8vqjJZHoo1DlitgdGdYDwa5vMNwcpy6pLZ2+
         Pvsg==
X-Gm-Message-State: AOAM532DF69FYl2CQOM1vEtJ7cO/HIW5ZmMNf61gTRJwhHdpkIt5PtRi
	553Ff1IFIjhSj0K9RowVNM13mK3mGGPEHA3KMfM=
X-Google-Smtp-Source: 
 ABdhPJzfPfs9OLTyjhY2kH8FQKx3zEWsLeSciOs6ZZe8jGfeM5FUK1yPMAaVMEBM5uZH59Ke2t1PJBe1ZnlMRFrJDg0=
X-Received: by 2002:a2e:9f12:0:b0:246:2893:391f with SMTP id
 u18-20020a2e9f12000000b002462893391fmr18311011ljk.216.1646181736247; Tue, 01
 Mar 2022 16:42:16 -0800 (PST)
MIME-Version: 1.0
References: <20220228163710.44361-1-quaresma.jose@gmail.com>
 <CAMKF1sr60VPL7C-kmroxNs5+d_aEsOn+ZZGZfBB7mwT-NHe3xg@mail.gmail.com>
 <963c756b456fa34b7377802f3fd3074f06c69476.camel@linuxfoundation.org>
In-Reply-To: 
 <963c756b456fa34b7377802f3fd3074f06c69476.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 2 Mar 2022 00:42:05 +0000
Message-ID: 
 <CANPvuRnHH0Lx5wHExD8=1tnO61nU2JO5Hbo8vvsFB32TvjogTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "cmake.bbclass: Set CXXFLAGS and CFLAGS"
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009ff5ea05d9318de8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 00:42:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162586

--0000000000009ff5ea05d9318de8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia ter=C3=
=A7a,
1/03/2022 =C3=A0(s) 07:50:

> On Mon, 2022-02-28 at 20:17 -0800, Khem Raj wrote:
> > this is fixing more than the workaround, e.g. see the patch I sent to
> > fix libical, where these flags are not passed to git compiler when
> > using cmake
> > I am not sure how many such fallouts there will be through out.
>
> The error Khem mentions is here:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/4839/st=
eps/11/logs/stdio
>
> with multiple other failures in that build in libical. I'm worried about
> other
> failures resulting from this change.
>

Thanks for the link, I can reproduce it on my side and it fails when
the gobject-introspection is enabled
and as I said to Khem I think that it's not related to cmake.
However I will try to build more cmake on oe-core to see if there are more
issues.

Without this patch none of the following variables makes much sense:

OECMAKE_C_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}"
OECMAKE_CXX_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS}"
OECMAKE_C_LINK_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS}
${LDFLAGS}"
OECMAKE_CXX_LINK_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAG=
S}
${LDFLAGS}"

Jose


> Cheers,
>
> Richard
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000009ff5ea05d9318de8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia ter=C3=A7a, 1/03/2022 =C3=A0(s) 07:50:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On Mon, 2022-02-28 at 20:17 -080=
0, Khem Raj wrote:<br>
&gt; this is fixing more than the workaround, e.g. see the patch I sent to<=
br>
&gt; fix libical, where these flags are not passed to git compiler when<br>
&gt; using cmake<br>
&gt; I am not sure how many such fallouts there will be through out.<br>
<br>
The error Khem mentions is here:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/65/build=
s/4839/steps/11/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/65/builds/4839/steps/11/logs/=
stdio</a><br>
<br>
with multiple other failures in that build in libical. I&#39;m worried abou=
t other<br>
failures resulting from this change.<br></blockquote><div><br></div><div>Th=
anks for the link, I can reproduce it on my side and it fails when the=C2=
=A0gobject-introspection is enabled</div><div>and as I said to Khem I think=
 that it&#39;s not related to cmake.</div><div>However I will try to build =
more cmake on oe-core to see if there are more issues.</div><div><br></div>=
<div>Without this patch none of the following variables makes much sense:</=
div><div><br></div><div>OECMAKE_C_FLAGS ?=3D &quot;${HOST_CC_ARCH} ${TOOLCH=
AIN_OPTIONS} ${CFLAGS}&quot;<br>OECMAKE_CXX_FLAGS ?=3D &quot;${HOST_CC_ARCH=
} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS}&quot;<br>OECMAKE_C_LINK_FLAGS ?=3D &quot=
;${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS} ${LDFLAGS}&quot;</div><di=
v>OECMAKE_CXX_LINK_FLAGS ?=3D &quot;${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${=
CXXFLAGS} ${LDFLAGS}&quot;<br></div><div><br></div><div>Jose</div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000009ff5ea05d9318de8--

