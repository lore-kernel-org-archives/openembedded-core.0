Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13044.1794489809936986564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 05:23:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Dxifxw3l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b56c428212so5592610a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 05:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794489808; x=1795094608; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SuAV9IO7XBUg8zyUueT1CwwNnB25In1PJpvIi4mlYqg=;
        b=Dxifxw3lOTPb1QHOVOS+3XgaaA8yYNG5/oGZ2WMG1687MeCVGKoE8BfPs243GAgHxh
         zx6kJTmAUNrDTpvOUP1rztRfs8VfXEBCdQL5blbRunS8GoldhYyUgTOKgV3pDXffDNNH
         Ygp6hUFzEptBLxfXHSCauoa5sSNl/G6bdS/XE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489808; x=1795094608;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SuAV9IO7XBUg8zyUueT1CwwNnB25In1PJpvIi4mlYqg=;
        b=oKJJV3WMC714UkQx1ZyH4NoPNmGnDJLiKydKGUNx11IrQmDTQsQIpSNMBJNnzkkspp
         UgEoOxD0KH8Dd6BhEfGX6rBFvosh9D2bvpu6l/3TB6NcMY9DiMkALXQmhXSXIiQ+dp9u
         1NpaUO8TBV3YyeQ7DEUnxtWcDwrZc8+sxXyVlVjMZRPeOzPxvGQwBQhKpYEOQzBK3WyI
         mc++FlLgmc5EU3pRS+lBSNQ9Aj1Q8D6lUqBpaBhq50cVKTzDWOOZmwm6OUAJVOh53lbo
         fvdgqYrfhx/nRmELS2MTQ8Y79CPASC8DgLhxj0vSgZPt57T6CDrgHjPjoICczFvUTqEE
         Y6Yw==
X-Gm-Message-State: APuU4Z/z4LSrZTJYpGgLB0SL9EpDIQryobUBNC6n5YDLqakjNMp+vv2T
	Yw92zmbsgpQJ884YfLAlwIcaepeOgq1/Fexbe6JklTn+G8dMMJTN3LI0AUwN8LTtwkk=
X-Gm-Gg: AYBFou3SW2+I6zkSCLRLabc4wKTL1tpZBJNxVsCeiZKLZPWeWjMswN2FfZbBFDIerSz
	G211vRBuhPAiXuHWjjGl9O1+yIX8aM4krdLUEqE5/q72ltNkfnX+we97xvJ3LkWYNCfk0V5iNpQ
	M3XiwtVnM8dT6jOJHre1zr3kyXgQ0sFep9yxPL0Yf56q/6WVrpn3PXHy5RAOqEL/k6dutAzzf9K
	I/cXVTZIaJhTndig0kwOG+U2uTovuv0IgFBiJ8KrUT4/V6d6eOCSzUxkjfNQUAG38vgUQk4HPAC
	9zIMd9o22UzX+QJCR+pTcRnpoSEjBwOiVkuzqBVzQyaIq20cpqH8GCsdOg4Uutjj7VUpIZsex7p
	JEp/2QfEelDVTpODioh+h59kI4wxz8UQ+cHoGTxge01r1R0ANmbNERWCn7UEh1Usvg+u2BtoxKl
	axa8f4bmM27h9I98hfenKnnZICnAU/AYrt2nDsyGe3Q+wJEHVpInUTjrYQe8QEWp/JoFL5E5vzp
	rC+wGiwpATAYgn9xwD5BhvwJgdoBKKrZQckV/yyZ/EMtahjYVzM83bTuM32WND1ktylfBKNQiIc
	qTWfGTuYiCYzMzm2ItV6MhbvVJh+VRbOGy/JgFGi0YDvdx97CKaiLX4do/ANlCmLkPWI/iGB0Lp
	1U1n9JZ/gA6Dp/8MVvxIaz5NuoceF1H+C88NDUsQ=
X-Received: by 2002:aa7:d78e:0:b0:6b1:c5c3:9624 with SMTP id 4fb4d7f45d1cf-6b777701e17mr3080069a12.22.1794489807893;
        Thu, 12 Nov 2026 05:23:27 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1562:9f61:e354:1b51? ([2001:8b0:aba:5f3c:1562:9f61:e354:1b51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835e20327sm17444284f8f.26.2026.11.12.05.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:23:23 -0800 (PST)
Message-ID: <d5684bdbe148991bccd4c57c1b4877994d1fe857.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] libzip: Allow support for bzip2 to be
 disabled
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.kjellerstedt@axis.com, Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Nov 2026 13:23:21 +0000
In-Reply-To: <DB5PR02MB10213425AAD6C58E8D300C49EEF742@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20261102140700.2707257-1-pkj@axis.com>
	 <EB395024-F1FA-4B28-92FF-25772374910D@arm.com>
	 <DB5PR02MB10213425AAD6C58E8D300C49EEF742@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10build1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 13:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250095

On Sun, 2026-11-08 at 16:51 +0000, Peter Kjellerstedt via openembedded-core=
 wrote:
> > -----Original Message-----
> > From: Ross Burton <Ross.Burton@arm.com>
> > Sent: den 5 november 2026 15:05
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 1/3] libzip: Allow support for bzip2 to b=
e disabled
> >=20
> > On 2 Nov 2026, at 14:06, Peter Kjellerstedt via openembedded-core <pete=
r.kjellerstedt=3Daxis.com@lists.openembedded.org> wrote:
> > > +PACKAGECONFIG[bzip2] =3D "-DENABLE_BZIP2=3DON,-DENABLE_BZIP2=3DOFF,b=
zip2"
> >=20
> > Does this work in native builds?=C2=A0 bzip2-native is in ASSUME_PROVID=
ED (for
> > now=E2=80=A6) so won=E2=80=99t be pulled into the build. I suspect eith=
er bzip2-
> > replacement-native is being pulled in, or the build will fail.
> >=20
> > I do think we either need to entirely drop bzip2-native from
> > ASSUME_PROVIDED (and just build it as required), or do the same -
> > decryption-native dance that we do with xz and zstd.
> >=20
> > Ross
>=20
> I have built libzip-native without problems, both with bzip2 enabled and =
disabled.

During review we were still not convinced with this explanation.

Did you check *which* headers/lib it using for libzip-native?

We're worried that it is using libbz2 from the host in the native build.

Cheers,

Richard

