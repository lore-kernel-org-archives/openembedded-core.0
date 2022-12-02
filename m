Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507A7C4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 07:49:40 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.69650.1669967372869331976
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 23:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lhh0291s;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso3598898wmp.5
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 23:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kobayHABewxDsp/3mXGHwvRdE9/zzNz4jpEE0G2z5NE=;
        b=Lhh0291sX2OG+mG6VJTd8xx8Bi2ipFQR0j72nsAwSVYLBD//8rk8CFAhFHSzr00l49
         pJBFHTWvfljGIW7Veh3Ela99Tcvjrgkv05gFPTYbZyZCBl5K94Xa1pwb5xzbe4ivaPDt
         ZBz+OTYrPlAsy+YX9RI7jqDrw4uQ/4hasOZBmHd4ylfM8CDTgNCC5kfDOVVNySx8wXHW
         GJ9QXeFQuliktaR36FvPal0ZaHk0+18EFqKKbz/47alGn3aVJVnaovsoPTuR8CBJ+2Da
         pZECJ4xbXav2lmou1i1/vkOL2SnyCQm1Gg9//3rxxNir6AoLYuE8lkHSfmf2R50h1jyk
         Inkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kobayHABewxDsp/3mXGHwvRdE9/zzNz4jpEE0G2z5NE=;
        b=1lvY8mD0vQReoFfEtKNBk4WNfX2myeevFfhDVBTPpLO9UccQc9efFcDfXjiH/sb2NA
         EFM4pTTOFDe3WSlbEpbmCtMEySTjUZW2B8DxpsQldED2xvTuL+hx+IEaX1k+4PwHRLZE
         0dHDYlVndU27XTsNcytwD1D7WaXn2yPBj4vFMri58CI1rr6AndJaNg/4bnALWodCzasL
         KEqVLqapnNjOehERuLQnUZWJJ89KZ5U0Tv6mKegwgTfhGW1fnLgqlh+oEiixL8jS1yrN
         waZsauDWe5KKrgJRYvVkszR/L4Hiy0+qBvOa+U4w9BhBIMuNGsfwdleRihHx1xqHxzh1
         JjDg==
X-Gm-Message-State: ANoB5plVeJWokOiTXa3qSNOh7GKAiTaBnd/LHk4dEKu38bfMl6hnzGQg
	zahZ3HpmnDMCdsLgVTML4plzak+ywc2OAotUszk=
X-Google-Smtp-Source: AA0mqf6ZPIOEiGnWhAl5d5U1YrYxMUKFjc6dBdahobrufRkBNgHOEsPzuvldtWax54GEFEuYDEf+RgDrws09MzsyIng=
X-Received: by 2002:a05:600c:1d81:b0:3cf:6ab3:4a60 with SMTP id
 p1-20020a05600c1d8100b003cf6ab34a60mr39942950wms.32.1669967371236; Thu, 01
 Dec 2022 23:49:31 -0800 (PST)
MIME-Version: 1.0
References: <20221202061812.62788-1-hprajapati@mvista.com>
In-Reply-To: <20221202061812.62788-1-hprajapati@mvista.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 2 Dec 2022 08:49:18 +0100
Message-ID: <CA+chaQcJfM_eNN8RZAMMqs=QmpK3jormd1qLEAaDgwKMvxwT-w@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] libarchive: CVE-2022-36227 NULL
 pointer dereference in archive_write.c
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f2fbff05eed39389"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 07:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174226

--000000000000f2fbff05eed39389
Content-Type: text/plain; charset="UTF-8"

>
>
> +From afa85b75607649f3a89cb4d17cf3f003738d3576 Mon Sep 17 00:00:00 2001
> +From: Hitendra Prajapati <hprajapati@mvista.com>
> +Date: Fri, 2 Dec 2022 11:22:39 +0530
> +Subject: [PATCH] CVE-2022-36227
> +
> +Upstream-Status: Backport [
> https://github.com/libarchive/libarchive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5
> ]
> +CVE: CVE-2022-36227
>

Please don't change the Author of the patch when backporting something, the
original change says:

