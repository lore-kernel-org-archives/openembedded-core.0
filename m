Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91ECFC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 11:40:43 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.8282.1699357234262098414
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 03:40:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bi/BKuiT;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32f78dcf036so3992726f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 03:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699357233; x=1699962033; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GF/SGOBxoUjZaWD05YaONwynbfaNk+5UWbTeo+YMQNI=;
        b=bi/BKuiTusd9xYQ+xK2REb1ac8KdnUjMOdN0i+N4VdWHglEoJjcpV8bqzn0NoVYwQU
         9YV8j1P/28l/XZnQiXy8wxDA9LLLfbQtm+uMn5yk3HkS8T6fz+xNxgmhdebbh7fpm/tb
         UEQYySKYG/UoJI1dpjKzhNogT4S3YdYv85bQuH9gX7gt2bGkaSrhP29c1rk8M+IypR/J
         HdLy742yyZJkK3xCZwFZCo1vhoeCkHRJdwL/bfXAuOVUNmrQBTaDmXv+OD4rHCf5OCKU
         i5nXT/UojaxJnUUVAwhPuMZITTZtbqUaj2y/F113/W/sS8lhCoCHNrNyzwIg1Jn6wW1H
         1e3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699357233; x=1699962033;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GF/SGOBxoUjZaWD05YaONwynbfaNk+5UWbTeo+YMQNI=;
        b=tROgsllnURTslGqequ4hlNVdfPCQ19H/6Bftuu2E2mePlIQvsHtZIFKPAFVPIz5oQY
         jrUGTgrxYhLZEoGa3stwYbcqCXw9a+hkrNZWdVEnSQm34xooGIbUmbI0hfMXj6m0iCjT
         IzFLpwIJToZs6MEF2aQAcniXk2CUPjCrW71Xt5RDcdDg13q2RlV4cg92RYlLcF+bqE0B
         YQJ69BgBS/BEf9ap2n8/lPFPcvgqd9oEBN5DCOPbUcxbNDcQclPPRh8fShVl767rsz8C
         jJG5C56c1Ed7Bbzpzgafqq7Cb/essd47APPZFUre1A3SuGhA9eMnDGfRAmvaCCw6tTlz
         VsVA==
X-Gm-Message-State: AOJu0YydXLOYDIal/aPVOImHGrNHRKWoAPnHtA0jBfgKIuNoAoEJVmBH
	ogF+BeRGxEHMhZIEOG2dYy/t2UtCikqQTcDWvQs=
X-Google-Smtp-Source: AGHT+IFZcdWxFVXRJ9B76hQbAKZ+mtMmVs5VDwXAE3StUyz6e/hZgwLG4vSZERFunIwRs6sf6bfSpWZeTufW3hgQXkE=
X-Received: by 2002:a05:6000:2c2:b0:32f:8c9a:67 with SMTP id
 o2-20020a05600002c200b0032f8c9a0067mr2728416wry.0.1699357232354; Tue, 07 Nov
 2023 03:40:32 -0800 (PST)
MIME-Version: 1.0
References: <24b92a7a-aa29-45e7-8a5e-7c34fe131971@gmail.com>
In-Reply-To: <24b92a7a-aa29-45e7-8a5e-7c34fe131971@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 7 Nov 2023 12:40:20 +0100
Message-ID: <CA+chaQdvOFqGHZ5=VLtG4uqDOocnP-_x90RUWn07J2=7RfMPcA@mail.gmail.com>
Subject: Re: [OE-core] Baekmuk license is not known by Yocto
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002e594b06098e701e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 11:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190269

--0000000000002e594b06098e701e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You can add the license to the layer where the recipe is, see LICENSE_PATH
variable used in meta-oe for example.

On Tue, Nov 7, 2023 at 12:30=E2=80=AFPM Zoltan Boszormenyi <zboszor@gmail.c=
om>
wrote:

