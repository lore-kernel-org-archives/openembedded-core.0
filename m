Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVU3V-0003GF-92
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 21:13:30 +0100
Received: by eaad13 with SMTP id d13so3593180eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 12:06:48 -0800 (PST)
Received: by 10.213.23.1 with SMTP id p1mr1511647ebb.146.1322597208623;
	Tue, 29 Nov 2011 12:06:48 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 49sm108717700eec.1.2011.11.29.12.06.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 12:06:47 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 29 Nov 2011 21:06:42 +0100
In-Reply-To: <4ED53438.9040903@emagii.com>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ED0CC76.4040606@emagii.com> <1322579029.7964.0.camel@ted>
	<4ED53438.9040903@emagii.com>
Message-Id: <7E3B66F1-28FC-45D4-BA89-193D9EA6DCA6@dominion.thruhere.net>
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
X-List-Received-Date: Tue, 29 Nov 2011 20:13:30 -0000
X-Groupsio-MsgNum: 13160
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8709DD39-913B-447C-B578-DE36ADF293D8";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8709DD39-913B-447C-B578-DE36ADF293D8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 29 nov. 2011, om 20:36 heeft Ulf Samuelsson het volgende geschreven:

> On 2011-11-29 16:03, Richard Purdie wrote:
>>=20
>>> 2.    "ftp://elsie.nci.nih.gov/pub/tzcode2011i.tar.gz" is no longer
>>> available.
>>>          tzdata , same problem.
>>>          The recipe is located in two places.
>>>          meta-openembedded/meta-oe/recipes-extended/tz*/tz*.bb have =
the
>>> problem
>>>          This is what the build uses.
>> This is something to raise with the meta-oe maintainers. I think =
there
>> isn't a problem in OECore.
>=20
> Since we now have a large number of layers, maybe it is a good
> idea to define in each layer,  how the "git send email" should behave =
in
> by providing a better ".git/config" file in the trunk?
>=20
>=20
> I.E:
>=20
> [sendemail]
>    to =3D openembedded-core@lists.openembedded.org
>=20
> or
> meta-angstrom/.git/config
> [sendemail]
>    to =3D angstrom-distro-devel@linuxtogo.org
> [format]
>    subjectprefix =3D "[meta-angstrom]"
>=20
>=20
> No need to look in the README file with this.

That assumes git-send-email is the preferred way, which it isn;'t for a =
lot of layers=

--Apple-Mail=_8709DD39-913B-447C-B578-DE36ADF293D8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7VO1UACgkQMkyGM64RGpGyVgCfbDUbG4SB+yjecyjYl9DBMmh7
pFUAmwYfHqP+TggBGiGraFnQXALU3u6M
=Jibv
-----END PGP SIGNATURE-----

--Apple-Mail=_8709DD39-913B-447C-B578-DE36ADF293D8--
