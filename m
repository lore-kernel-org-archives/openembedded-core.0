Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F84DC25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 22:45:02 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.1866.1716331497708632318
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 15:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: aehs29@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5238b5c07efso5034512e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 15:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716331495; x=1716936295;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWCwDz01D7yQPY5ABoE48TyV0O0Gr4N4rMbYRq0TMfE=;
        b=hPjVcuTtZXM13XigJiVf/mhca6fy97qE571/htvtodqW4IBtUWn0W9KrNHX5nEtAmL
         6G3lt7jJw8Ccd97M1zu7QRwGFWkupTso7kZnXOiT+6xVtvszAEn8cemZHW5Qb2lNmjRx
         U2NpTiHgOJXP3yU8yFzrNxo1TJFzcifAnhB0RcM5uthEDNxGq/Uh0ffarfJFpThpkXJQ
         ds/zyRAKi7q9WmctOSunqoiVhybJC6RWWAkM4ff4E3JqJTNbPFW/m2TRZSN7lfmySlTL
         go4cz/JRf6zpaGtpL/Nd79N8uBACyK8n/EveRfLrmzNZD4SX/5uCswhuaPxnKpnBrwvX
         TqhA==
X-Gm-Message-State: AOJu0YwYDUf19OvecvoE3lmb/niB/ZFdn6gvT8QMpjac9i7KhStoyd7d
	8NOWVYhUQZRCnkcX9Rd8Gx4ZwmFECUPbDbuOZy6qACuku9wjOap6mUmr+SL0WPM=
X-Google-Smtp-Source: AGHT+IG4H5rZOtkSR19K9lj9NW8AjJG4KhEIpYainPWYTaIs7FRctZxEbhPPoCNLAZZ253iQjHF/yQ==
X-Received: by 2002:ac2:4294:0:b0:51d:96be:b50 with SMTP id 2adb3069b0e04-526bf82cb18mr59065e87.31.1716331494310;
        Tue, 21 May 2024 15:44:54 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f39d2bb6sm4841798e87.249.2024.05.21.15.44.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 15:44:54 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e1fa824504so54285131fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 15:44:54 -0700 (PDT)
X-Received: by 2002:a2e:9b54:0:b0:2de:d48a:953b with SMTP id
 38308e7fff4ca-2e9494942f0mr588481fa.23.1716331493887; Tue, 21 May 2024
 15:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240519055050.2331637-1-alejandro@enedino.org>
 <20240519055050.2331637-4-alejandro@enedino.org> <9eaa082f9c71b013beac154498c89162696a11a3.camel@linuxfoundation.org>
In-Reply-To: <9eaa082f9c71b013beac154498c89162696a11a3.camel@linuxfoundation.org>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Tue, 21 May 2024 16:44:39 -0600
X-Gmail-Original-Message-ID: <CAHMutrZMwE_qQ71dJC_S7O2+41NKzvE8Gyk6z8nWSFiVTp=NJA@mail.gmail.com>
Message-ID: <CAHMutrZMwE_qQ71dJC_S7O2+41NKzvE8Gyk6z8nWSFiVTp=NJA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] tclibc-picolibc: Adds a new TCLIBC variant
 to build with picolibc as C library
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000002a1310618fe911b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 22:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199678

--00000000000002a1310618fe911b
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 May 2024 at 13:32, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2024-05-18 at 23:50 -0600, Alejandro Hernandez Samaniego via
> lists.openembedded.org wrote:
> > Enables usage of TCLIBC=picolibc extending OE functionality to build and
> use
> > picolibc based toolchains to build baremetal applications.
> >
> > Picolibc is a set of standard C libraries, both libc and libm, designed
> for
> > smaller embedded systems with limited ROM and RAM. Picolibc includes code
> > from Newlib and AVR Libc, but adresses some of newlibs concerns, it
> retains
> > newlibs directory structure, math, string and locale implementations, but
> > removed the GPL bits used to build the library, swiches old C style code
> for
> > C18 and replaces autotools with meson.
> >
> > This patch adds a picolibc recipe for the C library, a
> picolibc-helloworld
> > recipe that contains an example application and a testcase that builds
> it.
> >
> > Picolibc can be built for ARM and RISCV architectures, its been tested
> both
> > for 32 and 64 bits, the provided example recipe produces the following
> output:
> >
> > hello, world
> >
> > Runqemu does not automatically show any output since it hides QEMU
> stderr which
> > is where the QEMU monitors output is directed to when using semihosting,
> but,
> > manually running the same QEMU command does work properly.
> >
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
>
> Had two issues in selftest:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6778/steps/14/logs/stdio
>
> distrodata.Distrodata.test_maintainers:
>
> AssertionError:
> Unable to find recipes for the following entries in maintainers.inc:
> picolibc
>
>
> picolibc.PicolibcTest.test_picolibc:
>
>
> Removing 1 recipes from the qemux86_64 sysroot...done.
> ERROR: Nothing PROVIDES 'picolibc-helloworld'
> picolibc-helloworld was skipped: incompatible with machine qemux86-64
> (not in COMPATIBLE_MACHINE)
> Summary: There was 1 ERROR message, returning a non-zero exit code.
>
>
> Cheers,
>
> Richard
>
>
> It seems that picolibc recipe is being skipped in the first instance,
since a different TCLIBC is set whilst running oe-selftest, tinfoil simply
skips it, I see now why there is an exception for newlib too, For the
second case I'll figure out what needs to be done so the test isn't run for
incompatible machines and I will send a v2.

