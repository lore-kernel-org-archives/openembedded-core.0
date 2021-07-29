Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.9712.1627566846162146886
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 06:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ssl3XvvG;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id n12so7086662wrr.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jul 2021 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=JdgAzland2ScLxp0p6Q21P9r+Cl28C8JTQ+6USTdEbs=;
        b=ssl3XvvGcRV9RFxuZlDOekTstaw3uIzQ8Y7mOU5yNmeH7tUqt45O3zLIAT0pTn0+/e
         ew8KjyOVYSOZL2E2+uC5mtwNg8EpF2dydewqoug4McoDzCC3K8mFBHBd41AHIo7k9ZEw
         CBuxiv2VBp/HJDdphcy0g65389Pm36iQcRtA0qPek5TFMPoN74fgk8jXYwhREai0jvj4
         Bvrj53ryE5XYrkHpgtrT6tjnPyws/yaaY3IxPzD8dLo7yvWmf1rYcd4CIEALmBRKeIa7
         Pc2B6TptehVCLJkJTmvK6B6qhdwkJiixO5snyGoGqabhAhGvERUguXXxjKRqDE6fLwcz
         mr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=JdgAzland2ScLxp0p6Q21P9r+Cl28C8JTQ+6USTdEbs=;
        b=LhxIAifAmO+o5tSn97XtIgFVpJSH4ZnN5qEwNG26UmEOb4mlP8vwA8q1Fl4jhpO5Sy
         fjU0cSZoFVPWvV8uF+9s+Ma7/tBMaBjPtYpJhOlYriQEYhZK6lo/tW1TrsKJCRzB3vWw
         OZgA9lxBXqi9/JrKKbcR9poS4IkdsBON5gScD3b8oNG8EvUrmeq/B4Y6LD9FZqCFbTo9
         hd52vSljHevW3m4aVhBrUbEAVSfoSQ6iEpnUbgyxhO0BQ4CCT08N6Fv9GPSfHLb1a+k7
         NqAjHartzTLZDC0N9Ik5LhNWjms2oozgRAQfa8pNNsOuyVqicSK8zpDS+uHPK2K0Q81N
         URWg==
X-Gm-Message-State: AOAM532/aWljBktgzFeXe+uNi/d3etOtR9iqDyebR8TM94ItRJTA69sM
	McE9OpujaljV4Ej0CDtSDCXwS4rBzL3fuQ==
X-Google-Smtp-Source: ABdhPJyHHtlAQS/a3WDQkimYkXbFzdkz3YpzTwvrzUahnj3S3UslbtSTR+YTmco2npZN3+aPYCp7zg==
X-Received: by 2002:adf:f512:: with SMTP id q18mr4954718wro.318.1627566844229;
        Thu, 29 Jul 2021 06:54:04 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id s13sm9541366wmc.47.2021.07.29.06.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 06:54:02 -0700 (PDT)
Message-ID: <19d2ad76f9ea70218116aa82205cc56a3331520a.camel@gmail.com>
Subject: Re: [PATCH] systemd: Fix build on musl
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Jul 2021 14:54:01 +0100
In-Reply-To: <423aed88f51b09d6342089f4b02dc9d62bbdb413.camel@gmail.com>
References: <20210727201325.2215487-1-raj.khem@gmail.com>
	 <AM7PR83MB0436960F9D4BFDD1F504F0DFF1EB9@AM7PR83MB0436.EURPRD83.prod.outlook.com>
	 <423aed88f51b09d6342089f4b02dc9d62bbdb413.camel@gmail.com>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
X-Groupsio-MsgNum: 154248
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-I9bYr1NSgeJp7NntRQkK"

