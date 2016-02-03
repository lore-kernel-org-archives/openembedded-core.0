Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 799F477340
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 06:17:24 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id uo6so8073337pac.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 22:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=kE+DyHXrE005X+JlPXkj/8kvmPVM6uUus/3qbIh+KcI=;
	b=MbMYtn+9f1j2cO2hDBOkRh54I1qGDSw1+41HwHQV7kAZD5n7myWwPyMsZ+kLYxbg2+
	FG7ghVro+/ln7XFaynEHRqkJK9qQTyLzjbNZ2IbP4nTOzCLdv40cmQkwqh7CkICHlDu9
	iT5Ibey6d0MLqT8GdGtk+LbvZ7BUbTOl6ARUltA6uViiFrP65EO1RUx5tHoGXVnrXJLE
	E9BTd+UD3E5dPFxkQmU9MeuI9SPnnH9GC7Z+xOLWSJwFtxxoyfWN+08UhEix6rsk6C6X
	lP8dIsdgxnjHRhbq9Z2LPAqjZWDJx1TWIaoFUBCtqmOsz/JpZzxea1x+wWgpQWmFDDOO
	4nZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=kE+DyHXrE005X+JlPXkj/8kvmPVM6uUus/3qbIh+KcI=;
	b=H1/C174FBINmO8qVD1iLqJUTWO28XTf5jPREl4LxTnLZMfQoNVThImsq1OT2xh7a/T
	DUSrE+e80CnW7mq7KO+Z+OgKP0ZqnO+r5wZZvqC9fCPQxdwmlDzH9lFW/XNnelj3/E/N
	ysXZ45snS2yORjLbwvqAdAUgVqv2kb7AUy6elPFXFbLQZhUUueuG38s9+Nm4O1DIFfNv
	+0qs4RzGibXntCL4wBcWOVgQtEkuif47urmY28d1tKdTj9KcN14BOdtE79dNYkmAqMDm
	vo9jlUCXneY3i0RWlqJgw5I2VsCJp1XXEsuDLYWB+fpIFV0YH3Y0Ikfwrp9dRfGrhs9Z
	ymLw==
X-Gm-Message-State: AG10YOR116cCAr66muUokEUQRE7PDgB5DF5PKzeqRGGG4OIQITCeCvQjoau2Lg63SapnUA==
X-Received: by 10.66.153.11 with SMTP id vc11mr18864312pab.42.1454480245504;
	Tue, 02 Feb 2016 22:17:25 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:6d69:5a78:5946:6549?
	([2601:646:8802:5d5c:6d69:5a78:5946:6549])
	by smtp.gmail.com with ESMTPSA id tv6sm6874647pab.4.2016.02.02.22.17.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Feb 2016 22:17:24 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1454446338.7421.45.camel@pbcl.net>
Date: Tue, 2 Feb 2016 22:17:20 -0800
Message-Id: <46DD8494-2C7E-44B8-8793-12228FD56738@gmail.com>
References: <56B0AE88.3090103@siemens.com> <1454446338.7421.45.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Default value for FULL_OPTIMIZATION
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
X-List-Received-Date: Wed, 03 Feb 2016 06:17:25 -0000
X-Groupsio-MsgNum: 77432
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0D0A5BC5-68FD-4E1D-9EC2-CA6347411EED";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0D0A5BC5-68FD-4E1D-9EC2-CA6347411EED
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 2, 2016, at 12:52 PM, Phil Blundell <pb@pbcl.net> wrote:
>=20
> On Tue, 2016-02-02 at 14:26 +0100, Pascal Bach wrote:
>> I'm not sure if the documentation is wrong or if the default set in =
bitbake.conf is incorrect.
>> Maybe somebody can shed some light on this.
>=20
> FULL_OPTIMIZATION in bitbake.conf did use to match what the
> documentation says (or at least, was much closer to it).  It was =
changed
> to the current value by commit 9cb71137 which apparently omitted to
> update the documentation.

yes thats a gap agreed.

>=20
> As an aside, this commit also added "-pipe" to both FULL_OPTIMIZATION
> and DEBUG_OPTIMIZATION, which seems a bit weird since (a) -pipe =
doesn't
> have any effect on the generated code; and (b) if it's going to =
enabled
> for both debug and release builds then it might as well go in ${CC} or
> somewhere.  Also, that commit seems to have deliberately turned down =
the
> level of optimisation somewhat in order to facilitate debugging, which
> is perhaps not what folks who request FULL_OPTIMIZATION would expect.

-pipe does speed up build time so its an optimization. FULL_OPTIMIZATION =
is not about
code generation only. However, I agree to the fact that if we want to =
use
it in all combination then it should go into a common global variable =
which is common
across target/native/nativesdk recipes.

>=20
> But anyway, irrespective of the detailed merits or otherwise of that
> patch, I think that updating the documentation to match what the code =
is
> now doing would be a fine idea.
>=20
> p.
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_0D0A5BC5-68FD-4E1D-9EC2-CA6347411EED
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaxm3QACgkQuwUzVZGdMxQKaQCcDEDno/pgyik6yYDxwvQIZ4g4
qbgAn1H3eBoe6NkBJh2BEj6JavZ+nzYx
=D98S
-----END PGP SIGNATURE-----

--Apple-Mail=_0D0A5BC5-68FD-4E1D-9EC2-CA6347411EED--