> Hi,
>
> I have a font package recipe for baekmuk-ttf-fonts
> which can't be built under Yocto 4.3 do to these:
>
> WARNING: baekmuk-ttf-fonts-2.2-r0 do_populate_lic: QA Issue:
> baekmuk-ttf-fonts: No generic
> license file exists for: Baekmuk in any provider [license-exists]
> ERROR: baekmuk-ttf-fonts-2.2-r0 do_create_spdx: Cannot find any text for
> license Baekmuk
> ERROR: Logfile of failure stored in:
>
> /data/test-yocto-4.3/tmp-sicom-glibc/work/all-oe-linux/baekmuk-ttf-fonts/=
2.2/temp/log.do_create_spdx.3195121
> ERROR: Task
>
> (/data/test-yocto-4.3/conf/../layers/meta-sicom/recipes-support/fonts/bae=
kmuk-ttf-fonts_2.2.bb:do_create_spdx)
>
> failed with exit code '1'
>
> The recipe uses the source tarball from:
> http://kldp.net/baekmuk/release/865-baekmuk-ttf-2.2.tar.gz
> and this tarball contains the license in the file "COPYRIGHT".
>
> The SPDX page for this license is: https://spdx.org/licenses/Baekmuk.html
>
> I know the workaround is adding these lines to the recipe:
>
> NO_GENERIC_LICENSE[Baekmuk]  =3D "COPYRIGHT"
> INSANE_SKIP:${PN} =3D "license-exists"
>
> But this license exists and is known by SPDX.
> So please add this license name/text to Yocto.
> Also, please backport it to nanbield.
>
> Thanks in advance.
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190267):
> https://lists.openembedded.org/g/openembedded-core/message/190267
> Mute This Topic: https://lists.openembedded.org/mt/102440652/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002e594b06098e701e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You can add the license to the layer where the recipe is, =
see LICENSE_PATH variable used in meta-oe for example.</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 7, 2023 =
at 12:30=E2=80=AFPM Zoltan Boszormenyi &lt;<a href=3D"mailto:zboszor@gmail.=
com">zboszor@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hi,<br>
<br>
I have a font package recipe for baekmuk-ttf-fonts<br>
which can&#39;t be built under Yocto 4.3 do to these:<br>
<br>
WARNING: baekmuk-ttf-fonts-2.2-r0 do_populate_lic: QA Issue: baekmuk-ttf-fo=
nts: No generic <br>
license file exists for: Baekmuk in any provider [license-exists]<br>
ERROR: baekmuk-ttf-fonts-2.2-r0 do_create_spdx: Cannot find any text for li=
cense Baekmuk<br>
ERROR: Logfile of failure stored in: <br>
/data/test-yocto-4.3/tmp-sicom-glibc/work/all-oe-linux/baekmuk-ttf-fonts/2.=
2/temp/log.do_create_spdx.3195121<br>
ERROR: Task <br>
(/data/test-yocto-4.3/conf/../layers/meta-sicom/recipes-support/fonts/baekm=
uk-ttf-fonts_2.2.bb:do_create_spdx) <br>
failed with exit code &#39;1&#39;<br>
<br>
The recipe uses the source tarball from:<br>
<a href=3D"http://kldp.net/baekmuk/release/865-baekmuk-ttf-2.2.tar.gz" rel=
=3D"noreferrer" target=3D"_blank">http://kldp.net/baekmuk/release/865-baekm=
uk-ttf-2.2.tar.gz</a><br>
and this tarball contains the license in the file &quot;COPYRIGHT&quot;.<br=
>
<br>
The SPDX page for this license is: <a href=3D"https://spdx.org/licenses/Bae=
kmuk.html" rel=3D"noreferrer" target=3D"_blank">https://spdx.org/licenses/B=
aekmuk.html</a><br>
<br>
I know the workaround is adding these lines to the recipe:<br>
<br>
NO_GENERIC_LICENSE[Baekmuk]=C2=A0 =3D &quot;COPYRIGHT&quot;<br>
INSANE_SKIP:${PN} =3D &quot;license-exists&quot;<br>
<br>
But this license exists and is known by SPDX.<br>
So please add this license name/text to Yocto.<br>
Also, please backport it to nanbield.<br>
<br>
Thanks in advance.<br>
Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190267): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190267" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190267</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102440652/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102440652/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000002e594b06098e701e--

