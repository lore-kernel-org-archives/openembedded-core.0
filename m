Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEF8C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 09:02:33 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.2451.1665133346386302421
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 02:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WMg/ETSI;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id 67so4338189pfz.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=48nuB28UvK+zjLFp8NBOtR/iOioy3waadUNozwSxXj8=;
        b=WMg/ETSITAlwuro0IlQRvrr1K1YVgCn529/wcaOhLnjGBd8CkvouZmEYbt5lrl3XiX
         dFSp29vtfsxnIkdwpHolONwceHrnyE7nLcdYqbpcKU8bNi5qGUwgzuxCUUUZgfadTPv2
         AIA6YJEpBgomt/u0tK9sum+tkU2EgHrkiU7VPPkJnO75FiiON1zMXEYJr+gzqUqdOPjC
         rYhvsGztT+5WW0JZbIgQHJ267YtrKyuA/GMeDrvEqqmG8CWv53fZHIfmrO2exPbFXAYt
         KqsIpsDkwRDRNsrjnb3c2HxY1InlHU5LdDhfMRY5r4nOocnhR6mM/1/kXJgf+6ARDkXm
         ErIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48nuB28UvK+zjLFp8NBOtR/iOioy3waadUNozwSxXj8=;
        b=e0RMBofGtJxvXm27dPk2U4+TrKHGRR6xaN6Vo6WeWeaOzN1Cgr0AVVbSapu3zxzY4N
         jb/neXV6LaeVITKvq4Mx9ioCjB+UfgzB1HT59Ef3wEBLmgE/7pLqAhmq7cb21qWsAdkn
         K2G5uzO1OKR9ehwtHmSL551DXCf845vf3460sMcnl1Aa9K6oj7j8u1r3hu0uJQK9o5ga
         JwWpkjc7YF7AFWM3cgCp2wa7JS8Azg8c71DvfFZD9BSRKY528aZHzjHcSf9do61yxJwW
         ocSFFCnZ/PLuNh7QHFGqnJ0yxXyDW5+LTfcKdLGH1Lib8WMkkT3iOE97xuQSY5hHvhMd
         CrCQ==
X-Gm-Message-State: ACrzQf3RqrXX8t96Vik2fO3Wwy2Ywh8Ls7sgafoGrVeyhrlmwhUmMUwU
	x+64Ut0yYdx/SGmnwbkFK3+VW/grq/iV1TVToaNPHyT04iZ4lw==
X-Google-Smtp-Source: 
 AMsMyM7E4jhRfuJqQqnFynR2an3gl05eVcjz6ZoyiC5DAwgREiMi3+0UbsBfsz51bweNUaduCr051nscTl4ba2mnzoA=
X-Received: by 2002:a05:6a00:1892:b0:540:acee:29e8 with SMTP id
 x18-20020a056a00189200b00540acee29e8mr4235322pfh.1.1665133345628; Fri, 07 Oct
 2022 02:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220930175440.2168008-1-jose.quaresma@foundries.io>
 <20220930175440.2168008-3-jose.quaresma@foundries.io>
 <2F1C8D26-143C-462C-8705-DC9C23306603@arm.com>
In-Reply-To: <2F1C8D26-143C-462C-8705-DC9C23306603@arm.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 7 Oct 2022 10:02:14 +0100
Message-ID: 
 <CANPvuR=4CZ+M-S4DKQo1F-0xQfeqBzbXZhJOpvweJz0FoMrF4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] kernel-yocto: improve fatal error messages
 of symbol_why.py
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000091e7c105ea6e11db"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Oct 2022 09:02:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171520

--00000000000091e7c105ea6e11db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ross Burton <Ross.Burton@arm.com> escreveu no dia quinta, 6/10/2022 =C3=A0(=
s)
11:51:

>
>
> > On 30 Sep 2022, at 18:54, Jose Quaresma via lists.openembedded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
> > -        bb.fatal( "config analysis failed: %s" %
> e.output.decode('utf-8'))
> > +        bb.fatal( "config analysis failed when running '%s': %s" % ("
> ".join(cmd), e.output.decode('utf-8')))
>
> Much easier to just use e.cmd.
>

It's really much simpler. thank you, I will send a v2

Jose


>
>
> https://docs.python.org/3/library/subprocess.html#subprocess.CalledProces=
sError
>
> Ross



--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000091e7c105ea6e11db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Ross Burton &lt;<a href=3D"mailto:Ros=
s.Burton@arm.com">Ross.Burton@arm.com</a>&gt; escreveu no dia quinta, 6/10/=
2022 =C3=A0(s) 11:51:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>
<br>
&gt; On 30 Sep 2022, at 18:54, Jose Quaresma via <a href=3D"http://lists.op=
enembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org=
</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal( &quot;config analysis failed: %=
s&quot; % e.output.decode(&#39;utf-8&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal( &quot;config analysis failed wh=
en running &#39;%s&#39;: %s&quot; % (&quot; &quot;.join(cmd), e.output.deco=
de(&#39;utf-8&#39;)))<br>
<br>
Much easier to just use e.cmd.<br></blockquote><div><br>It&#39;s really muc=
h simpler. thank you, I will send a v2</div><div><br></div><div>Jose<br>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<a href=3D"https://docs.python.org/3/library/subprocess.html#subprocess.Cal=
ledProcessError" rel=3D"noreferrer" target=3D"_blank">https://docs.python.o=
rg/3/library/subprocess.html#subprocess.CalledProcessError</a><br>
<br>
Ross</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"=
ltr" class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=
=C3=A9 Quaresma</div></div></div></div>

--00000000000091e7c105ea6e11db--

