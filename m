Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982AEC4332F
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 17:51:48 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.12674.1653414707572262010
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 10:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FgNbZaGw;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id j21so16716897pga.13;
        Tue, 24 May 2022 10:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=m6KYjriY7meCQEj0m299HUbA70VJ7ih+2T5HRVpAm6k=;
        b=FgNbZaGwNHe66FsOLYBKX4P6sLlQiGRrSTy9Nm7gRx13mqITD01eLF0OPgtwYVfPvv
         sLKMZfa7Cl+c3pHAvXgiQOzUdEXBNftNMFz1wBHIGeeCLa1pKeL3/Htm0GGf07U3G4/F
         KPfsKGQ+XZ06fuZJPB2YI0tNRnQIbqbhWku2/mNM/+9jQWkXr9YOD4l1B71d8N332BHz
         s+g3+GqHqWbxojSFyiOvQbKKncNigwi0HiIxi+6RJaGVdn+Fde6Adx0bUStonoFs06UQ
         yZwabPWX7ycmXVxBhu4m4e9mrMK1PPS50yrQkaXosTMttVKAWzmUCYyLS7VoSJJBxkwg
         8X5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=m6KYjriY7meCQEj0m299HUbA70VJ7ih+2T5HRVpAm6k=;
        b=FdF7fHxPHYrkshxzvUbmvXp/ZxV7nNSWTL8Zkl4fRgm3Qp5jJ5D8ZdP6GOBzmls9Kx
         y/J7kQKLtur5DwWObfCkrleks2i4E9BM3otqjOB1CZBYFa+FxUrRQLxPv/dWissK66Yi
         CV+E2ptipnihUQgEP9qJXbdGaq9lN4UVkER0iFaq6l8NLbf0lowYdf4OP1uM+s7Yz0Ww
         3Dwh3NRSduFdKK53ykI3faezdX9G0royXYlE1tFoOR99dig6rIdZ7Rv/nyu9AXpe+6Z7
         jnZQq4LIAw1XS3gkqtssDEvT9V/zlSXMPv37xZhVG3Eec7joUFS2geVUXEiit649WU4n
         C8BA==
X-Gm-Message-State: AOAM533Fme5aAUJ04/QUjhq8ZFWuq6NCgTgofTUw2vFzJ+dWwT9L/aLd
	HNw7o4auWAbNWqAUNVFlez7cRXWaenq/CplE3/VJLzORMuQ=
X-Google-Smtp-Source: 
 ABdhPJyAxER18mHyxXwMd+YL/HGRH7UsbWzimHV3lnGHIZ3VPa8iq9TVXgD5usRPdniM3sv80YOXkfPDkABZWpCC2wU=
X-Received: by 2002:a63:343:0:b0:3f6:52e5:edbe with SMTP id
 64-20020a630343000000b003f652e5edbemr22486713pgd.272.1653414706580; Tue, 24
 May 2022 10:51:46 -0700 (PDT)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 24 May 2022 10:51:35 -0700
Message-ID: 
 <CANx9H-AbvivDSi_6oDWRuMpd5+NjwJAFUfrE6f1iLM2s+mzu8g@mail.gmail.com>
Subject: OpenEmbedded Happy Hour May 25 5pm/1700 UTC
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
 <Openembedded-devel@lists.openembedded.org>,
	openembedded-members@lists.openembedded.org,
	"Yocto (yocto@lists.yoctoproject.org)" <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000004091b105dfc59c6e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 17:51:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166086

--0000000000004091b105dfc59c6e
Content-Type: text/plain; charset="UTF-8"

All,

You are cordially invited to the next OpenEmbedded Happy Hour on May 25
for Europe/Americas time zones @ 1700/5pm UTC (1pm ET / 10am PT).

https://www.openembedded.org/wiki/Calendar
https://www.openembedded.org/wiki/Happy_Hours
https://www.timeanddate.com/worldclock/fixedtime.html?msg=OpenEmbedded+Happy+Hour+May+25&iso=20220525T17&p1=1440

Regards,
Tim "moto-timo" Orling

--0000000000004091b105dfc59c6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">All,<div><br></div><div>You are cordially invited to the n=
ext OpenEmbedded Happy Hour on May 25</div><div>for Europe/Americas time zo=
nes=C2=A0@ 1700/5pm UTC (1pm ET / 10am PT).</div><div><br></div><div><a hre=
f=3D"https://www.openembedded.org/wiki/Calendar" rel=3D"noreferrer" target=
=3D"_blank">https://www.openembedded.org/wiki/Calendar</a><br></div><div><a=
 href=3D"https://www.openembedded.org/wiki/Happy_Hours" rel=3D"noreferrer" =
target=3D"_blank">https://www.openembedded.org/wiki/Happy_Hours</a><br></di=
v><div><a href=3D"https://www.timeanddate.com/worldclock/fixedtime.html?msg=
=3DOpenEmbedded+Happy+Hour+May+25&amp;iso=3D20220525T17&amp;p1=3D1440">http=
s://www.timeanddate.com/worldclock/fixedtime.html?msg=3DOpenEmbedded+Happy+=
Hour+May+25&amp;iso=3D20220525T17&amp;p1=3D1440</a><br></div><div><br></div=
><div>Regards,</div><div>Tim &quot;moto-timo&quot; Orling</div><div><br></d=
iv></div>

--0000000000004091b105dfc59c6e--

