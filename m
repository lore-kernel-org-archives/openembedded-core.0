Return-Path: <fede@evolware.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D1AC433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 06:28:19 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web09.3569.1648535298081994919
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 23:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: fede.evol@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id e16so28469876lfc.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 23:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=62echjXxpR5v1+2GLUhvoPIpZ4Tcp1xfUvpcii4rZjw=;
        b=X7GCHYuI846t08qlMtX9yg318tA9b5MvlNuUuOGNHyoliXvo5C4OBELgprIzUE9AWJ
         iW22uBC1wsnKFSH2rfyUo0cuIaReIgQZN4rx0Gk3qJDtte8wsubwiBkHAeVP6Ebmcuun
         sqdTXGBO/CA6dh3+FFXZcZ0cnyH4GEqtvyHSP/SgI5i70qSaDj3MEC6LCYY5Jo/Hsog0
         /k2hFRuMh4cMBcbygNasR5luJ8fFnQUiNtElPzjaSwsRn525XcGdb73MwlEDP2VlRhPb
         z8ah9Uk2sGJ7PHZKSR/4AVwy23KOEcUNGl1SSV20x/2kFSXbWDDmglQ6VLuSlKySpBKo
         x7Eg==
X-Gm-Message-State: AOAM530zMlAd5yREEjdd+/RsNxOzKxkBE7cBDpKCSqkGobYY+paZHwdF
	Qv1z49leNZpIYoIrekQ5QMA9jZ2r1UZzYuAA/fU=
X-Google-Smtp-Source: 
 ABdhPJz0ca9TCGWM3JOKOM0G1G6lCjCH/xyT5/ydKCTN0uuDjwQqRe3sLP9Lqz9qzIE2GCu34bj+dBd0+COkNFH7taQ=
X-Received: by 2002:ac2:43d5:0:b0:44a:4968:1f86 with SMTP id
 u21-20020ac243d5000000b0044a49681f86mr1212368lfl.614.1648535296250; Mon, 28
 Mar 2022 23:28:16 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAA=hcWRay+5Xqz+RO_EX1-Yr2Ef_uXcLUL7dZE45d6wBga4mzA@mail.gmail.com>
In-Reply-To: 
 <CAA=hcWRay+5Xqz+RO_EX1-Yr2Ef_uXcLUL7dZE45d6wBga4mzA@mail.gmail.com>
From: Federico Pellegrin <fede@evolware.org>
Date: Tue, 29 Mar 2022 08:28:04 +0200
Message-ID: 
 <CAM6O0ZhZ6i6Qq5S-wWjk5Uwan0NRkfpY10MvEpeFnHuqrJHFfQ@mail.gmail.com>
Subject: Re: [OE-core] Which vendors maintain SDIO WiFi in mainline stable
 kernel
To: JH <jupiter.hce@gmail.com>
Cc: yocto <yocto@lists.yoctoproject.org>,
	oe-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bb96b205db558851"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 06:28:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163737

--000000000000bb96b205db558851
Content-Type: text/plain; charset="UTF-8"

Hi Jupiter,
I cannot help you on the specific chip you ask, but responding to the
second part of your question I have quite good experience with Microchip
WILC1000/3000 on SDIO which, after a part separate repo and then staging,
is now in mailine from quite some time:
https://github.com/torvalds/linux/tree/master/drivers/net/wireless/microchip/wilc1000
I had also some mixed experience (seemed to be arch releated) otherwise
also with SDIO/SPI of SiLabs which is currently in mainline staging:
https://github.com/torvalds/linux/tree/master/drivers/staging/wfx
These chips are at least currently still on the market (modulo shortage
problems), not sure about their projected lifespan (I guess something hard
to foresee).

Cheers,
Federico


Il giorno mar 29 mar 2022 alle ore 08:16 JH <jupiter.hce@gmail.com> ha
scritto:

