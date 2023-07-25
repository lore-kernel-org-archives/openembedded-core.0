Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1D5C001DF
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 08:25:02 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.15790.1690273499604470083
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 01:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=aLcLugiw;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31759e6a4a1so1761791f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 01:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690273498; x=1690878298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qNEc7Yjz1IHacYyyz/f0ZsR/CbykGe1/rg1EUIENpCw=;
        b=aLcLugiwNcovZ3VuJA41H5uY6Eymme5Yt04nnSx4TtGjSp8yVfvEaxA6L8sQtlcsaJ
         9BQsxBytgX0BYMefOxr+VtAg11W1HMZQZ0jPh+RxK6X0AzCuxgSFszQHCvNVeYo7Gw67
         732d0g5AQ6A4FcHLKcDC1G2MWfgR2maNXxZ0DwIzTcRHMkjUtbKvkxgOAq22onwUWXEu
         MKmiGR7OBvLb9Qj11gOXasm30yZ6Zzv9zczvtC+wSSs223fTFaRYbO2fhF3xcTtZ2Mqj
         ZTkkMqAuI+6ONznKmx/NJF8lv+ffo7JPSAfpeIW/PvPVtnmE5kySj25O8GU5ci+MDaxw
         Z2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690273498; x=1690878298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNEc7Yjz1IHacYyyz/f0ZsR/CbykGe1/rg1EUIENpCw=;
        b=APjnWSLhFzVMEjYO8x1FEobJEPqeY38znl/UrPFAydEtYr8uEuYTp0I7McC2M1qNQc
         PHox4txbV+L5GavzbjJBchrVOadnEsgUik0QNmG2qCx1PaHQ61GuAdT3QblF3EoshbJQ
         DoATcU+h5D3qzzsO031lYctuAsH/6547yQwPidn2mLtdg+Lhok/d4i2bWBQGjtn+J8uE
         bh9FpYY2oihADTQHL3xI3lgkjSuJymqRIImdo2jg0NYCgpTQtdZ2gd9s53YD++NEiD7c
         qhI7Nh0Rs1iICG4fCarYxXMNwcIn9pPGcsB4YY3PKE072YB+bKCTaRTMbpQavNoU8ybq
         Hwtw==
X-Gm-Message-State: ABy/qLYPvCHohwyrbMIu605PunF2dxAbJY2XG+oiiB09GWkiaL/BU+Cv
	MVjjf995MycVvTdZKwuJA2gZX6f+OXe4lZM5U3o=
X-Google-Smtp-Source: APBJJlFKUnjv7eyZtoAV2XbcVNW6R918VYeMimU1AuaF9WSUVxeD1Do+/mxaN2S4/TlUcYFgWA/77qYk8CHuS5+ebHU=
X-Received: by 2002:adf:f488:0:b0:314:311d:1b9 with SMTP id
 l8-20020adff488000000b00314311d01b9mr8955233wro.47.1690273497850; Tue, 25 Jul
 2023 01:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230725065258.2203988-1-raj.khem@gmail.com>
In-Reply-To: <20230725065258.2203988-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 25 Jul 2023 10:24:41 +0200
Message-ID: <CA+chaQfK48AnB5cOnCr6qfGkADoHMcf-gqAjNpOiMnk0gEB8-w@mail.gmail.com>
Subject: Re: [OE-core] [RFT][PATCH] binutils: Upgrade to 2.41 release
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000069a6e506014b7776"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 08:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184824

--00000000000069a6e506014b7776
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 8:53=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> Detailed changes [1]
>
> [1] https://sourceware.org/pipermail/binutils/2023-August/122246.html


 Release announcement from future? Now we know your secret! :).

--00000000000069a6e506014b7776
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jul 25, 2023 at 8:53=E2=80=AFAM K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt=
; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Detailed changes [1]<br>
<br>
[1] <a href=3D"https://sourceware.org/pipermail/binutils/2023-August/122246=
.html" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/pipermai=
l/binutils/2023-August/122246.html</a></blockquote><div><br></div><div>=C2=
=A0Release announcement from future? Now we know your secret! :).</div></di=
v></div>

--00000000000069a6e506014b7776--

