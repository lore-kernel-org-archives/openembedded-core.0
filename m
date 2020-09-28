Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.39661.1601307887701706208
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 08:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=duWY2BmX;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.195, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f195.google.com with SMTP id g3so1078171qtq.10
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 08:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1Sjf9FUl9CwPBj2B95KQ9xbRcGY6nUyY5KMtMLoVeCw=;
        b=duWY2BmXUutgs/B3Tfo4HR9JlooRF3s4lQCJI3OxhfjSNcB3lH/cnn9vxK3mh4omR4
         uPz/4IOJ1Y2CXlqAqCdzOHXJuGGy5j12FtEzwTUxONoHOxJANnLMKb7w1id+PvCMsfe5
         EcZh206zT0/o0kk0klMIa+n7VwdiH6h9zRhKRVKHFxnj6rLmZCMEkRrgLfTmfBB3tQ5Q
         s33W9JcBgvAvT3RcKt3JLOQNuQsOf1l2o4SBLJKOEa38h/Zl7DSaSAtaI40xE1cdBb/i
         T6NRRZKbij15JZMN6X7MlGUXYMhjmwoEixxl0EfFgXgn6+A9Cc1Qf+42ILJkmbjQ9KAI
         g9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1Sjf9FUl9CwPBj2B95KQ9xbRcGY6nUyY5KMtMLoVeCw=;
        b=rx0hSBH2UxtKalLxct6PQjMPqYH6nGP0khJ3/PB7F1HCzSW16FdNBSZfAnnfawylE5
         WzJHsOIvsUZeYNAJt9NraUhSM6psEI/yUKZn2kbL89VOWr1Z1hSI3eDHVLa5TLe8AyEI
         5tmmKx0Q60QoS5P2Dc2MgwHTAIeA10wBnSbi7k/uYXADzTr16t5QXHE8R3ZrkMqfDndh
         9QeKXiknUUlc7BYiK1o93TFjW4q8ThO3Z5ZkYtsbCbQOUDwfHyIonKHRlkn/SUcAVf9e
         Vr9wGo/cwyErFVXy42ayvh/ODlY7MiBrWrXw0qSO17bS5DPiBfyBAEWGeD4BZ+sRtOsw
         SGUg==
X-Gm-Message-State: AOAM530VnNjkT37q26YOW1LtrAFN35Bdkq/ie9MW9kGaOvCywtpC0ZSr
	Qz/ydJxcDsSNL5zZQ8Bmrc9znngk+AtxDsqQ
X-Google-Smtp-Source: ABdhPJxPZsa29nB6Oj5AG75GaZVMZUE72redGksbwvKWxN3PsMSJ7iptHJ93u796OtueU1tel7gctw==
X-Received: by 2002:ac8:3845:: with SMTP id r5mr2209033qtb.223.1601307886368;
        Mon, 28 Sep 2020 08:44:46 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id w18sm1551105qtt.19.2020.09.28.08.44.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2020 08:44:45 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f182.google.com with SMTP id q63so1368406qkf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 08:44:45 -0700 (PDT)
X-Received: by 2002:a37:5008:: with SMTP id e8mr25698qkb.247.1601307884886;
 Mon, 28 Sep 2020 08:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200923150515.2548741-1-richard.purdie@linuxfoundation.org>
 <20200923150515.2548741-2-richard.purdie@linuxfoundation.org> <dbbdf39c-6565-b461-a973-b58a21513826@kernel.crashing.org>
In-Reply-To: <dbbdf39c-6565-b461-a973-b58a21513826@kernel.crashing.org>
Date: Mon, 28 Sep 2020 12:44:32 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpjGergprX1Z0wKicVkAPR4=6TRRgCVOSJxZgK4Q8k+yg@mail.gmail.com>
Message-ID: <CAP9ODKpjGergprX1Z0wKicVkAPR4=6TRRgCVOSJxZgK4Q8k+yg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] ssh-regen-hostkeys: Add a recipe with pregenerated ssh host keys
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 28 de set. de 2020 =C3=A0s 12:39, Mark Hatle
<mark.hatle@kernel.crashing.org> escreveu:
>
> I'm worried about this from a product security perspective.
>
> I think this is very valid case for an autobuilder/autotest infrastructur=
e,
> however if this ends up in a release product it will lead to huge problem=
s.
>
> Is there a way we can ensure this can only be used for the autobuilder/au=
totest
> infrastructure, and never provided by accident in an image.  (If a user d=
ecided
> they must do something like this, we can't stop them -- but we should all=
ow it
> to happene either by accident or make it look like it's good practice.)

Maybe a YP_AB_SPECIFIC variable variable which if not set a python
function could skip the recipe?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
