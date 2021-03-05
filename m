Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.10331.1614942223154784078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 03:03:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nNoYDuFr;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id m7so1088957wmq.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 03:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=TvAmGFREbgEqVIeZpDkR7agtZ9W9Putp9GunIybPNPE=;
        b=nNoYDuFrJoFqp1o8FpqDeBJAoxnKYe8qCouryNQtKKHHRkdVXCSGmyw5WmAIJeMR94
         WwMx2468rUHuvESFXiatVVGsMyMnGClRSHeehYsobnKydIzmyWVDlXd4erYtRX1AONXT
         mi5BbVjL0qwl2/k+H7sX21WkVKQTa9Z9tIAx0731zHPQyU8NR1W6sK/H+olXyPRdnAPe
         W49Xcdhh3hX93hbQ8FHBs7u0s3fDzaCC7aqJorZKPwg0bjC6NmIvQgukxHAInOBX0h1A
         5RONKMnOC8KBntlRFl/6wwlQCr4LLRISYTUpdwaoUZc5/zMxiYw3+g5X8y1NKJtW6zSh
         t7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=TvAmGFREbgEqVIeZpDkR7agtZ9W9Putp9GunIybPNPE=;
        b=uLCN4I5FRgcWQ2cZ5NcrYs0zp+qSB+M4edRU2TnWd+Q06quBangKeWIv9ef80UHPKp
         tKIogZa8ylD7Qrcfp7ivJQJ3U2VdyKvViWV+i2STMT1P8k1QscPxKyjeKMpEgco7hV2w
         Hj6F1bAB+jQmaY3K7QA+J4m7GGPf8EKpTCqmMCoisIX9Xjc56dKGdfr0H0uiDXFzJKhN
         Bq7QdQ9vaYXvHIu/DDPygGxtexWo41SEn7Xf7ZcHFfBCoTL7nrAZNYuu+pOg2Ote4zwt
         6KdnFgWkBzmISZUxfx9DWm+PCu5XeQVSuOGxQJQxRmBCtgkDYhISFCBX9YF37S50eg8w
         GL6Q==
X-Gm-Message-State: AOAM533jrpOkW6wILppeqCEzMkHZiRysm4JqDdAbye3TZMei28WhLBbf
	Lr864Nq2p968GN1YEfw6pTdhcNSTQog=
X-Google-Smtp-Source: ABdhPJxEvxrPlQ1zzGxqWIh8MHECAJkfTdTi7cvYq05VTIqpczPqP3OfXDW2E66GA0KMMAcvvmqGDQ==
X-Received: by 2002:a1c:2e58:: with SMTP id u85mr8105148wmu.71.1614942221486;
        Fri, 05 Mar 2021 03:03:41 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
        by smtp.gmail.com with ESMTPSA id c26sm4304492wrb.87.2021.03.05.03.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 03:03:40 -0800 (PST)
Message-ID: <44eba28893dc537bc1359353d21671595bc0c13b.camel@gmail.com>
Subject: Re: [PATCH v6] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org
Date: Fri, 05 Mar 2021 11:03:38 +0000
In-Reply-To: <cd951f10bfdf495c3dd21495e36e2142cf5ca763.camel@linuxfoundation.org>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210304122732.2659524-1-luca.boccassi@gmail.com>
	 <cd951f10bfdf495c3dd21495e36e2142cf5ca763.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
X-Groupsio-MsgNum: 149023
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-lziP2XYtqFRfDYpk/wO9"

--=-lziP2XYtqFRfDYpk/wO9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-03-05 at 00:13 +0000, Richard Purdie wrote:
> On Thu, 2021-03-04 at 12:27 +0000, luca.boccassi@gmail.com wrote:
> > -RPROVIDES_${PN}-dev =3D "${PN}-libblkid-dev ${PN}-libmount-dev ${PN}-l=
ibuuid-dev"
> > +RDEPENDS_${PN}_append +=3D " util-linux-libuuid"
> > +RDEPENDS_${PN}-dev_append +=3D " util-linux-libuuid-dev"
>=20
> The mysterious libgcov.a issues which appeared in builds when this patch
> was added are due to the lines above. Changing them to:
>=20
> RDEPENDS_${PN} +=3D " util-linux-libuuid"
> RDEPENDS_${PN}-dev +=3D " util-linux-libuuid-dev"
>=20
> resolves the issue. To illustrate, have a look at "bitbake glibc -g" in
> the task-depends.dot file before and after that change.
>=20
> The problem is the native BBCLASSEXTEND code can't handle the
> RDEPENDS_${PN}_append correctly and it means in the native case it
> adds a dependency on util-linux-libuuid rather than a native
> version.
>=20
> Why does that cause the gcov error? Its because there are early toolchain
> util-linux-native dependencies which ends up meaning glibc sees a libgcc=
=20
> dependency. It usually uses libgcc-initial and that has overlapping files
> with libgcc and libgcov.a is the first in the sorted list.
>=20
> Again, we should have better errors for a native recipe depending upon
> a target one and show better errors for this configuration issue. It=20
> does at least explain the seemingly strange errors.

Thank you! Sent v7 as suggested after a quick rebuild check.

When to use '_append' vs '+=3D' is one of the things I'm never sure about
and invariably I get it wrong most of the times.

--=20
Kind regards,
Luca Boccassi

--=-lziP2XYtqFRfDYpk/wO9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmBCEAoACgkQSylmgFB4
UWK+XAgAuoMhJS5WnpXGtJslEDWelXLqFtXKjKP+agOqgRs6PD1pIjyHrbrIWOeG
NtKuPHTcCjE7JL6/+OD6ia8hEqodBY1e2DXq0qJ/c+30JRD3fSTRM3U+PXlKpJjk
ow+fGdaWNMZcdcYplcgSCXL0X45I1VyD/DOdaMAFCclobXppbS9hXK+8mq04E+hu
2IwDTZMlgsLaEAIsPj7pGyIH2tBChqXm5WhUQz6Nc+Vh/H0gybZj24kCQMS0sN6H
ytAP2m3NeBqsnHFFjdQYBr60umEEy8Q5nuXFCl2mHWpzltXM73FRRB5sGeE4j1/U
s8XLVVlzoWjfCQp2Bg0mvsRDttjC6A==
=i6yt
-----END PGP SIGNATURE-----

--=-lziP2XYtqFRfDYpk/wO9--
