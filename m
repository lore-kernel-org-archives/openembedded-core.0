Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26FDEDE9B9
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 12:22:38 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.10707.1694694148445982987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 05:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nC6dUGbO;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40413ccdd4cso4140685e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 05:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694694147; x=1695298947; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+HYwNmtXEB/QOL18haNXmn0fV0gsd1N5UqBs5+yT/98=;
        b=nC6dUGbOOAO6Dia6OqfyMwrNy3hVX04cUf+rYprpwvdtT7N8X1GHANTxhxyiD/R9dH
         20fgLC/Y8P5abGGz3QdjcDkHBXQl3wu7HI2lrf4vtSXbCuUJmyRaQQ+mkqqz5js17eSD
         DvcDFSf5q9GkJFut0gpd01/kUpyuziim063a71JCVbyuEsuKIFeKX6tiQdmBiplWqGk5
         kpXt8zZAxW2/vKHOTP5RzG7Ii+/lL91kCGAm96wXPFFbBsSFlKW3LxfyET9ZWw0juPqE
         Hq0IZ+9coox0YUZnYytqUcqIHT+RAf+scXd5sxyTLFFUG+w3KjmvO9ABpjy7qhDlLM88
         Ip9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694694147; x=1695298947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HYwNmtXEB/QOL18haNXmn0fV0gsd1N5UqBs5+yT/98=;
        b=IseOFZtdTXap+zmUpYN/sV0sA+HVXQ0WgxCsz9GoPoCu6fDI3XJFVAl7u+oqc1i0Dk
         psAzkfrYE/S2MtIhwq0XDmWV67sECTyFX610GbaRtGErcVIcQ44N5LQ2jFx0g8qfX+Ek
         1+eFtwnXSag4wt73xq+WLzn1UjOn32w5zYQVSGZfCJCz7JUvJFDz+2qaDa/1H2v+5Eno
         u5e+sRpHnHv3K2+0OoOk20tfy4JbnjGrDtaBd6XpM1wa98mUukb3qOdod2Ym9AQT8Kax
         uSYEiaFNABnjhvS1IYn7y5QuGuJ4ybRWe1WkdNxy7lN/1e7RVC3GQF6orTuDtctsjAWM
         xTMA==
X-Gm-Message-State: AOJu0YztmLTu5FaC3GMIB7ZfzOwFeG1f7mefr4nyfz6LHL5xBNmQbez+
	r6pm7ERSgf+Fzit8/heItUnz69lK6ki1Kjcc0LA=
X-Google-Smtp-Source: AGHT+IGRmi5HsVSEiOKnd1eozKLSwpwY62iSKmzSbW6guLtaRaOHWXthYQUCV0C0miyRpfC+c9wzctGFlIIJ+v30+9k=
X-Received: by 2002:adf:fb84:0:b0:314:314e:fdda with SMTP id
 a4-20020adffb84000000b00314314efddamr1363787wrr.23.1694694146562; Thu, 14 Sep
 2023 05:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230912172439.2336327-1-ross.burton@arm.com> <CA+chaQdGwohtDJFPa=pyVM+ST1BnWbd5Y9bFO7cWL7KbExtTAA@mail.gmail.com>
In-Reply-To: <CA+chaQdGwohtDJFPa=pyVM+ST1BnWbd5Y9bFO7cWL7KbExtTAA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Sep 2023 14:22:14 +0200
Message-ID: <CA+chaQd6xcDncFebJ32Fba5Fc5Dv8AqSuRX1dZmOL1ic0BJvvg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][mickledore] gcc: Fix -fstack-protector issue on aarch64
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: multipart/alternative; boundary="0000000000009be00c060550ba30"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 12:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187637

--0000000000009be00c060550ba30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 11:07=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om>
wrote:

