Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06C6C3271E
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 08:14:46 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.75048.1720426477439621099
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jul 2024 01:14:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AZjkPBqv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42565670e20so27553885e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 01:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720426476; x=1721031276; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5xrFx+fbY9jnE8x9a+2DSo7AvZUUDeYD1yZtnRRP2I=;
        b=AZjkPBqvdndynZ46/BDctJIwplpL2q1j1bC35rjN47I02oM7ESgQuo5GOzN7BIDo4T
         pxKJU002f05yArMuJxnXZhjUa0QeHplQSDpq6BnRPTX52qmJ9cZr/RdbuExrP1+7z8aF
         kS/2AxoThPmWGrrYVDrglj5llXfGPGybZ3mgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720426476; x=1721031276;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e5xrFx+fbY9jnE8x9a+2DSo7AvZUUDeYD1yZtnRRP2I=;
        b=mhBzcGlaa87BLn61tpLgZOSRxOjpLV0kdqMxHDRoGE2FymqlbWI48DHbpABja0hsjp
         adpyzVayeeA9mwXGj1FYuv51aIvGpcAJBcJMf4rCbyn+hMKH9Zi0CT6Xt+DJrAfW8E+G
         ImIhLAOQwISwIlu7NuxN+0X0X45CM51cS/XvCzl1O2wL045YhxiJMUVpIz4Z/b3wdFky
         b9lbVyqKcnsVMEgT8cr4Ym3Dby95RyFxU8UOaQHey0UvEOcjU6v1+aW++83sglpz/3lm
         6pBh/z4JwCiBO6d2z6S9/61hFtIUBtIV91PQChlCF4uBavCz+3pNcBYdY45pjmfb9sG9
         wyCg==
X-Forwarded-Encrypted: i=1; AJvYcCWStQQrrLv/QOZbJnwplu2BPxfSCmU7x1/hQexNCdDdw1Asu5DJBg4JtSFLUUXa7vt40sR18ocp3Eat7N9e07fbhk/21/ehE7emkdoSDuokFWL2tXUsdweg
X-Gm-Message-State: AOJu0Yxl09mw8zLFLU4rjUOaA7bwjVjgwMKq7wGyeRBmiPbwASsabcWA
	H9BDYZcdMfhZY4ssA58SViHWWSWExzfgQ/pZq0VqG6mIfb3JamngMoY1Q94shhI=
X-Google-Smtp-Source: AGHT+IHE2kf5G4xLPVLf6Bgtu3+SemxrGsExwnaPLF0X2cXW8FYJSUap7NI8eAqnrndRgv0nYFD1+w==
X-Received: by 2002:a05:600c:1c98:b0:426:5fa7:b495 with SMTP id 5b1f17b1804b1-4265fa7b6c3mr44440755e9.15.1720426475805;
        Mon, 08 Jul 2024 01:14:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1d0a:489f:367:5889? ([2001:8b0:aba:5f3c:1d0a:489f:367:5889])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679ac6d60dsm10506737f8f.39.2024.07.08.01.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 01:14:35 -0700 (PDT)
Message-ID: <b88f81cc1955984243020d6a728f9e9e2cb0fdfa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bluez5: upgrade 5.72 -> 5.76
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gudni.m.g@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 08 Jul 2024 09:14:34 +0100
In-Reply-To: <20061.1720356946240260660@lists.openembedded.org>
References: 
	<bdc48d97eea594eff799a370fc66fb28f283de52.camel@linuxfoundation.org>
	 <20061.1720356946240260660@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 08:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201628

On Sun, 2024-07-07 at 05:55 -0700, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org wrote:
> On Sun, Jul 7, 2024 at 10:00 AM, Richard Purdie wrote:
> > Thanks for the patch, unfortunately this ran into issues in our CI.
> > One
> > interesting one is this:
> >=20
> > https://valkyrie.yoctoproject.org/#/builders/40/builds/65
> > https://valkyrie.yoctoproject.org/#/builders/36/builds/64/steps/17/logs=
/stdio
> >=20
> > which isn't very clear what is going on until you look at the
> > files:
> >=20
> > (buildbot-venv) [pokybuild@rocky9-vk-1 ~]$ ls
> > /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-
> > glibc/work/qemuarm-oe-linux-gnueabi/core-image-sato/1.0/testimage-
> > sdk/sysroots/cortexa15t2hf-neon-oe-linux-gnueabi/etc/bluetooth/ -la
> > total 32
> > dr-xr-xr-x. 2 pokybuild pokybuild 4096 Jul 7 11:11 .
> > drwxr-xr-x. 3 pokybuild pokybuild 4096 Jul 7 11:26 ..
> > -rw-r--r--. 1 pokybuild pokybuild 928 Jul 7 11:11 input.conf
> > -rw-r--r--. 1 pokybuild pokybuild 12597 Jul 7 11:11 main.conf
> > -rw-r--r--. 1 pokybuild pokybuild 120 Jul 7 11:11 network.conf
> >=20
> > The missing write bit on the directory is stopping the files from
> > being
> > deleted.
> I wonder if this resolves the issue, looks exactly like something we
> need: https://docs.python.org/3/library/shutil.html#rmtree-example
>=20
> There's a comment in the Bitbake code saying rmtree is too slow, but
> that's from 12 years ago. Perhaps it is fast enough today with Python
> 3.12.

rmtree is still slow, rm is specifically designed for file
deletion.=C2=A0I'd be reluctant to start replacing all the rm calls with
rmtree.

There is also a usability issue here as we're making it hard for the
end user to delete an installed sdk.

> I don't think the solution is to request BlueZ to change how it
> installs it's files/directory.

We can ask but if they say no, the easiest thing to do is fix the
directory permissions in a do_install append in the recipe.

Cheers,

Richard

