Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.93.1596816883366827483
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 09:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QS/oZePe;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: rehsack@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id df16so1645023edb.9
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2020 09:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc:message-id:references
         :to;
        bh=U/2+gXUH80ApYlKX9rtDVlmmXdC994Uj1DixqwvLJF8=;
        b=QS/oZePekSODrU/KnzRXj2VbHlixUrAw2Zf++6Iytenz+D+/mb/MeoEMo6U384+EB4
         g33LrnF21GsdkAKbnS5Wsmczm9ZB2svR97md/MnXUNeDkQ9zZj09HFnyRhzgsxzLSFHN
         F444uXuYGLPBKbTvqyPklqIBJNY5S5ezYlGS4lPAN2tTlBVEKkQyqwzR/jdV/R1yjW9J
         Acz+1eFiYr0uI6kiETwfPCVAJZ7Iym/NS88rRXaX+HkNdBQXfeWV/FiN4ygyBXuy2xNz
         x8vK8RHpMNTS9lSJ73rGYm7OHOvzLy/wsicmOWXXDUZ51m5PHA3EjKT4NBvcSYTG58iZ
         E/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :message-id:references:to;
        bh=U/2+gXUH80ApYlKX9rtDVlmmXdC994Uj1DixqwvLJF8=;
        b=E7xUsjnIrmOwIZwdVe2G6cSZFERM0AGdh0oyppTyfjLyva+3Wu9513yKOl1FOgvXWQ
         LRFj3BvjwImxAK/d6MPKufLauajrDbiyJPXhKjQb9xGc2HdIFUWZ5lndxPbS7peNI7/i
         F5G9OdBss06ewPUSa0F3MipLYk/VftjsQHlWnbgZ0HgI0ElfcUWbWLu9W8UX3eLBsaMd
         f2l7zX+8sbALJHwj33OJPmQ3668Dp8jFcHM9tCCsRvXBQh9uKawJDUADorTqn3f+J/Ao
         y0u6CaTuWC6FZ6ISSo8+bEMUaF6riA29X+EBlNb57AwbjekDFeovQ3iqKKONFs4a3pZM
         FI5g==
X-Gm-Message-State: AOAM5316IzVwAdoA/osmmQlEJDQx1k+7Q6jaxNJzbQZWWocHGNXGKdyV
	zxN0DojSFyha+gXnJrFVFi8=
X-Google-Smtp-Source: ABdhPJxoVqG46KJs+BWoySUBEryGdeOR18jRZTpwTJkentlSdyqD3Ipb8afHJNTfEGQH8GU9qL1ALA==
X-Received: by 2002:aa7:d983:: with SMTP id u3mr9843548eds.366.1596816881788;
        Fri, 07 Aug 2020 09:14:41 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from [10.42.8.217] (p5b25b5e7.dip0.t-ipconnect.de. [91.37.181.231])
        by smtp.gmail.com with ESMTPSA id e6sm672969edu.36.2020.08.07.09.14.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Aug 2020 09:14:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: environment-setup.d usage in SDKs and eSDK
From: "Jens Rehsack" <rehsack@gmail.com>
In-Reply-To: <da1885af24ecf70823c3aa80ba668cc71493582b.camel@linuxfoundation.org>
Date: Fri, 7 Aug 2020 18:14:39 +0200
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Message-Id: <5751DB36-25F5-4995-9CC6-106C30D0DF66@gmail.com>
References: <da1885af24ecf70823c3aa80ba668cc71493582b.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Groupsio-MsgNum: 141299
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7B4680A6-5DC4-4F14-9AE6-60D2914D9A74";
	protocol="application/pgp-signature";
	micalg=pgp-sha512

--Apple-Mail=_7B4680A6-5DC4-4F14-9AE6-60D2914D9A74
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 07.08.2020 um 17:17 schrieb Richard Purdie =
<richard.purdie@linuxfoundation.org>:
>=20
> I've just spent far too long staring at this so I'm going to write =
down
> what I found out. I may as well share it publicly.
>=20
> An eSDK can be used like a normal SDK with an environment file that =
can
> be sourced. The challenge is that an eSDK contains native binaries
> rather than the nativesdk variants in the SDK.
>=20
> This means that where an SDK has nativesdk environment.d files, an =
eSDK
> ends up using "native" environment.d files which are not used in any
> other context.
>=20
> Some recipes like cmake implement both. Some others like icecc or
> openssl only have nativesdk variants. This probably needs cleaning up
> to be consistent.
>=20
> It gets worse when you find that buildtools is included in eSDK and =
its
> environment file is sourced. This means you get a mix of nativesdk and
> native. If you set OECORE_NATIVE_SYSROOT in buildtools, it corrupts =
the
> eSDK's variable of the same name. This why buildtools has a hardcoded
> list of variables it puts in the enrivonment rather than using
> environment.d.
>=20
> It would be better if the two sets of environment files (native and
> nativesdk) referenced different variables as currently the two can't
> coexist. This also really needs to be fixed.
>=20
> Cheers,
>=20
> Richard

Thank you very much for your patience and time digging deeper into this.
Maybe I'm getting the chance to help something - I forwarded this =
information
to the team and look if we can use both, SDK and eSDK so we would need
those fixups (and thus do them then ^^).

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_7B4680A6-5DC4-4F14-9AE6-60D2914D9A74
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAl8tfe8ACgkQRJmWrtzl
Cp0vYA//Z1NByUBsDglVJfRnVNWV2SwKSHXReyf2cnmNQd+ZmSCiv9Wavay5hzkr
oEQTcD94SXHBFv3dzh0Rfz44JhBPT7+C3N71DeJhM4oIwnOiZa6RUfJbOp4crCDk
Gw7wqRswPx1m4ATfA3snhl52QHbs4PcZ0PLo3Oq8Wj88ORObz/F5zv/Kl1z5wVEm
UbB2olaqiWY6onoc2s0QhMauMNwZ6FpJ1kKM1vYFIcRrTRmVqZkbAyyAHVNQ64+K
Ps5zDfBo6Bw0/XaXB8ZULrH+LsBvKz3EX9ntHW1gVZnwSVk9CPN6Koe7w+K0DXkz
Og3Ti89Xv/l15y1DbhgvVAS8586/tDXSFLZ7EfbXN6TuHPEA3evQgpttWrVM3j5A
0Sxs14WIaYEK4lVIlekjWaCzTyChTgoIfXMCSGmCLoRTSiQ54AoV3SVfJwEsYSgP
O/XGD7tJpD+9gEE5wRR4VkaGe7ksxkwccRkHU1CLVH9OoaWMMawNtLQlSws+gGru
pdsyrzLboZGAOT2xGOdqAW+iIWVSjhK63Ty0PGADHPLZ6bJOnwTvkXPNB0vudsu/
4mKXiVpyRHn8rA7J6dpnGsfwD6YpiZO63nXBkmY4r0boHr9zOdULh6XWeUDZtZxD
gfQ3G9Rvd3K32OM5MmdcDTu88LZxBpPexzX3FZRv0GsafKW/Zt0=
=vO+E
-----END PGP SIGNATURE-----

--Apple-Mail=_7B4680A6-5DC4-4F14-9AE6-60D2914D9A74--
