Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4364DC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 11:53:40 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web08.6155.1665489210654923970
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 04:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SiQZiyDf;
 spf=pass (domain: gmail.com, ip: 209.85.160.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-132fb4fd495so15519330fac.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 04:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DlmVSeD1kA5gxKaGIAsxTHI9jV5Pc0ZS6BP2kAndVV0=;
        b=SiQZiyDf95WdZ9qwC27X5YeID9ONUdySHtNpxxfhiRN0RDtu5L8LyBjVam/M3o16fz
         lirBdK+41fDLEDE5TrKENTDNc+aCiVuf1FnUK2lIDy7mwNUOtRi9XhmJ4UKru0IaHCuy
         AzeQNGa2ITNU27to5e5igED7IbAVn2IsdneVAdH2AYx/Qsw47CED4aB9ayJvUAj6cILh
         cDUAQKaA75HCIU9G/nb7EJdEUxts+v/Gz1zrXtfM0M/PH9Is6TFQn7FaMCsqTWqe93g/
         M87gXrtCrnxNRBtofkLZ8gmOgZPi9KBikiY+iyCUy88j6ePH9pLyM7JoRyvst+c0QOUF
         SqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DlmVSeD1kA5gxKaGIAsxTHI9jV5Pc0ZS6BP2kAndVV0=;
        b=wjGiDsOmJeUC3nehJVbpDdhoB9v9fb18bpU61AjVrJWXe/8qr7aRKDbQDSFythxKfW
         yCdBcohFWkEFT2JD5TWB/6c1uG7oyZ66Q17y2Y5CwZ2wJ/bYh6Cjt/UZZqO+6iUl3lem
         73rUxX8eSUy86Z1h/RbEA8DEl9PQtbJ8/JMlq919wSDDH62LTK52gwE+nrPzd7mKoPxC
         tdfyLRm/nRncK5fpviJV2czWDjz7D08daNtb2NRiAxS0TkqnDeKdgmK5vwy4b2ZqG2Eq
         a5qH0nZbcz8w3SNKVrNLiN1+Mqp/xr1es5norfVp6ZpRUSqaG2I1uOZaHiBCuglBdMEB
         vwUA==
X-Gm-Message-State: ACrzQf2RkRd61G6c1T5gPOTCo3DvBwjH0HMEidoRjdCrGHoRKX/78INl
	Q589tMVDpfphkadY3LGZyNJYJQceRVv8NK/LMu4=
X-Google-Smtp-Source: 
 AMsMyM66LyKAxx0zJdt0Ljg/cnd7GSqS8yZKVNS1Oo+zAs5drvTPyCVkF8g2ZGVY6lJXPZG8ErTCWtqdSU1tbqIt69U=
X-Received: by 2002:a05:6870:a7a4:b0:136:7c39:979e with SMTP id
 x36-20020a056870a7a400b001367c39979emr6432643oao.96.1665489209864; Tue, 11
 Oct 2022 04:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221011030216.3874881-1-raj.khem@gmail.com>
In-Reply-To: <20221011030216.3874881-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 11 Oct 2022 07:53:18 -0400
Message-ID: 
 <CADkTA4Mw3fBsRxOnbKzBMjXTw5VdXTd0LTY-eOXvS0GQ-kEQbg@mail.gmail.com>
Subject: Re: [PATCH] perf: Depend on native setuptools3
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bb38c005eac0ec26"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 11:53:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171621

--000000000000bb38c005eac0ec26
Content-Type: text/plain; charset="UTF-8"

There's already several versions of this patch floating around.

There was an error on the AB with the latest version of it that neither
Ross or myself could reproduce so we are looking at that part of it now.

Cheers,

Bruce

On Mon, Oct 10, 2022 at 11:02 PM Khem Raj <raj.khem@gmail.com> wrote:

> perf has need for python setuptools when scripting is enabled
> from 6.0.0 onwards it seems to throw an explicit error
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index 31bc04635d..c1b0bd22d8 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -13,7 +13,7 @@ PR = "r9"
>
>  PACKAGECONFIG ??= "scripting tui libunwind"
>  PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
> -PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3"
> +PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3
> python3-setuptools-native"
>  # gui support was added with kernel 3.6.35
>  # since 3.10 libnewt was replaced by slang
>  # to cover a wide range of kernel we add both dependencies
> --
> 2.38.0
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000bb38c005eac0ec26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">The=
re&#39;s already several versions of this patch floating around.</div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">There was an error=C2=A0on the AB w=
ith the latest version of it that neither Ross or myself could reproduce so=
 we are looking at that part of it now.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Cheers,</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Br=
uce</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Mon, Oct 10, 2022 at 11:02 PM Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">perf has need for python setuptools whe=
n scripting is enabled<br>
from 6.0.0 onwards it seems to throw an explicit error<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index 31bc04635d..c1b0bd22d8 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
@@ -13,7 +13,7 @@ PR =3D &quot;r9&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;scripting tui libunwind&quot;<br>
=C2=A0PACKAGECONFIG[dwarf] =3D &quot;,NO_DWARF=3D1&quot;<br>
-PACKAGECONFIG[scripting] =3D &quot;,NO_LIBPERL=3D1 NO_LIBPYTHON=3D1,perl p=
ython3&quot;<br>
+PACKAGECONFIG[scripting] =3D &quot;,NO_LIBPERL=3D1 NO_LIBPYTHON=3D1,perl p=
ython3 python3-setuptools-native&quot;<br>
=C2=A0# gui support was added with kernel 3.6.35<br>
=C2=A0# since 3.10 libnewt was replaced by slang<br>
=C2=A0# to cover a wide range of kernel we add both dependencies<br>
-- <br>
2.38.0<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--000000000000bb38c005eac0ec26--

