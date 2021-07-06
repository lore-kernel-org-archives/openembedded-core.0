Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.9172.1625590600525826168
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 09:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=uQ/T1RIn;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.180, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f180.google.com with SMTP id x24so5077132qts.11
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 09:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=fxuh/vYz+a9bOM5AL7trMFdA0jKM6qdNkV5OkwSK/vk=;
        b=uQ/T1RIngTKnU30er1YVm1k/BoLG86o2WFsi9RQZBGdkJdmBed2+Kaj6Il0c92UD0J
         8BPAyhMA8+U45N5U0fmaG+Dovf/SohnUB7L/AmtPBbvNqk3QU8TsvQkokXlXmwP7Z0Jo
         aHZLdQtxC0oiFkkhUC2LzRnXZ/APw8WlT0gO/J6YBkOe/waH95gRP54Hai3YtYHxUlor
         FwVulqGLkIYqfCZcvOM1JdXdDGOEvKlfxqwiCXNIuZxQs2edgLVQi3Xy2dMAOwDNhk4P
         E92bhGjo9DaaaOGJC7P+GNHaTcCxEzvS4S88X64ERQFnuxxpElF5Xb003l8uZtDyf6UV
         4Mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=fxuh/vYz+a9bOM5AL7trMFdA0jKM6qdNkV5OkwSK/vk=;
        b=lI4avLuSI2TPQpiMX4MB0J3X1AODYD3TX7B8iMkVVHStupBNSll6xbNjaaC7LtfXCQ
         kcda8ptl6kHXxJKnqsJtC83sO4cO8etJOJ2/tTemR9XgkhWS6yHgLFsMr51UPvnDtbSH
         8aIGZ/PTYl0uncBZ+G+U+KXpLNphPJWW7eJ0l+FgLAE509Fm20OfsZXm21sWTN/NJhyZ
         JeX5Elc4cEODZVPII7nfGPnFNI+eA4s9FXtGXC09RwqllOfdgBFOtQnPM3To9lU8344d
         5IsFrHN72sM/Q9DCCJUOOE4Hyo/3zFS9vjJ9mEcWcHh78f/2c1U1p+8lYMr2kHNYbIJg
         vzBA==
X-Gm-Message-State: AOAM532Q0XQKtIBM5x5dulVPs6sh+yY16CSOkpTO6LqXjZKTMi0X7XFw
	DL4sHWFtyUmr8yyIhdYxAnr3Enmc7KXAZIKe
X-Google-Smtp-Source: ABdhPJyfqe3SmI95w03ZrOfRojGgr0wH+zipXIUv1BcnvMqWdXlwc3CthQPz9kK77qTOYJrdSgcpXA==
X-Received: by 2002:ac8:7a81:: with SMTP id x1mr18390294qtr.102.1625590599271;
        Tue, 06 Jul 2021 09:56:39 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id q184sm7164019qkd.35.2021.07.06.09.56.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 09:56:38 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f171.google.com with SMTP id n9so14908920qtk.7
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 09:56:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1891:: with SMTP id v17mr18809251qtc.138.1625590598290;
 Tue, 06 Jul 2021 09:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210702115900.19417-1-peter@berginkonsult.se>
 <bc5cdd46cfb003f45c1ed7762ee140c0f4f5cca5.camel@intel.com>
 <775af313-1b19-146e-b0f3-113d5af0a992@berginkonsult.se> <a3f45eab0d82dea6f34936d821d902b79c43abbd.camel@linuxfoundation.org>
 <0e446811e98bcb4833cdc0c7f5dd40fcd8f07a43.camel@intel.com>
 <d83ff556-cab9-3616-f4ad-506e8675eda5@berginkonsult.se> <db03a0b4-d292-4db8-694e-56b3fa1c99cc@berginkonsult.se>
In-Reply-To: <db03a0b4-d292-4db8-694e-56b3fa1c99cc@berginkonsult.se>
Date: Tue, 6 Jul 2021 13:56:26 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrSEHz26EPkkOvPqpd37x3fzmTTJ9vuPxByFMnraJVmvg@mail.gmail.com>
Message-ID: <CAP9ODKrSEHz26EPkkOvPqpd37x3fzmTTJ9vuPxByFMnraJVmvg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "libubootenv: inherit uboot-config"
To: Peter Bergin <peter@berginkonsult.se>
Cc: Anuj Mittal <anuj.mittal@intel.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>, "liu.ming50@gmail.com" <liu.ming50@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000294fff05c6774e54"

--000000000000294fff05c6774e54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 6 de jul. de 2021 =C3=A0s 12:12, Peter Bergin <peter@berginkonsult=
.se>
escreveu:

> Then I can correct my earlier statement and a new wisdom that run-time
> dependecies are scanned already in the early phases. Apparently it is
> not possible to build libubootenv due to RRECOMMENDS to
> u-boot-default-env. The build for a 'non-u-boot config' will fail if we
> add 'inherit uboot-config' and it will fail without. What is the
> difference for a 'world' build?
>

The dependency on the default-env seems too strong. It could be relaxed as
it works without it.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000294fff05c6774e54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em ter., 6 de jul. de 2021 =C3=A0s 12=
:12, Peter Bergin &lt;<a href=3D"mailto:peter@berginkonsult.se">peter@bergi=
nkonsult.se</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Then I can correct my earlier statement and a new wisdom that=
 run-time <br>
dependecies are scanned already in the early phases. Apparently it is <br>
not possible to build libubootenv due to RRECOMMENDS to <br>
u-boot-default-env. The build for a &#39;non-u-boot config&#39; will fail i=
f we <br>
add &#39;inherit uboot-config&#39; and it will fail without. What is the <b=
r>
difference for a &#39;world&#39; build?<br></blockquote><div><br></div><div=
>The dependency on the default-env seems too strong. It could be relaxed as=
 it works without it. <br></div><div> <br></div></div>-- <br><div dir=3D"lt=
r" class=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. =
Systems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http:/=
/www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code=
.ossystems.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>Mo=
bile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (34=
7) 903-9750</div></div>

--000000000000294fff05c6774e54--
