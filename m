Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7BCC25B78
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:55:59 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.4168.1716317756084797987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 11:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: aehs29@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e564cad1f1so59555231fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 11:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716317753; x=1716922553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1EvBYdBTAF2QeBCIpCZcXuW7CSPRQygH82NjDvkc/Bc=;
        b=pB43lshBFFBUYJHagwamtOsmTmssi8qtnKmybHRqOdgaZ9BBpwnUn38rs9BO6DqzjU
         8/eRsqjQTupJEmFh1L5colzp8qJ8yoMUMX67tTik/seqcAlc1pkyLk2Aw0h0PYF/dPv7
         qvTJN8TubohukUi5S2M6Kblog5Yv6qklBb/ciOquMZdzL1Zgpg2iwnj2yNvEqWp3ct8a
         nnobc8d/jCFBkP6ZlFWb4WYIfH1gObS1F8hqBJEn2acWzlmUtqKgO6wkxKha7g0lDd8p
         JFgOEC1ze4qAcrseGf0rxHBnR98IeX9eES4dNTif561he18HIjkjGFl5HC/WD2UF4saO
         Wj/w==
X-Gm-Message-State: AOJu0YwDtxE2uvyFi8Gb4f1qgipokfJw81p2Nss92K55wGh332syBkHB
	t4ryrw1g06irp9rG0wSa253oKDAh1s0D/SoaUGHwqJ8hogE0fKO3/7AcWbWwwYI=
X-Google-Smtp-Source: AGHT+IEs3L+cNItjKNRzTHc2LBit3TTe29VIJr7lIN9J43QUMyGwGM4IIRaCBkmmwKm6c+xYdA2EFw==
X-Received: by 2002:a2e:be13:0:b0:2de:25e2:6187 with SMTP id 38308e7fff4ca-2e51fe57b06mr234892651fa.23.1716317753098;
        Tue, 21 May 2024 11:55:53 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e93d1f13f7sm344861fa.85.2024.05.21.11.55.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 11:55:52 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e564cad1f1so59554711fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 11:55:52 -0700 (PDT)
X-Received: by 2002:a2e:8896:0:b0:2e5:46c:7233 with SMTP id
 38308e7fff4ca-2e52028b244mr209828901fa.40.1716317752243; Tue, 21 May 2024
 11:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240519055050.2331637-1-alejandro@enedino.org>
 <20240519055050.2331637-4-alejandro@enedino.org> <C23A42BD-03CC-45C7-9221-196D21A31787@arm.com>
In-Reply-To: <C23A42BD-03CC-45C7-9221-196D21A31787@arm.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Tue, 21 May 2024 12:55:38 -0600
X-Gmail-Original-Message-ID: <CAHMutrYhV8u0xD40C52HXmnRjNv82QzCmYqLmWT=PXj9MjeKzg@mail.gmail.com>
Message-ID: <CAHMutrYhV8u0xD40C52HXmnRjNv82QzCmYqLmWT=PXj9MjeKzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] tclibc-picolibc: Adds a new TCLIBC variant
 to build with picolibc as C library
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f1c6cc0618fb5d46"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 18:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199669

--000000000000f1c6cc0618fb5d46
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 May 2024 at 05:38, Ross Burton <Ross.Burton@arm.com> wrote:

