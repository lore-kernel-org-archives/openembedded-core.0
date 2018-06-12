Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 39C2B78ABF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 09:00:53 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o13-v6so19150028wmf.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 02:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ZKTz1u8uRFfIwI0g4CPJEduFkWqfMz1QGv9tkwBgN6Q=;
	b=Ju9WyCDYx9yfKXEsXddFzmqC4XUHjcw8JDilaBtSZZsbeBRrX8htKS4wSPkrYsUs7Z
	23nAX2W3MzvBg0992R4Ar7C9R/tyumxa4VK8A1UIQfFHx6y579oGrH0LYvTpaI+zSBsq
	eRqIaahlBWg2lb46WV+du16SdqnbuY/6qByBC4lJeCE5lgsqmOEnE6onMvO1Q2bPw3Q6
	TkCHRTsYRq3W8NUOb8zXQevufPWtIZhrmJGVwcwYZaLGxmS/cwD1B4k6C8jghr1eJv/D
	SNx0PpWDkYERrbD3xaw+xB23TBl1+rIDLwjD4NKOW9D/lgaZWidY+n/K2LvC8JJg0mxS
	HUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ZKTz1u8uRFfIwI0g4CPJEduFkWqfMz1QGv9tkwBgN6Q=;
	b=Ys72d5q37nwOXjDQziXi5IT/7fjZulzRo6efZyN/c0PtquT2NFWQwzqWcm9p/XaR+s
	FQ+xMN8Kb9ZCuqSyw2t6LYzVPW1fJPhjW/GNEFVB+xegDgMPqFUuPpMhxucmJSPyOsqi
	zgPMl0uiLW96nuFDMwboFyijnjshjs+6+HPxWu1wi0ct67X/V67YyAYT5/XkXDps7yAK
	5VC6PHt0RjRdLI2INtAV0nIBjpuwNdSSXdXvdNv/q64Aizf6rte7azz9nk6IdK54STTU
	lsvKuKawgvQhRECOIwKs6bQ6df8EFkNXxDzf9cubk0zfCbufAuqo3I65hAnaK2MMkvYI
	Kw7w==
X-Gm-Message-State: APt69E04BzXc+rvnH+BQpy86JGf1fdh49/BbS5cR0R06xLpz6Q7AJgVC
	bny8kwY8KntRbl2j1LR+5Cvfuw==
X-Google-Smtp-Source: ADUXVKItGizkhB3GDHA//hgv5aPwsCOU3jI04cmAcGafMYx9zO81Qzrwqr/OKNpDQpaSJTT9cf2iQA==
X-Received: by 2002:aa7:d14f:: with SMTP id
	r15-v6mr2761866edo.53.1528794053985; 
	Tue, 12 Jun 2018 02:00:53 -0700 (PDT)
Received: from [172.20.0.85] ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id
	x42-v6sm337589edx.73.2018.06.12.02.00.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 02:00:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.4 \(3445.8.2\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20180609062628.32364-1-ayaka@soulik.info>
Date: Tue, 12 Jun 2018 11:00:51 +0200
Message-Id: <F1A6604B-E5BB-413F-B7AF-0EC7B85D5C12@dominion.thruhere.net>
References: <20180609062628.32364-1-ayaka@soulik.info>
To: Randy Li <ayaka@soulik.info>
X-Mailer: Apple Mail (2.3445.8.2)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/4] Add tune for ARMv8 and some cortex processors
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jun 2018 09:00:53 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> Op 9 jun. 2018, om 08:26 heeft Randy Li <ayaka@soulik.info> het =
volgende geschreven:
>=20
> I read the ARMv8 manual again, it looks the hardware float is =
mandatory
> in Linux Distributions and toolchain libraries. Even some cortex
> processors can be configured without FPU/NEON hardware, but I don't
> think they would be used in openembeded core.
>=20
> So I can assume the NEON(SIMD) would exist all the time. Leaving only =
the
> crc and crypto instructions are optional here.
>=20
>=20
> Randy Li (4):
>  arch-armv8a.inc: add tune include for armv8
>  tune-cortexa35: add tunes for ARM Cortex-A35
>  tune-cortexa32: add tunes for ARM Cortex-A32
>  tune-cortexa72: add tunes for ARM Cortex-A72

Having been forced to deal with the mess that=E2=80=99s 32-bit arm =
tunes: Let=E2=80=99s only add an implementation specific tunes *after* =
having seem conclusive, repeatable benchmark results. 90% of the 32 bit =
tune files are placebo effect and just explode number of package archs =
in your distro feed. The goal of aarch64 was to stop being different for =
the sake of being different, let=E2=80=99s not make a mess because we =
are used to messes.

regards,

Koen=

