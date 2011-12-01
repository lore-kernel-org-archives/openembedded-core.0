Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RW8o1-0002sR-QT
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 16:44:15 +0100
Received: by eekc1 with SMTP id c1so1334342eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 07:37:32 -0800 (PST)
Received: by 10.14.3.224 with SMTP id 72mr872284eeh.116.1322753852440;
	Thu, 01 Dec 2011 07:37:32 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 8sm18672009ees.2.2011.12.01.07.37.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 07:37:31 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 1 Dec 2011 16:37:30 +0100
In-Reply-To: <4ED77E14.1080309@balister.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ED0CC76.4040606@emagii.com>
	<1322579029.7964.0.camel@ted>	<4ED53438.9040903@emagii.com>
	<7E3B66F1-28FC-45D4-BA89-193D9EA6DCA6@dominion.thruhere.net>
	<4ED77E14.1080309@balister.org>
Message-Id: <878817F5-05C7-4749-BA0A-7ED04EE884BB@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
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
X-List-Received-Date: Thu, 01 Dec 2011 15:44:15 -0000
X-Groupsio-MsgNum: 13450
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2CC22757-FFCA-4FD5-882A-8B733B4EF6EB";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2CC22757-FFCA-4FD5-882A-8B733B4EF6EB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 1 dec. 2011, om 14:16 heeft Philip Balister het volgende geschreven:

> On 11/29/2011 03:06 PM, Koen Kooi wrote:
>>=20
>> Op 29 nov. 2011, om 20:36 heeft Ulf Samuelsson het volgende =
geschreven:
>>=20
>>> On 2011-11-29 16:03, Richard Purdie wrote:
>>>>=20
>>>>> 2.    "ftp://elsie.nci.nih.gov/pub/tzcode2011i.tar.gz" is no =
longer
>>>>> available.
>>>>>         tzdata , same problem.
>>>>>         The recipe is located in two places.
>>>>>         meta-openembedded/meta-oe/recipes-extended/tz*/tz*.bb have =
the
>>>>> problem
>>>>>         This is what the build uses.
>>>> This is something to raise with the meta-oe maintainers. I think =
there
>>>> isn't a problem in OECore.
>>>=20
>>> Since we now have a large number of layers, maybe it is a good
>>> idea to define in each layer,  how the "git send email" should =
behave in
>>> by providing a better ".git/config" file in the trunk?
>>>=20
>>>=20
>>> I.E:
>>>=20
>>> [sendemail]
>>>   to =3D openembedded-core@lists.openembedded.org
>>>=20
>>> or
>>> meta-angstrom/.git/config
>>> [sendemail]
>>>   to =3D angstrom-distro-devel@linuxtogo.org
>>> [format]
>>>   subjectprefix =3D "[meta-angstrom]"
>>>=20
>>>=20
>>> No need to look in the README file with this.
>>=20
>> That assumes git-send-email is the preferred way, which it isn;'t for =
a lot of layers
>=20
> Even if it is not the preferred way, it would direct the discussion to
> the appropriate list. This would reduce the number of mis-directed
> emails to this list.

You can't fix stupid, sadly.


--Apple-Mail=_2CC22757-FFCA-4FD5-882A-8B733B4EF6EB
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7XnzoACgkQMkyGM64RGpEJqwCeP77J06fTNb9i4759aAqU0dsH
6woAn2Yq+Hlw+hpOUM0AZIPkNHhcJKl5
=ssAm
-----END PGP SIGNATURE-----

--Apple-Mail=_2CC22757-FFCA-4FD5-882A-8B733B4EF6EB--
