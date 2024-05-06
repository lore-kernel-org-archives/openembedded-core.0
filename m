Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB719C25B4F
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 15:33:15 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.23622.1715009591525916566
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 08:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hv+8d4wr;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2a2d82537efso1391191a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 08:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715009591; x=1715614391; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IRQ+WKIeXzzcoWciVJDmmxlWyTtj2JVx/a5jdY+GCRs=;
        b=hv+8d4wra559i5ve71NtJN+TxyV1ecuMJykG3c2EVVdSHa70Zp7G5EwoTA9MKjV3fB
         aScUdArBxCUm/E6Iv67thI6UqGD0LY85RLp8HyMK1WSNDKBzVuJFxrFr2qeP1cUEbEbn
         IFRVAdrZf+iU6Kzl8sWl6b1iS/ZKkw4lSwHpl4qEnSv+m7BHI5S6IKIRlh3pLlMFsyq+
         hzm9PLfH0nyUfx3eErCASNnbSxwKbjkLoJVIGGJuwFrSK6Fv4b/iGiJaeUTqnljbdMmm
         IbbfhFxGzRG8HKXAoWSla9CVMwqh4ob9I+Kd05NSfkd2G+wm5VwGxQkD8NqSc0T0mDDq
         TXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715009591; x=1715614391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRQ+WKIeXzzcoWciVJDmmxlWyTtj2JVx/a5jdY+GCRs=;
        b=fjH57TANvGrm588rEm9RFrt5mj6rtYXEHoF11I0vZimBM5SL/ogUZqCL9Ry5nzC+k9
         wuHta5pafoBQ58tjGjWCPTX2RVmV5theqgy+GNb8LHuIiJN11GCipClSnkikytS8W5cv
         yBixz/vOb7g9c96+oumGxw4BlWdrMlZ55DtQ205G3fgmvOZV+ex6i42d/hFEj4RN629c
         uNWgN7M7K5zBbuntVpdhqkLUvgOpSfiEsRyT9V2UFGpKbvqE6+Qd8HYmShgv0zUbDqHw
         8j5DwN0AzZjHy0G/+wVADm/fK1SzX26JsoFiczEuIqyhB2pl3NtyZnsRbOd4PLUSd4nj
         AAEg==
X-Gm-Message-State: AOJu0Yw0wrF5eeUYSe/dkIZeCc6AZJDhi3PlL+eLQr06anZUHZ6lAcVY
	oVh421FFNOInwQGkwMJUMPh+TRi4x1cYk4MNz1oUaYrMtGTOBVScc8HWNfna8GyYXIn8G75zgnp
	bkbym0+c6U2FL4mglLIdemJcOmEM=
X-Google-Smtp-Source: AGHT+IGQMZ4FS6QA8FnPDPnidTY6ioS0KKcy8YcoRT7BguUJznOkNA42m9yU6UFbkEmVczPExzD7wCMxZq46xwaHHWI=
X-Received: by 2002:a17:90a:f0d1:b0:2b2:7e94:4073 with SMTP id
 fa17-20020a17090af0d100b002b27e944073mr9677351pjb.14.1715009590484; Mon, 06
 May 2024 08:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240506110846.125652-1-nikhil.r@kpit.com>
In-Reply-To: <20240506110846.125652-1-nikhil.r@kpit.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 6 May 2024 17:32:58 +0200
Message-ID: <CAApg2=TB81yXyxpt8kEaoHB-SCoJ8753w77FWby2m8Qj-nDEig@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] xz: Update LICENSE variable for xz packages
To: nikhilar2410@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Bhabu Bindu <bhabu.bindu@kpit.com>, Nikhil R <nikhil.r@kpit.com>, 
	Bhabu Bindu <bindudaniel1996@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006d6e510617cac9ec"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 15:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199047

--0000000000006d6e510617cac9ec
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 May 2024, 13:09 nikhil via lists.openembedded.org, <nikhilar2410=
gmail.com@lists.openembedded.org> wrote:

> Update LICENSE defined for xz packages to match the license
> information provided in the xz COPYING file.
>
> The License information from PACKAGERS file of xz mentions
> packages with lzma files are in public domain.They ask to
> use GPLv2+, if only it's not possible to mention "PD and GPLv2+".
>
> Include PD license with GPLv2 to packages with lzma content:
> xz-dev package contains lzma header
> xz-doc package contains lzma man pages
> xz packages contains lzma binaries
>
> Links: https://github.com/tukaani-project/xz/blob/v5.2.6/COPYING
>        https://github.com/tukaani-project/xz/blob/v5.4.1/PACKAGERS
>
> Signed-off-by: Bhabu Bindu <bindudaniel1996@gmail.com>
> ---
>  meta/recipes-extended/xz/xz_5.2.6.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/xz/xz_5.2.6.bb
> b/meta/recipes-extended/xz/xz_5.2.6.bb
> index 3482622471..33496748bc 100644
> --- a/meta/recipes-extended/xz/xz_5.2.6.bb
> +++ b/meta/recipes-extended/xz/xz_5.2.6.bb
> @@ -9,10 +9,10 @@ SECTION = "base"
>  # libgnu, which appears to be used for DOS builds. So we're left with
>  # GPL-2.0-or-later and PD.
>  LICENSE = "GPL-2.0-or-later & GPL-3.0-with-autoconf-exception &
> LGPL-2.1-or-later & PD"
> -LICENSE:${PN} = "GPL-2.0-or-later"
> -LICENSE:${PN}-dev = "GPL-2.0-or-later"
> +LICENSE:${PN} = "PD & GPL-2.0-or-later"
> +LICENSE:${PN}-dev = "PD & GPL-2.0-or-later"
>  LICENSE:${PN}-staticdev = "GPL-2.0-or-later"
> -LICENSE:${PN}-doc = "GPL-2.0-or-later"
> +LICENSE:${PN}-doc = "PD & GPL-2.0-or-later"
>  LICENSE:${PN}-dbg = "GPL-2.0-or-later"
>  LICENSE:${PN}-locale = "GPL-2.0-or-later"
>  LICENSE:liblzma = "PD"
> --
> 2.25.1
>

