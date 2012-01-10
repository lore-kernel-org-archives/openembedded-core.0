Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RkYlv-0002lc-6S
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 11:17:39 +0100
Received: by eekb47 with SMTP id b47so120664eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 02:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nRyULTHnODrI9GT8V4JBIVpoQPV2d4s0g+845Ex3Mw8=;
	b=dJmIyeG3CxRg429GDsmVtO7xQqzqVTFQ7p+nAuNJJgBji8sBWvMv92XHP0/RoEA9bZ
	4eMuMNvM8uJcrx1HwwUtVO+nA017PxtYK/QEaJ+bnzNmaMnhHA4cciVDjW0J8sBXJX12
	2d8iwTvvq5WXtNxKGHXZd8lRWN1Rmb5S4iKGY=
Received: by 10.14.100.10 with SMTP id y10mr7426277eef.119.1326190210643;
	Tue, 10 Jan 2012 02:10:10 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 76sm302469526eeh.0.2012.01.10.02.10.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jan 2012 02:10:09 -0800 (PST)
Date: Tue, 10 Jan 2012 11:09:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120110100957.GA3445@jama.jama.net>
References: <20120110100306.GB3664@ad.chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <20120110100306.GB3664@ad.chargestorm.se>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Preventing RRECOMMENDS from installing
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
X-List-Received-Date: Tue, 10 Jan 2012 10:17:39 -0000
X-Groupsio-MsgNum: 15715
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2012 at 11:03:06AM +0100, Anders Darander wrote:
>=20
> Is there a simple way, in a bbappend-file to prevent packages in an
> RRECOMMENDS from being installed? E.g. if package foo has:
> RRECOMMENDS_${PN} +=3D "bar"
>=20
> I'd reluctant to rewrite RRECOMMENDS_${PN} completely, as foo sets
> RRECOMMENDS using +=3D (or =3D+), thus I'd like not to remove other packa=
ges
> from RRECOMMENDS.=20
>=20
> If possible, I'd like to avoid patching the foo.bb-file, and just have a
> foo.bbappend in my own layer.
>=20
> I've unsuccesfully tried different variants using oe_filter_out, but
> they don't seems to prevent bar from being installed.
>=20
> Thanks in advance for any hints!

Cannot you use
BAD_RECOMMENDATIONS +=3D "bar"
for your image/distro?

It was broken for some time, but iirc should be fixed now.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8MDnUACgkQN1Ujt2V2gBy5QgCfexptS6WLDB5EcudhAcQabUoP
Px0An106uM1ZQKFqOg1BUnVTAcyvMsT7
=GGun
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