>
>
> > On 19 May 2024, at 06:50, Alejandro Hernandez Samaniego via
> lists.openembedded.org <alejandro=enedino.org@lists.openembedded.org>
> wrote:
> > +# Use the same method that picolibc uses to bypass early compiler tests
> on meson,
> > +# otherwise meson will try to compile AND run test applications, avoids:
> > +# ../git/meson.build:35:0: ERROR: Executables created by c compiler are
> not runnable...
> > +EXEWRAPPER_EXE ?= "exe_wrapper = ['sh', '-c', 'test -z
> \"$PICOLIBC_TEST\" || ${WORKDIR}/meson-qemuwrapper \"$@\"',
> '${WORKDIR}/meson-qemuwrapper']"
>
> From picolibc (
> https://github.com/picolibc/picolibc/blob/main/meson.build#L1562),
> talking about this workaround:
>
> # This was fixed in meson version 0.54.2, so this can be removed from
> # here and the sample cross scripts once picolibc requires a version
> # of meson newer than that.
>
> We have meson 1.3.1, so this (and the corresponding meson.bbclass change)
> is redundant, right?
>
> Ross
>

Hi Ross,

I did see that comment when I was trying to debug the issue with the early
compiler tests, however, I couldn't find an easy way to inject
skip_sanity_check=true into the [properties] field in meson.cross and since
exe_wrapper was still there I thought I'd just override it.

Do you think it'd be better to modify the meson class, add a
MESON_SANITY_CHECK ?= "" thats is written to the cross file all the time?,
that way I can just override it on the recipe with
MESON_SANITY_CHECK="skip_sanity_check=true" or something similar?

Or do you have any other suggestions?

Alejandro

--000000000000f1c6cc0618fb5d46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 21 May 2024 =
at 05:38, Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burto=
n@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
<br>
&gt; On 19 May 2024, at 06:50, Alejandro Hernandez Samaniego via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.=
openembedded.org</a> &lt;alejandro=3D<a href=3D"mailto:enedino.org@lists.op=
enembedded.org" target=3D"_blank">enedino.org@lists.openembedded.org</a>&gt=
; wrote:<br>
&gt; +# Use the same method that picolibc uses to bypass early compiler tes=
ts on meson,<br>
&gt; +# otherwise meson will try to compile AND run test applications, avoi=
ds:<br>
&gt; +# ../git/meson.build:35:0: ERROR: Executables created by c compiler a=
re not runnable...<br>
&gt; +EXEWRAPPER_EXE ?=3D &quot;exe_wrapper =3D [&#39;sh&#39;, &#39;-c&#39;=
, &#39;test -z \&quot;$PICOLIBC_TEST\&quot; || ${WORKDIR}/meson-qemuwrapper=
 \&quot;$@\&quot;&#39;, &#39;${WORKDIR}/meson-qemuwrapper&#39;]&quot;<br>
<br>
From picolibc (<a href=3D"https://github.com/picolibc/picolibc/blob/main/me=
son.build#L1562" rel=3D"noreferrer" target=3D"_blank">https://github.com/pi=
colibc/picolibc/blob/main/meson.build#L1562</a>), talking about this workar=
ound:<br>
<br>
# This was fixed in meson version 0.54.2, so this can be removed from<br>
# here and the sample cross scripts once picolibc requires a version<br>
# of meson newer than that.<br>
<br>
We have meson 1.3.1, so this (and the corresponding meson.bbclass change) i=
s redundant, right?<br>
<br>
Ross<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"f=
ont-family:arial,sans-serif;font-size:small">Hi Ross,</div><div class=3D"gm=
ail_default" style=3D"font-family:arial,sans-serif;font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-=
size:small">I did see that comment when I was trying to debug the issue wit=
h the early compiler tests, however, I couldn&#39;t find an easy way to inj=
ect skip_sanity_check=3Dtrue into the [properties] field in meson.cross and=
 since exe_wrapper was still there I thought I&#39;d just override it.</div=
><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-family:arial=
,sans-serif;font-size:small">Do you think it&#39;d be better to modify the =
meson class, add a MESON_SANITY_CHECK ?=3D &quot;&quot; thats is written to=
 the cross file all the time?, that way I can just override it on the recip=
e with MESON_SANITY_CHECK=3D&quot;skip_sanity_check=3Dtrue&quot; or somethi=
ng similar?</div><div class=3D"gmail_default" style=3D"font-family:arial,sa=
ns-serif;font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-family:arial,sans-serif;font-size:small">Or do you have any other sugge=
stions?</div><div class=3D"gmail_default" style=3D"font-family:arial,sans-s=
erif;font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
family:arial,sans-serif;font-size:small">Alejandro</div></div></div>

--000000000000f1c6cc0618fb5d46--

