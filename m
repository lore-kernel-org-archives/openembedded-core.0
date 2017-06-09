Return-Path: <trini@konsulko.com>
Received: from mail-yb0-f175.google.com (mail-yb0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 48F017829C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 19:28:22 +0000 (UTC)
Received: by mail-yb0-f175.google.com with SMTP id 202so17748887ybd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 12:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=drclpPYp5ouzWnVgFNJ2AWiVwMkz6FcpcGxCDo5hJFU=;
	b=dzFW8BrK6PrJ97hGp4pcahox//dKesanZax5HQwgkMA8kWVDN79LAnuerp+EaoG48b
	UAXn99r5bSwGGDMRiquZMX124vMBjF57y0et2BLleCfCZCT+HBiu3XzhIw553vZhKyz4
	Qx2zMcRizsdUlRnpTjxlwPNDoT4Qq7/B162So=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=drclpPYp5ouzWnVgFNJ2AWiVwMkz6FcpcGxCDo5hJFU=;
	b=CMmwZKfmLkEXcw28JmFhHTO/CcLJic2ZoU0I2t/x+mQEH+acKSdhAZOx7f7/X+8AQW
	boRiHit6wSR3ocQIo8Ksok5KmnywbsnmIjgZ6WncYNZn/W4m0DP0S+xxnnfpJDBPl3mg
	uNYDv3wmsuB/E6trH3o8s52hjbFGYG1I67HSQqOWlF1FHt2MJcKXRk2hK9dvF1WfKHzv
	7CRRysrSNv4TSi2xprrb8STCWwK9886vVKIjcEEaAFqoDMRJZl8wPzsXLrq8H845uf2q
	BDAZ9RGS5CgzGX2K7GqLDO7B937zD4rqBuXzjAoHn0kau4I0L+Rgodd1zZdUUfW/u1r5
	hWWA==
X-Gm-Message-State: AODbwcAf4vbWlsj1LArXy/I2APdfXWCPwV/xruds2Bi4g9blZvmxcerg
	ApSUNak4wRdkYdWr
X-Received: by 10.37.81.67 with SMTP id f64mr16416969ybb.22.1497036504086;
	Fri, 09 Jun 2017 12:28:24 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133])
	by smtp.gmail.com with ESMTPSA id k7sm518289ywd.60.2017.06.09.12.28.23
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 09 Jun 2017 12:28:23 -0700 (PDT)
Date: Fri, 9 Jun 2017 15:28:40 -0400
From: Tom Rini <trini@konsulko.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170609192840.GL10782@bill-the-cat>
References: <1496966441-30260-1-git-send-email-trini@konsulko.com>
	<1496966441-30260-2-git-send-email-trini@konsulko.com>
	<CAJTo0LbUHNxxQMPz=RH+xxMk2=sN4tcg6MXtNHkz7-R_bY4g1A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbUHNxxQMPz=RH+xxMk2=sN4tcg6MXtNHkz7-R_bY4g1A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] dpkg: Fix perl modules by moving them to the versioned perl directory
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
X-List-Received-Date: Fri, 09 Jun 2017 19:28:23 -0000
X-Groupsio-MsgNum: 98480
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fbGaB/N4l6zMtENL"
Content-Disposition: inline

--fbGaB/N4l6zMtENL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 09, 2017 at 05:15:07PM +0100, Burton, Ross wrote:
> On 9 June 2017 at 01:00, Tom Rini <trini@konsulko.com> wrote:
>=20
> > In order for the dpkg perl modules to be used the must reside in the
> > versioned perl library directory (as to be in the default include path).
> > Be explicit about this location in our FILES_${PN}-perl directive, so
> > that if this breaks in the future, the recipe will fail).  We can now
> > drop the custom do_configure as it wasn't fixing this problem.
> >
>=20
>   * FILES: removed "/usr/lib/perl", added "/usr/lib/perl/None"
>=20
> Obviously something didn't work right!

Oh, I see.  Yes, an existing feature is that if perl isn't built yet
then no, you don't get a sane PERLVERSION.  That's true today, for
example, see liburi-perl.

--=20
Tom

--fbGaB/N4l6zMtENL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZOvboAAoJEIf59jXTHXZSmfwP/RrM+snFvrtAVhidCxw83QUv
QoWR0Vf90itb8/cjjYKGeliGauFPvlZhIEa7joqNRRXo4ZZqeWTiE+Ib4Hg59Ec0
QNpERj0gn53Z1F9fEmBTzBJnh97gOZtPGS72MRhkljXHp2CN3NYxyYAD1nakU+vU
n/CLymsOxV4kOcJp/dXNfvMMzoD0uWjQZm9D5kDqfdMZryFvJFBbyIvWR2PG4yTP
DhLC5mgkPTHdnVmHi3Zg8VTnejmEueaUX342GsmrNelMDMbO1UJVOm+YgtZDqoyg
nDJhLC9eI6DryE1iZR0gC3A5UjofUmD3WGEZ3TAz8pPzDxZZ+0Z7cUkQnjqhsTnX
k7R2MFRAw2wVCKtYlxuifPpvr1rl1hYnXROkJmOtJHCXFWu0DVZxRK/wgrtOSTUQ
FgIEJ5OMqwk2iBZnR0tsBwCjTSJesry/QWUh+jJfQLSczbj3qAw1lqdRxyWvo0vx
vHtXI6VjyWkHeWQ5w1IcKnGMGpv8LGcUhE/5qRdkUs5V0vDpfBiwV6J8Fu2YnjQj
b1b5p3ce1yThz7WI0dAFcgTRV+roXoV3Gh73nrqrv0vT6oIfPQhucOWPeEEimaUw
YbZgcTHPTF5q38jhUv4BOavE+kn2GIhZoyeZn9b9Xxi0bHDmtMdUCTzZ/5OTtcTY
siLY0nRQeIAyHR08CEsm
=HvTo
-----END PGP SIGNATURE-----

--fbGaB/N4l6zMtENL--
