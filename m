Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1023BE748F3
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 17:41:17 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.64138.1696182075727946710
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 10:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cv+FLsGo;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-57b574c6374so6860081eaf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 10:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696182075; x=1696786875; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYw9fYp8btZ7DzjqWA91quU9jyBuH5ZOYPHY8E+eD10=;
        b=cv+FLsGoUCFVOApxS2JZvXTnEqgf7YqJsDKgdtWY2T8stDG7rlhaZDvJr20sOXSamM
         UJS3ctg+28nDPx6l4hXmo9OiGRACwV6PomrMzd6XS5hF1c5mDhWixvOYTL9YnOtFsFjj
         kgZBiZlVA8rhIG9Y6aNSHdPdmjrtpBvuIc6/f5PPLBUddbpXViMULuM+famNqe0QC98M
         AkFA6DuYZeSlB9mdMF+Mq7LSY+NjXIrDGmr1ESq8jyharqB7PKGV3M02ssNo0lYyhCRR
         rK3IGa4r5VTZH0Hm8Zzjg2BkxYb90jsFvtsnPS88lLz0pEpzCL6Zq2nBs9epnak03gzO
         nVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696182075; x=1696786875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYw9fYp8btZ7DzjqWA91quU9jyBuH5ZOYPHY8E+eD10=;
        b=Rxc7/kI6NxeXrUUmNlLP3iKGyjbsQebEKEAmafBSZy67FXytoKwxIiUNzZ+s6OtoO7
         eDzcH0e/yRrFhdkF2uUNQAO2SBaFxEmBK52Fx0FgPZLko/1kR8mDAJ0bSzXqMeqsoHPV
         jnnzEYlcph5IYfdsikG5oipH1S9DNlHEutVMDyHNTyF2X1OuavrxmTY9Ppf4Ohq+VxRH
         AtMtAmjlD1+kOElLqnopQwhG+ij1Uj7/5BrPGET4GofYXYeBIndtkcW7fcVXAvfianBT
         l4LHHRJ92HZRUymxnAdHzXsyevCPWrEazQprVMNfEyNns8u3A4po58p0/iDaN2wCieKF
         SsHQ==
X-Gm-Message-State: AOJu0YyLHi412i8tLupt9pWjiS6tY/X3JoNg5n8FS5wfSO2T0KQ/T4B6
	o46laJxj1Sx4bdQn1WW3+YWlZXiUfZywYWR6ZHA=
X-Google-Smtp-Source: AGHT+IEsIZX83J6AqUZouJmWvMrbnIm8PDLO/pkRegvQbix/PuxMujy8DEdiJOwqDFVpPR9gi7VJF72/kbR+8mxWvnA=
X-Received: by 2002:a05:6870:41c5:b0:1d5:a6ac:ac8d with SMTP id
 z5-20020a05687041c500b001d5a6acac8dmr10153230oac.47.1696182074844; Sun, 01
 Oct 2023 10:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1696017123.git.bruce.ashfield@gmail.com>
 <2c1e6c379204c619cc4fe41f1b3cea1b8c6582f7.camel@linuxfoundation.org> <a87cca5199af470fc7e3b415d57f5b3b8fad4318.camel@linuxfoundation.org>
In-Reply-To: <a87cca5199af470fc7e3b415d57f5b3b8fad4318.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Oct 2023 10:40:48 -0700
Message-ID: <CAMKF1srSs1YRudkXQ2jdQYN5ZSFENPhv5o0yc3Ycx=1CCAUeXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/10] kernel: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: bruce.ashfield@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 17:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188516

On Sun, Oct 1, 2023 at 4:49=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2023-10-01 at 11:13 +0100, Richard Purdie wrote:
> > On Fri, 2023-09-29 at 16:04 -0400, bruce.ashfield@gmail.com wrote:
> > > Given where we are in the release cycle, this clearly is NOT a typica=
l
> > > consolidated pull request.
> > >
> > > I've done what normally takes about three weeks in about 4 days.
> > >
> > > With 6.4 going EOL before expected upstream, it really isn't a suitab=
le
> > > reference kernel for the release.
> > >
> > > So we've decided to take on the task of getting 6.5 ready and availab=
le,
> > > and at the same time moving the -dev kernel to v6.6. The -dev kernel
> > > testing for 6.5 was critical for this, since I already knew the core
> > > was sane.
> > >
> > > Also we've never shipped purposely mismatched libc-headers in the rel=
ease,
> > > so I also took the leap to update the libc-headers to match.
> > >
> > > I've already sent fixes to meta-oe, and there's a btrfs update in thi=
s
> > > series to fix breakage that I found in the tightly coupled packages.
> > >
> > > I've built and booted core-image-kernel-dev, core-image-minimal, core=
-image-sato
> > > for both glibc and musl for all the supported architectures.
> > > There will be some things that break regardless, but this needs the
> > > better coverage of the AB.
> > >
> > > If this causes too much problems, our choices are to ship 6.4 EOLd, o=
r
> > > fall all the way back to 6.1.
> > >
> > > I'll remove 6.4 from master once we've figured out the fallout from
> > > this kernel, and which direction we are going.
> >
> > I've merged this series which seemed to work fine. Given the time
> > constraints, I thought I'd throw some 6.5 testing at the autobuilder.
> > It ran into two issues. One was cryptodev, I have a patch for that in
> > master-next. The other were entropy boot failures on arm kvm:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5512/=
steps/12/logs/stdio
> >
> > [    0.796831] Key type id_resolver registered
> > [    0.797581] Key type id_legacy registered
> > [    0.798724] Key type cifs.idmap registered
> > [    0.808070] jitterentropy: Initialization failed with host not compl=
iant with requirements: 9
> > [    0.809690] xor: measuring software checksum speed
> > [    0.811307]    8regs           : 12333 MB/sec
> > [    0.812862]    32regs          : 12322 MB/sec
> > [    0.814885]    arm64_neon      :  7851 MB/sec
> > [    0.815626] xor: using function: 8regs (12333 MB/sec)
> >
> >
> > -----------------------
> > Central error: [    0.808070] jitterentropy: Initialization failed with=
 host not compliant with requirements: 9
> > ***********************
> >
> > I did find this in google:
> >
> > https://lore.kernel.org/linux-arm-kernel/68c6b70a-8d6c-08b5-46ce-243607=
479d5c@i2se.com/T/
> >
> > which does bisect to a change.
> >
> > I'll rerun the autobuilder testing with the cryptodev patch and see if
> > anything else transpires.
>
> The LTP on arm run failed:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/5406
>
> which diving into the logs shows it went OOM and keeled over badly:
>
> https://autobuilder.yocto.io/pub/failed-builds-data/qemu_boot_log.2023100=
1101358
>
> meta-virtualization doesn't like something:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/2295
>
> The arm ptest failures above are unsurprisingly still around:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5513
>
> There may or may not be failing strace ptests on x86:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5694/st=
eps/13/logs/stdio

strace might be related to something like this
https://blog.sebastianwick.net/posts/so-peerpidfd-usefulness/

>
> but we didn't get the world build failures from cryptodev.
>
> Cheers,
>
> Richard
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188481): https://lists.openembedded.org/g/openembedde=
d-core/message/188481
> Mute This Topic: https://lists.openembedded.org/mt/101665418/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

