Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RLwgr-0000YX-3i
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 13:46:41 +0100
Received: by wyh5 with SMTP id 5so1237845wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 05:40:32 -0700 (PDT)
Received: by 10.216.135.37 with SMTP id t37mr2866899wei.44.1320324032641;
	Thu, 03 Nov 2011 05:40:32 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id en13sm9907728wbb.22.2011.11.03.05.40.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 05:40:31 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 3 Nov 2011 13:40:24 +0100
In-Reply-To: <9971B226-F171-4D8E-B751-B358923CD41A@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320191934.git.sgw@linux.intel.com>
	<9ef4f9a56a7d68c636768d2a1dbfeb9d6542b5f4.1320191934.git.sgw@linux.intel.com>
	<22CC451F-6D62-44A0-8984-489D40859F17@dominion.thruhere.net>
	<9971B226-F171-4D8E-B751-B358923CD41A@dominion.thruhere.net>
Message-Id: <F5711950-4A76-4337-99BB-46863F3E1C45@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [Pull v3 1/4] avahi: use useradd to create avahi user for avahi-daemon
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
X-List-Received-Date: Thu, 03 Nov 2011 12:46:41 -0000
X-Groupsio-MsgNum: 11855
Content-Type: multipart/signed;
	boundary="Apple-Mail=_60675073-3F0D-4850-9C7E-96BB308A5EC2";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_60675073-3F0D-4850-9C7E-96BB308A5EC2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 3 nov. 2011, om 13:38 heeft Koen Kooi het volgende geschreven:

>=20
> Op 3 nov. 2011, om 13:23 heeft Koen Kooi het volgende geschreven:
>=20
>>=20
>> Op 2 nov. 2011, om 01:21 heeft Saul Wold het volgende geschreven:
>>=20
>>> DBus was failing to start correct since the avahi user was
>>> not setup.
>>>=20
>>> Keep the dbus reload since this could still be installed
>>> as a package an would require a dbus restart.
>>=20
>> This doesn't seem to work for me, I keep getting "Unknown username =
'avahi' in message bus configuration file"
>=20
> Manually running the preinst on the target *does* work, so something =
isn't right during do_rootfs.

+ sh =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-lin=
ux-gnueabi/systemd-image-1.0-r0/rootfs/var/lib/opkg/info/avahi-daemon.prei=
nst
Running useradd commands...
grep: =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-lin=
ux-gnueabi/systemd-image-1.0-r0/rootfs/etc/passwd: No such file or =
directory
useradd: group '1000' does not exist
useradd: the GROUP=3D configuration in /etc/default/useradd will be =
ignored
useradd: user 'avahi' already exists

I think I know what's going wrong, patch coming soon!



--Apple-Mail=_60675073-3F0D-4850-9C7E-96BB308A5EC2
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6yi7gACgkQMkyGM64RGpEUMgCggwgw3ZvnNrqJMu8vND3OyFgw
NuAAoIiH2qxCxfiYFDY4dWpMxkLIO1wR
=2nyR
-----END PGP SIGNATURE-----

--Apple-Mail=_60675073-3F0D-4850-9C7E-96BB308A5EC2--
