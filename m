Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.1941.1620948271160517422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 16:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DON5JZu/;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id t21so15191366plo.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 16:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=oJleNKg10qlNS2RuarkLu+BDZ2Q/aXlPiwXmwkP9zSg=;
        b=DON5JZu/YJA7ZSKctuMMRFaupndhviGAH6HXeQU3DZ7cCr8KVwi6PhxhZeTUaJmWmj
         reXgiR2ajwuiWr249riIoccKH0MKHj09q/tC9IN2lLm+xB/ad5Q1LqEbnYCEE08kjs88
         UBNa2EGzvjKg5RS+hfDfZyfL0szHK84w1/8YM6Tf9e65d+/twzymE+QOfbBOEBX7YjXm
         p5ruvlZwFBc4juMcuNab/fyKQLtflDN7XBI6IsR0YQjbWSiePKT06FJf8HYK6/hgFOR8
         TGyjRQIwPYBVev//U+nVwO7IWK5ix/HgX/XGaMLcSTRuxfl+rFenpCMbO1uJFNmc98Sa
         o0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=oJleNKg10qlNS2RuarkLu+BDZ2Q/aXlPiwXmwkP9zSg=;
        b=ktZYkcsRSLj5oJANrEG2ReD9H2Vs4efYSpffye37E9aB9pksOckIQrLmflGHMIio23
         aloz8eyD9AQICo7jgrnhBS8Pz2xPrtIZSSgKb/PVIS7jzBaX4DI8e/Yr1qv5WigjrxPm
         nXHuxlSODUagy++CjUqlDwyluRs3qRTylViYbDOT2roFRc7M1x40Z7YQiVXCoS/qx0KB
         40sEz1T84Tc3EntxxEYx5kdg0mBMe5tJ/tOBAZyyjO7ERxFdyhd+xMC4aNEi18dqKUXx
         mdYtGhfFCpwoKvMXL5fT1cZclNiueSeFVhBfLryTv6/reHN3VKW6kAUfLMQaPsf1U0A3
         gNTA==
X-Gm-Message-State: AOAM530aMKBJ6C6FybxqByGkgWdOPB53XujQaq+aSDY8us7swZarTi/b
	G8aSr5hd7UzvMyU1qlhWH+kYt4jnleOlymwtGhWHq1uK
X-Google-Smtp-Source: ABdhPJwpbfb5GSHHCO1LHcTTGtx8OnVHRyY36l/ucZPgJegcNu6XhP5n2kBF7C3DFcaZorLSoD542ZcqMtUV0rNX320=
X-Received: by 2002:a17:90b:2390:: with SMTP id mr16mr48467618pjb.133.1620948270614;
 Thu, 13 May 2021 16:24:30 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Fri, 14 May 2021 01:24:19 +0200
Message-ID: <CALbNGRT+HjGmqeFhBbpv6=sDHa9KXJ90OHunv3wFDbZOcXO56g@mail.gmail.com>
Subject: Layer list's certificate expired
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, yocto@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On opening OE-layers browsers complain that certificate has expired
yesterday 13.th of May. Just wanted to let you know.

Cheers,

Andreas
