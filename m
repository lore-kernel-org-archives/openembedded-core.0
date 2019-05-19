Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id 174FF6010D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2019 00:13:30 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id k128so2086193ywf.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 17:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hpczqDSYKlkvCWlbolYLWYzn+L9FJ9vyZfCe7a/qcF4=;
	b=Y/swram+iqc4GO8T9psLfGC9QdYhoq9wvMYkSOGMVz0e85fAn6HFH7wBCU8BaPJxJ3
	gSvBNn46IX7BkZABO5wI1ryYXBL1IWbgE2Ih+H0/8cdwhC3AcEFuJqZ9rBgGN4K2b4fQ
	OKunc44axBIOGpGLd4PztkrejJQ5/6TtnCx18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hpczqDSYKlkvCWlbolYLWYzn+L9FJ9vyZfCe7a/qcF4=;
	b=kU77ycKhf49XlNgg/XTIJQOSdrY0u2xOQepDVCZF4vrnWmmUenQSNbzoUsck35c5Kb
	82QtiYAevwpqQqkVGCxxBSune8podgeFqXhTsE2U9+HDyhrlU0ge4bugxcH2g6jPubVJ
	c4PGIYpv5SiO3GRZqQV9FScVuh81j3t7+l1D3DO/RViQdNqdn7gx6P98/dlZVh5C5s94
	jEaMR2Gn3ObmNuLPS62fkD3H6mvAV6UKj9QzaZFpnmWzrTsCzF2s4lV005UF8hROhxGb
	202WTI0sSSoc/s5g6/Ofa3uSRqjNtSakyhSDyo3/5oYhNDONzwit3kpGOrxJzFrV0hG4
	viVw==
X-Gm-Message-State: APjAAAWbS8BWXnKhfeREqKpRvO2fmUEcEWGLgBAp7Rkk0qSETeqlNXbV
	evlUni8KtR+l8kF9UTjn2CbjMQ==
X-Google-Smtp-Source: APXvYqyrmsTbmUqqoq4ktjhVMKfJF0UCzT9oLswjE+VxkEW6VN+4DI+zr3h4vmxJPOX4yPeXuMIUdw==
X-Received: by 2002:a81:616:: with SMTP id 22mr31927482ywg.234.1558224811757; 
	Sat, 18 May 2019 17:13:31 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147]) by smtp.gmail.com with ESMTPSA id
	s17sm3729350ywg.70.2019.05.18.17.13.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 May 2019 17:13:30 -0700 (PDT)
Date: Sat, 18 May 2019 20:13:28 -0400
From: Tom Rini <trini@konsulko.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190519001328.GM22232@bill-the-cat>
References: <20190517135309.116495-1-alex.kanavin@gmail.com>
	<1558204453-8142-1-git-send-email-trini@konsulko.com>
	<CA+chaQdA-jTDBMz_S9gMDLzSU8NWd3b4tvfyRPVdLkq46_vKSQ@mail.gmail.com>
	<20190518190327.GL22232@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20190518190327.GL22232@bill-the-cat>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vim: Rework things so vim adds features not vim-tiny removes
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
X-List-Received-Date: Sun, 19 May 2019 00:13:31 -0000
X-Groupsio-MsgNum: 124630
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c5s4KQzYKKhDo6IA"
Content-Disposition: inline

--c5s4KQzYKKhDo6IA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 18, 2019 at 03:03:27PM -0400, Tom Rini wrote:
> On Sat, May 18, 2019 at 08:57:02PM +0200, Martin Jansa wrote:
> > Thanks Tom for quick update.
> >=20
> > ALTERNATIVE_TARGET[xxd] =3D "${bindir}/xxd"
> > ALTERNATIVE_LINK_NAME[xxd] =3D "${bindir}/xxd"
> > looks strange, IIRC TARGET and LINK_NAME should always point to differe=
nt
> > filepath, it was added in meta-oe commit:
> >=20
> > commit 897c10b7c17c138a85bdeb36cf72e7201daf0e0e
> > Author: Dan McGregor <dan.mcgregor@usask.ca>
> > Date:   Thu Oct 18 09:46:27 2018 -0600
> >=20
> >     vim: alternatify xxd
> >=20
> >     toybox also provides xxd.
> >=20
> > but I wonder what u-a does (or is supposed to do in this scenario). May=
be
> > u-a bbclass automatically adds .${BPN} suffix to TARGET and renames the
> > installed file?
>=20
> I'll double check, but also toybox doesn't have anything for xxd today,
> so I'll add that into my build and come up with something sane for both
> if needed, thanks!

OK, so busybox, toybox and vim all provide "xxd" and busybox/toybox
setup u-a with their normal method.  With what vim has (today and also
with this patch) we end up with /usr/bin/xxd.vim, which is what we want.
I inspected the ipk for that, and then putting all 3 in
core-image-minimal looks sane too.

--=20
Tom

--c5s4KQzYKKhDo6IA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJc4J+nAAoJEIf59jXTHXZSDDAP/iDO24MZla9f65zphEIWoUnx
0meSVK+agoNw3N0UR0sjnksTUWHIziVp+mp5MgxHgQX1q6895X9oOWV6vRT9q0aF
/7BU1/ZbmlCEUZ3i1O8tfWwAS38EJqPL/HHJszNfpzy10RWmwNC1chtVjI6C49i4
jmBmSw80LhlQoZlERNo8NSxvldYAWoEV3D4iOg6oWlR0B8IH9vcoANNW92F8awNT
bi13Aewnw+XwKY2Pw5d9FUg9tKm/C+JKJg0jnx1BX7BI7on8se66Xj8SZouIqMms
ZTTSf1yx9afDGiGlpuv7S0rhvMhu1vBF0nPH2d9loFskfWYnMmAnTLO5vFjQhTj0
BDtV6nlCKxu+1fCjsrjHfCHOwjdM7cdWFV1QA4krtiF5BaAag1ttewFQGsuhQe4C
NJtwiG+NoKyq4VsuLmES140L6vWw3d4yC46nYyDbQ/PPqwFGkkEPTI+jnYlX6xrO
fppaYFHRyCaFmieHQ+otL2as7LaCzDmQbOuGkBYBufnXMttsnBtfiudMMc7V7Gm0
q6PZpaNvCjQNgIcTYb8nXRmzrv+8NTNJnzyKZ6JEyziu49eaeqMNIx6pkIlAZVTa
k/bYMpEcIcaQjoky1co5w5wdSnDONyosPvw4e0m2FyHhHGEzZWtV//BpBH8UIg8N
j1wQCsC0x/RNpGuy9niZ
=bfbk
-----END PGP SIGNATURE-----

--c5s4KQzYKKhDo6IA--
