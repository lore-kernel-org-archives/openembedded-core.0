Return-Path: <vishal.bhoj@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC47EC43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 15:30:40 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.120766.1669649435799789201
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 07:30:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RCcNbkf4;
 spf=pass (domain: linaro.org, ip: 209.85.166.48, mailfrom: vishal.bhoj@linaro.org)
Received: by mail-io1-f48.google.com with SMTP id g26so7166215iob.11
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 07:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7otu+I8HkootANvSZ6wuWfgUiNuBm2YPxYtK5qXl5L4=;
        b=RCcNbkf4nzAtqvusM8fqBPQdVaVdhxT2/Y1Tj2rQKq5+Pc54KNno1etvQ+esNOSPeY
         0a1xPd5X2eSU8N/60auiMYC0MW4u3Hqu5wHgMndotKnJp8sxlRt2ArJhhwDmkXJVezmX
         kOQoYCbcF1/lzeoFgLATuMlVn5Zi0DPsJg4AXTbFCZ3MG1zGJTCAI7FpIpnf1T24RSut
         fL5djrJxuhRLOA9XdXHJdA0O7We4Sxf4jtaY9LBqOKhpNo3UjzGCzuqCOBnu34n0qBcB
         Q+ZgDamMW3mZ/BOkuaYhpQXKc/T1USCE7k+stWaOsH/2EFYCVWk45ix68vGXnIzHED8H
         nDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7otu+I8HkootANvSZ6wuWfgUiNuBm2YPxYtK5qXl5L4=;
        b=t+xqMNYBCyUaW5KEUFXkBktQUXVuRZWfgPuDMDX2F6Avno6D7nlnPEb5RGXQFIo8TL
         eXN7GI/kgZMYU6f0tYid0mrEGaAXEM5t4rwyd1BtxBa7rbMgw9Ty1Ea+lg6nztJ1eeFA
         EtEuwxAYaFWTqqE+Z0jrnh66msYO7L03eUBTtfaQ+psWd4aXwxPJubMzvzkJna5KZEui
         ycsRZGXwCeVuNIvQuQplvoWYyemlICXllrNhTwOuCBTpvc6+Qd4CRuA3vmRJ2Yele8e0
         gs8FylPAlocWuruylZsPukF00FOMzlNBCp+S17MsjzVbUBxRcJ7AWMsT1+ibPPurhvr2
         azxQ==
X-Gm-Message-State: ANoB5pl7fv4P/ow+IaAH69KPcIB8FykMzyRUqOpsyO2r7nmvIoGzARH/
	40lDLR7HMyoC6b/aPJklBWC0jZFHR9EcZSNrFBY3gQ==
X-Google-Smtp-Source: AA0mqf4wzZ6Dw/VlPURzCAkuMM2kRXr+Rxr9unyDejf+AtI4OcGOVQeTfl3r+eeeeJ8tO5pWlcrZ3UEtDtCBNSIqpn8=
X-Received: by 2002:a6b:3102:0:b0:6bf:e923:388b with SMTP id
 j2-20020a6b3102000000b006bfe923388bmr24731341ioa.105.1669649434899; Mon, 28
 Nov 2022 07:30:34 -0800 (PST)
MIME-Version: 1.0
References: <20221127213640.539995-1-richard.purdie@linuxfoundation.org>
 <CAKdWgSw2tZ68R531RZgi2bqLrdOXkc1oZnxM_rEugv7S-ysOUA@mail.gmail.com> <89a3d3880e4da3f35326c7c3c2d4c904bae5f2aa.camel@linuxfoundation.org>
In-Reply-To: <89a3d3880e4da3f35326c7c3c2d4c904bae5f2aa.camel@linuxfoundation.org>
From: Vishal Bhoj <vishal.bhoj@linaro.org>
Date: Mon, 28 Nov 2022 21:00:24 +0530
Message-ID: <CAKdWgSwO_C22j+0SYRNAf-q_ZueV7Jf3bkrZ7WSf7w+BhktmyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH RFC] base: Switch to use addpylib directive
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000077908a05ee898d6c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 15:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173925

--00000000000077908a05ee898d6c
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Nov 2022 at 20:14, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2022-11-28 at 19:29 +0530, Vishal Bhoj wrote:
> > I get the below backtrace with this patch on master-next. The same
> > patchset works fine on debian-11. Are there any specific versions of
> > packages that need to be installed as  dependency ?
> >
> > Tested on host os: ubuntu-18.04/ubuntu-20.04


> Which python versions are those? It looks like I perhaps assumed a
> piece of newer python syntax accidentally. I suspect this code only
> works with python 3.9+:
>

Looks like it is the case:
ubuntu-18.04: python 3.6
ubuntu-20.04: python 3.8

>
> https://peps.python.org/pep-0584/
>
> I was wondering whether to remove this piece entirely anyway, I need to
> check the performance implications.
>
> Cheers,
>
> Richard
>
>

--00000000000077908a05ee898d6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 28 Nov 2022 at 20:14, Richard=
 Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.p=
urdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Mon, 2022-11-28 at 19:29 +0530, Vishal Bhoj wro=
te:<br>
&gt; I get the below backtrace with this patch on master-next. The same<br>
&gt; patchset works fine on debian-11. Are there any specific versions of<b=
r>
&gt; packages that need to be installed as=C2=A0=C2=A0dependency=C2=A0?<br>
&gt; <br>
&gt; Tested on host os: ubuntu-18.04/ubuntu-20.04=C2=A0</blockquote><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
Which python versions are those? It looks like I perhaps assumed a<br>
piece of newer python syntax accidentally. I suspect this code only<br>
works with python 3.9+:<br></blockquote><div><br></div><div>Looks like it i=
s the case:</div><div>ubuntu-18.04: python 3.6</div><div>ubuntu-20.04: pyth=
on 3.8</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<a href=3D"https://peps.python.org/pep-0584/" rel=3D"noreferrer" target=3D"=
_blank">https://peps.python.org/pep-0584/</a><br>
<br>
I was wondering whether to remove this piece entirely anyway, I need to<br>
check the performance implications.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--00000000000077908a05ee898d6c--

