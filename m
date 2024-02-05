Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8A8C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 14:33:17 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.63832.1707143595676331916
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 06:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O7RmVNcP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40fd72f721dso12337835e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 06:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707143594; x=1707748394; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qQL5/3l0lWkgjkbKGcNCF8+OG2kepgrEWoKmADYKpIw=;
        b=O7RmVNcPuhbdx2P87tLxVdHumLDKKpk9VQwbYtfDVu2iu2OZg7w173ATFQGDu9d1NB
         WbatwtAe9x//xFes0VrEoePv6LukLyt98wD9D7zPgiKFG043NsGhRxQ1i5IV8NmjrIeS
         mBua+qeGk1456VBguDge+KKWYRRG3MR9rCl0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707143594; x=1707748394;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQL5/3l0lWkgjkbKGcNCF8+OG2kepgrEWoKmADYKpIw=;
        b=Ew3H+J5GG2i5VxkZR8bBEfBlF9aBs+lQkd0vDjuEfgKBSa/4qftAO9v2GGg6JD8FI6
         IubjOFtqJYQswD9ylboZhxWXGfIea0sfm1dTHaNGQC8Ssk6Qa4djgY45boH1NQbA3VIw
         UwC743diiJc5P2fYODLow31ZTq4A9Mc9q+ktFBSzZ2r+bcYDIdbIkJuWsI68cTr3kjze
         vnAoDUoAITQSxFdv+jzybjUorcEzFrQ3guvyb7BtNGVBUqo2ehz5ted4YwMNaGFwxhd2
         CYlCdhlhjxxRfrPcfs7kgL8KSiyTnu6yFI40VSbnluGeI8UubCUAwi+So/xyK9aFubeE
         s12g==
X-Gm-Message-State: AOJu0YxLqej6krhtuTXXuIvCoE7L2mGxrpRhCMzjmbo5pGY5Q14hiqlf
	xZWTi+inm10nwtttw9CmuoMAr7hh206Esf6XhbySFVlid+CBD0ocg78tSwZu+58=
X-Google-Smtp-Source: AGHT+IE3ElkNLGPlNpcQvjLrUG4GBCnG07pi42T0NBGaf8UtZYYefiVD0JDQNFhyYtzsaVzFDQ3S9A==
X-Received: by 2002:a5d:64e3:0:b0:33b:15fc:22bc with SMTP id g3-20020a5d64e3000000b0033b15fc22bcmr9009883wri.52.1707143593669;
        Mon, 05 Feb 2024 06:33:13 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVmD10e8+dz17/jXxTWvoxas91m9MQ5iX7AGhdn0KpxVXhXwirHbiqOq9F9JcYGTOSF6PLutSkcwECvn6xUiWm6KWty1maZXJe/MKi4AhBUqXumWdui/IcDxHIY4Qi2ZQkd1kjXHcTfBW5j3OeojCvt5tD5dHHf2DinOGkPgKSUcjazsIM=
Received: from ?IPv6:2001:8b0:aba:5f3c:1dd9:a716:2b89:e181? ([2001:8b0:aba:5f3c:1dd9:a716:2b89:e181])
        by smtp.gmail.com with ESMTPSA id p4-20020a05600c358400b0040fb7c87c73sm8831024wmq.45.2024.02.05.06.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 06:33:13 -0800 (PST)
Message-ID: <8d09eca8e65d69bc9d79da3a0c271a05097ebe9e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] ltp: Update to 20240129
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	openembedded-core@lists.openembedded.org, Daniel =?ISO-8859-1?Q?D=EDaz?=
	 <daniel.diaz@linaro.org>, Khem Raj <raj.khem@gmail.com>
Date: Mon, 05 Feb 2024 14:33:12 +0000
In-Reply-To: <20240205104342.GB166229@pevik>
References: <20240131183243.30223-1-petr.vorel@gmail.com>
	 <202402021507535468a87c@mail.local> <20240203235247.GA163430@pevik>
	 <c6b68e4d96108645ffcfdac875e6081c57bdf7a1.camel@linuxfoundation.org>
	 <20240205104342.GB166229@pevik>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 14:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194939

On Mon, 2024-02-05 at 11:43 +0100, Petr Vorel wrote:
> > Hi Petr,
>=20
> > On Sun, 2024-02-04 at 00:52 +0100, Petr Vorel wrote:
> > > Hi Alexandre, all,
>=20
> > > > On 31/01/2024 19:32:43+0100, Petr Vorel wrote:
> > > > > Removed patch accepted upstream as
> > > > > 8c53cc947 ("testcases/kernel/syscalls/fcntl: define _LARGEFILE64_=
SOURCE")
>=20
> > > > > Rebase runtest/mm patch.
>=20
> > > > > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > > > > ---
> > > > > Hi Richard, Daniel, Khem,
>=20
> > > > > could anybody please test this update if build (it should).
>=20
> > > > > Also, it'd be good nice to rerun proc01 -m 128 and report me with=
 the
> > > > > details, maybe we can fix it. If still problematic, it'd be nice =
to turn
> > > > > disable_hanging_tests.patch into proper git patch (makes rebasing=
 patch
> > > > > on new LTP version easier).
>=20
> > > > This fails on the autobuilders:
>=20
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/5=
957/steps/12/logs/stdio
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/5=
917/steps/12/logs/stdio
>=20
>=20
> > > Thanks for testing this, you probably mean the warning before python =
stack trace:
>=20
> > > scp: /opt/ltp/results/connectors: No such file or directory
> > > WARNING: core-image-sato-1.0-r0 do_testimage: File could not be copie=
d. Output: scp: /opt/ltp/results/connectors: No such file or directory
>=20
> > > The problem is not due packaging, but simply runtest/connectors was r=
emoved [1],
> > > thus your tooling has to be fixed not to expect it (not trying to run=
 it).
> > > I'm sorry, we sometimes do cleanup which brings incompatibility issue
> > > (here it did not make sense to start SUT just for single test, thus w=
e moved the
> > > test to runtest/kernel_misc).
>=20
> > I did try again with that removed:
>=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/5929/=
steps/12/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/5968/=
steps/12/logs/stdio
>=20
> > which comes down to:
>=20
> > scp: /opt/ltp/results/fsx: No such file or directory
>=20
> > so I'll remove that and try again.
>=20
> > Are there any additions we should be considering too? This all feels a
> > little fragile so I'm wondering if we should be reworking the way we
> > handle this?
>=20
> I forget that also this one was removed in fb2b6a0b3 ("fs: Remove fsx run=
test
> suite") [1], therefore not a real error.

Thanks, with that removed we had successful runs so I've merged it.

I appreciate we need to try and re-enable that test that was hanging
but I'm a bit stretched with other issues at the moment to dive into
that one unfortunately.

Cheers,

Richard



