Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.7485.1615809020680876810
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 04:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VQEBDLoI;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id f12so8506247wrx.8
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 04:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=/Apt//BTkS3tUNFftgZIH97RV1l+RQOUOZJRDALBpaY=;
        b=VQEBDLoI/gmut8i0CUHU8DEVwkU8DysVq9gvb1sh1Xl2oVWk9bJ67GZQ57oFIWH/AY
         1y7CG/Ib/6jo9LgOX7OWI5ZvQH95onJTQFKFrdHg8Q1GS9FmPQOdOPoFkzfEgOgj0SKS
         GClJIQfYuci/QQRb3+NPLt+Bgt0rL8iJdY4tNmvsCH+OKnQmi66ndIkhvnmmcrqKB54X
         rEMAd9vgfT7b9Yaswi1tzxAZ/02kWNtS8ThF1/DfBrnbST8xVpiXVjA5VpD1ANIrf2ek
         EzaEh9Txy1IYf9IVoBNOvuHWCSupMEC/Yq1k/jKC2d2RJVbg02X+avg2SYygeYiB3Z/1
         0rTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=/Apt//BTkS3tUNFftgZIH97RV1l+RQOUOZJRDALBpaY=;
        b=XQOhvuUJGxiHk1LoYvcMYZPLM+Si9u5XyadcTim/H6fc3pB1IWUSjvzj9cKLgoLUO/
         a3HeZZNoIHspW83n6iSOUCcnMB4BdcqCg+rjlCdgqiFptHdA05CXPH+19odLvH9bLP3o
         8dGcaqQgEURmnCTiyZ5zYPI0UYOak+qe+/QICqyh0WuP43qjhwLG4r1KRATnenOKh02l
         ZVWFlZP6yNqcbEGo81atWW5vb/7SmSbL9MQNZVL1fy+1IlTmhxYMingFCfQEBf1UQM3Q
         H/nbA5x04eoH3cw7xMjYFvk4XxI9UrKGzP74H7uIHj2vbukplyvVSwYWJyyTiM67uU8T
         SyLQ==
X-Gm-Message-State: AOAM530V+VTyBu2kSdt1knyvY1FKVDx+yVdfzstNaa3qHOXnKiHeoN6C
	iZmUv23ORotZUq1Q4o6u8ws=
X-Google-Smtp-Source: ABdhPJzzoRnuBXjt0AZU7VWFstGNErh3Unuxe/JmGZs1BLwCzUou6mhSB8AJ7LTmGjPP8IqV6gaVuQ==
X-Received: by 2002:a5d:58ce:: with SMTP id o14mr22212837wrf.4.1615809019151;
        Mon, 15 Mar 2021 04:50:19 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id i4sm11684248wmq.12.2021.03.15.04.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 04:50:18 -0700 (PDT)
Message-ID: <764f13d7a09be6a0d992651ca0f95b9180284544.camel@gmail.com>
Subject: Re: [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org
Date: Mon, 15 Mar 2021 11:50:17 +0000
In-Reply-To: <307a85e26da1a6fb90c274da8dbb5fbea457a156.camel@linuxfoundation.org>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210311150959.782186-1-luca.boccassi@gmail.com>
	 <39f7cdcc297fb447632b8b8f222c1a80d88d0871.camel@linuxfoundation.org>
	 <96cb1cfec8dca5eeca800aa238cab4912701621e.camel@gmail.com>
	 <307a85e26da1a6fb90c274da8dbb5fbea457a156.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
X-Groupsio-MsgNum: 149453
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-NYT0KXRAQo/nJWkuYFfq"

--=-NYT0KXRAQo/nJWkuYFfq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-03-15 at 10:49 +0000, Richard Purdie wrote:
> On Mon, 2021-03-15 at 10:44 +0000, Luca Boccassi wrote:
> > On Sun, 2021-03-14 at 22:10 +0000, Richard Purdie wrote:
> > > On Thu, 2021-03-11 at 15:09 +0000, luca.boccassi@gmail.com wrote:
> > > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > >=20
> > > > Recently util-linux gained an (optional) build dependency on libcry=
ptsetup.
> > > > But libcryptsetup build-depends on util-linux for blkid (optional, =
can be disabled)
> > > > and uuid (mandatory).
> > > > Split out util-linux-uuid in a different recipe to break the cycle.
> > > >=20
> > > > https://github.com/karelzak/util-linux/pull/898
> > > >=20
> > > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > >=20
> > > Unfortunately I noticed we had a performance regression in buildtimes=
 in=20
> > > recent changes. The closest I have this narrowed down to so far:
> > >=20
> > > https://autobuilder.yocto.io/pub/non-release/20210314-14/testresults/=
buildperf-ubuntu1604/perf-ubuntu1604_master_20210314181831_d42487bf52.html
> > >=20
> > > suggests it may be this change. I have more tests queued to confirm
> > > that definitively, if so we'll have to figure out why as this shouldn=
't
> > > really happen, its an 8% regression :(.
> >=20
> > Very strange that a single recipe could do that - is there something
> > wrong in the new .bb that I missed and could cause this?
>=20
> I'm wondering if it is because we're building util-linux twice now and
> there is some key choke point in the dependency chain. I have no evidence
> for that yet, it is just speculation though.

With the autoconf options I've set, on my laptop it takes 32s to do
configure + make -j2. Most of that is autoconf - make -j2 takes 8s.

Only 3 libraries are built with this combination: libcommon.a,
libtcolors.a, and libuuid.a/so. No executables or anything else is
built. It doesn't look like libtcolors is actually needed, I'll see if
I can prepare a patch to skip it, but I don't think it will buy more
than 1s, it's just two object files.

The good news is that meson support is about to land upstream, which
should be significantly faster than autoconf + make:

https://github.com/karelzak/util-linux/commits/topic/meson

--=20
Kind regards,
Luca Boccassi

--=-NYT0KXRAQo/nJWkuYFfq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmBPSfkACgkQSylmgFB4
UWKBCQgAqtGliPmhhx9tssBC+rgAuzhnUXIDPNKgr/nX2llmFXLRsvLYWghLHDaC
9Bus+l+wFoqGf/n3KVXd5Tq3+nqM0jmF3/Kh3gOUfSq0ytsxafxmRT3NU6WoYIOz
Ikmm0egOw+QlFp5iy8AhhABP9OeDSCUOWB5QI9FWdtnN47HFw+TwCbpNvIgyMmmD
SxNqTaQWbRcoCC5wDRFmFUy21iVwvwd7OnP6m77jU+O0BB88x1Yq5CV8Mgo9Q6Dl
ERXFn9Guvwz0JmcSJdMWPCdAsCDa+3f9mK+dB2slqrv8lNomIlVv51yLBEBEsCc/
XrAYRGrYwS8f64tppHPjmWpQoOplmA==
=wMHj
-----END PGP SIGNATURE-----

--=-NYT0KXRAQo/nJWkuYFfq--
