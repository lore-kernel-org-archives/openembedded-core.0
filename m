Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C14C433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 11:15:43 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.4505.1640085341834297805
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 03:15:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aOh0Wrhe;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id k37so28581654lfv.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 03:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mmIjXMGWFNyg2JziFPHuAALDKr59ucCGq4C1oq/BlnA=;
        b=aOh0WrhekdHs+p7Vi5fB/I7J4R7iCTh9438ypIaGUTEXfwnkRf6sGzQE3QqppJLaXI
         DTqOqflLxAZULh+2OsFhoCtOwS0jNmfyPAD3M8liLnXPEgK50L2uwerpIRiB6zCutTJW
         Zu0Tl8yZBotRQjZhNIQAmxxAL07VcMqurFKTXofXSrLkvzYO6hkh0IjBHlZ2fYbICtFM
         jBm+iErcheCRSRwtR9/hA1ED0t6BBDPrXF64vLjL/krRjWcrNrTEL9JANw/GBCfTIpRS
         4E9BLghKdws7fkdalh+BX05X9zayxv+b+/AF4YqL70jGInUtMmP766WiEUoD2ZQOWVA/
         0pZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mmIjXMGWFNyg2JziFPHuAALDKr59ucCGq4C1oq/BlnA=;
        b=nE6Ti9LFo8DcTL39exAUntsb+L9qqx0S5KJYKa/ZGLrra88SonPcPUU2ep2Z5QQF3+
         zg60OtDDG2LoFXKUdYgpS7E1PE4BeYSA0M/RdLEQDHuS4kx7x319gFSd6UYK6Rw7k7RD
         esbAz4/ilSX/bDXV271JA74TQlRKAZuFNOgZ63343EmcuXyFUT6sntRcipXenpn6gvDW
         M+e9EAy/TSm7pPfT3hBsfZCpqfCDw3NGgUbvOqn/DQSQN6zaEJqb797CFFUpekf0SRoj
         kYIPH3dvcClME20g4YvV6WnFM4bmvzkwjEDw29kXw/PsortwmyFSBppjOvzOKJWrscif
         2Mvg==
X-Gm-Message-State: AOAM530EFPANr0WL+4onmP8sSSQvg++XDJ5cIXHEI3x1aII8IGFjOXKq
	Prbbo68qlfJListaqO8YeIqLwYktI/qSmgnMI68=
X-Google-Smtp-Source: 
 ABdhPJyuPlr3j88ua4SD/yR+VSMnH1SKaBNyWUbXBLO7xdXEPTkRsEyrukx1xYZa9oRWW09P/8ftYoVTpd8ghTYvd4U=
X-Received: by 2002:a05:6512:3402:: with SMTP id
 i2mr2592598lfr.447.1640085339808;
 Tue, 21 Dec 2021 03:15:39 -0800 (PST)
MIME-Version: 1.0
References: 
 <99e75b930d85e240c51074406b0cd896c93257cb.camel@linuxfoundation.org>
 <DM5PR1101MB23482FA91A07CA4057E768D9BB7C9@DM5PR1101MB2348.namprd11.prod.outlook.com>
In-Reply-To: 
 <DM5PR1101MB23482FA91A07CA4057E768D9BB7C9@DM5PR1101MB2348.namprd11.prod.outlook.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 21 Dec 2021 11:15:28 +0000
Message-ID: 
 <CANPvuRkqyngQAqhqfou9ka7J3oufuSCubf9J7cgZ-ZU9KLTJjg@mail.gmail.com>
Subject: Re: [yocto] [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.13.rc1)
To: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
Cc: "qa-build-notification@lists.yoctoproject.org"
 <qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000014a5c205d3a62047"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 11:15:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159912

--00000000000014a5c205d3a62047
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Teoh, Jay Shen <jay.shen.teoh@intel.com> escreveu no dia ter=C3=A7a, 21/12/=
2021
=C3=A0(s) 07:46:

> Hi all,
>
> This is the full report for yocto-3.1.13.rc1:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree=
/?h=3Dintel-yocto-testresults
>
> =3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
> No high milestone defects.
>
> new issue found
>
> Bug 14669 - [QA 3.1.13 RC1] failure in ptest
> :gstreamer1.0.gstreamer-1.0/pipelines_seek.test
>
>
> =3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14669


This patch is a bug fix 14669
<https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14669>
https://lists.openembedded.org/g/openembedded-core/message/159911


