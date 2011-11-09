Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RO6HT-0007x0-Om
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 12:25:23 +0100
Received: by wyh5 with SMTP id 5so1585886wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 03:19:08 -0800 (PST)
Received: by 10.180.81.163 with SMTP id b3mr2222224wiy.20.1320837548403;
	Wed, 09 Nov 2011 03:19:08 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n2sm2648813wiz.16.2011.11.09.03.19.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 03:19:07 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 9 Nov 2011 12:18:55 +0100
In-Reply-To: <1320834947.10843.161.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320799787.git.josh@linux.intel.com>
	<dd949a69e2e7c9379caf5bb6162259c4f2584ea5.1320799787.git.josh@linux.intel.com>
	<8EF5D367-6159-471F-8F2C-F3FA3216F05D@dominion.thruhere.net>
	<1320831447.10843.131.camel@ted>
	<0A7ED8DD-40A2-4E01-90A1-B2BB9849E500@dominion.thruhere.net>
	<1320834947.10843.161.camel@ted>
Message-Id: <215EB605-E036-4165-9C8B-0506C6E9E8C5@dominion.thruhere.net>
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
X-List-Received-Date: Wed, 09 Nov 2011 11:25:23 -0000
X-Groupsio-MsgNum: 12200
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0C522D50-266A-43E4-A83A-BFB08D3C98FF";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0C522D50-266A-43E4-A83A-BFB08D3C98FF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 9 nov. 2011, om 11:35 heeft Richard Purdie het volgende geschreven:

> On Wed, 2011-11-09 at 11:27 +0100, Koen Kooi wrote:
>> Op 9 nov. 2011, om 10:37 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Wed, 2011-11-09 at 10:27 +0100, Koen Kooi wrote:
>>>> Op 9 nov. 2011, om 01:53 heeft Joshua Lock het volgende geschreven:
>>>>=20
>>>>> This patch pulls in the gnome related classes from oe-core which
>>>>> adds extra packaging rules and functionality whilst modularising =
things
>>>>> so that one can get a subset of gnome functionality without adding =
a lot
>>>>> of extra dependencies.
>>>>>=20
>>>>> These aren't an exact copy of the classes from meta-openembedded, =
notable
>>>>> differences are:
>>>>> * gnome.bbclass - I dropped the BBCLASSEXTEND
>>>>=20
>>>> It looks that will break a number of things in meta-oe, why was it =
dropped?
>>>=20
>>> Unconditionally BBCLASSEXTENDing everything gnome is a great way to =
hack
>>> around build issues and create a convoluted dependency mess that =
isn't
>>> really required. I'd much rather we try and minimise the amount of
>>> -native dependencies to those actually needed.
>>>=20
>>> Comparing our builds against other systems its becoming clear our
>>> convoluted dependency trees are one of the areas we don't do as well =
and
>>> it hurts performance :(.
>>=20
>> The list of -native needed in meta-gnome:
>>=20
>> bison-native
>> cairo-native
>> docbook-utils-native
>> flex-native
>> gconf-native
>> gdk-pixbuf-native
>> glib-2.0-native
>> gnome-doc-utils-native
>> gobject-introspection-native
>> gtk-doc-native
>> icon-naming-utils-native
>> intltool-native
>> libffi-native
>> libidl-native
>> libxml-parser-perl-native
>> orbit2-native
>> pango-native
>> perl-native
>> popt-native
>> python-native
>=20
> Many of which are not gnome bbclass derived recipes. I therefore think
> it makes sense to put the BBCLASSEXTEND in the recipes where its =
needed
> and not the core class...

Exactly! I did a lot of dependency cleanup when importing them, so the =
situation isn't as bad as it was in OE classic.

Josh, what kind of test builds did you do for the meta-gnome recipes =
after moving the classes?

regards,

Koen=

--Apple-Mail=_0C522D50-266A-43E4-A83A-BFB08D3C98FF
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk66YaUACgkQMkyGM64RGpHsWgCggBhj+AU89YjYGN5f5iGhNgNC
7dIAn113Ji6fb8rDm4g9hv9BeZ9pjxDx
=Nh0U
-----END PGP SIGNATURE-----

--Apple-Mail=_0C522D50-266A-43E4-A83A-BFB08D3C98FF--
