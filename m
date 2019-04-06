Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id A4A917D27F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Apr 2019 19:04:57 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id x12so11137998qts.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Apr 2019 12:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DyBZTkLW5AcdNN5jNFKMLZdnaIcKZK05EnGH95xLJb0=;
	b=BnkYgNVqw+B27J+bAitACLxLIqYTQGJisLSoB3b0AQs2k7uAnc30gEqcOUJ67ZhLh4
	oCC2SPZ+92j+L0vSqffimGH78E0z5tRZub/KUhYet4gLt3BvAKgVNV2wgALuFs2VpoTG
	k7qeeLtiC66gbjOjavNNGMCqQRuOTnd8diLF1ydszO+FbbklRFN/tjAOoNbm69fOUtyV
	j+smZpdnEWLEbn91aWkMaVopQYLT1HRpiaYLu9f888Vk0irQ108Ko+90iRpvhJbBCfbo
	34NrR1Xf6mfHzi0Y/QzHL+jvAMwK/AB7q2FPsMH1+nzMGkJRW9nFlJBQLl+XHNtfuD04
	2GIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DyBZTkLW5AcdNN5jNFKMLZdnaIcKZK05EnGH95xLJb0=;
	b=jvVdMmCKa3yPGsHXw1eDuIpZHU07s1TyvJDv+CYDMTHauOvfJQxxaTP4uwvq85Ly4z
	8AKgR+2VfvS7jMDOpkvecgwQNm7y2YG9JGYibgCFa/kZLU6YBYe35zVkAm2G8hXT6+Yg
	PzR67a/rXRH7GPpuF+6Kgo/3s3V7Kg6jKpruBA9EpstxNmVX+QP/GlQhckMvCpYC7EUq
	NzVfiM9CcS9awMbbBdCEHqMg/+n6c3S10ls7iqOtTUGMym1N3R57o16kwuGxFse/VB/n
	eAShlbUy23AyUSx5tnWzUcEyaDxAvpi5/oFXonCxuJ5qCAhL5VCSznz2NkO7s+BvOK5l
	DVEw==
X-Gm-Message-State: APjAAAWUwXgodPBZFhRlJElieEtGf+4FLmyFH47TUwQ0B3pKhEC3jHRx
	a/5wyAeuRfW2ujykSoTntarqw/Ud9l99ZFVr0BmwAryO
X-Google-Smtp-Source: APXvYqzJpdg4vlmefwsda7t8AYLCdpbi69SKY39FWO/vmqw2DO9zYVXkOP32hB+fpj/uRwHZ8dTOsq2XsPkeSpORYV0=
X-Received: by 2002:ac8:2aa4:: with SMTP id b33mr17151409qta.127.1554577498448;
	Sat, 06 Apr 2019 12:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190406161948.9151-1-raj.khem@gmail.com>
	<CALbNGRS9mRJidO1dDRrwJjBadjMz4DjRr40pj=WhOSF8443x-w@mail.gmail.com>
In-Reply-To: <CALbNGRS9mRJidO1dDRrwJjBadjMz4DjRr40pj=WhOSF8443x-w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Apr 2019 12:04:32 -0700
Message-ID: <CAMKF1soj5ax+mtnxgWLGMRZuQoybDTBRO_zpgTgxVMpLF5yHMw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-python: Remove --enable-introspection
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
X-List-Received-Date: Sat, 06 Apr 2019 19:04:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 6, 2019 at 11:27 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Sat, Apr 6, 2019 at 6:20 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > This option is not available and recently it is reported as error
> >
> > do_configure: QA Issue: gstreamer1.0-python: configur
> > e was passed unrecognised options: --enable-introspection [unknown-conf=
igure-option]
> >
> Send out a patch already addressing [1] but honestly I parts of this
> parts more: remove option instead of ignoring.
>
> Cann you add:
>
> -inherit autotools pkgconfig distutils3-base upstream-version-is-even
> gobject-introspection
> +inherit autotools pkgconfig distutils3-base upstream-version-is-even
> gobject-introspection distro_features_check
> +# gobject-introspection is mandatory and cannot be configured
> +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
>
> or shall I send V3?

seems better please do

>
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2019-April/=
280958.html
>
> Andreas

