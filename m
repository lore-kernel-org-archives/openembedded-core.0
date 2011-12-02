Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RWPrC-0002P0-O8
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 10:56:38 +0100
Received: by eekc1 with SMTP id c1so1821025eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2011 01:49:56 -0800 (PST)
Received: by 10.14.10.85 with SMTP id 61mr1383022eeu.26.1322819395402;
	Fri, 02 Dec 2011 01:49:55 -0800 (PST)
Received: from [172.20.1.19] (ip5451781a.direct-adsl.nl. [84.81.120.26])
	by mx.google.com with ESMTPS id 17sm15137506eej.3.2011.12.02.01.49.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 01:49:54 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 2 Dec 2011 10:49:52 +0100
In-Reply-To: <4ED7ABF9.5000109@emagii.com>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ED0CC76.4040606@emagii.com>
	<1322579029.7964.0.camel@ted>	<4ED53438.9040903@emagii.com>
	<7E3B66F1-28FC-45D4-BA89-193D9EA6DCA6@dominion.thruhere.net>
	<4ED77E14.1080309@balister.org>
	<878817F5-05C7-4749-BA0A-7ED04EE884BB@dominion.thruhere.net>
	<4ED7ABF9.5000109@emagii.com>
Message-Id: <5D177C90-C498-49C3-8FE3-AE1589ADB5A3@dominion.thruhere.net>
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
X-List-Received-Date: Fri, 02 Dec 2011 09:56:38 -0000
X-Groupsio-MsgNum: 13546
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E6B40F08-FA3F-414E-BEED-7161748ECC33";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E6B40F08-FA3F-414E-BEED-7161748ECC33
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 1 dec. 2011, om 17:31 heeft Ulf Samuelsson het volgende geschreven:

> 2011-12-01 16:37, Koen Kooi skrev:
>> Op 1 dec. 2011, om 14:16 heeft Philip Balister het volgende =
geschreven:
>>=20
>>=20
>>> On 11/29/2011 03:06 PM, Koen Kooi wrote:
>>>=20
>>>> Op 29 nov. 2011, om 20:36 heeft Ulf Samuelsson het volgende =
geschreven:
>>>>=20
>>>>=20
>>>>> On 2011-11-29 16:03, Richard Purdie wrote:
>>>>>=20
>>>>>>> 2.    "ftp://elsie.nci.nih.gov/pub/tzcode2011i.tar.gz"
>>>>>>>  is no longer
>>>>>>> available.
>>>>>>>         tzdata , same problem.
>>>>>>>         The recipe is located in two places.
>>>>>>>         meta-openembedded/meta-oe/recipes-extended/tz*/tz*.bb =
have the
>>>>>>> problem
>>>>>>>         This is what the build uses.
>>>>>>>=20
>>>>>> This is something to raise with the meta-oe maintainers. I think =
there
>>>>>> isn't a problem in OECore.
>>>>>>=20
>>>>> Since we now have a large number of layers, maybe it is a good
>>>>> idea to define in each layer,  how the "git send email" should =
behave in
>>>>> by providing a better ".git/config" file in the trunk?
>>>>>=20
>>>>>=20
>>>>> I.E:
>>>>>=20
>>>>> [sendemail]
>>>>>   to =3D=20
>>>>> openembedded-core@lists.openembedded.org
>>>>>=20
>>>>>=20
>>>>> or
>>>>> meta-angstrom/.git/config
>>>>> [sendemail]
>>>>>   to =3D=20
>>>>> angstrom-distro-devel@linuxtogo.org
>>>>>=20
>>>>> [format]
>>>>>   subjectprefix =3D "[meta-angstrom]"
>>>>>=20
>>>>>=20
>>>>> No need to look in the README file with this.
>>>>>=20
>>>> That assumes git-send-email is the preferred way, which it isn;'t =
for a lot of layers
>>>>=20
>>> Even if it is not the preferred way, it would direct the discussion =
to
>>> the appropriate list. This would reduce the number of mis-directed
>>> emails to this list.
>>>=20
>> You can't fix stupid, sadly.
>>=20
>=20
> Tend to disagree.
> The whole purpose of OE is to make it possible for people,
> stupid or not, to go off and make things which they would
> not be able to do on their own.
>=20
> As I see it, it is no real drawback of adding this, and at least some =
benefit.

The drawback is that people will postpone reading the README even =
longer.

Why are you so dead against having people read the README?=

--Apple-Mail=_E6B40F08-FA3F-414E-BEED-7161748ECC33
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7Yn0AACgkQMkyGM64RGpGfDQCeNNCQLR5sVJ9zIIYqbf6eV2Bo
KQ0AnjoSTYrpVZYlly+MwwtqsgrhHFKX
=0uzQ
-----END PGP SIGNATURE-----

--Apple-Mail=_E6B40F08-FA3F-414E-BEED-7161748ECC33--
