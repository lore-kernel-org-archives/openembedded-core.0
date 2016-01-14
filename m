Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id F38F3731A8;
	Thu, 14 Jan 2016 11:32:19 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id l65so337858135wmf.1;
	Thu, 14 Jan 2016 03:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gQNu9bRzSupVUZZKPBDw7cQYAMNPn6RCKCBjxZn3Pv4=;
	b=Wcnwo5JbhdhpzxjkC+3sZtYWATC8MeqnfL4nhTciOs1hqgNensf9JnmmlB4H2HVP74
	7sUTz6XsAu20+Jmvzsd7BqvCRhNsVlAl7jySUp1UkIHrHBtjcGJLNSfKLIe1rq3p93RM
	kuow4zSlxbxG4D3Xt3vC6eH/ypfyJPy2gYEzqRVy33XiBvAqYiLUu7QTIXF9g6xSQWpW
	JDZ2dZ5y9fqxXtY3Zk95zP1mF7xc5QLb/LZDRU3Fy8PI3UuGXY0r36FIYm7XNp2TNnu7
	Z0IPZJ400QsWylyJdCqH4pwAcUQchuIkIXd3SPCU23gkUzCRgdvd7JuDjPdh2Y8gaMfp
	uLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=gQNu9bRzSupVUZZKPBDw7cQYAMNPn6RCKCBjxZn3Pv4=;
	b=XAfzW1WERykaV1rFYdpApFT8cbNYa2cQA+SiCbaiEtJkBToQGiQL83KUh+bBF55bOF
	sIYmnjMoGa8895NLS0EKOYZulL1edV6gw4R2Oe1wxPqQJTkU0slcTmOzMD5wBKgqkeAl
	z7Vye//DgIRwRIef2iTZIfQl7f3fkf0BJqXGnUiScWU+UJzQuAGdlULuUJQbmcA6vV8f
	wWoC8EFgPU4w2rJ+qcEAuakZWyXLVAPAKIlIbY9NQcPN1hPp08bcdhM1uSzKLtzXew6/
	tkBGXJ3qriW3E/dkWIlPxnfH6tn220kU7QXcjt+V0EABTcgT2bnrSoiV1GVjNfps/h8O
	hw1w==
X-Gm-Message-State: ALoCoQmcZKLqk4cawrX9DWKqX+ZIq/z5lA8h04MgLP2HiyEJkL0yt1czjg7b6JJdyux8ZDsiWXTggvfNkRawaN1SxdTM72wogA==
X-Received: by 10.28.52.195 with SMTP id b186mr30624563wma.40.1452771139423;
	Thu, 14 Jan 2016 03:32:19 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u191sm23942572wmd.4.2016.01.14.03.32.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jan 2016 03:32:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 14 Jan 2016 12:33:08 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160114113308.GB2582@jama>
References: <39606447-07D3-4F1F-93A1-CB9C77114535@gmail.com>
MIME-Version: 1.0
In-Reply-To: <39606447-07D3-4F1F-93A1-CB9C77114535@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Cached size of off_t
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
X-List-Received-Date: Thu, 14 Jan 2016 11:32:21 -0000
X-Groupsio-MsgNum: 76041
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline

--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2016 at 03:23:33PM -0800, Khem Raj wrote:
> Hi
>=20
> We cache size of off_t in site files and the value is 4 in most cases
>=20
>=20
> meta/site/arm-linux:ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}
> meta/site/ix86-common:ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}
> meta/site/nios2-linux:ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}
> meta/site/powerpc32-linux:ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}
> meta/site/x32-linux:ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D8}
> meta/site/x86_64-linux:ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D8}
>=20
>=20
> However this value is wrong when largefile support is enabled (which is d=
efault) on
> most OE based distros. It also lands us in nasty bugs which are complicat=
ed to uncover
> eg. the curl issue
>=20
> http://git.openembedded.org/openembedded-core/commit/?id=3D3c58712465494e=
441c4036a7cf21d2e6d343efab
>=20
> and just in OE-Core more e.g. grub2,libsndfile1,pax are showing same symp=
toms.

It's even more complicated in curl case, which bumps SONAME version when
off_t is changed.

So with dizzy we had libcurl5, but after the commit above we get
libcurl4 which looks strange considering the curl version in oe-core is new=
er now.

You can force the bump with --enable-soname-bump, but that doesn't make
it ABI compatible, because SIZEOF_OFF_T was really changed inside curl
build.

Regards,

> I think this value should be left for configure to compute and
> autotools.bbclass should pass --{enable|disable}-largefile based upon
> DISTRO_FEATURES enabling largefile support
>=20
> Do we see any downsides or point I might have missed
>=20
> Thank you
> -Khem
>=20



> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaXhxEACgkQN1Ujt2V2gBxMngCgnacCtDSXxtZAuZaS9Zo8DzP4
uPYAn1vxi9mgFtxzF80ZGtiJjBU5YIs+
=aksE
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
