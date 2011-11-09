Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RO5TD-0005Gz-Vc
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 11:33:28 +0100
Received: by wwf4 with SMTP id 4so1763123wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 02:27:12 -0800 (PST)
Received: by 10.180.92.163 with SMTP id cn3mr1973140wib.26.1320834432485;
	Wed, 09 Nov 2011 02:27:12 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id bl10sm2566024wib.15.2011.11.09.02.27.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 02:27:11 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 9 Nov 2011 11:27:05 +0100
In-Reply-To: <1320831447.10843.131.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320799787.git.josh@linux.intel.com>
	<dd949a69e2e7c9379caf5bb6162259c4f2584ea5.1320799787.git.josh@linux.intel.com>
	<8EF5D367-6159-471F-8F2C-F3FA3216F05D@dominion.thruhere.net>
	<1320831447.10843.131.camel@ted>
Message-Id: <0A7ED8DD-40A2-4E01-90A1-B2BB9849E500@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 2/3] classes/[gnome|gnomebase|mime]: enhance gnome related classes
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
X-List-Received-Date: Wed, 09 Nov 2011 10:33:28 -0000
X-Groupsio-MsgNum: 12195
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7A0286F1-4CFC-4E99-857B-921078C5252F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7A0286F1-4CFC-4E99-857B-921078C5252F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 9 nov. 2011, om 10:37 heeft Richard Purdie het volgende geschreven:

> On Wed, 2011-11-09 at 10:27 +0100, Koen Kooi wrote:
>> Op 9 nov. 2011, om 01:53 heeft Joshua Lock het volgende geschreven:
>>=20
>>> This patch pulls in the gnome related classes from oe-core which
>>> adds extra packaging rules and functionality whilst modularising =
things
>>> so that one can get a subset of gnome functionality without adding a =
lot
>>> of extra dependencies.
>>>=20
>>> These aren't an exact copy of the classes from meta-openembedded, =
notable
>>> differences are:
>>> * gnome.bbclass - I dropped the BBCLASSEXTEND
>>=20
>> It looks that will break a number of things in meta-oe, why was it =
dropped?
>=20
> Unconditionally BBCLASSEXTENDing everything gnome is a great way to =
hack
> around build issues and create a convoluted dependency mess that isn't
> really required. I'd much rather we try and minimise the amount of
> -native dependencies to those actually needed.
>=20
> Comparing our builds against other systems its becoming clear our
> convoluted dependency trees are one of the areas we don't do as well =
and
> it hurts performance :(.

The list of -native needed in meta-gnome:

bison-native
cairo-native
docbook-utils-native
flex-native
gconf-native
gdk-pixbuf-native
glib-2.0-native
gnome-doc-utils-native
gobject-introspection-native
gtk-doc-native
icon-naming-utils-native
intltool-native
libffi-native
libidl-native
libxml-parser-perl-native
orbit2-native
pango-native
perl-native
popt-native
python-native

regards,

Koen=

--Apple-Mail=_7A0286F1-4CFC-4E99-857B-921078C5252F
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk66VXkACgkQMkyGM64RGpEUkACgrr8X0UUU+NK22LcmysVeFlrM
BDAAmwRSWJzhpjiYmMmCEKBjgHmP0FOQ
=vuMY
-----END PGP SIGNATURE-----

--Apple-Mail=_7A0286F1-4CFC-4E99-857B-921078C5252F--
