Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3448AC3DA41
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 09:20:50 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.7794.1720689642887805219
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 02:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aYUcaLj2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.170, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ee92f7137bso6635861fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 02:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720689641; x=1721294441; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/heUFH/bhgZaAzIZlGTc9Y8Ba4JSvucUijhbLjlGsk=;
        b=aYUcaLj2d/Tf1buS1toJon/aVwBl5b8q0AfosCOYJml0QWgdpXIbaWx+wTXjOgVtOQ
         nvwhDxLkuExF2NgjvEvC3S6GPTLrLPPNqB0VL9oqjvMyVCewAG4nkYsiuh91VKbH8bs7
         BBSl3+4+v3cs/jE57YwhDugPlZhd4mXmMMfZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720689641; x=1721294441;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w/heUFH/bhgZaAzIZlGTc9Y8Ba4JSvucUijhbLjlGsk=;
        b=UqBSzYOjk98FjFdROI+GJ1RWogQ9utc8XNnAqmAqgWYbtR9b4TZ280StNUHioaZFJM
         4lA+c/nfFQftEwp+mQjIgruHl9HbkuHuz6BuczUPKWGolejOvUTeqRNs4FTNX1rx0oeq
         DtsuwT8tvF2GAy5EkewFx6qnN+6bnVCIKaLVEinGS/CnoTXBS5CdI9w/Fh5J9d/TMs/H
         p13relV/Go8/LKVdc3euHiRPb98gxk9Ev059Pd9Rgd5GW4rL74L2c/g6lhPoK1nIDBPY
         iu5rsujxmlU4He7uQGY6bm6kY4Ez9aqf/Y/LFPtOtVDdliGqR1taM3MXqSgzEImnj1ST
         KSJA==
X-Forwarded-Encrypted: i=1; AJvYcCX7t+heGKBY+goBXP3nUc/+truOrP+sgEp4Gul7Tvkniwbu41hK4bxI+LJbLnv5WEi1K5ChNbjn1CYoKVj6GyiR/Uq8Sxptm8Mq6smMskReEoCIKkFfipfV
X-Gm-Message-State: AOJu0YyxsTPne3cb2YO7OAhXWrmUA089e8GiP47HGaJFQk+kaPDcLVZG
	JpmhIOf6gYJeHQ+of+2XAAYSIFz3ItM7R9tKxfv+3JbIg4nO652cEUOQOLQwA1c=
X-Google-Smtp-Source: AGHT+IFmz/Nu7jHGk28OrSzdDL/2R98E9rbbbra1CtJ0fKCZH+vVrtI9OPRAV9tEp2lbN+lXr5rhnQ==
X-Received: by 2002:a2e:b0e4:0:b0:2ee:87ce:c863 with SMTP id 38308e7fff4ca-2eeb3182243mr58244621fa.32.1720689617499;
        Thu, 11 Jul 2024 02:20:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b76e:27af:5a94:dcb6? ([2001:8b0:aba:5f3c:b76e:27af:5a94:dcb6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09e5sm111487375e9.5.2024.07.11.02.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 02:20:17 -0700 (PDT)
Message-ID: <4475dad783adf0f3d7272b236065b46eca1c88af.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bluez5: upgrade 5.72 -> 5.77
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gudni.m.g@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 11 Jul 2024 10:20:16 +0100
In-Reply-To: <18500.1720685571712510299@lists.openembedded.org>
References: <28985.1720633665101112847@lists.openembedded.org>
	 <18500.1720685571712510299@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 09:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201769

On Thu, 2024-07-11 at 01:12 -0700, Gu=C3=B0ni M=C3=A1r Gilbert via lists.op=
enembedded.org wrote:
> I'm seeing a very weird bug in Bitbake and I'm not sure if it is just
> my environment. Sharing this in case anyone knows what is going on...
> I've isolated the issue to something between when do_install finishes
> and when Bitbake worker teardown process starts.
>=20
> For whatever reason, after running bitbake -v -DD -c do_install
> bluez5, the permission for the /etc/bluetooth folder is changed to
> 755 when it should be 555. The owner also changes from root to user
> (in my case 'builder'). I've ruled out the BlueZ recipe and the make
> build. The make file correctly installs the directory with 555
> permissions.
>=20
> I've been trying to debug this by adding:
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug("HELLO")
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug("HELLO WORLD")
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(subprocess.check_o=
utput(['/usr/bin/ls -la
> /home/builder/yocto/build/tmp-musl/work/core2-64-oe-linux-
> musl/bluez5/5.77/image/etc/bluetooth'], stderr=3Dsubprocess.STDOUT,
> shell=3DTrue).decode('ascii'))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as e:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass
>=20
> next to various bitbake logs to track down the issue.
>=20
> I'm open for any ideas / suggestions to debug this further. I'm
> thinking about adding to my docker container tools to watch the
> directory somehow...
>=20
> I'm using the latest master branch for everything at the time of
> writing this.

do_install taskes run under our fakeroot emulator, pseudo. Our builds
don't have root privileges so it stores our emulated owners/modes in a
sqlite database (see ${WORKDIR}/pseudo). This is why as a normal user
you'd see something different to what the task sees when the fakeroot
emulation is running. "bitbake bluez -c devshell" will drop you into
that fakeroot context assuming you have a terminal setup that works
with devshell.

Cheers,

Richard



