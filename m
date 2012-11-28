Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdibQ-00024d-1e
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 15:27:05 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so5184727eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 06:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=u6ev2so8x2w2Qm0HD5ecRlFCGCqxkZz13L0MD2/DKdo=;
	b=aXNseifpycTqvX/gATsIOr1HeMnib5+WJ+PeT70Jl+jgeVj45HIf/1Rx0V+qX0Wdf/
	m+4dVg6eiEVGFK1F0H2F4fKJfU78QBcUEXCZJVbrO686K+2iMuGx6/Kuj2m+i47yJKZ2
	sOKTEO4XMvsrKEFfz9LSAesKtx3vowfonGUBzFKYkPNZcasGQDknAj7oLT+TjdSugimR
	wRIU0l6wgouW1fAhju0Uxv2eKuW0WyC8IdB6OXOzW/y5zsSA0QV/7LgpmBa329SWakAf
	TnWC1i9zMIuIXhLnvdFfB75i/hKt7XR/3WJDuNdtVb7da3EfAdqGc8TsnquOL0Vyvz4P
	6Qlw==
Received: by 10.14.173.69 with SMTP id u45mr46645016eel.21.1354111969512;
	Wed, 28 Nov 2012 06:12:49 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y44sm47299595eel.14.2012.11.28.06.12.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 06:12:49 -0800 (PST)
Date: Wed, 28 Nov 2012 15:12:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20121128141245.GD3477@jama.jama.net>
References: <20121127182306.GE3692@jama.jama.net>
	<50B50A05.9020201@windriver.com>
	<20121128085726.GA3477@jama.jama.net>
	<1354093560.21863.164.camel@ted>
	<20121128125301.GB3477@jama.jama.net>
	<lyzk213k6t.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <lyzk213k6t.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: locale data broken in gstreamer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 14:27:06 -0000
X-Groupsio-MsgNum: 31850
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KdquIMZPjGJQvRdI"
Content-Disposition: inline

--KdquIMZPjGJQvRdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 28, 2012 at 02:56:26PM +0100, Enrico Scholz wrote:
> Martin Jansa <martin.jansa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> writes:
>=20
> > Other option is to include the same hack in our Makefile.in.in
> > GETTEXT_PACKAGE =3D @GETTEXT_PACKAGE@
> > if we test that this does not break some other packages.
>=20
> oe_runconf_prepend() {
>     sed -i -e "1a\\" -e 'GETTEXT_PACKAGE =3D @GETTEXT_PACKAGE@' po/Makefi=
le.in.in
> }

Ah interesting I was expecting that we need to do this before
autoreconf, but if this works then it looks like easiers solution.

I'll try to add this to all gst* package and rebuild image.

Thanks,

>=20
> seems to work too (at least for gst-plugins-good)
>=20
>=20
>=20
> Enrico
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KdquIMZPjGJQvRdI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC2G90ACgkQN1Ujt2V2gBw9mgCdEp7H7xHqSRMqZYV/619eA1KF
PHgAoJjjK4zu1Dk8fNzSKrJ/Rr7mObO4
=btA8
-----END PGP SIGNATURE-----

--KdquIMZPjGJQvRdI--
