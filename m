Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9674BC4706F
	for <webhook@archiver.kernel.org>; Mon, 25 Dec 2023 22:02:17 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.67016.1703541730254727617
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Dec 2023 14:02:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZEfaiOaI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3368fe4dcb1so2877765f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Dec 2023 14:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703541728; x=1704146528; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rAPx/1GQnteo032dOuWcTtIUGY7qGpYYEt7OxfQEqJQ=;
        b=ZEfaiOaIZwaqWAGfTLtSoUpscre1l2PBX59sDexaX72CM+nogpKEzAtTCUFvdjMCFW
         bJnbGLrNwywgTJcJnqX5fB/C5liT/V2E8kBw9hIRD31+Xaru+I3L1CSjMz6ST7l65lBV
         8ipKf3YMW/OzgfgYYlPvMuLXwL+nFcUmMgLeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703541728; x=1704146528;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rAPx/1GQnteo032dOuWcTtIUGY7qGpYYEt7OxfQEqJQ=;
        b=n3U5hewrTsFzkXxBufGqRzMPtlaQNXfwpEkWdxtz9DYQpjHGcQMCrdAcABFEg0xMOg
         8rrm4E8ZL2JHLmDuw7MU29lmnycitbhuu9hyOZWsUlxhKXK9JeOPv8s8fT/zgteMotXs
         Pb3Oh3SlRxHg88I8YuxvvHRZb9vnML0pvzVNIBRoWiPdPlKa4AvZWPQrIB6NFcma7pcS
         qYBT2O2e7eYNwO+CgpWNLysQEpQyTdybuwo53fwKhZgP3E3ZYXTfIyzKoHogTSsPy9fV
         /yBUxh9ltZTdF9SLCS4a7uJuvTLrscEfuK92vZpam89oF8pXXE8z52cNW4EYCuYHhv28
         yqLg==
X-Gm-Message-State: AOJu0YzRQpfh6yf/7Kc3mXZihpFA2d2v2UutrEWKJHn7vnp7quD40avn
	k1QaNz+aVYJxDuAP7XBxOwRbESB7cLAy3g==
X-Google-Smtp-Source: AGHT+IFryBaa7rZofwn7Qk9DbTI/PaGqQDZKqoWMl5irDjWRpLPr0khIEsvadZIs5NXrU6Scb5D2eA==
X-Received: by 2002:a05:600c:4f02:b0:40d:4d76:89ba with SMTP id l2-20020a05600c4f0200b0040d4d7689bamr3485180wmq.72.1703541728399;
        Mon, 25 Dec 2023 14:02:08 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e2d:585c:721e:ff84? ([2001:8b0:aba:5f3c:e2d:585c:721e:ff84])
        by smtp.gmail.com with ESMTPSA id m20-20020a05600c3b1400b0040b4c59f133sm18550167wms.1.2023.12.25.14.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 14:02:07 -0800 (PST)
Message-ID: <40a32888473597abf1b65d85e46efde7ce153d54.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH 0/6] Stepwise rust upgrade 1.71.1 -> 1.74.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>, Randy MacLeod
 <randy.macleod@windriver.com>, Sundeep KOKKONDA
 <sundeep.kokkonda@gmail.com>,  "Shinde, Yash" <Yash.Shinde@windriver.com>
Date: Mon, 25 Dec 2023 22:02:06 +0000
In-Reply-To: <17A406727F961131.18684@lists.openembedded.org>
References: <20231224230934.831-1-alex.kiernan@gmail.com>
	 <17A406727F961131.18684@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Dec 2023 22:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192904

On Mon, 2023-12-25 at 08:40 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Sun, 2023-12-24 at 23:09 +0000, Alex Kiernan wrote:
> > This is the 1.74.1 rust series rebased to include a revert of
> > https://github.com/rust-lang/cc-rs/commit/c4f414f449bb7cffba3bc923f2777=
04d1d08a8ec
> > which I'm pretty sure is what's causing our filename churn. I've checke=
d
> > 1.72.0 and 1.74.1 for the absvdi2.o intrinsic (one of many intrinsics
> > which had the issue) and in both cases we're not generating the dirname
> > based prefix - hopefully that means that the interim commits are fine
> > too, if not we can do the step back through the commits to find the nex=
t
> > issue.
> >=20
> > I've dropped the zvariant tests as upgrading it isn't useful (since it
> > no longer includes git crate dependency) and spurious oe-selftest
> > failures aren't helpful. I guess we need to include either something
> > synthetic which tests git crates, or pull in
> > https://github.com/jthornber/thin-provisioning-tools/ from
> > meta-openembedded which includes a live example (though who knows for
> > how long!)
> >=20
> > Assuming this does actually fix the reproducibility issue, I'll look at
> > how we fix the issue properly, rather than just reverting the commit
> > which I think is our problem, but I'd like to try and get us back on th=
e
> > rust release train if we can!
> >=20
> >=20
> > Alex Kiernan (6):
> >   meta-selftest: Drop zvariant recipe
> >   rust: Upgrade 1.71.1 -> 1.72.0
> >   rust: Upgrade 1.72.0 -> 1.72.1
> >   rust: Upgrade 1.72.1 -> 1.73.0
> >   rust: Upgrade 1.73.0 -> 1.74.0
> >   rust: Upgrade 1.74.0 -> 1.74.1
>=20
> Sounds like a good plan, I've started a reproducibility test:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4142
>=20
> With zvariant, we might be better replacing with a synthetic example
> for testing purposes?

That build went green so I ran an a-full to double check and check
everything else:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6374

Curl ptest warning was the only issue (unrelated) so it also looks
good.

Looks like you might have tracked down the issue, nice work! :)

Should I merge this as is or is there something we should do first now
we know where the issue is?

Cheers,

Richard




