Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.4262.1588798705008073198
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 13:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=JsnuVNFK;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.195, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f195.google.com with SMTP id w29so2850147qtv.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2020 13:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=6tMyquHNiHfZOo4AkdQKkXeF1eUkihyjVB5ZQqW40Tg=;
        b=JsnuVNFKk0e0gQYCzUWDndO50epd3NHEMopjrPKRYREyLDuse/eZ7LX4z98u6+6Yzt
         MkTD/d3BhsXztbwVbiPdXIqk58OKRuk8/PsklN9S6bZvCcXeSwZJvpk+liDT5EoLkCbI
         XX9ckODK29nX7+gS/fOdHgKNIwcltVK7ILEu49EPVbFe0EYMKJ3AK5q7NywKbiniOOMA
         NC3sSYuf2DO0gCXGkxd44vW8OHFige3NBWSAmMboxj1H44mR/tV7yAHg2bgC8mNxNv5t
         4fKQlsaxV+yBOQolQobqfOsnfHeEY1ULJsb6gShFZi/2jz7j+dsCwVTmy1mlq+8u/zEF
         zZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=6tMyquHNiHfZOo4AkdQKkXeF1eUkihyjVB5ZQqW40Tg=;
        b=m4mHOP8ytD2C6dstM3WdtXicqR5tFJLJ3XvEkfjfXf4RAnGK6bOihIUwpkMaSh5zM4
         iHTAAlXsHeYhFRsVYV5nJzPCc+A/wtpRRhSPXPvoVx3cqjYZBtqaP+rQdhYwxARQAEgG
         g95Hm73CGPf2i539vQN6Yv7MBR6n58USjCXJZY7eIsP5C8u88lUsQ7zqmZZtyJwpE/w8
         bvZKXKcGbyXbuGRQMWlaCA9j+gcnkECiCxuNoTJbR1N39oJ87cbNj5Uu6E+tZN5MnlgM
         KGBq3p/Uz6gi4XVfi9Wda320NZ4iSxOLssrt1sPNDxsc9rwbg1HrdOdlC5TrNFIgvDW+
         0XVA==
X-Gm-Message-State: AGi0PuatVYQRP491xBYCzkXryOrsDS2Md631cWgD5hivIUbyHQd0ncXi
	4zTO7irmfK6GBpocPJ2oTL4GBuDFRrRWLA==
X-Google-Smtp-Source: APiQypLQ2IFs1ywwwSTC3q6Z9OIt6HPc9rjJQVgRu++e9sj6mpYfundgPBaY0A+72BEi/5K1AjgKTA==
X-Received: by 2002:ac8:2965:: with SMTP id z34mr8131349qtz.44.1588798703793;
        Wed, 06 May 2020 13:58:23 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id p22sm2554553qtb.91.2020.05.06.13.58.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 13:58:23 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f172.google.com with SMTP id n14so3701541qke.8
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2020 13:58:22 -0700 (PDT)
X-Received: by 2002:a05:620a:9c6:: with SMTP id y6mr7045019qky.82.1588798702445;
 Wed, 06 May 2020 13:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <VE1PR04MB6621CBC0F321F39DAFEBE548E2A40@VE1PR04MB6621.eurprd04.prod.outlook.com>
 <CAHtQpK43_Ytsw6JnOoPx6xTd9zhQZY6A1OzDhNFXFW57Ttmohg@mail.gmail.com>
In-Reply-To: <CAHtQpK43_Ytsw6JnOoPx6xTd9zhQZY6A1OzDhNFXFW57Ttmohg@mail.gmail.com>
Date: Wed, 6 May 2020 17:58:11 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpsh=K=-LzUS9O2zsDH3MQt=z6RWjGCJyEZC-AZ8ZNe7g@mail.gmail.com>
Message-ID: <CAP9ODKpsh=K=-LzUS9O2zsDH3MQt=z6RWjGCJyEZC-AZ8ZNe7g@mail.gmail.com>
Subject: Re: [OE-core] Cannot disable weston
To: Andrey Zhizhikin <andrey.z@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: Tom Hochstein <tom.hochstein@nxp.com>, 
	"Patches and discussions about the oe-core layer (openembedded-core@lists.openembedded.org)" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello all,

Adding Khem on Cc.

On Wed, May 6, 2020 at 5:42 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> On Wed, May 6, 2020 at 10:29 PM Tom Hochstein <tom.hochstein@nxp.com> wrote:
> >
> > We are no longer able to disable weston service with standard `systemctl disable weston@root.service`.
>
> I've faced similar issues a while back, and also found out that weston
> has been actually started twice: once from udev, and once from
> systemd. At that time, I removed the udev locally on the EVK and
> didn't look further into it.
>
> > On boot the service is started again. It seems likely this started with the introduction of a starting udev rule:
> >
> > https://github.com/openembedded/openembedded-core/commit/aa3bced2e1de2f4ba507aa014835b06edccc138a#diff-d92aa97566c1bd0dd1eb817bb4511cda
> >
> > Is this behaving correctly? Can the rule be made to honor the service disablement?
>
> Or the other way around: can the systemd service be disabled? Or in
> general: is it possible to leave only one of those mechanisms, and
> which one is the correct one?

Why the udev support was added and why this cannot be done in the service?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
