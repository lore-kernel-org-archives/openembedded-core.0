Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EB5C43334
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 15:29:25 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.56340.1656430163064009049
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 08:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aQT5VtGV;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 i8-20020a17090aee8800b001ecc929d14dso12549858pjz.0;
        Tue, 28 Jun 2022 08:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=JfMe9wtFIcpOaRbm2IdQFPOEVkrZOfOUIkrQeYTS28Q=;
        b=aQT5VtGVLeCpQfakTxdGfwHW84lp9vw1LK9ZWIyEqAVmEdgfjSqY+DHONA1mqG0qIc
         9jiZSMXW7vfw/bjgI8n+Y2HGVoT1dc0GE5VjN+0biJeuK5PPstW25RZ76giWCdN2lmMc
         Ff3APAN2R1XKk4ky9qzqLNEC4H8ETCa9FytfDad3hMxVlAr2OU7n0I6w51VJeSnSS+3C
         0+qRupWLCPBLuwRH6nKgqFGqI0f0YwsLlATO+Rhq32RvPeYgwhSzTV2OgMHEAmT7xRqi
         8BEu9352QJWBhLITZpDdmcfeV1FTLAHLeX86YNtHv8RvI59K73BhW8IMx6IS2c1AOsTX
         +7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=JfMe9wtFIcpOaRbm2IdQFPOEVkrZOfOUIkrQeYTS28Q=;
        b=6nKT2nL8qfG9L1WemFcrqHWeKQBxs4ITYdR4VENUbA530r5MafYwqjqKt1K1AG9GWC
         JOKrb9XnDu7wLy4ezak31OlWUBD16h7UVIo5NLigJB6+/b/hERiMALD5LKVBIhl0aiqC
         VLlj8ntNhwZ1EbejyeXgu1iAnOjXrNbj+HzUOVHM7CfUKwQzonMpgTxmUbRTdPlD0xoJ
         zTeyNLaHWuOEJiQQGiFlIZMsrSUVPQsl8lHMPJXX/mTzfkX3jQ/t8c3sMof8LtN4P7fd
         PfndZWoT5NhRvZ1sKIaoESWjAdaLH9PZdCHqBp4XLNzIPqxv13jU87nZEiXDc+M/LiLH
         MJ2A==
X-Gm-Message-State: AJIora/e3K53/wQFOU7nXLHPqcuqdC5AxyVHuzcg0axeNO0NNdGGMlNk
	Iu5K1jhEj55dnnRq1NmeDrP4BAfJ1MYwZSVHFN8/tJDvIDnP7g==
X-Google-Smtp-Source: 
 AGRyM1sdHXije+UMS8HpTaag0L9FgUnEILxrh6xf3COEDUTIRLIQ/Bpma5Fkqu1LeqqaPBR7ONS+OAed7pguZ//Ykm4=
X-Received: by 2002:a17:90b:19d3:b0:1ed:5596:1ee5 with SMTP id
 nm19-20020a17090b19d300b001ed55961ee5mr166581pjb.83.1656430161981; Tue, 28
 Jun 2022 08:29:21 -0700 (PDT)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 28 Jun 2022 08:29:10 -0700
Message-ID: 
 <CANx9H-ATwbp6A4hKjfrMTi92EVhibkW3FSSSR_9Oqh1Qe0oHcg@mail.gmail.com>
Subject: OpenEmbedded Happy Hour June 29 9pm/2100 UTC
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
 <Openembedded-devel@lists.openembedded.org>,
	"Yocto (yocto@lists.yoctoproject.org)" <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000006675ec05e283b3fc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 15:29:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167349

--0000000000006675ec05e283b3fc
Content-Type: text/plain; charset="UTF-8"

All,

You are cordially invited to the next OpenEmbedded Happy Hour on June 29
for Europe/Americas time zones @ 2100/9pm UTC (5pm ET / 2pm PT).

https://www.openembedded.org/wiki/Calendar
https://www.openembedded.org/wiki/Happy_Hours
https://www.timeanddate.com/worldclock/fixedtime.html?msg=OpenEmbedded+Happy+Hour+June+29&iso=20220629T21&p1=1440

Regards,
Tim "moto-timo" Orling

--0000000000006675ec05e283b3fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">All,<div><br></div><div>You are cordially invited to the n=
ext OpenEmbedded Happy Hour on June 29</div><div>for Europe/Americas time z=
ones=C2=A0@ 2100/9pm UTC (5pm ET / 2pm PT).</div><div><br></div><div><a hre=
f=3D"https://www.openembedded.org/wiki/Calendar" rel=3D"noreferrer" target=
=3D"_blank">https://www.openembedded.org/wiki/Calendar</a><br></div><div><a=
 href=3D"https://www.openembedded.org/wiki/Happy_Hours" rel=3D"noreferrer" =
target=3D"_blank">https://www.openembedded.org/wiki/Happy_Hours</a><br></di=
v><div><a href=3D"https://www.timeanddate.com/worldclock/fixedtime.html?msg=
=3DOpenEmbedded+Happy+Hour+June+29&amp;iso=3D20220629T21&amp;p1=3D1440">htt=
ps://www.timeanddate.com/worldclock/fixedtime.html?msg=3DOpenEmbedded+Happy=
+Hour+June+29&amp;iso=3D20220629T21&amp;p1=3D1440</a><br></div><div><br></d=
iv><div>Regards,</div><div>Tim &quot;moto-timo&quot; Orling</div></div>

--0000000000006675ec05e283b3fc--

