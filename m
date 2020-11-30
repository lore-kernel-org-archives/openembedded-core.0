Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.194.1606757384789039136
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 09:29:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PV+PGnLC;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.53, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f53.google.com with SMTP id y22so9010051edv.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 09:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=hi0fiCsn2VjSsam1CiI4tA7EwqRR3XrfjgSkOPGZghw=;
        b=PV+PGnLCIfgpobxZcRR1Jh2j/9drNJOKbSVwGyWILv7s38ggFQ1IOAYbcaPTdr10IB
         1IO1cXxYO8tbtoDfPMRZFQeNUloFx4uTvsidFuQNJhYVdHyTdUtelAc+9ITdZL7KlAaD
         RF61d5pQ/m7Vs6vnsxtLq9+kwPNAcu2N+KRxThn+/BLzDKPL06C6nH4mK7h7/4Dj5jS1
         qbxRG2pYBkW4kgXLFka9PXLo0pJKXKlGO28Z+PZMFHeCXcfJNTRtkcqZb/LcjIUsUfdo
         gmt7wDL4dE7aXdEbuZ2LzaWTLueNadm7Un4jDS6NtvFt4JP2fFyF3MPhcSsO/JOG4nql
         5B4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=hi0fiCsn2VjSsam1CiI4tA7EwqRR3XrfjgSkOPGZghw=;
        b=F6DF7QWrsPNbWHtHbwBFM9dfHCK/XeNhKESAsyn20PNHhguDzk0bGo5s+L0vnEZwSr
         +N+2+kogWc8fASg+t6coN9IpMs+160+tk/KIOFoKf9z4vkR8mD42mGLrN+ZyxRAJDxHw
         LG4sfFFAxUlXirwYPVm3vABt3aj9mjNGbLqOpvooPC6YD9TUNfKp4jbeOAVoEBtiHzOZ
         49fOUj30TgaAZrUcm62EARSowCf3p1zhHs9jaSLGE6EfVuq3SkTsvbyq/LEeyy1InqXZ
         4FopOHbSBD5oJAXdeb3D/w08+/vQfcCCKE0s3ry9wvJHx1Lwq9qc7CMoAADqIY+Maoll
         h/VA==
X-Gm-Message-State: AOAM530NU4QWY8viWa7sPiGZNKd/zrMJuGaJXxXbDZ7nVZc++z/wNjpe
	9UhrejecIbCZThLzvoIPW6ErbjCECqfa+sFBpf8CWzBN8Y+ub/mU
X-Google-Smtp-Source: ABdhPJy601pMt03RFiHQhK7dtNv/ZcPHuFKNw4KlWu01ZHn2fdEqPaBFLG7Q9Qb3bXFfzvHbafauMYFBZU4Ih8C1bxQ=
X-Received: by 2002:a05:6402:2da:: with SMTP id b26mr22280317edx.176.1606757382827;
 Mon, 30 Nov 2020 09:29:42 -0800 (PST)
MIME-Version: 1.0
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 30 Nov 2020 07:29:32 -1000
Message-ID: <CAOSpxdbVWXUD2i+Ewpq72i2hr=L8-_Tp+Oaf7NnX5HAwPc4eJw@mail.gmail.com>
Subject: CVE raffle: collision avoidance
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Reply to this thread noting which CVE you plan to work on.  Please
don't claim one
unless you really intend to follow through!

Note: there are already outstanding CVE database update requests for
most of the older qemu issues.  Fixes for recent CVE's are fair game
though!
