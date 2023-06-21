Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA35EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 23:18:22 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web10.1914.1687389495276462861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 16:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BOBItfBZ;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-440b4b0147bso1076513137.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 16:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687389494; x=1689981494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mcxzhrBs0/oP4zz1elD3wxauoW/h4yv7Rj91zT1uJJs=;
        b=BOBItfBZy60H6fI7X/HVNP0HxaH/mKmEXcIY7Paw3JAo5wJ/koIVbNWGeSNqXGk4W9
         os9MYg/hCAZ4GDm7brXNtRWWmXcBeJRJGcPUbHt544K0vfJG4gHRvi+VtFfIpM5ctN45
         667Tf15UegVGxz9IsN1TjcRQtOaEaPKajYb1VpsPT5dCl5tCrQF98wDCHkEc+Nwc4/JY
         38U7fyco9EhjwtzXeuyrAGtH19OgDM4i9gXauIbRj5tr07CeMgxfSLqMqhP+umXHpjYb
         Gfo98CDctpnM5kBgKOi+ssmG/zfjpNhoWXiTDjV2tGTNgEj7zeHO205YwsCYOpEAjmgc
         /L5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687389494; x=1689981494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mcxzhrBs0/oP4zz1elD3wxauoW/h4yv7Rj91zT1uJJs=;
        b=RaJED1DTmBnRz434T9ML5cMusb+bjrE5i/pbeDTvLQ6olArR6XzSEi+KfZ8IsMWQVO
         LvOQnqq62vOw9K+BdJrnU8Y1ptiFms6kpuFMKvI9Rj3xO5Kjp0klFgkES4XtD3gXd4uJ
         rP5nzFnnr6zg9MvomsNLCFLQa1FHuB5Vuus/ON/rQ6BwwmPMTLPad7RQGLk7cdwBZVs7
         R5YvtN8zFZe1UoLDozvEsCR0ko9023pO/A8Za4PiUc19wazy8EuXIr4tGXR28piBvKbp
         OfxKPuvKdM1grZM2cE9fsRqSvXFdMnZ5W3fykBA9JffPadkzShue6t30g1TKnsKU5YCI
         1+SA==
X-Gm-Message-State: AC+VfDwex0J/iM/WcdiU+fz6pZe1QeaWczG9gAzdDReZYPlRuPBLZdJi
	EXSwWpNNFvGgIYSYSWXCxDtGIqfVmEKge8snz2o=
X-Google-Smtp-Source: ACHHUZ73lQoVYpFH33w76D5uqP+CdKKmADk2gVVWXGe0Yihuj6UPY9OnSUdSLF0F4aU2iZljEOqKGXLIRajmA0PEJe4=
X-Received: by 2002:a05:6102:3663:b0:440:ccf2:d3e0 with SMTP id
 bg3-20020a056102366300b00440ccf2d3e0mr3206109vsb.23.1687389494215; Wed, 21
 Jun 2023 16:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230620221942.2801107-1-jose.quaresma@foundries.io> <20230621222232.6575ab6b@booty>
In-Reply-To: <20230621222232.6575ab6b@booty>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 22 Jun 2023 00:18:03 +0100
Message-ID: <CANPvuRnZX+pVFy0gR_3Xf2P81As+2-yEKyu=112VJr5g47e4_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3 1/3] kernel-module-split: make autoload and
 probeconf distribution specific
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>, Ola x Nilsson <Ola.x.Nilsson@axis.com>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Content-Type: multipart/alternative; boundary="0000000000006688a905feabfb21"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 23:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183199

--0000000000006688a905feabfb21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

Luca Ceresoli <luca.ceresoli@bootlin.com> escreveu no dia quarta,
21/06/2023 =C3=A0(s) 21:22:

> Hi Jose,
>
> On Tue, 20 Jun 2023 22:19:42 +0000
> "Jose Quaresma" <quaresma.jose@gmail.com> wrote:
>
> > Also take the oportunity to only add configuration files to FILES
> > and CONFFILES when they exist and are used.
> >
> > The modules-load.d [1] - Configure kernel modules to load at boot
> > should install their configuration files in /usr/lib/modules-load.d.
> >
> > The modprobe.d [2] - Configuration directory for modprobe
> > should install their configuration files in /lib/modprobe.d
> >
> > [1] https://www.freedesktop.org/software/systemd/man/modules-load.d.htm=
l
> > [2] https://www.man7.org/linux/man-pages//man5/modprobe.d.5.html
> >
> > [YOCTO #12212] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1221=
2
> >
> > CC: Ola x Nilsson <Ola.x.Nilsson@axis.com>
> > CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>
> We're having this error on the autobuilders:
>
> ERROR: linux-yocto-6.1.33+gitAUTOINC+db25e51e20_947f660bde-r0 do_package:
> QA Issue: linux-yocto: Files/directories were installed but not shipped i=
n
> any package:
>   /etc
>
> May it be caused by this series?
>

I have another mistake on the patch that doesn't work without systemd.
My fault, on my tests it's been working well because I use the systemd.
I will send a V4 and helpfully is the last one.

Sorry and thanks for testing.

Jose


>
> Logs:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/7665/st=
eps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/7376/st=
eps/12/logs/stdio
>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000006688a905feabfb21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Luca,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Luca Ceresoli &lt;<a href=3D"mailto:luca.cere=
soli@bootlin.com">luca.ceresoli@bootlin.com</a>&gt; escreveu no dia quarta,=
 21/06/2023 =C3=A0(s) 21:22:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hi Jose,<br>
<br>
On Tue, 20 Jun 2023 22:19:42 +0000<br>
&quot;Jose Quaresma&quot; &lt;<a href=3D"mailto:quaresma.jose@gmail.com" ta=
rget=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Also take the oportunity to only add configuration files to FILES<br>
&gt; and CONFFILES when they exist and are used.<br>
&gt; <br>
&gt; The modules-load.d [1] - Configure kernel modules to load at boot<br>
&gt; should install their configuration files in /usr/lib/modules-load.d.<b=
r>
&gt; <br>
&gt; The modprobe.d [2] - Configuration directory for modprobe<br>
&gt; should install their configuration files in /lib/modprobe.d<br>
&gt; <br>
&gt; [1] <a href=3D"https://www.freedesktop.org/software/systemd/man/module=
s-load.d.html" rel=3D"noreferrer" target=3D"_blank">https://www.freedesktop=
.org/software/systemd/man/modules-load.d.html</a><br>
&gt; [2] <a href=3D"https://www.man7.org/linux/man-pages//man5/modprobe.d.5=
.html" rel=3D"noreferrer" target=3D"_blank">https://www.man7.org/linux/man-=
pages//man5/modprobe.d.5.html</a><br>
&gt; <br>
&gt; [YOCTO #12212] <a href=3D"https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D12212" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctop=
roject.org/show_bug.cgi?id=3D12212</a><br>
&gt; <br>
&gt; CC: Ola x Nilsson &lt;<a href=3D"mailto:Ola.x.Nilsson@axis.com" target=
=3D"_blank">Ola.x.Nilsson@axis.com</a>&gt;<br>
&gt; CC: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.c=
om" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
<br>
We&#39;re having this error on the autobuilders:<br>
<br>
ERROR: linux-yocto-6.1.33+gitAUTOINC+db25e51e20_947f660bde-r0 do_package: Q=
A Issue: linux-yocto: Files/directories were installed but not shipped in a=
ny package:<br>
=C2=A0 /etc<br>
<br>
May it be caused by this series?<br></blockquote><div><br></div><div>I have=
 another mistake on the patch that doesn&#39;t work without systemd.<br></d=
iv><div>My fault, on my tests=C2=A0it&#39;s been working well because I use=
 the systemd.<br></div>I will send a V4 and helpfully is the last one.<br c=
lass=3D"gmail-Apple-interchange-newline"><div><br>Sorry and thanks for test=
ing.=C2=A0<br><br>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
Logs:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/23/build=
s/7665/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/23/builds/7665/steps/14/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/89/build=
s/7376/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/89/builds/7376/steps/12/logs/=
stdio</a><br>
<br>
Luca<br>
<br>
-- <br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000006688a905feabfb21--