--=-I9bYr1NSgeJp7NntRQkK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-07-29 at 14:49 +0100, Luca Boccassi wrote:
> On Thu, 2021-07-29 at 12:59 +0000, Khem Raj wrote:
> > Latest upgrade to 249 broke a working build on musl, this is incrementa=
l
> > fix to exisiting patches adapted to 249 release
> >=20
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> >  ...002-don-t-use-glibc-specific-qsort_r.patch |  24 +--
> >  ...missing.h-check-for-missing-strndupa.patch | 173 +++++++++---------
> >  .../0006-Include-netinet-if_ether.h.patch     | 147 ++++++++-------
> >  ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  20 +-
> >  ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  14 +-
> >  ...-not-disable-buffer-in-writing-files.patch | 143 ++++++---------
> >  .../systemd/0026-Handle-missing-gshadow.patch |  18 +-
> >  7 files changed, 247 insertions(+), 292 deletions(-)
> >=20
>=20
> Having a look at the patches, a few comments:
>=20
> - 0001-test-parse-argument-Include-signal.h.patch was merged upstream,
> but never removed, I think because it was refactored so it applies
> cleanly and doesn't raise errors?
>=20
> - 0005-src-basic-missing.h-check-for-missing-strndupa.patch this is
> massive and will keep growing and breaking the build, wouldn't it be
> better to just implement strndupa in musl? Even out-of-tree it sounds
> like it would be easier to maintain than this
>=20
> - 0006-Include-netinet-if_ether.h.patch sounds like it should be doable
> in a way that is compatible with both glibc and musl, and thus could be
> upstreamed?
>=20
> - 0010-Use-uintmax_t-for-handling-rlim_t.patch can be upstreamed but
> needs to be reworked slightly as explained in=20
> https://github.com/systemd/systemd/pull/7199#issuecomment-358268647
> which seems worth doing to me
>=20
> - 0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch I find
> quite worrying, as it fundamentally changes access patterns, some of
> which are done for security reasons. At best, this will cause
> completely different runtime behaviours for the same filesystem
> depending on the libc implementation, which doesn't sound great?
>=20
> - 0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch sounds
> like a genuine bug, have you tried upstreaming it?
>=20
> - 0019-Handle-missing-LOCK_EX.patch I see no problem upstreaming this
>=20
> - 0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch should
> also be fine to upstream I think, in src/basic/missing_syscall_def.h

Also isn't 0001-binfmt-Don-t-install-dependency-links-at-install-
tim.patch doable with two drop-ins and a post-install adjustment in the
recipe, rather than with a patch?

This also sounds like a good candidate for a drop-in, doesn't seem
generally applicable to me:

https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Df65757ad1791a4=
6cc210141c84ccc51552171e98

--=20
Kind regards,
Luca Boccassi

--=-I9bYr1NSgeJp7NntRQkK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCSqx93EIPGOymuRKGv37813JB4FAmECsvkACgkQKGv37813
JB7r/Q/8CHyeqcV2SQ2+1qKzrt5i8Pxraj4Z5pJ/zoozmv3sj2Bt5unNtfUR0ZR2
pan7fC6l2mjOLzUnZiAkO0x7sfpddUNDftuKMm8l5iqWoQ8KGZ3W9IFurYmOzrKZ
oV0pm3/M/Q5G/uane0BNRNUSohPQMTAIJLAt5/kejVam8+033SAWjfJzXRqorKRa
y3VJw99RhWDa9HzCGqmbba40L2XaHQI503eULdoedcnfVceU4LVN8dMkETtlc4+N
OdHe/0cQrFeSNLF7q2ivjccXL7RRkdIFgzehDbxV3Wh5HvbHHDLU8s7GpwMYX5c2
XTp2wwEASDH2AEF52g6VLSENih3qt9L94WnDcwE6/s8vD0FD78trk3zGypjKx6IB
SvXXW5Xc9IvjEoGnicaV8/ZKMYfb4z2s0F4Z2lA6escq5dhtN7mFq6wt5FnXS2Vi
kuRWsqwRxEyrQODEeIsqxsTXgLj3AZ8g1Y3xKOf333U+ViUPF5G161ySxCGJ+zYd
kxJsLX7glF63nHV3sP895bWAaUAwNxTjyHMZZnrzjFL+gMhCtRxmtYkWdLfmbehx
7+3tMIYNiRaFQlaQNxier5nf99P8zATysm/UVKO1v1H9S1ZbZ1x2cYw1QC+QvC+7
SXa1jZMf83YX5FQ4Iqxb/AybLDAXd81KnqgJMwVIqtJP4+Yt98U=
=aqNW
-----END PGP SIGNATURE-----

--=-I9bYr1NSgeJp7NntRQkK--
