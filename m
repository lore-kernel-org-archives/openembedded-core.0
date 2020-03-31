Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web11.199.1585692897069266976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 15:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=LS4gPsTl;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.68, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f68.google.com with SMTP id z13so11804249qvw.3
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 15:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=3pLUI1vp0uxWjRXROUWSRgJpt3RxHpujPnym8HnWTtM=;
        b=LS4gPsTl5EVvr22+Wif2BXNxq37ETCf+CjTn1MFnI0vT4Vfk7BK/P7NVhv0Wwnc4NA
         itpNtioq5oYnqEEsE07FK3Y1p5mhmOnApCjDPaQgFGZnTUo7dc8ulVCRPMQgoA+JuoNg
         YeiEDg01ifLkNQmiAqtv23hmHspleKmz0Dg2kkLUsuWJ6/Y+RgMG/CdTROXVXZa2SN7g
         mFUxWNjFMIK1bjsm9GflKOZDLlfpJDTtWiZRuNKiZvN+lSfCD2Hy8HcVGImTqPNHydWB
         kNA3rhV53tw5vWuCoS0b1+21GrJR2aFhaM9Ba2x6b7pqBYwqZLEg56aUdyYNLW1KNsZn
         FY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=3pLUI1vp0uxWjRXROUWSRgJpt3RxHpujPnym8HnWTtM=;
        b=SgL38+NNUytwhS190880qDZq/fQCOr1Bo+pEmydozaEF8l8GOexGkA1OY/LRrZ4TYN
         mHY4D3KN+QpXRbA+3WPxv7WxF9rSoAJwxhBOztf7rKm3I3cUI/PUbFSrObGvLllEyXUB
         Mxm4tWYc1pDwpGQwlpLYuBPq7qNGeKI34N+N/3KnW3+StW0+RVW/2qtj/k9ZaW8Gbadl
         RAQmb/axGtxeSSsiBaEQhR8fKFpto+OdgUw1lLFSuEX2SzsBa5RMVt1JL90aNQ5LjbpT
         VrU3RpKt692s9UqXfJcyA/GlQGrsSRBKpMKnMQRcItStco+wqRQLwXH9Dfjmh9y8R3Q+
         knSg==
X-Gm-Message-State: ANhLgQ1j7EfD0NW5D97dlFcnv71uQaNiWG6IUX48GqVmxd3w1oYxupZw
	843KDF7XBlG1dj5NJiumgg+sGYQAh/bKGg==
X-Google-Smtp-Source: ADFU+vvgen2ttFUjYR1Xf2x1raQkXR6+LwxXUqxXG+AETEap0wS36cIOhh6mUYJlNhL+kjq5YLzN1Q==
X-Received: by 2002:a0c:e810:: with SMTP id y16mr18845657qvn.198.1585692895843;
        Tue, 31 Mar 2020 15:14:55 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id j6sm177415qti.25.2020.03.31.15.14.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 15:14:55 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f182.google.com with SMTP id i6so24957824qke.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 15:14:54 -0700 (PDT)
X-Received: by 2002:a05:620a:9:: with SMTP id j9mr6687636qki.82.1585692894585;
 Tue, 31 Mar 2020 15:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200327172520.62888-1-alex.kiernan@gmail.com>
 <20200327172520.62888-7-alex.kiernan@gmail.com> <CAP9ODKroMUKsP3b+tpM7kYvtVUO_Om-4TB=NTSi5cSTZJJ94qA@mail.gmail.com>
 <160163452C4DFA3B.16021@lists.openembedded.org> <CAO5Uq5TbsVpR9czdELSDZ3cKG+Ck6weGpXqqqgSoDefZ2+XAqA@mail.gmail.com>
In-Reply-To: <CAO5Uq5TbsVpR9czdELSDZ3cKG+Ck6weGpXqqqgSoDefZ2+XAqA@mail.gmail.com>
Date: Tue, 31 Mar 2020 19:14:42 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo=chBHoL-4U70-cF2GAdRRbnHuDDju+=EeEsxVyLP1wg@mail.gmail.com>
Message-ID: <CAP9ODKo=chBHoL-4U70-cF2GAdRRbnHuDDju+=EeEsxVyLP1wg@mail.gmail.com>
Subject: Re: [OE-Core][RFC PATCH v3 06/13] systemd: Add PACKAGECONFIG for sysvinit
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 31, 2020 at 4:45 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> On Tue, Mar 31, 2020 at 1:28 PM Alex Kiernan via
> Lists.Openembedded.Org <alex.kiernan=gmail.com@lists.openembedded.org>
> wrote:
>
> I'm looking at the wrong build... if you remove sysvinit, systemd
> drops legacy.conf. What are you seeing that expects /run/lock?

fw_printenv and fw_setenv

https://github.com/sbabic/libubootenv/blob/master/src/uboot_env.c#L56-L71

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
