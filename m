Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tmp8J-0004a0-8f
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Dec 2012 18:14:41 +0100
Received: by mail-ea0-f181.google.com with SMTP id k14so2532746eaa.26
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Dec 2012 08:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=qZsJHJ1gYdxZN3v0XiOeNPH6xSlCsDmkfxWAyYtF9aI=;
	b=l1BhQpf7ut/9hfMRAhY/S97IWDZBRudvAWmosvPJXjuLtN2nRNjYVMgkAygRxgX72Y
	bC4CqZ+TR5NVjT8fVLYxGgW2y3RLT+Wc1qnDw3vhmayl7SpoBYlW+8eFxPdJvIQEQXn8
	+ihdojiHiGw9eCyap1HB/1jU0BCCxcuKnU/63lw86blAEM3g9gqOxadZ0Hje7K+5EbGP
	OJQBIx7LZtSFJ5FmGmvOi2V6OGaXfeoy6FG25sxNdBcoqKoKSbxb7wpbkqixTfHnQ+vf
	QRS6WLIuuldOxr4OQjoYQUzt4dHtrWCiYUT81Nz4rwBtuJFxIAItMYrp/Zhm3EMQcbtV
	F/OQ==
X-Received: by 10.14.177.1 with SMTP id c1mr49139563eem.8.1356281990510;
	Sun, 23 Dec 2012 08:59:50 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b49sm35904432eem.16.2012.12.23.08.59.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 08:59:49 -0800 (PST)
Date: Sun, 23 Dec 2012 17:59:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20121223165947.GI8988@jama.palm1.palmone.com>
References: <alpine.DEB.2.02.1212230949580.11704@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1212230949580.11704@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: OK to drop reference to "udev-extra-rules" from udev-extraconf_1.0.bb?
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
X-List-Received-Date: Sun, 23 Dec 2012 17:14:42 -0000
X-Groupsio-MsgNum: 33030
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="STPqjqpCrtky8aYs"
Content-Disposition: inline

--STPqjqpCrtky8aYs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 23, 2012 at 09:50:18AM -0600, Robert P. J. Day wrote:
>=20
>   it would seem that this from udev-extraconf_1.0.bb:
>=20
> # to replace udev-extra-rules from meta-oe
> RPROVIDES_${PN} =3D "udev-extra-rules"
> RREPLACES_${PN} =3D "udev-extra-rules"
> RCONFLICTS_${PN} =3D "udev-extra-rules"
>=20
> is now superfluous since udev-extra-rules was tossed from meta-oe some
> months ago?  OK to submit a patch to just take it out?  unless someone
> wants to do it, i'm good either way.

No keep it, you don't know how long it will take for _all_ users to
upgrade on target.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--STPqjqpCrtky8aYs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDXOIMACgkQN1Ujt2V2gBy4tACfXDaTzAU4Bk5cjGdOkgHn0t4q
dGMAninwaU2Kl/5YIKBAjRiMxllx6jlH
=gsW1
-----END PGP SIGNATURE-----

--STPqjqpCrtky8aYs--
