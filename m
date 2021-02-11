Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.7435.1613045123941059299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 04:05:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dnuewRBO;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a9so9694347ejr.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 04:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kpYMJwsFNqJEEjGo1bljoFqFJvZnehmxNPuBLC5BSY8=;
        b=dnuewRBOAf7XfFWfUdv7f5O0hwo+hSTYbGperm+nZ05lFOLhFu/mlPwpXoaUkoCP+x
         eM9gXHSJhnwy6Vq+LXrICocMq5n9ODjRCXv04hbGIpZSpnCedKuY1BdRyb5+6kHMw9bI
         1VEIFEjYsRIyntU+CK9U6KKzqcJz3pWA8i7oldPyepNk/biavy7Lw3zUeOdFHtFsLEvk
         qGObnh1W6D4uLzTw6Ay758iuUgVFw65Ucl1KZodV6OjfH3ffG3akkbLeoFQ7hVC1Qe+8
         VlCwb8KOSx/XNyqPdvbyT4RqNJqrJQpPXI0Z/ZITExoZPRpUeweg6Q5ZWDGne6/Lk4SS
         o0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kpYMJwsFNqJEEjGo1bljoFqFJvZnehmxNPuBLC5BSY8=;
        b=hSwfyjBE4CHv6GWmHLQvRiHDiT/C8ZvePR2uDEMyMtHJw6AcploaO74TD7gNQxo0d+
         6iUhBhmA6Ao3QtaRAOtfLEHWErWH4xU6dKpfln8dJ5Y7pdpM+Qy2om+ztbBLzUiP4dHH
         71xDYjtvmP4rFV9jmewrsRXbiqsT+/HxVDr/CmCtrBx+rldAcQP/ZJ6XzU+7FtBi6GQt
         6D6HeGJ4ipUw01QBi3Eus/4ZU3v+7pAKRg5kmh+2PxUIgetYP59hO62hP39kig9C2s7m
         XOipgRIu2vi6795VUDhH4/yyjgb8xNEArPHDJVnYdPqAYgVeVlCavRZiMq8mnw6MEydd
         IaCw==
X-Gm-Message-State: AOAM533AEZ15oXbgZEVS8PGYNr2eCEiLUaP6QuniERhjhePbcOBulqZ/
	CypMUNREh6Q/ancnzqmqsZs=
X-Google-Smtp-Source: ABdhPJxiMqZYiyItu+uwVDeUclW7bVyEIg5Pv6StKYq4AdCsMVY7ikNflXLLWNT7ceZ1SNE2RI41Cw==
X-Received: by 2002:a17:906:3649:: with SMTP id r9mr7998489ejb.202.1613045122295;
        Thu, 11 Feb 2021 04:05:22 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i18sm3740571edt.68.2021.02.11.04.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 04:05:21 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 11 Feb 2021 13:05:20 +0100
To: Ray Smith <raymsmithuk@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Andrey Zhizhikin <andrey.z@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] mesa: Remove dependency on opengl or vulkan DISTRO_FEATURES
Message-ID: <20210211120520.7h32qy5sqasyplv7@jama>
References: <20210210111113.17318-1-raymsmithuk@gmail.com>
 <CAP9ODKqqrhboqgEGa_7MRprs2OZhE8GMRFCS3K77Jt2-4G9KKw@mail.gmail.com>
 <CAHS1ALKpm9+5Fa+roQ8ZJ3m3jGa3m=yymWpG8ftfEkVdAk+RqA@mail.gmail.com>
 <CAHtQpK7rFBrGHUJ2TG-Xke4V-kZc2jJF4hZgO5LtdGef4vNQfA@mail.gmail.com>
 <CAP9ODKorRTxwsCdJPGT4hzG5cd560EUuOeGzVgnJ6CNLAhxjYQ@mail.gmail.com>
 <CAHS1ALL+u0sRMTVb5uXJg67aLdxm4aYoCriv-1vM4WKNfyh0Qw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHS1ALL+u0sRMTVb5uXJg67aLdxm4aYoCriv-1vM4WKNfyh0Qw@mail.gmail.com>
X-Groupsio-MsgNum: 147946
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ghn5vowag4q4eenj"
Content-Disposition: inline

--ghn5vowag4q4eenj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 11:59:43AM +0000, Ray Smith wrote:
> On Wed, Feb 10, 2021 at 9:36 PM Otavio Salvador <
> otavio.salvador@ossystems.com.br> wrote:
>=20
> > Em qua., 10 de fev. de 2021 =E0s 17:21, Andrey Zhizhikin <andrey.z@gmai=
l.com>
> > escreveu:
> >
> >>
> >> Should this be clarified with Mesa folks upfront? If you believe that
> >> this limitation is rather "artificial", then there has to be a proper
> >> explanation from Mesa developers why OGL is provided when OGLES-only
> >> is built.
> >>
> >
> > Agreed ... I'd rather not drop the check until we hear from upstream the
> > reasoning behind it.
> >
>=20
> This patch is really about the first line:
>=20
> > Mesa doesn't _require_ either of these features of the distribution,
> > it (conditionally) _provides_ them.
>=20
> Even if we had an opengles distro feature that solved the GLES vs OpenGL
> issues, having a 'ANY_OF_DISTRO_FEATURES_class-target =3D "opengl vulkan
> opengles"' line instead still wouldn't make sense (although it would solve
> my problem), because mesa doesn't require any of those features. This line
> is effectively saying it depends on the things it provides.

Or you can read it as that it makes sense to build mesa recipe only when
DISTRO supports opengl or vulkan or opengles, which IMHO still makes
sense.

Similarly when DISTO_FEATURES are used to set PACKAGECONFIG values, it
doesn't say what it requires, but what DISTRO wants to support.

--ghn5vowag4q4eenj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYCUdfAAKCRA3VSO3ZXaA
HPTdAJ9rpO4JKK2+r8Kc13PjTe3Inlq6WQCfe4Dwybg0EyGYtiElGjHLQpdGBns=
=mzwV
-----END PGP SIGNATURE-----

--ghn5vowag4q4eenj--
