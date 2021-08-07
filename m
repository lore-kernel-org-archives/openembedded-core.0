Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.6130.1628342279923890862
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Aug 2021 06:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dresearch-fe-de.20150623.gappssmtp.com header.s=20150623 header.b=Gxfy4K98;
 spf=pass (domain: dresearch-fe.de, ip: 209.85.128.47, mailfrom: sledz@dresearch-fe.de)
Received: by mail-wm1-f47.google.com with SMTP id l11-20020a7bcf0b0000b0290253545c2997so8023887wmg.4
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Aug 2021 06:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=bdzTZ9agAGPUkOsuDl/h7jwG+LpUaM/+PjonJyGBAfI=;
        b=Gxfy4K98eSPfYSzd7DH+m+IkiV9zguhpxvRgY6voltBVvv6JjKLAXBe26YXwAdjh9N
         +c15FDtgEuOICL+lFs7fqo3H+35+Ot+Dii9mzcPVKl7gcvram5qtGxY05I7rqX6Osvdn
         M2nW6diLOc4RdWUY8EjDwiugQ0/xedDgi5mOWTihWDlxeydaBGZsuz/a+fSlIYytjr27
         LmaweYSUROYRmm5JKo8vxuQsr2wMhoDl/N/OmnSvi/vfzhWG9b6NFva0nHhr1bfSLA0x
         UOBp5eiQLBZcg8QEhfrj7rrqM5PY2y6982GFJjGDRyEtFtNikxrV+TCwKBC7tYAtDEXt
         aasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=bdzTZ9agAGPUkOsuDl/h7jwG+LpUaM/+PjonJyGBAfI=;
        b=JcXfby0ol8tgObEo0F/ha0rwsQTYF72/K/vYDoYfz4YyDibUj+LTq/fynhC+zCw4FG
         EQJPeMYL84EhDp+hGxjrGLOFNkDy2tx4O02oq/WAx3yztp9l/RP4YmlhT+xqmNhNjGG9
         MRsQN6TrVVKid4K6qVk5YOQTxfJODqTzjJWMec2QGMZO5JJ9RNEBRaFARPdSPxq4+2HT
         ZIVpskUuxXPBe1RPIlvEfYzvUy/OdUhbCU0azWVe1MczXASXwy7LfMDebQ2epVkqghfb
         O64gbwI5LKdfpJH9Q5SsV0ioZhUK3I6nHH4Z04lXpaONBASd45TmStFvch35Lhux6pVY
         skyA==
X-Gm-Message-State: AOAM532l99pN3LOunzgnSwVL8dIRXNoQX+PzkqIIwfGL5nmHnmSy0XSE
	G1jKgK4+qrQnOomWgRl8qBuFTQ==
X-Google-Smtp-Source: ABdhPJw3Q5q7WtRG/03XJdgmXlJF0A3HKpffDL0WkaGz8MYcjaqUCp/guSDZ8mhk+OprzhenUC2ElA==
X-Received: by 2002:a1c:2984:: with SMTP id p126mr7993149wmp.58.1628342277899;
        Sat, 07 Aug 2021 06:17:57 -0700 (PDT)
Return-Path: <sledz@dresearch-fe.de>
Received: from ?IPv6:::1? ([2a01:598:b182:df4b:833a:c61d:7ece:3544])
        by smtp.gmail.com with ESMTPSA id k9sm12499194wrc.6.2021.08.07.06.17.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Aug 2021 06:17:57 -0700 (PDT)
Date: Sat, 07 Aug 2021 15:17:53 +0200
From: "Steffen Sledz" <sledz@dresearch-fe.de>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
CC: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>,
 Sean Nyekjaer <sean@geanix.com>, Adrian Bunk <bunk@stusta.de>,
 Yi Zhao <yi.zhao@windriver.com>, Otavio Salvador <otavio@ossystems.com.br>,
 Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] GPSD time will jump back 1024 weeks at after week=2180 (23-October-2021)
User-Agent: K-9 Mail for Android
In-Reply-To: <CAP9ODKq+=O0QC_F7LxRWvbPtj-7i_JCJ__e6o4bE9+J_GrkPoA@mail.gmail.com>
References: <ec96b538-d04d-e7ea-a9b5-e2f998c6b569@dresearch-fe.de> <CAP9ODKq+=O0QC_F7LxRWvbPtj-7i_JCJ__e6o4bE9+J_GrkPoA@mail.gmail.com>
Message-ID: <3D6D2025-1EAA-4DC5-BA93-164922A6947E@dresearch-fe.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 7=2E August 2021 13:35:19 MESZ schrieb Otavio Salvador <otavio=2Esalvado=
r@ossystems=2Ecom=2Ebr>
>
>I am not; but from discussion with upstream it seems to need to be
>ported down to 3=2E20 gpsd=2E



Why not switch Tod 3=2E23?
