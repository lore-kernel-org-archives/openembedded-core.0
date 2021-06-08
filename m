Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.13281.1623163290917127990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 07:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=EVxn5k+7;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.174, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f174.google.com with SMTP id k4so20438214qkd.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 07:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xIMDLNR5wxN7i+XkJwUefHh4shdZym+TvdBOysNnm88=;
        b=EVxn5k+7/uz8JgHuKgupThYu1Oz6x0VKmge+jSfTyrrLQNBTaHY/0z0LiMxa4u9a7X
         lJVnNbqKtoiUF3UwU7Wd/3VZJzI5w8H6dFOoizBpg7s7Rb0lezAM8idUenTw4NoKeVKc
         m1x+TdgfKjN+diGTDQddyOQrtIVeH8zXlCRkD04/N+B2JRHhYUVDBsTzJTJCpsDay3FN
         SNUGxjBn/1MN51k4q11LRCGfg9hNt+LhwQB5Weou2Yjd5v5wuNvLpEuCDOANC+Vp7I6V
         Du2uFrA6Iq+7z3IZPUvorU3AH1oiH6nNA7uu7uAwyCCDPNMScabnh4z+qsalB2i5jVLI
         TS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xIMDLNR5wxN7i+XkJwUefHh4shdZym+TvdBOysNnm88=;
        b=ugChSLRwz1D0j4Q2M3HmupE/UPoT39vnh+UsNgqdbYvDS9mg4hj2UzwzIw1/UKH3L3
         JnKwn8xBPGMjFkVfHhaVZqurEDagBQVfKaBGz2U75WzkVkut2pM4J9fbhL9KWDJbgmeb
         hSCCiF9gI3hRBy/joK0TkJRIM4v+/bsaf6uzRuEPsdlPN3DWIGtVU0ESin08bzSJyGql
         DxZqpHrjE2hkkFfHgSS3yR+J4/bSkWTcX4+cOY+ORTv1L5xhsK8zPbuClLlMLrPm1zIH
         +O0PhJoLkeahQfwOfnEvKW+oJGV9ckRAdT1Yu+DEFVJyNYfdxczSjiFoa7hb0DJP46Ad
         o/5w==
X-Gm-Message-State: AOAM531cfaH/rPsFFE+yIgTUDaxYU0d8jLbQi2CqiXBGgVgV3VsctdO0
	zLldKUGl3NraxwZgX5/kynB/ClodoSVyQnxQ
X-Google-Smtp-Source: ABdhPJxVqiapK3a4aZ6BoX56XNRJQPDuW5ydksjB6z6Xzb/tKyrD1l9Xp2T11YqVaJ7NEJrX5GCjOQ==
X-Received: by 2002:a37:9c88:: with SMTP id f130mr21725425qke.368.1623163289625;
        Tue, 08 Jun 2021 07:41:29 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id 64sm10758624qtc.95.2021.06.08.07.41.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 07:41:29 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f174.google.com with SMTP id 93so8074297qtc.10
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 07:41:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1304:: with SMTP id v4mr21780252qtk.33.1623163289124;
 Tue, 08 Jun 2021 07:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623162901.git.steve@sakoman.com>
In-Reply-To: <cover.1623162901.git.steve@sakoman.com>
Date: Tue, 8 Jun 2021 11:41:17 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr9vg4+OvgoH43Y2t0Cok2wzyOMecqH983btTfPW1dMNA@mail.gmail.com>
Message-ID: <CAP9ODKr9vg4+OvgoH43Y2t0Cok2wzyOMecqH983btTfPW1dMNA@mail.gmail.com>
Subject: Re: [OE-core][dunfell 0/1] Pull request (cover letter only)
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Steve,

Em ter., 8 de jun. de 2021 =C3=A0s 11:37, Steve Sakoman <steve@sakoman.com>=
 escreveu:
>
> This reverts commit e990a9ec5d6eaf2c328d61c4de73ea6c270cfa15.
>
> Patch not in master, erroneously applied
>
> The following changes since commit b48cfe9148e8f9bbc942899455215e8f9c8e27=
28:
>
>   linux-firmware: upgrade 20210315 -> 20210511 (2021-05-31 05:30:56 -1000=
)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nex=
t
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
dunfell-next
>
> Steve Sakoman (1):
>   Revert "busybox: make busybox's syslog.cfg depend on
>     VIRTUAL-RUNTIME_base-utils-syslog"

Thanks for looking into this.



--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