>
>
> Thanks,
> Jay
>
> >-----Original Message-----
> >From: qa-build-notification@lists.yoctoproject.org <qa-build-
> >notification@lists.yoctoproject.org> On Behalf Of Richard Purdie
> >Sent: Wednesday, 15 December, 2021 3:40 PM
> >To: <yocto@lists.yoctoproject.org> <yocto@lists.yoctoproject.org>
> >Cc: qa-build-notification <qa-build-notification@lists.yoctoproject.org>
> >Subject: [qa-build-notification] QA notification for completed
> autobuilder build
> >(yocto-3.1.13.rc1)
> >
> >A build flagged for QA (yocto-3.1.13.rc1) was completed on the
> autobuilder and is
> >available at:
> >
> >
> >    https://autobuilder.yocto.io/pub/releases/yocto-3.1.13.rc1
> >
> >
> >Build hash information:
> >
> >bitbake: f18b65d0b9a6b983d53bde491e1bf2ca56949444
> >meta-agl: 6d1ab9f3bb270a773ec5d2f7c8c856796833b559
> >meta-arm: ce535dfb96de4d2529f091d7d85a7172c626001c
> >meta-aws: 9979cfa676105cb68cfadfdaeabf044d7c919319
> >meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> >meta-intel: 87984115eb6ed1a4c17204629dcb100f6b76fe82
> >meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> >meta-openembedded: 69f94af4d91215e7d4e225bab54bf3bcfee42f1c
> >oecore: 90a07178ea26be453d101c2e8b33d3a0f437635d
> >poky: 795339092f87672e4f68e4d3bc4cfd0e252d1831
> >
> >
> >
> >This is an automated message from the Yocto Project Autobuilder
> >Git: git://git.yoctoproject.org/yocto-autobuilder2
> >Email: richard.purdie@linuxfoundation.org
> >
> >
> >
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#55630):
> https://lists.yoctoproject.org/g/yocto/message/55630
> Mute This Topic: https://lists.yoctoproject.org/mt/87873452/5052612
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000014a5c205d3a62047
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Teoh, Jay Shen &lt;<a href=3D"mailto:=
jay.shen.teoh@intel.com">jay.shen.teoh@intel.com</a>&gt; escreveu no dia te=
r=C3=A7a, 21/12/2021 =C3=A0(s) 07:46:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hi all,<br>
<br>
This is the full report for yocto-3.1.13.rc1:=C2=A0 <br>
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-con=
trib/tree/?h=3Dintel-yocto-testresults" rel=3D"noreferrer" target=3D"_blank=
">https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree=
/?h=3Dintel-yocto-testresults</a><br>
<br>
=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D<br>
No high milestone defects. <br>
<br>
new issue found <br>
<br>
Bug 14669 - [QA 3.1.13 RC1] failure in ptest :gstreamer1.0.gstreamer-1.0/pi=
pelines_seek.test<br>
<br>
<br>
=3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14669" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D14669</a></blockquote><div><br></div><div><span style=3D"color:r=
gb(51,51,51);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-se=
rif;font-size:14px;white-space:pre-wrap">This patch is a bug fix </span><a =
href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14669" rel=3D"n=
oreferrer" target=3D"_blank">14669</a></div><div><a href=3D"https://lists.o=
penembedded.org/g/openembedded-core/message/159911">https://lists.openembed=
ded.org/g/openembedded-core/message/159911</a><br style=3D"box-sizing:borde=
r-box;color:rgb(51,51,51);font-family:&quot;Helvetica Neue&quot;,Helvetica,=
Arial,sans-serif;font-size:14px;white-space:pre-wrap"></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Thanks,<br>
Jay<br>
<br>
&gt;-----Original Message-----<br>
&gt;From: <a href=3D"mailto:qa-build-notification@lists.yoctoproject.org" t=
arget=3D"_blank">qa-build-notification@lists.yoctoproject.org</a> &lt;qa-bu=
ild-<br>
&gt;<a href=3D"mailto:notification@lists.yoctoproject.org" target=3D"_blank=
">notification@lists.yoctoproject.org</a>&gt; On Behalf Of Richard Purdie<b=
r>
&gt;Sent: Wednesday, 15 December, 2021 3:40 PM<br>
&gt;To: &lt;<a href=3D"mailto:yocto@lists.yoctoproject.org" target=3D"_blan=
k">yocto@lists.yoctoproject.org</a>&gt; &lt;<a href=3D"mailto:yocto@lists.y=
octoproject.org" target=3D"_blank">yocto@lists.yoctoproject.org</a>&gt;<br>
&gt;Cc: qa-build-notification &lt;<a href=3D"mailto:qa-build-notification@l=
ists.yoctoproject.org" target=3D"_blank">qa-build-notification@lists.yoctop=
roject.org</a>&gt;<br>
&gt;Subject: [qa-build-notification] QA notification for completed autobuil=
der build<br>
&gt;(yocto-3.1.13.rc1)<br>
&gt;<br>
&gt;A build flagged for QA (yocto-3.1.13.rc1) was completed on the autobuil=
der and is<br>
&gt;available at:<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://autobuilder.yocto.io/pub/releases/yoct=
o-3.1.13.rc1" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
o.io/pub/releases/yocto-3.1.13.rc1</a><br>
&gt;<br>
&gt;<br>
&gt;Build hash information:<br>
&gt;<br>
&gt;bitbake: f18b65d0b9a6b983d53bde491e1bf2ca56949444<br>
&gt;meta-agl: 6d1ab9f3bb270a773ec5d2f7c8c856796833b559<br>
&gt;meta-arm: ce535dfb96de4d2529f091d7d85a7172c626001c<br>
&gt;meta-aws: 9979cfa676105cb68cfadfdaeabf044d7c919319<br>
&gt;meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac<br>
&gt;meta-intel: 87984115eb6ed1a4c17204629dcb100f6b76fe82<br>
&gt;meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7<br>
&gt;meta-openembedded: 69f94af4d91215e7d4e225bab54bf3bcfee42f1c<br>
&gt;oecore: 90a07178ea26be453d101c2e8b33d3a0f437635d<br>
&gt;poky: 795339092f87672e4f68e4d3bc4cfd0e252d1831<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;This is an automated message from the Yocto Project Autobuilder<br>
&gt;Git: git://<a href=3D"http://git.yoctoproject.org/yocto-autobuilder2" r=
el=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/yocto-autobuilder2=
</a><br>
&gt;Email: <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"=
_blank">richard.purdie@linuxfoundation.org</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#55630): <a href=3D"https://lists.yoctoproject.org/g/yoc=
to/message/55630" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctop=
roject.org/g/yocto/message/55630</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/87873452/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/87873452/5052612</a><br>
Group Owner: <a href=3D"mailto:yocto%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">yocto+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/yocto/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/yocto/un=
sub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quare=
sma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000014a5c205d3a62047--