> FYI: one of LGE proprietary components triggers ICE with this applied,
> I'll try to find minimal reproducer later, this is just for other people
> who might hit the same:
>
> error: unrecognizable insn:
>  2923 | }
>       | ^
> (insn 416 286 290 17 (parallel [
>             (set (mem/c:SI (plus:DI (reg/f:DI 29 x29)
>                         (const_int -260 [0xfffffffffffffefc])) [1
> redacted.pixel_format+0 S4 A32])
>                 (const_int 0 [0]))
>             (set (mem/c:SI (plus:DI (reg/f:DI 29 x29)
>                         (const_int -256 [0xffffffffffffff00])) [1
> redacted.pixel_value+0 S4 A128])
>                 (reg/v:SI 22 x22 [orig:141 color ] [141]))
>         ])
> "TOPDIR/BUILD/work/redacted/redacted/redacted/git/redacted.c":2903:45 -1
>      (expr_list:REG_DEAD (reg/v:SI 22 x22 [orig:141 color ] [141])
>         (nil)))
> during RTL pass: cprop_hardreg
> TOPDIR/BUILD/work/redacted/redacted/redacted/git/redacted.c:2923:1:
> internal compiler error: in extract_insn, at recog.cc:2791
> 0x191624a internal_error(char const*, ...)
> ???:0
> 0x6bee26 fancy_abort(char const*, int, char const*)
> ???:0
> 0x697469 _fatal_insn(char const*, rtx_def const*, char const*, int, char
> const*)
> ???:0
> 0x697485 _fatal_insn_not_found(rtx_def const*, char const*, int, char
> const*)
> ???:0
> 0xbef198 extract_constrain_insn(rtx_insn*)
> ???:0
>

And the same code fails like this only with gcc-12.3 in mickledore and
gcc-13.2 in nanbield. kirkstone with gcc-11.4 and your patch (as it is in
kirkstone-nut) builds the same code fine.

--0000000000009be00c060550ba30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Sep 14, 2023 at 11:07=E2=80=AFAM =
Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gma=
il.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">FYI: one of LGE proprieta=
ry components triggers ICE with this applied, I&#39;ll try to find minimal =
reproducer later, this is just for other people who might hit the same:<div=
><br></div><div>error: unrecognizable insn:<br>=C2=A02923 | }<br>=C2=A0 =C2=
=A0 =C2=A0 | ^<br>(insn 416 286 290 17 (parallel [<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (set (mem/c:SI (plus:DI (reg/f:DI 29 x29)<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (const_int -260 [0xfffffffffffffefc])) [1 redacted.pixel_format+0 S4 A3=
2])<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (const_int 0=
 [0]))<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (set (mem/c:SI (plus:DI=
 (reg/f:DI 29 x29)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (const_int -256 [0xffffffffffffff00])) [1 r=
edacted.pixel_value+0 S4 A128])<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (reg/v:SI 22 x22 [orig:141 color ] [141]))<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ]) &quot;TOPDIR/BUILD/work/redacted/redacted/redacted/git=
/redacted.c&quot;:2903:45 -1<br>=C2=A0 =C2=A0 =C2=A0(expr_list:REG_DEAD (re=
g/v:SI 22 x22 [orig:141 color ] [141])<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 (nil)=
))<br>during RTL pass: cprop_hardreg<br>TOPDIR/BUILD/work/redacted/redacted=
/redacted/git/redacted.c:2923:1: internal compiler error: in extract_insn, =
at recog.cc:2791<br>0x191624a internal_error(char const*, ...)<br>	???:0<br=
>0x6bee26 fancy_abort(char const*, int, char const*)<br>	???:0<br>0x697469 =
_fatal_insn(char const*, rtx_def const*, char const*, int, char const*)<br>=
	???:0<br>0x697485 _fatal_insn_not_found(rtx_def const*, char const*, int, =
char const*)<br>	???:0<br>0xbef198 extract_constrain_insn(rtx_insn*)<br>	??=
?:0</div></div></blockquote><div><br></div><div>And the same code fails lik=
e this only with gcc-12.3 in mickledore and gcc-13.2 in nanbield. kirkstone=
 with gcc-11.4 and your patch (as it is in kirkstone-nut) builds the same c=
ode fine.=C2=A0</div></div></div>

--0000000000009be00c060550ba30--

