Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E79C433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 09:48:32 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web10.13808.1636710511265387513
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 01:48:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MdfUoDBZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id p2so17578959uad.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 01:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=a3N5XmtTm5QqbMiRbvKsfjMrdL7SHW2Yyspg31EvkD0=;
        b=MdfUoDBZ4C1Fk66f/l4IKWaml1z/vL5N1SzAAq7lMqbsESFh5M3a02B7e4MGFHndCx
         QSvnm0VT6x8EkHqoYG+/hWXo0ytwIw4pVQsur7G1wFbzbauyWozCpxDn1wlK2nTXwimc
         +nSFfEdeWykQ/CZfhQq+LcpFjN9ark8RxqlFRBc4U/ogn6sSFHzOR8Wi7+y//HOWoT+p
         j62MKKObHJVXBy0rLMww1FmH7nxr6iCUeaXusCn4efNMq29Jaw7cL7GPynbPj/O2/6Xy
         jwYQ93dbJtjUq+IlSCRN/bmmxxt8B6X78iCesUZAHeNdeskP1MCiiEIxwLUGSpckjkSV
         Yu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=a3N5XmtTm5QqbMiRbvKsfjMrdL7SHW2Yyspg31EvkD0=;
        b=bSiuNsRhCYL8dvsyD24cpXFPV+Q88WPqtsfohG4V9WM1B8QW91iumBFyhEQTlVoEbH
         wVgj5qiECaC5CQZNmGQ0V5iccO+DOhMAZS70LO/Ha7Kp92XRWMBvo59jH88/VX0zyL9k
         agn6Cw5bFblSZumTTuR82qQHirhxgmPam6xMlmduvCkc7iaEGAscziQDECkceeGHog3C
         YVfac8i/hIn26Sd1YqgNsUMCOcyzDdew1OlQva7AfG18wi+2LvBOXSJmwIGfHcusHkvI
         0Vv0ii2m0G/AqkVjmmufh+1K6c6/0z6uvse8KhmC7FZE9/ahzXq143OjHGjlzAUJenCa
         LCcw==
X-Gm-Message-State: AOAM530kmypKZC6CWstt6+TNxPqFGbQl0sEXaiGxMa+zt4bksUSHiCEf
	bHDwjUaVpOz/WUM5lYU/psQZBgGgi4x/neC0VOrrkzkTh3o=
X-Google-Smtp-Source: 
 ABdhPJycPWL/ZDkEKvdC6qx2vOOZJg+RSVjkpT3lG0ulxtZ/TVcJZDoxgP4IbG1bH4Vi9w3cuXPWKkpeFaM6N4rUn2U=
X-Received: by 2002:a67:ae47:: with SMTP id u7mr8565335vsh.7.1636710507341;
 Fri, 12 Nov 2021 01:48:27 -0800 (PST)
MIME-Version: 1.0
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Nov 2021 10:48:16 +0100
Message-ID: 
 <CANNYZj8h4kDhv-ZqkKqMY_aXAezOVYmmrV28jn-jQjdK-d3N2Q@mail.gmail.com>
Subject: pls comment on weston non-PAM patch (link inside)
To: OE-core <openembedded-core@lists.openembedded.org>, tom.hochstein@nxp.com,
	Denys Dmytriyenko <denys@ti.com>, Denys Dmytriyenko <denis@denix.org>
Cc: ppaalanen@gmail.com
Content-Type: multipart/alternative; boundary="00000000000063ea9705d0945c09"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 09:48:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158213

--00000000000063ea9705d0945c09
Content-Type: text/plain; charset="UTF-8"

Hello folks,

I sent the weston non-PAM patch upstream and they have raised questions
about its validity, can you please comment on it?
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/725

Thanks,
Alex

--00000000000063ea9705d0945c09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello folks,</div><div><br></div><div>I sent the west=
on non-PAM patch upstream and they have raised questions about its validity=
, can you please comment on it?</div><div><a href=3D"https://gitlab.freedes=
ktop.org/wayland/weston/-/merge_requests/725">https://gitlab.freedesktop.or=
g/wayland/weston/-/merge_requests/725</a></div><div><br></div><div>Thanks,<=
/div><div>Alex<br></div><div><br></div><div><br></div><div><br></div></div>

--00000000000063ea9705d0945c09--

