Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.8259.1615813462648870691
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 06:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RJYa7aZl;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 124-20020a1c00820000b029010b871409cfso20214678wma.4
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 06:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=jIgmXVkUBzkIaVE35Vf7+e5Am5kbUp9wVyWCrL4BXro=;
        b=RJYa7aZlM8msSyt6gM8aTiN+tBy5YlNHVv/B9VNNoK/DdEoJuhWBNFMIz+JJ1K1uBM
         yd2YotmQXJgDME+bNmh2g8AqmLsG5x5+CdDXPrDwILezS2U7j1lI2Di/K/qXAPDmGLU4
         odWNZ2EfLzwBGpWijT8fEdo8rZ5eb1OvbmqmUKPBTVcwWPjwUgVb0mWkP/556wk4tWxL
         X/aTDMTVtU335zSnrLGI0sjStmpOATaT+m8V2BKnh7CgOjCOS2uFnJUUzrdKYh6DvQqt
         0Ipp1wCYQI1StK1EPAJqPQZ9KEvZLTb3rmEK2W9zMOqx/BDS8m2j7xqfvp8WAnNr/DGV
         GZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=jIgmXVkUBzkIaVE35Vf7+e5Am5kbUp9wVyWCrL4BXro=;
        b=tNVokMMQVYJFHD6niveOmLG2EQYeZPvOer3mConSaixIARyD2mtabpDQUy907+jX9c
         icIakYc8zniJFwasL/m9zEMY6zJtYXSs5lgCzHbdLWRajWQzMQVS+G7CsG22Rky8EmcC
         cyaCOj8kulNGxINQ+ZRyqxWAlzJq0L2nQYn+GazIyAtIO0J9/K7yCmZwr4P+yka1tUmc
         /aXqjOr66wJmyNCiGM0UfQY//4mgABmtOEp/lrCEzOQGUGZqk6N+fKctCmg+TjhmA0Ff
         BqF05mWx8pnmQnBQRMa1BEJEJZwnX3aqFhpVhiZENzdTf1Av6+IKACBWUw5ic7w1vKLo
         clZA==
X-Gm-Message-State: AOAM530+qsz+AiQHoCN2I7fFOFrA3uIUdQQT1iq8ng+d+g4rJ5cGxMsc
	8EYpucXpP46if5KFNg8OLT8=
X-Google-Smtp-Source: ABdhPJytTDwDyiUI2nie7gtdFhJk5x72xPVfPepov0UNbX57JihO8XsTIBUV6ll0oiKEutg0yeuKXA==
X-Received: by 2002:a05:600c:22d9:: with SMTP id 25mr25578541wmg.108.1615813460718;
        Mon, 15 Mar 2021 06:04:20 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id p18sm23169986wro.18.2021.03.15.06.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 06:04:19 -0700 (PDT)