Cheers,
Alejandro

--00000000000002a1310618fe911b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 21 May 2024 =
at 13:32, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Sat, 2024-05-18 at 23:50 -0600=
, Alejandro Hernandez Samaniego via <a href=3D"http://lists.openembedded.or=
g" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<b=
r>
&gt; Enables usage of TCLIBC=3Dpicolibc extending OE functionality to build=
 and use<br>
&gt; picolibc based toolchains to build baremetal applications.<br>
&gt; <br>
&gt; Picolibc is a set of standard C libraries, both libc and libm, designe=
d for<br>
&gt; smaller embedded systems with limited ROM and RAM. Picolibc includes c=
ode<br>
&gt; from Newlib and AVR Libc, but adresses some of newlibs concerns, it re=
tains<br>
&gt; newlibs directory structure, math, string and locale implementations, =
but<br>
&gt; removed the GPL bits used to build the library, swiches old C style co=
de for<br>
&gt; C18 and replaces autotools with meson.<br>
&gt; <br>
&gt; This patch adds a picolibc recipe for the C library, a picolibc-hellow=
orld<br>
&gt; recipe that contains an example application and a testcase that builds=
 it.<br>
&gt; <br>
&gt; Picolibc can be built for ARM and RISCV architectures, its been tested=
 both<br>
&gt; for 32 and 64 bits, the provided example recipe produces the following=
 output:<br>
&gt; <br>
&gt; hello, world<br>
&gt; <br>
&gt; Runqemu does not automatically show any output since it hides QEMU std=
err which<br>
&gt; is where the QEMU monitors output is directed to when using semihostin=
g, but,<br>
&gt; manually running the same QEMU command does work properly.<br>
&gt; <br>
&gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"ma=
ilto:alejandro@enedino.org" target=3D"_blank">alejandro@enedino.org</a>&gt;=
<br>
<br>
Had two issues in selftest:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/87/build=
s/6778/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6778/steps/14/logs/=
stdio</a><br>
<br>
distrodata.Distrodata.test_maintainers:<br>
<br>
AssertionError: <br>
Unable to find recipes for the following entries in maintainers.inc:<br>
picolibc<br>
<br>
<br>
picolibc.PicolibcTest.test_picolibc:<br>
<br>
<br>
Removing 1 recipes from the qemux86_64 sysroot...done.<br>
ERROR: Nothing PROVIDES &#39;picolibc-helloworld&#39;<br>
picolibc-helloworld was skipped: incompatible with machine qemux86-64<br>
(not in COMPATIBLE_MACHINE)<br>
Summary: There was 1 ERROR message, returning a non-zero exit code.<br>
<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br></blockquote><div><div class=3D"gmail_default" style=3D"font-family:ari=
al,sans-serif;font-size:small">It seems that picolibc recipe is being skipp=
ed in the first instance, since a different TCLIBC is set whilst running oe=
-selftest, tinfoil simply skips it, I see now why there is an exception for=
 newlib too, For the second case I&#39;ll figure out what needs to be done =
so the test isn&#39;t run for incompatible machines and I will send a v2.</=
div><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-family:ar=
ial,sans-serif;font-size:small">Cheers,</div><div class=3D"gmail_default" s=
tyle=3D"font-family:arial,sans-serif;font-size:small">Alejandro</div><br></=
div><div><br></div><div>=C2=A0</div></div></div>

--00000000000002a1310618fe911b--

