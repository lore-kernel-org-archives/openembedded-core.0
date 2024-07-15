Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D26C3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 12:15:57 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.36606.1721045748500691747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 05:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CrHxq5S+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3678f36f154so2487270f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 05:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721045747; x=1721650547; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qXmH0dCqFmrcr2JnH4EAxz4WjMfcudvj+0s4KmAHcgI=;
        b=CrHxq5S+Cv1hAeOUcF2F1agaNU3qDVWos3wvwcma57fS/P0kYc8UN8VudM6gz6ofN7
         6nlXz0PzBJ6zBRJIJgwk+wRBRPIyTHNwHzHg/eDx5qin+NKFlLURHpzJ6WItmkul9O+2
         /065FgbhvBuY5Q7BEt7nbUdEfoYUuL3SJsqoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721045747; x=1721650547;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qXmH0dCqFmrcr2JnH4EAxz4WjMfcudvj+0s4KmAHcgI=;
        b=nX2d1j6RJhPhjvQWjw+5xSjpAHiiRUgG1BCxV/VsGT77mjd1eY6+lws8XyfpwfETM+
         Hqc0hkezpFUwJRq99/2IeEehNu2p1K3Kv0eUUKZjBiQf0fQcrqxNFthiQcgpnWpd7tqh
         sJfwwYHYPUUU06ursHzclf/vLgt8+1uhMpNB0UuzbUTTQF7S5JU2x04Mm+v6t7JxNYds
         EDooy7H0+Zgcq/hh1O8eL8yVoE60uo3kzvpxje9lOTduvGZAbElKANJ8T9amo71rsOrA
         WJcUHzkqua295CbJfHx46Z50TdQx2d7FenI1lZPc66Rt29zOqpQZlFNTdvGVKOPWigr0
         Mw1w==
X-Gm-Message-State: AOJu0YxDk0oX0DiRqaTMftqh+3o5JyGtFzIWdQPIpb5dFruwlpoClxlp
	avEB55eyoEIultVEVDX9ycwCw4GMMcJgKLCkEkw+gl6nBis2gvfGiko3YYQ7DO4=
X-Google-Smtp-Source: AGHT+IFpyEI5x/KVYC2++OfGWw9VDJaml4rxfAHd9K4LKjbc7xgaQyhB1P19rxgCDDcYXlKdkhPjWQ==
X-Received: by 2002:a5d:4ed0:0:b0:367:8e53:7fd7 with SMTP id ffacd0b85a97d-367cea73ea2mr11770385f8f.28.1721045746926;
        Mon, 15 Jul 2024 05:15:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b820:e15f:2b8d:2478? ([2001:8b0:aba:5f3c:b820:e15f:2b8d:2478])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccdffsm6289582f8f.54.2024.07.15.05.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 05:15:46 -0700 (PDT)
Message-ID: <51c67579742105d284c7f1aa719edb1c68486076.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/1] gfortran: update runtime dependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kai <kai.kang@windriver.com>, Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2024 13:15:45 +0100
In-Reply-To: <17E25C9ABAE28545.4882@lists.openembedded.org>
References: <20240616153135.3058410-1-kai.kang@windriver.com>
	 <20240616153135.3058410-2-kai.kang@windriver.com>
	 <17DA6AA6C1087792.28936@lists.openembedded.org>
	 <CA+chaQexmQso_xy45yCMU_EsVDq9RsX+qmmuuVb3r8ur3XQe4A@mail.gmail.com>
	 <7001a7c7-f500-49bd-ae2b-711d42a97f06@windriver.com>
	 <CA+chaQczh+jy5tEz67r+dcLUJzV=tpnbMad3dHGGR1+KOmLFbw@mail.gmail.com>
	 <6a947a6b-4052-413a-bd90-fb460be51ce5@windriver.com>
	 <17E25C9ABAE28545.4882@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 12:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201918

On Mon, 2024-07-15 at 11:37 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Mon, 2024-07-15 at 18:20 +0800, Kai wrote:
> > On 7/15/24 17:59, Martin Jansa wrote:
> > > Hi Kai,
> > >=20
> > > are you also seeing these buildpaths warnings from libgfortran?
> > > These
> > > will be fatal since ERROR_QA update from yesterday:
> > > https://git.openembedded.org/openembedded-core/commit/?id=3Db79b191cc=
43a45dde2adb61ea349b426cb2461d1
> > > and it probably wasn't detected in AB builds which might not enable
> > > fortran.
> > Yes, it seems exists for long time. My colleague worked on it for=20
> > several days. But it seems hard to resolve that
> >=20
> > host path are somehow set to the intrinsic path.
> >=20
> > I'll discuss with him tomorrow and check if we can fix it.
>=20
> We're seeing these in automated testing now too.
>=20
> I'm wondering if adding -ffile-prefix-map might avoid them. Sadly there
> are tools which don't support that option so it isn't an easy thing to
> add/test.

To be clear, we saw failures in the fortran selftest however I tracked
those down to the way we were calling the compiler and fixed it that
way.

I did try adding file-prefix-map to the compiler commandline but it
didn't help. I'm not sure of the status of prefix remapping in the
fortran compiler but it doesn't seem to be quite working properly.

Cheers,

Richard

