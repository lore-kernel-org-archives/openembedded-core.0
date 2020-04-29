Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.2088.1588161028579730689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 04:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DCyzcWbd;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: bartlomiej.burdukiewicz@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id a21so2247144ljb.9
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 04:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version;
        bh=EvARvPx1f0lIhx5FDlA/GTKHDCvUa+zMZs+FqLf0Sz0=;
        b=DCyzcWbdkZ4sF7xF3UVvAQm+RHbJcItsILf4sde+Q9hzL3CgSCFWdVm7ac8FP+UKJk
         NN6y2p10dT9lP1j3xZBRwBXh1ur11smnkeZhDTQd88l1nicsiMK/5sOM1EYHwTPg9+np
         xqNC+77em8EzPSykoPHj9nLky9S3dygxrve3/YMFQgE1fps/cGVR0tv46KpfHCPQjciq
         QJCe/UVWxyLRJG7mbeEtRYYRu9lUPgnOqTRm03rPrwHPdAK/E7/Vk1qmvy6gIwYE1LuE
         ysSrJuavGMGRZ0S6HIb4Wh6Lsmuwrt5CKVXWagnSEV0MT9GCoOIO4FiYLZQhSdf6HUtK
         eEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version;
        bh=EvARvPx1f0lIhx5FDlA/GTKHDCvUa+zMZs+FqLf0Sz0=;
        b=C8kMHp7BaeiKpPwyWlMIbN82pSNeImnKRBfSkUcptQ1BQj3yw2apdNu20kUKu6LT6v
         8NsaRUChblm0b245O8xc+3d81PI9v3IbjU+YZRt790S2BL7ksX394nzsU/7LE3kctHv6
         UNusdUUX+K1pssLM5doHSero4gY2IzhQky6ICgaReFDh+2iWva5TCyRgMeMka6chS5p0
         7dIb30gElYSdPKHArKc4jQr3LEWxLm9maeRpYPoY3AGYeYUnl4VFs1TXwFpeuS2oe7lA
         tEFNihkAa7fmTxBnEkYdmw353Kiqu5A9AxsDBcD7NbtFb6N4v5HPlg5voSr4a8p0ctcq
         yd6Q==
X-Gm-Message-State: AGi0PuaxYo0XlhEMWS8EYrD2uQliWgWAbqcS4tUjCY6oxgnX5koaa6CJ
	K7+ffbU1w39zLDwx8N7B0ey5iyNMYuoLZA==
X-Google-Smtp-Source: APiQypJBR0Qlm8fYN9SqYmj8bm2wXkOPZ4a5pKJIpygxRuc2BLhWJDXnNs7m99a0QmOUtz7GHrVuWw==
X-Received: by 2002:a2e:89cb:: with SMTP id c11mr21406909ljk.121.1588161026150;
        Wed, 29 Apr 2020 04:50:26 -0700 (PDT)
Return-Path: <bartlomiej.burdukiewicz@gmail.com>
Received: from navi.localnet (dynamic-78-8-50-212.ssp.dialog.net.pl. [78.8.50.212])
        by smtp.gmail.com with ESMTPSA id 12sm2327894ljq.0.2020.04.29.04.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 04:50:25 -0700 (PDT)
From: =?UTF-8?B?QmFydMWCb21pZWogQnVyZHVraWV3aWN6?= <bartlomiej.burdukiewicz@gmail.com>
To: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Anuj Mittal <anuj.mittal@intel.com>
Subject: Re: [OE-core] [meta-oe][PATCH] libva: Removed virtual/mesa dependency
Date: Wed, 29 Apr 2020 13:50:19 +0200
Message-ID: <2195913.ElGaqSPkdT@navi>
In-Reply-To: <376f53f97f8eed5797ddb21d52fe8e0b5b9fc87f.camel@linuxfoundation.org>
References: <7de2a86b-e32c-35ae-716d-505845a837b2@gmail.com> <2255490.NgBsaNRSFp@navi> <376f53f97f8eed5797ddb21d52fe8e0b5b9fc87f.camel@linuxfoundation.org>
MIME-Version: 1.0
X-Groupsio-MsgNum: 137594
Content-Type: multipart/signed; boundary="nextPart4571521.GXAFRqVoOG"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart4571521.GXAFRqVoOG
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Apr 2020 10:47:42 CEST Richard Purdie wrote:
> On Tue, 2020-04-28 at 01:09 +0200, Bart=C5=82omiej Burdukiewicz wrote:
> > Other media player don't have strong requirements for GLX.
> >=20
> > I'm now totally unsure. Probably adding PACKAGECONFIG with glx flag
> > (disabled
> > by default) will be better approach with conditional virtual/mesa
> > dependency.
> > This will fix recursive dependency problem for common cases. There is
> > also ton
> > of articles that GLX is deprecated, so softly going away should be a
> > proper
> > way.
> >=20
> > Or just those bbappends should stay where they are. Another thing is
> > that
> > meta-intel layer introduced libva-intel package which also need
> > separate
> > bbappend to remove virtual/mesa, this made me to post that patch in
> > first
> > place.
>=20
> Turning it into a PACKAGECONFIG is definitely a good idea and I'm happy
> to have a patch to do that. What the defaults should be I'm less sure
> about, initially leaving as it is today, maybe discuss changing the
> default in a follow up second patch?
>=20
> Cheers,
>=20
> Richard

Ok sounds reasonable, I'll prepare new patch and do some testing around it.

Thanks,
Bart=C5=82omiej=20

--nextPart4571521.GXAFRqVoOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEhZwkVUCmwRFjZfunQ+DhhJwr0RgFAl6pafsACgkQQ+DhhJwr
0RjZPQf/Sx9jo1/96vOXiktbkAhZCuf0p9KPqO22UdmFVvmOePW8d/alP1Ak0kQq
my8K5YVsY2yzERN23t21W8gaxmltnIQOPF2Hz+3n6ReInca/UD2M62qiAQzGrjTV
oVQ+ikvMn8QjHhAvrOK/8MAZYVq2/QhfF2ISdQBYhYiTxT1s7N+WZRInmWMCHfsO
LrIzMXX41jl+f+aOiffTIw1NgVsAkEavYNKo3fA5zLw6mTtnHlM6XHYYgJEq7BuW
FaOOLboFubojVmuX08vgOsmuXY0szM33Q2FIhyKWAdTI3R16UREqr/Ljpq+VzSZc
0e/8kaTCc6VjNYyeV/XPbTyyRSuf4Q==
=9y5o
-----END PGP SIGNATURE-----

--nextPart4571521.GXAFRqVoOG--