> Hi,
>
> I could not understand why so many large WiFi chip vendors retreat to
> stop maintaining WiFi SDIO chips to mainline Linux kernel, and to
> settle it's chip support to out of the tree, use its own SDK and
> proprietary kernel tree to source.codeaurora.org or private repository
> which are not compatible to mainline stable kernel, the kernel
> configures are also different.
>
> I looked at the following link, the mwifiex and mwifiex_sdio support
> the Marvell (NXP) 88W88 chipset, but only kernel 4.19 was able to
> build and to run, kernel 5 cannot support 88W88 chipset, any more.
> Same to Qualcomm, the old Atheros WiFi modules are supported, the
> QCA-9377-3 chipset is in source.codeaurora.org only supported by old
> kernel 4.9.
>
> Given the OE/Yocto poky kernel build is based on a mainline stable
> kernel repository, how can I build kernel 5 for 88W88 chipset or
> QCA-9377-3 from source.codeaurora.org or private repository? Or which
> WiFi vendors are still well maintaining the WiFi chips for kernel 5,
> the only sensible solution is to switch WiFi SDIO chips? Appreciate
> your advice and comments.
>
> https://wireless.wiki.kernel.org/en/users/drivers
>
> Thank you very much.
>
> Kind regards,
>
> jupiter
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163735):
> https://lists.openembedded.org/g/openembedded-core/message/163735
> Mute This Topic: https://lists.openembedded.org/mt/90102949/5117409
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> fede@evolware.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000bb96b205db558851
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Hi Jupiter,</div><div>I cannot help yo=
u on the specific chip you ask, but responding to the second part of your q=
uestion I have quite good experience with Microchip WILC1000/3000 on SDIO w=
hich, after a part separate repo and then staging, is now in mailine from q=
uite some time: <a href=3D"https://github.com/torvalds/linux/tree/master/dr=
ivers/net/wireless/microchip/wilc1000" target=3D"_blank">https://github.com=
/torvalds/linux/tree/master/drivers/net/wireless/microchip/wilc1000</a></di=
v><div>I had also some mixed experience (seemed to be arch releated) otherw=
ise also with SDIO/SPI of SiLabs which is currently in mainline staging: <a=
 href=3D"https://github.com/torvalds/linux/tree/master/drivers/staging/wfx"=
 target=3D"_blank">https://github.com/torvalds/linux/tree/master/drivers/st=
aging/wfx</a></div><div>These chips are at least currently still on the mar=
ket (modulo shortage problems), not sure about their projected lifespan (I =
guess something hard to foresee).<br></div><div><br></div><div>Cheers,</div=
><div>Federico</div><div><br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">Il giorno mar 29 mar 2022 alle ore 08:16=
 JH &lt;<a href=3D"mailto:jupiter.hce@gmail.com" target=3D"_blank">jupiter.=
hce@gmail.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hi,<br>
<br>
I could not understand why so many large WiFi chip vendors retreat to<br>
stop maintaining WiFi SDIO chips to mainline Linux kernel, and to<br>
settle it&#39;s chip support to out of the tree, use its own SDK and<br>
proprietary kernel tree to <a href=3D"http://source.codeaurora.org" rel=3D"=
noreferrer" target=3D"_blank">source.codeaurora.org</a> or private reposito=
ry<br>
which are not compatible to mainline stable kernel, the kernel<br>
configures are also different.<br>
<br>
I looked at the following link, the mwifiex and mwifiex_sdio support<br>
the Marvell (NXP) 88W88 chipset, but only kernel 4.19 was able to<br>
build and to run, kernel 5 cannot support 88W88 chipset, any more.<br>
Same to Qualcomm, the old Atheros WiFi modules are supported, the<br>
QCA-9377-3 chipset is in <a href=3D"http://source.codeaurora.org" rel=3D"no=
referrer" target=3D"_blank">source.codeaurora.org</a> only supported by old=
<br>
kernel 4.9.<br>
<br>
Given the OE/Yocto poky kernel build is based on a mainline stable<br>
kernel repository, how can I build kernel 5 for 88W88 chipset or<br>
QCA-9377-3 from <a href=3D"http://source.codeaurora.org" rel=3D"noreferrer"=
 target=3D"_blank">source.codeaurora.org</a> or private repository? Or whic=
h<br>
WiFi vendors are still well maintaining the WiFi chips for kernel 5,<br>
the only sensible solution is to switch WiFi SDIO chips? Appreciate<br>
your advice and comments.<br>
<br>
<a href=3D"https://wireless.wiki.kernel.org/en/users/drivers" rel=3D"norefe=
rrer" target=3D"_blank">https://wireless.wiki.kernel.org/en/users/drivers</=
a><br>
<br>
Thank you very much.<br>
<br>
Kind regards,<br>
<br>
jupiter<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163735): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163735" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/163735</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90102949/5117=
409" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90102949/5117409</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:fede@evolware.org" target=
=3D"_blank">fede@evolware.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000bb96b205db558851--

