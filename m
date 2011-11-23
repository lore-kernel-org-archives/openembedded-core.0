Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RTKwn-0003Op-AF
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 23:05:41 +0100
Received: by wwo1 with SMTP id 1so2222485wwo.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 13:59:09 -0800 (PST)
Received: by 10.216.168.196 with SMTP id k46mr3451990wel.34.1322085549117;
	Wed, 23 Nov 2011 13:59:09 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id es5sm21847409wbb.11.2011.11.23.13.59.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Nov 2011 13:59:08 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 23 Nov 2011 22:59:01 +0100
In-Reply-To: <CAMKF1sp2v-vs_S6Tq7kzKvOBhjEsrtE4qDfOE0uzOBn6p6nddQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320799787.git.josh@linux.intel.com>
	<552def63eb1b587a3f0685c7e604ab1b9a1ac7e5.1320799787.git.josh@linux.intel.com>
	<4EC64DA5.2020406@ts.fujitsu.com>
	<CAMKF1sp2v-vs_S6Tq7kzKvOBhjEsrtE4qDfOE0uzOBn6p6nddQ@mail.gmail.com>
Message-Id: <309750B0-0A26-48AE-93CA-7F6556AD4880@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/3] shared-mime-info: package runtime data separately
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
X-List-Received-Date: Wed, 23 Nov 2011 22:05:41 -0000
X-Groupsio-MsgNum: 12845
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E647811A-0DF2-4D5C-B58D-48A8B0A04814";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E647811A-0DF2-4D5C-B58D-48A8B0A04814
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 23 nov. 2011, om 22:45 heeft Khem Raj het volgende geschreven:

> On Fri, Nov 18, 2011 at 4:20 AM, Rainer Koenig
> <Rainer.Koenig@ts.fujitsu.com> wrote:
>> Am 09.11.2011 01:53, schrieb Joshua Lock:
>>> The freedesktop.org.xml is required when updating the mime database =
but
>>> otherwise not much use. Therefore package it separately, rather than
>>> removing it completely, so that it can be used as required for =
on-device
>>> updates without adding almost 2MB to every image which hase =
shared-mime-info.
>>=20
>> somehow this patch breaks the image creation for systemd-gnome-image.
>> Famous last words from bitbake:
>=20
> Did you do a clean build ? if not try that

=
http://cgit.openembedded.org/openembedded-core/commit/?id=3D79ee0f8c849cd5=
de16b6ae1b3dd6c43bbad472b2=

--Apple-Mail=_E647811A-0DF2-4D5C-B58D-48A8B0A04814
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEUEARECAAYFAk7NbKoACgkQMkyGM64RGpFdEwCfbZJS0gHkvNU/6NFxksVaG9WI
Il4Alj7qx52T1Zhf/a24ISwaNsXHvis=
=4i4l
-----END PGP SIGNATURE-----

--Apple-Mail=_E647811A-0DF2-4D5C-B58D-48A8B0A04814--
