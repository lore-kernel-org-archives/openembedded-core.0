Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SDEQH-0007o5-4t
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 14:25:49 +0200
Received: by wgbdr12 with SMTP id dr12so1393217wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 05:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hxH59AIzaQv+Ol7/bEBtXgBM2nQLPYJz0Iy2i+/y+/A=;
	b=z+VEBSiYpxrDI2Ihb6wmELh9GErUL6ELZBjy0xCrcH92gGYLFcq7v+3KKXjfxPJH/M
	f6YRXacvqJ9Jjcc2F/JqX6ICti1idKX/AJILegdmRz+Zz4Dcus8ERv5H9UFeEANXDL95
	A5xx3TheDQdKHe5KCGavs6h1PJiZfbCHm78agwvE110/3A1yIUakHAFiOT/oRcDxPJl4
	AGd5H7eXHxj+e47Xscm9m9EIxRVhn/P9sokfyI4rQcZmmbd7OypV/ZR6PGR0SF0mBlfJ
	I2xGjrdVK25+3Q5Pi/SOJxrIetnK9ST8NWHe4qLLp7D0TG3Qh58ougJAYRjGk/aRm1kp
	Ltcw==
Received: by 10.180.92.130 with SMTP id cm2mr5185392wib.4.1333023406011;
	Thu, 29 Mar 2012 05:16:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ea6sm36376627wib.5.2012.03.29.05.16.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Mar 2012 05:16:44 -0700 (PDT)
Date: Thu, 29 Mar 2012 14:16:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120329121646.GK4004@jama.jama.net>
References: <4b37a73d52ca39e73b4d8230269af5d9e2d88c52.1333001415.git.Martin.Jansa@gmail.com>
	<49e5bc38bdd5b01d3fb35b4d26a2d189ad2c2c44.1333001415.git.Martin.Jansa@gmail.com>
	<1333015547.14983.11.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1333015547.14983.11.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/2] kernel.bbclass: unify white spaces
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Mar 2012 12:25:49 -0000
X-Groupsio-MsgNum: 19945
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OOq1TgGhe8eTwFBO"
Content-Disposition: inline

--OOq1TgGhe8eTwFBO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 11:05:47AM +0100, Richard Purdie wrote:
> On Thu, 2012-03-29 at 08:24 +0200, Martin Jansa wrote:
> > * indentation was with spaces and tabs, unify to use tabs instead of
> >   spaces, because "python populate_packages" expects tabs (or 8 spaces)
> >   and we're doing populate_packages_preppend here
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/kernel.bbclass |   38 +++++++++++++++++++----------------=
---
> >  1 files changed, 19 insertions(+), 19 deletions(-)
>=20
> FWIW, we're supposed to be using tabs for shell code and spaces (4) for
> python. Unfortunately populate_package() is special due to the number of
> places we append/prepend it and the need to be consistent with
> whitespace.
>=20
> I'm therefore not sure it makes sense to re-indent the anonymous python.

Agreed, but that anonymous python used spaces and tabs in the same
function which is ugly.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OOq1TgGhe8eTwFBO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk90Uq4ACgkQN1Ujt2V2gBwqPACgpFLV7nf95d7fL0ZYt0q3gBAI
koMAoKBBQ5oMuFwwdX96y45/iXQuvq5/
=ysRB
-----END PGP SIGNATURE-----

--OOq1TgGhe8eTwFBO--
