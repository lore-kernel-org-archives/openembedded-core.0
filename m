Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F91C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 08:20:28 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web08.48755.1638778827387982852
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 00:20:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ACuC+1Nv;
 spf=pass (domain: gmail.com, ip: 209.85.222.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id p37so17915806uae.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 00:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W75mVsD+mFEip/68/8ZeT5JmXFx6tvlvSvssKwNv8nc=;
        b=ACuC+1Nv50CrXbhPMWikMd5514rwXWsYD4BCEd7+Uk7bWxk43xUhz51ZhUsr8HwlUu
         4Mz3Jfv+WAWo6SfvYOyZzaVTJQFuzaq8t8lgUqsLHD1Axk/nIS1PIpuK5X+uHaw4stoL
         5CSlHVhd+oAsHbzCSR5/jqNDpckxPnaZiYS2/uOJMn00GQIzoHkA7RW4RysSsIt47/UL
         Lg/kXOfZdZDNHNqe8x+UB00LwrWjrEouUbAImN/9Z3ctuE09dLSeLZY56Q3ceC05l3c/
         nH9ImP7hd+KwnqAi1lcKUcSu34EnN9jsgORpg/qMtsgVNCIBeAl/7V8yRAgMF8tvG3ot
         UoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W75mVsD+mFEip/68/8ZeT5JmXFx6tvlvSvssKwNv8nc=;
        b=LaFLkG+rMFNG9iqEnrdeuE9OH2AyaqwZM1+gFZ20Kwk/j6VM5nYBVRvdvLT4uTNIhj
         67BDvD+YZrT4b1E12ffk5lzygq5y+s5mtS4RUHIkXBrCdKU63jTaZ6o0BoCscXYlEhoC
         o8cT3gRixZGNkKNZQbqA5IH1A9DXuuN96qQjYsWl79R4c7XDkEDTyEeDVkde+MgVrhTM
         CtXdZecTYFcJ13ROAHpZ+KwXHuIAtMmi2avj0QXrrUzcTBGGr7eCzwrv0MpEWyx/dq1q
         aT4Onu1ahPAJ1XHCJV/3EZqNPn9sp8cqqJ1bxdt88wgNL3jbzB/zIyVoJ1I3ZQgNIhMZ
         cUPQ==
X-Gm-Message-State: AOAM530FQ0uqGH9dAP9sAp51odN/yum7I/HgWdiYCAw9VrsRbi8k7gBJ
	Zso/q19Ou3kLTyK1obQdri4J4v/IgQor4Oge07k=
X-Google-Smtp-Source: 
 ABdhPJx+LRnBvIQEGp++p9pWpTx9u+E+jmfPLZteVUmjV8SbyZV8vsMAcNjsl/azyVuo4Vu9T7SKexqwAg+sf4/xziY=
X-Received: by 2002:a67:7105:: with SMTP id m5mr34700884vsc.81.1638778826498;
 Mon, 06 Dec 2021 00:20:26 -0800 (PST)
MIME-Version: 1.0
References: <20211206054504.61115-1-pgowda.cve@gmail.com>
In-Reply-To: <20211206054504.61115-1-pgowda.cve@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Dec 2021 09:20:14 +0100
Message-ID: 
 <CANNYZj91-Jn48FCrzd1aFeCmyxR0vzqnOqqPx7+ORiUdjRdVAg@mail.gmail.com>
Subject: Re: [PATCH] Build libstd-rs in release mode to compile mozjs
To: pgowda <pgowda.cve@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <rwmacleod@gmail.com>,
	umesh kalappa0 <umesh.kalappa0@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d1a8e105d275ed52"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 08:20:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159212

--000000000000d1a8e105d275ed52
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Dec 2021 at 06:45, pgowda <pgowda.cve@gmail.com> wrote:

> When mozjs in firefox is built with DEBUG_BUILD = "1"
> in local.conf, it will fail with the following error:
>    rustc-1.56.0-src/vendor/compiler_builtins/src/int/specialized_div_rem
> /asymmetric.rs:57:
>    more undefined references to `core::panicking::panic' follow
>
> Switch to building libstd-rs in "release" mode as that works
> around the issue and builds mozjs successfully. This is a
> work-around that can be used until the root cause of the debug
> build error is resolved.
>

Thank you, but I think the problem needs to be properly understood before
any fix to oe-core is merged. Can you keep the workaround as a bbappend
until then?

Alex

--000000000000d1a8e105d275ed52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 6 Dec 2021 at 06:45, pgowda &lt;<a href=3D"mailto:pgowda.cve=
@gmail.com">pgowda.cve@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">When mozjs in firefox is built with DEBUG_=
BUILD =3D &quot;1&quot;<br>
in local.conf, it will fail with the following error:<br>
=C2=A0 =C2=A0rustc-1.56.0-src/vendor/compiler_builtins/src/int/specialized_=
div_rem<br>
/<a href=3D"http://asymmetric.rs:57" rel=3D"noreferrer" target=3D"_blank">a=
symmetric.rs:57</a>:<br>
=C2=A0 =C2=A0more undefined references to `core::panicking::panic&#39; foll=
ow<br>
<br>
Switch to building libstd-rs in &quot;release&quot; mode as that works<br>
around the issue and builds mozjs successfully. This is a<br>
work-around that can be used until the root cause of the debug<br>
build error is resolved.<br></blockquote><div><br></div><div>Thank you, but=
 I think the problem needs to be properly understood before any fix to oe-c=
ore is merged. Can you keep the workaround as a bbappend until then?</div><=
div><br></div><div>Alex</div><br></div></div>

--000000000000d1a8e105d275ed52--