From bff38efe8c110469c5080d387bec62a6ca15b1a5 Mon Sep 17 00:00:00 2001
From: obiwac <obiwac@gmail.com>
Date: Fri, 22 Jul 2022 22:41:10 +0200
Subject: [PATCH] libarchive: Handle a `calloc` returning NULL (fixes #1754)

And you should keep it.

Also please check your e-mail, my previous 2 reply were returned with 550
(hopefully you might see them in the ML:
https://lists.openembedded.org/g/openembedded-core/message/174225
https://lists.openembedded.org/g/openembedded-core/message/174224
that might explain why you haven't noticed the answer from Steve).

 ** Address not found **

Your message wasn't delivered to hpprajapati@mvista.com because the address=
 couldn't be found, or is unable to receive mail.

Learn more here: https://support.google.com/mail/?p=3DNoSuchUser

The response was:

550 5.1.1 The email account that you tried to reach does not exist. Please =
try double-checking the recipient's email address for typos or unnecessary =
spaces. Learn more at https://support.google.com/mail/?p=3DNoSuchUser u6-20=
020adfc646000000b0024187597f81sor4016963wrg.5 - gsmtp

--000000000000f2fbff05eed39389
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><br>+From afa85b75607649f3a89cb4d17cf3f003738d3576 Mon S=
ep 17 00:00:00 2001<br>
+From: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.com" targ=
et=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
+Date: Fri, 2 Dec 2022 11:22:39 +0530<br>
+Subject: [PATCH] CVE-2022-36227<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/libarchive/libarc=
hive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/libarchive/libarchive/commit/bff38efe8c1=
10469c5080d387bec62a6ca15b1a5</a>]<br>
+CVE: CVE-2022-36227<br></blockquote><div><br></div><div>Please don&#39;t c=
hange the Author of the patch when backporting something, the original chan=
ge says:</div><div><br></div><div>From bff38efe8c110469c5080d387bec62a6ca15=
b1a5 Mon Sep 17 00:00:00 2001<br>From: obiwac &lt;<a href=3D"mailto:obiwac@=
gmail.com">obiwac@gmail.com</a>&gt;<br>Date: Fri, 22 Jul 2022 22:41:10 +020=
0<br>Subject: [PATCH] libarchive: Handle a `calloc` returning NULL (fixes #=
1754)<br></div><div><br></div><div>And you should keep it.</div><div><br></=
div><div>Also please check your e-mail, my previous 2 reply were returned w=
ith 550 (hopefully you might see them in the ML:</div><div><a href=3D"https=
://lists.openembedded.org/g/openembedded-core/message/174225">https://lists=
.openembedded.org/g/openembedded-core/message/174225</a><br></div><div><a h=
ref=3D"https://lists.openembedded.org/g/openembedded-core/message/174224">h=
ttps://lists.openembedded.org/g/openembedded-core/message/174224</a><br></d=
iv><div>that might explain why you haven&#39;t noticed the answer from Stev=
e).</div><div><br></div><div>=C2=A0** Address not found **</div><br>Your me=
ssage wasn&#39;t delivered to <a href=3D"mailto:hpprajapati@mvista.com">hpp=
rajapati@mvista.com</a> because the address=3D<br>=C2=A0couldn&#39;t be fou=
nd, or is unable to receive mail.<br><br>Learn more here: <a href=3D"https:=
//support.google.com/mail/?p=3D3DNoSuchUser">https://support.google.com/mai=
l/?p=3D3DNoSuchUser</a><br><br>The response was:<br><br>550 5.1.1 The email=
 account that you tried to reach does not exist. Please =3D<br>try double-c=
hecking the recipient&#39;s email address for typos or unnecessary =3D<br>s=
paces. Learn more at <a href=3D"https://support.google.com/mail/?p=3D3DNoSu=
chUser">https://support.google.com/mail/?p=3D3DNoSuchUser</a> u6-20=3D<br>0=
20adfc646000000b0024187597f81sor4016963wrg.5 - gsmtp</div></div>

--000000000000f2fbff05eed39389--

