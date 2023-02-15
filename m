Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC64FC636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 15:10:38 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web10.17391.1676473836604831841
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 07:10:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=klWYENCp;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id m1so20147320vst.7
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 07:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=glC2rn2xqtlvzVuSerFBfbAs4W2mfckOn4jgWiKnZNM=;
        b=klWYENCpHH0RKqG70vP/pLjxVHjzHzC3Z33M3Qy67d0Aa+WLpgst1hGmOHFt9azSvC
         /MN5W5ONpvDEplNtGWMxCupVDyZtPSTz7gLaZqrPGQabitR1GAGAvmiOnh5SQ0mMR2ib
         YstD/yoMJxadA/ZLI3MFkwrMv1JRqHhjrqw2ZqpdSLgkDcYeFUh0Xx6IWoScs+ZGZRLg
         iOZWC0Q4l1v7v73eh3bhjFgEE1Uek2sldyqqHARTslA0xyIK3zU7AuGbkD0LA1qvDyte
         H1OSzO8sbixP4CC51dl/dXifeHEkLTOAG8wx90Vb3PqhXKkVK+15mQI+/0nrt5JWPyVi
         OiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glC2rn2xqtlvzVuSerFBfbAs4W2mfckOn4jgWiKnZNM=;
        b=mZj4C/3eKg93MZHH+dvbAAqIM00/zFP6gdXNTG/98yr+vbfenq45oqM3CURY8Pi74O
         y8913N17yVL2wzSNJdt1cFdSknshAG7BnwYqhGbz75r+EyUfir/kDXw/0rBvPTXyzZm3
         NfQWVy1y0Lk9Qx0gecJX7yRPpBOuXgRicLKDvyH5M3shwz6KbgZajxFdsiEHCO/SXNMs
         qOo+HI3w9TUI2lRYj3fTU+cgaQV+jCcTjANRITII9E00cii0Emqmui0sXVPeFI/jFzKe
         4hybCj4XIkbd1/j6fww5atEyR82Dl28xMerDELyMnYORv9JvZTHc8g2nT0QDAF/X4Vqw
         iy9g==
X-Gm-Message-State: AO0yUKXKYkZDxTH8e2MZFIeHRns8WDiCi3I2Nsv/zGV3bYs5uDEFHAQg
	uTGzI6hPdCmqsLoBh28mCcl4wxSGy8uVbRjf/Ts=
X-Google-Smtp-Source: AK7set9DwFyViHt60AHqTeyrmcbSkXeH9mb5ZjVl7tKuMl/PpvO8KwESeqXXzW+Dg8H4CSxXAKIzYGW9KSHDXlWbphM=
X-Received: by 2002:a05:6102:11f7:b0:3f0:be66:8037 with SMTP id
 e23-20020a05610211f700b003f0be668037mr464660vsg.80.1676473835565; Wed, 15 Feb
 2023 07:10:35 -0800 (PST)
MIME-Version: 1.0
References: <20230215130057.1923450-1-jose.quaresma@foundries.io> <CAP9ODKrs24T2V1Ks8yeWbT+_6FLWdc4wy8iybKQpjxPhOhctAw@mail.gmail.com>
In-Reply-To: <CAP9ODKrs24T2V1Ks8yeWbT+_6FLWdc4wy8iybKQpjxPhOhctAw@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 15 Feb 2023 15:10:24 +0000
Message-ID: <CANPvuRm+Df-HVCi-KDOUPzKeUJz9VvznSKLVu1vWCK9Fx+YOoA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] kernel-module-split: make autoload and
 probeconf distribution specific
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000071bb1805f4be7bae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 15:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177202

--00000000000071bb1805f4be7bae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Octavio,

Otavio Salvador <otavio.salvador@ossystems.com.br> escreveu no dia quarta,
15/02/2023 =C3=A0(s) 13:25:

> Em qua., 15 de fev. de 2023 =C3=A0s 10:01, Jose Quaresma
> <quaresma.jose@gmail.com> escreveu:
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
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>
>
> Did you validate this using busybox only? Using sysv and busybox need
> to be validated as well.
>

Please drop this patch series because it doesn work with busybox.

Looks like busybox don't support other path than /etc:
https://git.busybox.net/busybox/tree/modutils/modprobe.c?id=3D669c40ed8ebf4=
80c95ce36135104e474e361a7e6#n658

So I need to implement this in another way, maybe relocating the files from
/etc only when systemd is enabled.

Thanks for raising the issue.

Jose


> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000071bb1805f4be7bae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Octavio,</div><div><br></div><div><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Otavio Salvador &lt;<a hre=
f=3D"mailto:otavio.salvador@ossystems.com.br">otavio.salvador@ossystems.com=
.br</a>&gt; escreveu no dia quarta, 15/02/2023 =C3=A0(s) 13:25:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Em qua., 15 de fev. de 2023=
 =C3=A0s 10:01, Jose Quaresma<br>
&lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.j=
ose@gmail.com</a>&gt; escreveu:<br>
&gt;<br>
&gt; The modules-load.d [1] - Configure kernel modules to load at boot<br>
&gt; should install their configuration files in /usr/lib/modules-load.d.<b=
r>
&gt;<br>
&gt; The modprobe.d [2] - Configuration directory for modprobe<br>
&gt; should install their configuration files in /lib/modprobe.d<br>
&gt;<br>
&gt; [1] <a href=3D"https://www.freedesktop.org/software/systemd/man/module=
s-load.d.html" rel=3D"noreferrer" target=3D"_blank">https://www.freedesktop=
.org/software/systemd/man/modules-load.d.html</a><br>
&gt; [2] <a href=3D"https://www.man7.org/linux/man-pages//man5/modprobe.d.5=
.html" rel=3D"noreferrer" target=3D"_blank">https://www.man7.org/linux/man-=
pages//man5/modprobe.d.5.html</a><br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
<br>
<br>
Did you validate this using busybox only? Using sysv and busybox need<br>
to be validated as well.<br></blockquote><div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr"><div>Please drop this patch series =
because it doesn work with=C2=A0busybox.<br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr"><div><br></div></div></div></div><div>Loo=
ks like busybox don&#39;t=C2=A0support other path than /etc:<br></div><div>=
<a href=3D"https://git.busybox.net/busybox/tree/modutils/modprobe.c?id=3D66=
9c40ed8ebf480c95ce36135104e474e361a7e6#n658">https://git.busybox.net/busybo=
x/tree/modutils/modprobe.c?id=3D669c40ed8ebf480c95ce36135104e474e361a7e6#n6=
58</a><br></div><div><br></div></div><div dir=3D"ltr" class=3D"gmail_attr">=
So I need to implement this in another way, maybe relocating the files from=
 /etc only when systemd is enabled.<br></div><div dir=3D"ltr" class=3D"gmai=
l_attr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
"><div>Thanks for raising the issue.<br></div></div></div></div></div><div>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"><br></div>=
</div></div></div><div>Jose<br><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
-- <br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: +55 (53) 9 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile: +1 (=
347) 903-9750<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div></div>

--00000000000071bb1805f4be7bae--

