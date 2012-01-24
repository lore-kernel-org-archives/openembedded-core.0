Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rpi0V-0001e0-JU
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 16:09:59 +0100
Received: by werc1 with SMTP id c1so1905122wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 07:02:14 -0800 (PST)
Received: by 10.180.109.198 with SMTP id hu6mr4241346wib.16.1327417334391;
	Tue, 24 Jan 2012 07:02:14 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id bj10sm19141917wib.9.2012.01.24.07.02.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jan 2012 07:02:13 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 24 Jan 2012 16:02:11 +0100
In-Reply-To: <cover.1326481387.git.josh@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326481387.git.josh@linux.intel.com>
Message-Id: <09C174D7-2741-4099-BBA1-861E3608EB98@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQka7Ksg1H8baqz/pAOokTEEacjdZjB6JLNOtUBXef7UxxfKMMjdCf3kbUPhor0j4Ve3lur/
Subject: Re: [PATCH 0/4] Add alsa-state from OE Classic v3
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
X-List-Received-Date: Tue, 24 Jan 2012 15:09:59 -0000
X-Groupsio-MsgNum: 16489
Content-Type: multipart/signed;
	boundary="Apple-Mail=_22482B9D-2ACA-41BF-86EE-B8C00B63608F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_22482B9D-2ACA-41BF-86EE-B8C00B63608F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 13 jan. 2012, om 20:10 heeft Joshua Lock het volgende geschreven:

> The small series which follows introduces the alsa-state recipe from =
oe-classic.
> The reason for doing so is to remove the requirement for recipes like =
the
> beagleboard-audio recipe in meta-yocto, which ensures the beagleboards =
sound
> device has the volume turned up.
>=20
> Long term I'd like to implement something more generic for handling =
device
> quirks, but alsa-state is a simple fix for an immediate need that =
should
> standardise how alsa configuration is handled in layers.

FWIW, alsa-lib itself includes initscripts to do this. I dropped =
asound.state in /var/lib/alsa and it just worked since alsactl also =
installs systemd units to handle this. So alsa-state can just hold the =
config files and drop the initscripts by the looks of it.

regards,

Koen=

--Apple-Mail=_22482B9D-2ACA-41BF-86EE-B8C00B63608F
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk8ex/MACgkQMkyGM64RGpGqiACgirR95t4KLeZVZLdl22ygkV2f
oSUAoK/KVasfZADkIj4VkXx8+OVoH8T+
=u3uQ
-----END PGP SIGNATURE-----

--Apple-Mail=_22482B9D-2ACA-41BF-86EE-B8C00B63608F--