I'm not a copyright lawyer, but from what I understand public domain is not
a licence. For a discussion see
https://wiki.spdx.org/view/Legal_Team/Decisions/Dealing_with_Public_Domain_within_SPDX_Files

The next version of xz will be 0BSD so the statement will change too.

Regards,
Marta

>

--0000000000006d6e510617cac9ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, 6 May 2024, 13:09 nikhil via <a href=3D"http:/=
/lists.openembedded.org">lists.openembedded.org</a>, &lt;nikhilar2410=3D<a =
href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Update LICENS=
E defined for xz packages to match the license<br>
information provided in the xz COPYING file.<br>
<br>
The License information from PACKAGERS file of xz mentions<br>
packages with lzma files are in public domain.They ask to<br>
use GPLv2+, if only it&#39;s not possible to mention &quot;PD and GPLv2+&qu=
ot;.<br>
<br>
Include PD license with GPLv2 to packages with lzma content:<br>
xz-dev package contains lzma header<br>
xz-doc package contains lzma man pages<br>
xz packages contains lzma binaries<br>
<br>
Links: <a href=3D"https://github.com/tukaani-project/xz/blob/v5.2.6/COPYING=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/tukaan=
i-project/xz/blob/v5.2.6/COPYING</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/tukaani-project/xz=
/blob/v5.4.1/PACKAGERS" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
ps://github.com/tukaani-project/xz/blob/v5.4.1/PACKAGERS</a><br>
<br>
Signed-off-by: Bhabu Bindu &lt;<a href=3D"mailto:bindudaniel1996@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">bindudaniel1996@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/xz/<a href=3D"http://xz_5.2.6.bb" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">xz_5.2.6.bb</a> | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/xz/<a href=3D"http://xz_5.2.6.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">xz_5.2.6.bb</a> b/meta/recipes-ex=
tended/xz/<a href=3D"http://xz_5.2.6.bb" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">xz_5.2.6.bb</a><br>
index 3482622471..33496748bc 100644<br>
--- a/meta/recipes-extended/xz/<a href=3D"http://xz_5.2.6.bb" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">xz_5.2.6.bb</a><br>
+++ b/meta/recipes-extended/xz/<a href=3D"http://xz_5.2.6.bb" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">xz_5.2.6.bb</a><br>
@@ -9,10 +9,10 @@ SECTION =3D &quot;base&quot;<br>
=C2=A0# libgnu, which appears to be used for DOS builds. So we&#39;re left =
with<br>
=C2=A0# GPL-2.0-or-later and PD.<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-or-later &amp; GPL-3.0-with-autoconf-except=
ion &amp; LGPL-2.1-or-later &amp; PD&quot;<br>
-LICENSE:${PN} =3D &quot;GPL-2.0-or-later&quot;<br>
-LICENSE:${PN}-dev =3D &quot;GPL-2.0-or-later&quot;<br>
+LICENSE:${PN} =3D &quot;PD &amp; GPL-2.0-or-later&quot;<br>
+LICENSE:${PN}-dev =3D &quot;PD &amp; GPL-2.0-or-later&quot;<br>
=C2=A0LICENSE:${PN}-staticdev =3D &quot;GPL-2.0-or-later&quot;<br>
-LICENSE:${PN}-doc =3D &quot;GPL-2.0-or-later&quot;<br>
+LICENSE:${PN}-doc =3D &quot;PD &amp; GPL-2.0-or-later&quot;<br>
=C2=A0LICENSE:${PN}-dbg =3D &quot;GPL-2.0-or-later&quot;<br>
=C2=A0LICENSE:${PN}-locale =3D &quot;GPL-2.0-or-later&quot;<br>
=C2=A0LICENSE:liblzma =3D &quot;PD&quot;<br>
-- <br>
2.25.1<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">I&#39;m not a copyright lawyer, but from what I understand public dom=
ain is not a licence. For a discussion see=C2=A0<a href=3D"https://wiki.spd=
x.org/view/Legal_Team/Decisions/Dealing_with_Public_Domain_within_SPDX_File=
s">https://wiki.spdx.org/view/Legal_Team/Decisions/Dealing_with_Public_Doma=
in_within_SPDX_Files</a></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>The next version of xz will be 0BSD so the statement will change too.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Regards,</div><div dir=3D"au=
to">Marta=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"></blockquote></div></div></div>

--0000000000006d6e510617cac9ec--

