Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D428C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 18:25:57 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.279.1646936755641477911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 10:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=wwB8fffq;
 spf=pass (domain: burtonini.com, ip: 209.85.128.48,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f48.google.com with SMTP id q20so3780914wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 10:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Fflg4aBK+P9QBfybMCTYlF/+kIVTOtWwOEuz+Nr9bs=;
        b=wwB8fffqnVyvSMM4/NQIwzAimlG6Uu4Axy22SsHtUsL/S3llRMoXVu7l6F91XLUFVI
         1NXH09ZLr0h7kqmOtY/lDsWQVFHain8OUlFO/+vzrOzOqY2GJxNk9aJGwnCrhXtlzwAv
         EA8dr2OwVkt4Y6GduwYVmKGOOJdkIq/CVUKRZrXvmCOXrBHhJMqflgQxrI0AlRcOekkM
         ipKCn/NHO1XXSKW5/pYb2ZWcU2yJmHlfCAaM/l2l5SlV2K/O/hOcUuwfwm+cjtolPIHP
         LSFDsarpfslFhzVqmyExw3k1aHDribZ5rP0bfb6NeCvzuyRS2KDFFfDBuJuM0yx+7Dee
         9Wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Fflg4aBK+P9QBfybMCTYlF/+kIVTOtWwOEuz+Nr9bs=;
        b=Iptyc5ZyuSAJImMWIVPbSGhJExiCFWybs54TzNvRZxjii/GSGeg5tIscHMfzcxMcfB
         GDBh6XFZMXuV+neuMtQ7Pj2fZclhoEGTJOERcyGfdoKlOB4PvZjM78nNedl8ga+elnfk
         k9WdYz6t4NmSZ+0LK73HRxrnaLbMCPHJ/Xv/TLmP3GWwL80UyLPgBxz6JtND6ZOnBHPH
         Dwl7B32HPTaDWhM0oqoCA3zsDtk3tlKvLwOxB0KUxiDesEj5Kj3s0PJZjyNSxHfMdZop
         VRF1TMKQ1GU6OhWDgvcUoJC2Q938mnx1zYIEk2vAskif/U3HKaquB/3q824jXrutqI5l
         yKVQ==
X-Gm-Message-State: AOAM531/TJOqCQ/NrIQeJhyE4gH62lhlO2skeLT9OFQ74rUlIm6nbUR0
	ymoa96434pPh/CRPMZVdabGfN8AX1qnoLipehv0AgA==
X-Google-Smtp-Source: 
 ABdhPJw7vrfbmTAJn5Chz4fJzP47q4a7EG6AONYXhI6nQS+vHnIQKAqn93YcZuMHEPUiP7vqS94cuYftnQZQrlkCuQI=
X-Received: by 2002:a7b:c841:0:b0:389:864c:e715 with SMTP id
 c1-20020a7bc841000000b00389864ce715mr4600569wml.72.1646936753987; Thu, 10 Mar
 2022 10:25:53 -0800 (PST)
MIME-Version: 1.0
References: <20220310171656.3106028-1-ross.burton@arm.com>
 <AM9PR09MB46423A3FDC636B28C16590C6A80B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB46423A3FDC636B28C16590C6A80B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 10 Mar 2022 18:25:42 +0000
Message-ID: 
 <CAAnfSTujN-T=7kfEfrmcs3XXdsAB2XL3=p9gtCWCyn__dhT2Pg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-installer: add installer module
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003077f205d9e158fb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 18:25:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163035

--0000000000003077f205d9e158fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Mar 2022 at 17:36, Konrad Weihmann <kweihmann@outlook.com> wrote=
:

> Sorry to say that - but to me (even though it's more work) pip seems to
> be the better option - the proposed tool is ~8 months old and not part
> of pypa community as it seems - so in comparison to pip this could not
> be labeled "battle proven".


It=E2=80=99s not that unheard of, for example the flit_core bootstrap docum=
entation
says to use it:

https://flit.readthedocs.io/en/latest/bootstrap.html

It also does one job and just one job, which is A Very Good Thing.

Especially as the second patch of the series removes the possibility to
> use the tooling proposed by python upstream for installing stuff.


Do you mean Pip here? That=E2=80=99s one option.  Installing a wheel is a g=
lorified
unzip, pip brings a lot of baggage that we don=E2=80=99t care about.

I should make it clear that this class is not for installing arbitrary
wheels, it installs a wheel we just built and in the future will build the
wheel too.

If one would want to have that kind of tooling the switch from pure
> setup.py to toml and friends could have been done already a year ago
> (python-build was the originally proposed tool iirc) - so this feels to
> me like a step in the wrong direction (esp. the part that this would
> rely on a tool **not** supported by upstream)


Adding support for build is next on the list.

Ross

--0000000000003077f205d9e158fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu, 10 Mar 2022 at 17:36, Konrad Weihmann &lt;<a href=3D"mail=
to:kweihmann@outlook.com">kweihmann@outlook.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(=
204,204,204)">Sorry to say that - but to me (even though it&#39;s more work=
) pip seems to <br>
be the better option - the proposed tool is ~8 months old and not part <br>
of pypa community as it seems - so in comparison to pip this could not <br>
be labeled &quot;battle proven&quot;.</blockquote><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">It=E2=80=99s not that unheard of, for example the flit=
_core bootstrap documentation says to use it:</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><div><a href=3D"https://flit.readthedocs.io/en/latest=
/bootstrap.html">https://flit.readthedocs.io/en/latest/bootstrap.html</a></=
div><br></div><div dir=3D"auto">It also does one job and just one job, whic=
h is A Very Good Thing.</div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" =
dir=3D"auto">
Especially as the second patch of the series removes the possibility to <br=
>
use the tooling proposed by python upstream for installing stuff.</blockquo=
te><div dir=3D"auto"><br></div><div dir=3D"auto">Do you mean Pip here? That=
=E2=80=99s one option.=C2=A0 Installing a wheel is a glorified unzip, pip b=
rings a lot of baggage that we don=E2=80=99t care about.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">I should make it clear that this class is =
not for installing arbitrary wheels, it installs a wheel we just built and =
in the future will build the wheel too.</div><div dir=3D"auto"><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb=
(204,204,204)" dir=3D"auto">
If one would want to have that kind of tooling the switch from pure <br>
setup.py to toml and friends could have been done already a year ago <br>
(python-build was the originally proposed tool iirc) - so this feels to <br=
>
me like a step in the wrong direction (esp. the part that this would <br>
rely on a tool **not** supported by upstream)</blockquote><div dir=3D"auto"=
><br></div><div dir=3D"auto">Adding support for build is next on the list.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Ross</div><div dir=3D"au=
to"><br></div></div></div>

--0000000000003077f205d9e158fb--

