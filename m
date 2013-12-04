Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9B9AE6D840
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 19:07:11 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id h10so10825417eak.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 11:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=j32E25TyM4me3sfK6ED02gC/WP6Pq2i26J5MAMkm/fQ=;
	b=v2JSh7YImJ1ZBys/rSusofSRalglEazzB1JmTOZybXIr12PDdSRXekA6l8q91IUA5E
	xkdKGRoxAWVf9lJfWV/yDSdBmHxgAad7g3d8GhCBryMu/tGOqo6PE6qr852KY3ruoP9k
	iGsjwe8QWQNce4RQOaJ0v9ut0sdNxM+v3GlJTHJty4+ynZSf7I1qtQiQ8HTlmt89oUFa
	IG+5Wl2h/KQ2YZPYzAlueVpIQeop8i0Ig61xfkxcx7X0Z9+9v498h4qSVrv8JU+L+EZx
	eGWxRP2XVlN6DuGwtY+spoT2rmXKIVKtlya0eyc9Jip3TwJx1ZIhXIlukPSWytbRM9BR
	G4ow==
X-Received: by 10.15.95.72 with SMTP id bc48mr12687280eeb.49.1386184030553;
	Wed, 04 Dec 2013 11:07:10 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m1sm91698609eeg.0.2013.12.04.11.07.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 11:07:09 -0800 (PST)
Date: Wed, 4 Dec 2013 20:07:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20131204190721.GK3714@jama>
References: <1386182811-3588-1-git-send-email-andrei@gherzan.ro>
	<2780723.Eg1JlMHale@helios>
MIME-Version: 1.0
In-Reply-To: <2780723.Eg1JlMHale@helios>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] libav: Add v9.10
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
X-List-Received-Date: Wed, 04 Dec 2013 19:07:12 -0000
X-Groupsio-MsgNum: 47897
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ucgz5Oc/kKURWzXs"
Content-Disposition: inline

--Ucgz5Oc/kKURWzXs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2013 at 06:57:20PM +0000, Paul Eggleton wrote:
> On Wednesday 04 December 2013 20:46:50 Andrei Gherzan wrote:
> > This version includes libavresample needed for packages like xbmc.
> > To use this version add:
> > PREFERRED_VERSION_libav =3D "9.10".
>=20
> We really want to avoid having too many versions of the same recipe hangi=
ng=20
> around. However, it seems premature to drop 0.8.x at this point. Perhaps =
we=20
> should drop the libav_git recipe that we currently have, since that is ju=
st=20
> pointing at an old 0.9.x version?
>=20
> Anyone have any thoughts on this?

Or update it to point to newer (or the same revision as 9.10)

>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Ucgz5Oc/kKURWzXs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKffWkACgkQN1Ujt2V2gBytOwCfUgAtT5lUXlvS2h89hBtVoxYZ
Mk4AnAk1w8raJzQaji2/aUERfdF2sf/1
=8RtS
-----END PGP SIGNATURE-----

--Ucgz5Oc/kKURWzXs--
