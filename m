Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.152.1611865664525063398
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 12:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=vQ9YLY33;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.46, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f46.google.com with SMTP id l14so3464211qvp.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 12:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ep57zHELazeTcgymxjR66tmx/J4/uvw3ub0Apfi0gOs=;
        b=vQ9YLY338GZpU5rkLy3uEUbn5tsmqvUiDvU2HidsPBAPjeo1NZ+r6XpGLa6CZU69V6
         dOQ2ATOgX0+v4itb0UrUWwA97VxNeXKT8nyqri55OasjOTX+M6ALwYQE7p2GUZ4hj6HY
         kHYMI6bhYjIxB+aPA/1i35x9I3hMA6J4D60y1raGSntuRPR+ipNG238Acmx2TTIkbVIE
         TBmEVzgP5vYzhsMlSBmQOum7u8BF3dVM5cwfTBKTl3mvhIno65No7IHgSFH1Itd2ZkYo
         QkdmtPSTaVS0xwAbX+kXiWsTM2KDwCv7mlMTGRcgBlGtv2CRl77HBJMymZWuZ00EV1/q
         gMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ep57zHELazeTcgymxjR66tmx/J4/uvw3ub0Apfi0gOs=;
        b=HBkA9FXz4xce5NY+Hgvg0LmA4Wz2nxXS+JtGgSdbIQpmTKLM6nA26sfKMJCid4/+eS
         UXyd9yytscfCHyIZrOwfrz+nZHaEsZpiOzFCTsFbx0LvAa5FdvC6TwPwK2nrmQizb4AZ
         b+4i8mbDXWdeIp0BmuGC6bP6goIrrQbYkoyPZQbLAaDYiJtRaYrqXC7eRpHa6spZeBvX
         xU3rl3RhpQ0Cj1R0fYRCQa9dAhjCuckqzBmJvtjjpTEh8QYWjiAgvCn0Ibb56CMoDyCx
         hQPu+DyOWlH8ePddUptsq1Lc0tRYyjClInCmvzdzrfK5jePfzAPvoWSzyBuTxJfOp7E4
         sLHQ==
X-Gm-Message-State: AOAM531fGpzD/tPI8F61Xwk8VW/6iLHJm541rIX9c9NIDwRXDKD2BnWb
	Y3457WykrBN73EY/Oynxb9uXEc3VXhUZ+8X+
X-Google-Smtp-Source: ABdhPJxfTpaqMBPW9xIZOmDX+GKJ6HLkKxmahrOnZgwdb+gaJxFeXvq9lOLJyjiXIxjK/EUn9Jawsw==
X-Received: by 2002:ad4:5a02:: with SMTP id ei2mr1123372qvb.40.1611865663416;
        Thu, 28 Jan 2021 12:27:43 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id n94sm4107626qtd.28.2021.01.28.12.27.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 12:27:43 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f179.google.com with SMTP id c1so5126766qtc.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 12:27:42 -0800 (PST)
X-Received: by 2002:ac8:4a98:: with SMTP id l24mr374571qtq.33.1611865662720;
 Thu, 28 Jan 2021 12:27:42 -0800 (PST)
MIME-Version: 1.0
References: <20210127213311.6030-1-tomasz.dziendzielski@gmail.com> <20210127213311.6030-2-tomasz.dziendzielski@gmail.com>
In-Reply-To: <20210127213311.6030-2-tomasz.dziendzielski@gmail.com>
Date: Thu, 28 Jan 2021 17:27:31 -0300
X-Gmail-Original-Message-ID: <CAP9ODKow4MBA-WoGMJyxiU-75GXY3-BQyWRqT+dYsJ=+AT7ECQ@mail.gmail.com>
Message-ID: <CAP9ODKow4MBA-WoGMJyxiU-75GXY3-BQyWRqT+dYsJ=+AT7ECQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] insane: native-last: Print classes inherited after native/nativesdk
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 27 de jan. de 2021 =C3=A0s 18:30, Tomasz Dziendzielski
<tomasz.dziendzielski@gmail.com> escreveu:
>
> See [YOCTO #5729] for details.
>
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

I'd prefer a little of context on the commit log.


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
