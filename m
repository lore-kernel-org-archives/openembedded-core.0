Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC88E95A67
	for <webhook@archiver.kernel.org>; Sun,  8 Oct 2023 08:24:07 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.34395.1696753440627214535
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Oct 2023 01:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gk9Io4D9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3247d69ed2cso3430874f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Oct 2023 01:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696753439; x=1697358239; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=an48vreesPW3S187hZ0JgxrLeDA2FAFYkbkG89soqOo=;
        b=gk9Io4D99k6h2qPEcq1aw704W5zm9URBRetSYQr7PTvchG8AdMXCt1sFrRI3nmb0rT
         m4EVcPdSkxwPc9UN5ZaZ9e8gYbg/MSajtshOkMLnoE5C1G5b/iimOfw9SMSiAuUbZbgO
         bvrMgxXwyyFY6aCXePRCjCAHFsd8BkmXIN+KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696753439; x=1697358239;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=an48vreesPW3S187hZ0JgxrLeDA2FAFYkbkG89soqOo=;
        b=UsyyZ2U9mrQXqfuSAvRJcUW5Fmx80ZcHguDS/n5FMRc1jT0om51AbiPXW2l1R42vi6
         zvBuO5Pcap1sstlCCISWTCabWFUKjRs+3uO5DSnSBCn3eAWZPktebzOVP5Q215A2i7F+
         TtPeN9H2B4dl8EH19xoqIenKlN4AT/f+rAtYqHKBQed4RowcmCIPtXecFGZ1yWqfh0Lw
         2TeAazbM0C9WhQ0Vatpu48OphvD49pwoXIBW7I9mXrZd7o9DsjaUM9Fsey8tw3UtQomI
         m/7Y18Jui/QSMlskYv2vc6qUjD6n2/3bo2WUsBWq+ktVWXH1FUP3GbUMDz6K6b0LJLL8
         AqvA==
X-Gm-Message-State: AOJu0YyPPCn0aZV8k/KAJx+FNh3Wa3KCd2103O2yWqWrVv/VfL3t5G3t
	7XwiDsVQRFcFcqPPvqZIuZ7SIv2IqpnNz7FJxA4=
X-Google-Smtp-Source: AGHT+IGQjf2pOCpiYx44vO+9Hiw8EQJpl7PRjGUkCIC1U0Q3EPUGJ/uh9Rga8AsA5cf7Out9Nvb3Qw==
X-Received: by 2002:a5d:6447:0:b0:31f:fb5d:96da with SMTP id d7-20020a5d6447000000b0031ffb5d96damr11744420wrw.64.1696753438571;
        Sun, 08 Oct 2023 01:23:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e3cf:21eb:ad11:4ec9? ([2001:8b0:aba:5f3c:e3cf:21eb:ad11:4ec9])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d43cf000000b003233b554e6esm6254007wrr.85.2023.10.08.01.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 01:23:58 -0700 (PDT)
Message-ID: <a2ad67a0575548b6d5d8d187e597dcd72ae07f64.camel@linuxfoundation.org>
Subject: Re: [OE-core] Summary of the remaining 6.5 kernel serial issue (and
 6.5 summary)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Paul Gortmaker <p_gortmaker@yahoo.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>, Mikko Rapeli <mikko.rapeli@linaro.org>, Randy
	MacLeod <randy.macleod@windriver.com>
Date: Sun, 08 Oct 2023 09:23:57 +0100
In-Reply-To: <178BF2895FF685E6.5378@lists.openembedded.org>
References: <178BF2895FF685E6.5378@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Oct 2023 08:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188821

On Sat, 2023-10-07 at 23:05 +0100, Richard Purdie via
lists.openembedded.org wrote:
> I thought I'd summarise where things are at with the 6.5 kernel.
>=20
> We've fixed:
> * the ARM LTP OOM lockup (kernel patch)
> * the locale ARM selftest failure which was OOM due to silly buffer=C2=A0
>   allocations in 6.5 (kernel commandline)
> * the ARM jitterentropy errors (kernel patch)
> * the cryptodev build failures (recipe updated)
>=20
> We've also:
> * disabled the strace tests that fail with 6.5.
> * made sure the serial ports and getty counts match
> * added ttyrun which wraps serial consoles and avoids hacks
> * made the qemurunner logging save all the port logs
> * made the qemurunner write the binary data it is sent verbatim
> * made sure to use nodelay on qemu's tcpserial
>=20
> This leaves an annoying serial console problem where ttyS1 never has
> the getty login prompt appear.
>=20
> What we know:
>=20
> * We've only seen this on x86 more recently (yesterday/today) but have
> seen it on ARM in the days before that.
>=20
> * It affects both sysvinit and systemd images.
>=20
> * Systemd does print that it started a getty on ttyS0 and ttyS1 when
> the failure occurs
>=20
> * There is a getty running according to "ps" when the failure occurs
>=20
> * There are only ever one or three characters received to ttyS1 in the
> failure case (0x0d and 0x0a chars, i.e. CR and LF)
>=20
> * It can't be any kind of utf-8 conversion issue since the login prompt
> isn't visible in the binary log
>=20
> * the kernel boot logs do show the serial port created with the same
> ioport and irq on x86.
>=20
> Previously we did see some logs with timing issues on the ttyS0 port
> but the nodelay parameter may have helped with that.
>=20
> There are debug patches in master-next against qemurunner which try and
> poke around to gather more debug when things fail using ttyS0.
>=20
> The best failure log we have is now this one:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5874/st=
eps/14/logs/stdio
>=20
> where I've saved the logs:
>=20
> https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/j/qemu_b=
oot_log.20231007084853
> and
> https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/j/qemu_b=
oot_log.20231007084853.2
>=20
> You can see ttyS1 times out after 1000 seconds and the port only has a
> single byte (in the .2 file). The other log shows ps output showing the
> getty running for ttyS1.
>=20
> Ideas welcome on where from here.=C2=A0
>=20
> I've tweaked master-next to keep reading the ttyS1 port after we poke
> it from ttyS0 to see if that reveals anything next time it fails (build
> running).

Testing overnight with the new debug yielded:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5895/step=
s/14/logs/stdio

The interesting bit being:

"""
WARNING: core-image-full-cmdline-1.0-r0 do_testimage: Extra read data:=20
Poky (Yocto Project Reference Distro) 4.2+snapshot-
7cb4ffbd8380b0509d7fac9191095379af321686 qemux86-64 ttyS1

qemux86-64 login: helloA

Poky (Yocto Project Reference Distro) 4.2+snapshot-
7cb4ffbd8380b0509d7fac9191095379af321686 qemux86-64 ttyS1
qemux86-64 login:=20

"""

i.e. the getty didn't appear in 1000s but sometime in shutdown the
original prompt, the "helloA" and the new getty prompt did.

So the data *is* there but stuck in a buffer somehow. Kernel or qemu
side, I don't know.

Cheers,

Richard





