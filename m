Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web09.1551.1604355577268923471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 14:19:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=k6TzUUvl;
 spf=pass (domain: foundries.io, ip: 209.85.210.67, mailfrom: ricardo@foundries.io)
Received: by mail-ot1-f67.google.com with SMTP id 79so6696776otc.7
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 14:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/6SaTbAjlh+S7wp7z0nqmLOF7oBZFzMxDIn61O5AMQs=;
        b=k6TzUUvlByn0Pu0CqTD4XvzHAKZMcKGDGcCctPX8OYDFPuqgQ90HvSyZb273mor/DS
         e6tVLuiU6A5fq61K0e19lhqoPgmPDykypetb6mcMKgkOLay0c4ewJt1Qsl5QsseG/oi1
         n5YIZyNj4SF1c5gFeVJDmD6fGe318zJuUA4sFMImZnN200N4tAJHjxLruuygVopVVsie
         JLza0PuxNab5EJKIex9BrW9lSTQTbu/wdql2Ll2lLO7JQjDZj7u1xeeG4CjfFKtc2xcP
         nWuNOb4GgbE6DN3aNttvOvwmE/vvO/ZHqSMqXf2qRigWIyzqszhs26I2gVTWCv6BExdq
         KhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/6SaTbAjlh+S7wp7z0nqmLOF7oBZFzMxDIn61O5AMQs=;
        b=Hn7BGQneZcnHs0KCbuwAOnpIDV+DSx+EuywmF6IKkcLgoDc9n59/FTwuctbEbpbdvz
         7/dr7T0Ih01qHXnnR0E05FSjSq2Cv48oed4ihyod/qbHQX0rbjC6jxc/YH9YnJGOs/6N
         GjVy9lW8f+HMHBcc2Xga4hlBVuMcGyOaf5dWS20+6nWyAOJZs2+G4ODsdILLbQUTFPeK
         /DnctY/rEyVOP+MfM3DO9hIgFeadLy1uCC59cz/fgn2Qh7Al80Vt/hMQzNkFrMRYEa1k
         73EmT7kJeOqtHa9PMGkXMA53hElH+QQoOLfg5v+BBQucEqhJQTZ2MMG6ze8P4f3G93ig
         EfOQ==
X-Gm-Message-State: AOAM5320p++oQDLgcegUewvSpz6dRLWRNcP6uiNgRIPyccSOyyeXGt6O
	aTEFr47K/p3J0XVUAwArrCL5/ofnF7oIXJ10FaDd
X-Google-Smtp-Source: ABdhPJymFPXxo7+ol+0XmkF+io/JFnuN5EkTsDpL+r87nCkoc1Kc4dsDMK6a7Kse3OyRbkNoiWVic9b6mjeYMlEvOD4=
X-Received: by 2002:a9d:7586:: with SMTP id s6mr13458411otk.46.1604355576494;
 Mon, 02 Nov 2020 14:19:36 -0800 (PST)
MIME-Version: 1.0
References: <20201031003917.21190-1-ricardo@foundries.io> <aeddcee4aa83407919f961b70949b2b8b298f972.camel@linuxfoundation.org>
In-Reply-To: <aeddcee4aa83407919f961b70949b2b8b298f972.camel@linuxfoundation.org>
From: "Ricardo Salveti" <ricardo@foundries.io>
Date: Mon, 2 Nov 2020 19:19:00 -0300
Message-ID: <CAAaKDhE5qBBciPNMdMFeNScVutoxxaFy2Hw0zBmj6YZ2UW77fQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] dosfstools: add mkfs.vfat to ALTERNATIVE
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 1, 2020 at 1:27 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-10-30 at 21:39 -0300, Ricardo Salveti wrote:
> > The mkfs.vfat tool can also be provided by busybox via the
> > CONFIG_MKFS_VFAT
> > configuration (not enabled by default in OE but can be enabled on
> > systems avoiding components based on GPLv3).
> >
> > Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> > ---
> >  meta/recipes-devtools/dosfstools/dosfstools_4.1.bb | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
>
> This seems to throw a lot of warnings:
>
> WARNING: dosfstools-4.1-r0 do_package: dosfstools: alternative target (/sbin/mkfs.vfat or /sbin/mkfs.vfat.dosfstools) does not exist, skipping...
> WARNING: dosfstools-4.1-r0 do_package: dosfstools: NOT adding alternative provide /sbin/mkfs.vfat: /sbin/mkfs.vfat.dosfstools does not exist
> WARNING: dosfstools-4.1-r0 do_package: dosfstools: alt_link == alt_target: /sbin/mkfs.vfat == /sbin/mkfs.vfat
>
> (see the builds in https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1531)

Interesting, a subtle base_sbindir/sbindir difference. Tested with
usrmerge, where both point to the same path.

Will send a v2.

Thanks,
-- 
Ricardo Salveti
