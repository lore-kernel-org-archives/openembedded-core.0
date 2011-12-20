Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rd0AI-0003Me-Ac
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 14:55:35 +0100
Received: by wibhq7 with SMTP id hq7so1451103wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 05:48:30 -0800 (PST)
Received: by 10.180.91.201 with SMTP id cg9mr4901096wib.15.1324388909185;
	Tue, 20 Dec 2011 05:48:29 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ei9sm4691839wid.0.2011.12.20.05.48.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 05:48:28 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 20 Dec 2011 14:48:18 +0100
In-Reply-To: <CAP9ODKoS9HK089TEFRwrddk5gnd5rwArZdWvRysSt2GH47N3gQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EEBC476.20108@linux.intel.com> <4EEF8073.2040205@linux.intel.com>
	<CAP9ODKoS9HK089TEFRwrddk5gnd5rwArZdWvRysSt2GH47N3gQ@mail.gmail.com>
Message-Id: <A77B2F65-71EC-46E5-B396-C5A6FA0CEA7C@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: UDEV-145??
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
X-List-Received-Date: Tue, 20 Dec 2011 13:55:35 -0000
X-Groupsio-MsgNum: 14517
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B5F3ED53-B484-4997-88B9-C091BEFD9D53";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B5F3ED53-B484-4997-88B9-C091BEFD9D53
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 20 dec. 2011, om 14:35 heeft Otavio Salvador het volgende geschreven:

> On Mon, Dec 19, 2011 at 16:20, Joshua Lock <josh@linux.intel.com> =
wrote:
> On 16/12/11 14:21, Saul Wold wrote:
> >
> > Does anyone know why we might be keeping this older version around?  =
I
> > know that in the past there were kernel <-> udev issues. Are most =
usages
> > now using current kernels and udev?
>=20
> I was wondering the same thing. I have a WIP patch series to drop the
> old version and the old inc file.
>=20
> Further I'd like to try and get meta-oe using at least most of the
> oe-core udev, I've not looked at the differences there yet.
>=20
> I read this e-mail after I started working on this. My current WIP =
patchset is at:
>=20
> =
https://github.com/OSSystems/oe-core/compare/ae4118a1f78f113c3d687c3aa6a86=
007cf977cae...master
>=20
> I am going to finish this getting 175 on oe-core but those patches =
seems good for merging to me.

Keep in mind that udev 175 looks a lot different than earlier versions, =
e.g. no udev-acl anymore, locations have moved, etc. So the custom OE =
initscripts will need a fair amount of changes for people still using =
sysvinit.=

--Apple-Mail=_B5F3ED53-B484-4997-88B9-C091BEFD9D53
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7wkicACgkQMkyGM64RGpG6mwCfTuciYWXZ57FgiZIlboCduVHQ
n/8An3H9OgsCQp5EQRwT0dcrv40QZU9e
=Fj31
-----END PGP SIGNATURE-----

--Apple-Mail=_B5F3ED53-B484-4997-88B9-C091BEFD9D53--
