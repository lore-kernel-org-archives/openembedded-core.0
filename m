Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RZfFa-0008RQ-CR
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 09:59:14 +0100
Received: by wgbds11 with SMTP id ds11so7620002wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2011 00:52:21 -0800 (PST)
Received: by 10.180.6.71 with SMTP id y7mr17282577wiy.67.1323593539293;
	Sun, 11 Dec 2011 00:52:19 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id p2sm6335270wbh.22.2011.12.11.00.52.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 11 Dec 2011 00:52:18 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Sun, 11 Dec 2011 09:52:15 +0100
In-Reply-To: <2fd890beaefd817feed03ef17b630a9af8aa465c.1323554268.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323554268.git.sgw@linux.intel.com>
	<2fd890beaefd817feed03ef17b630a9af8aa465c.1323554268.git.sgw@linux.intel.com>
Message-Id: <4C7FA566-48B4-4F91-B705-F3F7DB3D9082@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 2/5] gdk-pixbuf: Add hicolor-icon-theme as RDEPENDS
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
X-List-Received-Date: Sun, 11 Dec 2011 08:59:14 -0000
X-Groupsio-MsgNum: 14042
Content-Type: multipart/signed;
	boundary="Apple-Mail=_ADE2A3E3-D73A-43C3-9E5B-3B6B500AC1C4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_ADE2A3E3-D73A-43C3-9E5B-3B6B500AC1C4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 10 dec. 2011, om 23:01 heeft Saul Wold het volgende geschreven:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb |    4 ++++
> 1 files changed, 4 insertions(+), 0 deletions(-)
>=20
> +RDEPENDS =3D "hicolor-icon-theme"

Are you sure this is the right place? gdk-pixbuf are just the image =
loaders, they shouldn't have a hard dependency on a bunch of icons... As =
for the apps, gtk-icon-cache.bbclass should be adding the hicolor dep =
automatically.

regards,

Koen


--Apple-Mail=_ADE2A3E3-D73A-43C3-9E5B-3B6B500AC1C4
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7kb0EACgkQMkyGM64RGpFoaACgqZd2FERGKeMfWafZnnK8D5c6
jt4Amwf9zCUsS2IvAqrmzXFRWgnyUsCO
=QJ9t
-----END PGP SIGNATURE-----

--Apple-Mail=_ADE2A3E3-D73A-43C3-9E5B-3B6B500AC1C4--