Message-ID: <08ca466e258707f3d58fedb1170b5d3e7bb9c145.camel@gmail.com>
Subject: Re: [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org
Date: Mon, 15 Mar 2021 13:04:18 +0000
In-Reply-To: <82b8349fa9de8918ddcb70993e438d9795de4700.camel@linuxfoundation.org>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210311150959.782186-1-luca.boccassi@gmail.com>
	 <39f7cdcc297fb447632b8b8f222c1a80d88d0871.camel@linuxfoundation.org>
	 <96cb1cfec8dca5eeca800aa238cab4912701621e.camel@gmail.com>
	 <307a85e26da1a6fb90c274da8dbb5fbea457a156.camel@linuxfoundation.org>
	 <764f13d7a09be6a0d992651ca0f95b9180284544.camel@gmail.com>
	 <82b8349fa9de8918ddcb70993e438d9795de4700.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
X-Groupsio-MsgNum: 149457
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-WuSG40eV56z79slJWVWm"

--=-WuSG40eV56z79slJWVWm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-03-15 at 12:21 +0000, Richard Purdie wrote:
> On Mon, 2021-03-15 at 11:50 +0000, Luca Boccassi wrote:
> > On Mon, 2021-03-15 at 10:49 +0000, Richard Purdie wrote:
> > > On Mon, 2021-03-15 at 10:44 +0000, Luca Boccassi wrote:
> > > > On Sun, 2021-03-14 at 22:10 +0000, Richard Purdie wrote:
> > > > > On Thu, 2021-03-11 at 15:09 +0000, luca.boccassi@gmail.com wrote:
> > > > > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > > >=20
> > > > > > Recently util-linux gained an (optional) build dependency on li=
bcryptsetup.
> > > > > > But libcryptsetup build-depends on util-linux for blkid (option=
al, can be disabled)
> > > > > > and uuid (mandatory).
> > > > > > Split out util-linux-uuid in a different recipe to break the cy=
cle.
> > > > > >=20
> > > > > > https://github.com/karelzak/util-linux/pull/898
> > > > > >=20
> > > > > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > >=20
> > > > > Unfortunately I noticed we had a performance regression in buildt=
imes in=20
> > > > > recent changes. The closest I have this narrowed down to so far:
> > > > >=20
> > > > > https://autobuilder.yocto.io/pub/non-release/20210314-14/testresu=
lts/buildperf-ubuntu1604/perf-ubuntu1604_master_20210314181831_d42487bf52.h=
tml
> > > > >=20
> > > > > suggests it may be this change. I have more tests queued to confi=
rm
> > > > > that definitively, if so we'll have to figure out why as this sho=
uldn't
> > > > > really happen, its an 8% regression :(.
> > > >=20
> > > > Very strange that a single recipe could do that - is there somethin=
g
> > > > wrong in the new .bb that I missed and could cause this?
> > >=20
> > > I'm wondering if it is because we're building util-linux twice now an=
d
> > > there is some key choke point in the dependency chain. I have no evid=
ence
> > > for that yet, it is just speculation though.
> >=20
> > With the autoconf options I've set, on my laptop it takes 32s to do
> > configure + make -j2. Most of that is autoconf - make -j2 takes 8s.
> >=20
> > Only 3 libraries are built with this combination: libcommon.a,
> > libtcolors.a, and libuuid.a/so. No executables or anything else is
> > built. It doesn't look like libtcolors is actually needed, I'll see if
> > I can prepare a patch to skip it, but I don't think it will buy more
> > than 1s, it's just two object files.
> >=20
> > The good news is that meson support is about to land upstream, which
> > should be significantly faster than autoconf + make:
> >=20
> > https://github.com/karelzak/util-linux/commits/topic/meson
>=20
> Meson definitely improves the speed! I was wondering if it was from
> configure for example.
>=20
> I now have more performance test results in (takes time to interleave=20
> them with testing of master):
>=20
> https://autobuilder.yocto.io/pub/non-release/20210315-1/testresults/build=
perf-ubuntu1604/perf-ubuntu1604_master_20210315005048_6bb1621815.html
>=20
> and I think this means it isn't from the util-linux change but one of=20
> another three. I'm not entirely convinced those changes could do this
> but it is what the data says.=20
>=20
> I've queued more bisection to narrow it down from there...
>=20
> Cheers,
>=20
> Richard

Ok, that's good news then (at least for me!) - in the meanwhile I had a
look at automake anyway, and found out the compile time can be halved
since libcommon and libtcolors are not needed by libuuid:

https://github.com/karelzak/util-linux/pull/1262

Not sure if worth backporting, as it's just a dozen object files, the
big time chunk is from autoconf anyway.

--=20
Kind regards,
Luca Boccassi

--=-WuSG40eV56z79slJWVWm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmBPW1IACgkQSylmgFB4
UWIcfAf/ZabGSbQJG3TfogTcoodbxB9sj4VUm1DOAMRh/WQibsnt0Utz1JWIUjHZ
CIIQk2UKbfiWfm1YaYWWpfxAoaeIYtcFce87seaGfXwZQlwIgn4K2N1zTkYNcYSs
MV3qGeq89k3FIeA76MfVUnR+yKtW9n4iK9IVmIkP6eKOlqXlMpj83UbkE7Em7qOX
bUIy3TpHdzXjNCg5bFLTqvDy0ouciTiw8T7lIx667XEPGygTDQAxKkXda9FxGqRg
cmnjr20RV3dQx6fMxOFBP7drU2jmKvaVkaqN448ISgwWeeJhJAKXfoqbjLfyA3ZP
Vkp4d4hO0wJ48Plu9/MLJTItIf/+sg==
=CUvn
-----END PGP SIGNATURE-----

--=-WuSG40eV56z79slJWVWm--
