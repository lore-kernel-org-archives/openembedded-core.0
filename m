Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E59C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 12:22:23 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.30816.1702038142704954475
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 04:22:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MFn7mcrx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3331752d2b9so1483493f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 04:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702038140; x=1702642940; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N1Z7wGemhYIkXKLp5zXo0bZGWZNs8ijm3CFM8zO3SRg=;
        b=MFn7mcrxOY8gYoadhWDQPj8CjI4XGcK+cKeZDZ5sAEiGAyw1VbC4l6wIwmz/WtaZ9m
         fAAXPlsjkoaJ14hEmtbwIZpimfSmJkkT3L0GBFkOQKLOLlYfbcfuCio1fEz4TKlS3t4G
         06OpjfzY1KUYxzB1RS2udXsUtD/MO9UZhVuXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702038140; x=1702642940;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N1Z7wGemhYIkXKLp5zXo0bZGWZNs8ijm3CFM8zO3SRg=;
        b=muAp+f687ERmpHhEmUT02t+/p0X/AIt9zKU1b2nSzZZsS/zkYycCBOv+MZjnfTEIPm
         mnw5SRMsdshT4EpakcmjNxOBjQxQ68yg8SkqhDtoC2avveATN1GQGbDuCoaWvoCHZ9YA
         SlGsmLDotUHNLps/If2Y5SCjx+p1Q2f14CBFkaB615ByRvjPjtAa3gaUt/joHJ7TTAQk
         XyeZBkCylrGI7E9RgO81kWJe9vtjAoFTMZ93rt/JVmcgVgznmJ2SNd2uZq+70x7W85jV
         tYQ4+/L5ZP/rBo7162TvSPy6X3a6/+vq8jvCrQkLHdUHtugmjjsI4H+WtGVDvIVYbDdM
         Sx/g==
X-Gm-Message-State: AOJu0YwiWX95SM18zAfGh6vKUL2wIWvWbkmVh1Wl05kQ4aKoluPheqML
	UZ+H6j3KR3ok533OHwdTUZpTxQ==
X-Google-Smtp-Source: AGHT+IHnss5wGWs2FAoi9Z++nbiudsqllsRw4isMyI4wjS2G3tb+n512g6NeaWQzrbXD6SoEmcDqUg==
X-Received: by 2002:a5d:634f:0:b0:333:2fd2:8138 with SMTP id b15-20020a5d634f000000b003332fd28138mr2436226wrw.85.1702038140580;
        Fri, 08 Dec 2023 04:22:20 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b? ([2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b])
        by smtp.gmail.com with ESMTPSA id e33-20020a5d5961000000b0033346fe9b9bsm1921928wri.83.2023.12.08.04.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 04:22:20 -0800 (PST)
Message-ID: <0b9ea27634ed3c7ccdcd74de9cd8418d893e21c5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 6/6] oeqa/selftest/sstatetests: re-disable CDN
 tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Fri, 08 Dec 2023 12:22:19 +0000
In-Reply-To: <20231208101522.198832-6-alex@linutronix.de>
References: <20231208101522.198832-1-alex@linutronix.de>
	 <20231208101522.198832-6-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 12:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192051

On Fri, 2023-12-08 at 11:15 +0100, Alexander Kanavin wrote:
> With the rework of printdiff, it is not longer useful for checking
> absence of sstate objects in a remote http cache, as it would only
> report the top level missing signatures, and leave the recursive
> investigation to diffsigs (which relies on ability to list cache
> files - not available over http).
>=20
> The CDN check will be performed via a separate 'printmissing'
> function, which would be written specifically for the purpose,
> and so until then disable the test as it would only persistently fail.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/lib/oeqa/selftest/cases/sstatetests.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/=
selftest/cases/sstatetests.py
> index 07e82d25c62..97ac0d2e9d9 100644
> --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> @@ -930,12 +930,12 @@ SSTATE_MIRRORS ?=3D "file://.* http://cdn.jsdelivr.=
net/yocto/sstate/all/PATH;downl
>          result =3D bitbake("-D -S printdiff {}".format(targets))
>          self.check_bb_output(result.output, exceptions)
> =20
> -    def test_cdn_mirror_qemux86_64(self):
> +    def _test_cdn_mirror_qemux86_64(self):
>          # Example:
>          # exceptions =3D [ ["packagegroup-core-sdk","do_package"] ]
>          exceptions =3D []
>          self.run_test_cdn_mirror("qemux86-64", "core-image-minimal core-=
image-full-cmdline core-image-sato-sdk", exceptions)
> =20
> -    def test_cdn_mirror_qemuarm64(self):
> +    def _test_cdn_mirror_qemuarm64(self):
>          exceptions =3D []
>          self.run_test_cdn_mirror("qemuarm64", "core-image-minimal core-i=
mage-full-cmdline core-image-sato-sdk", exceptions)

Crazy question - for the CDN tests, why don't we try just setting a
dummy SSTATE_DIR, then "bitbake <images> -n" and check the "State
Summary:" line in the output?

Cheers,

Richard

