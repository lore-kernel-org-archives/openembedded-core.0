Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REjoH-0000Wj-7t
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 17:36:34 +0200
Received: by bkat8 with SMTP id t8so2117529bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 08:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3FiHQZMt9IVQlN1qkBab8c+7CPSyE2pVubxTXPYKVVc=;
	b=j+7EBusIxcuW16mPpQsmnfMf0ksb29fCf0yVanXDIIv4ltY5F4HoR9vWFILt2Q/ziU
	VfSg6OEwTPc32BEQUehHQkmks8XcQ2NObGI2Z//5ozq/e2EDNROYHS5EC68cUWyf7kLl
	qAt9dFFs+MgtkMt75eWjmLdUNd1v+8TZIr7Is=
Received: by 10.204.9.214 with SMTP id m22mr7416679bkm.4.1318606243340;
	Fri, 14 Oct 2011 08:30:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z9sm8864112bkn.7.2011.10.14.08.30.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 08:30:42 -0700 (PDT)
Date: Fri, 14 Oct 2011 17:30:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111014153034.GL3542@jama.jama.net>
References: <1318603356.2342.20.camel@ted>
	<CAP9ODKod1GCk5gFPq0YkEPb0rZ3NHsD6YBu7cAQVDPLW0PN7xA@mail.gmail.com>
	<1318605925.2342.24.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1318605925.2342.24.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] mesa-dri: Enable swrast only by default and intel drivers only on IA platform
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
X-List-Received-Date: Fri, 14 Oct 2011 15:36:34 -0000
X-Groupsio-MsgNum: 11032
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5fECsWged6836Ycf"
Content-Disposition: inline

--5fECsWged6836Ycf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 14, 2011 at 04:25:16PM +0100, Richard Purdie wrote:
> On Fri, 2011-10-14 at 11:46 -0300, Otavio Salvador wrote:
> > +1
> >=20
> > Just another thing, I'd prefer to have DRIDRIVERS as ?=3D so machine can
> > override it.
>=20
> I really wouldn't recommend overriding this on a per machine basis, it
> needs to be on a per arch basis. This is because the recipe is not
> machine specific (nor should it be).
>=20
> Configuration therefore falls to the distro, not machine.

Why not make it machine specific only when machine provides own module
(like the case with glamo on om-gta02)?

Or recipe cannot change PACKAGE_ARCH in some special cases (like
$MACHINE in path to some file in SRC_URI) anymore?

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5fECsWged6836Ycf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6YVZoACgkQN1Ujt2V2gBydRgCeMvcD5NLwS5qepskkMIcxxi3t
U68AoLlLSH4NdGFzpiHh4clS6Cau68DS
=OsCQ
-----END PGP SIGNATURE-----

--5fECsWged6836Ycf--
