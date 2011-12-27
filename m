Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RffLQ-0005o1-VF
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Dec 2011 23:18:05 +0100
Received: by wibhq7 with SMTP id hq7so5292003wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2011 14:10:49 -0800 (PST)
Received: by 10.180.96.72 with SMTP id dq8mr64779848wib.10.1325023848933;
	Tue, 27 Dec 2011 14:10:48 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dd4sm69134821wib.1.2011.12.27.14.10.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Dec 2011 14:10:48 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 27 Dec 2011 23:10:46 +0100
In-Reply-To: <4EFA3FEE.3090107@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1325018118-30223-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1325018118-30223-2-git-send-email-fransmeulenbroeks@gmail.com>
	<4EFA3FEE.3090107@linux.intel.com>
Message-Id: <3524D1BF-B35F-41D9-94E2-53978FC8ABC8@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 2/2] u-boot: added generating the env utils (fixes bug 1800)
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
X-List-Received-Date: Tue, 27 Dec 2011 22:18:05 -0000
X-Groupsio-MsgNum: 14837
Content-Type: multipart/signed;
	boundary="Apple-Mail=_75722699-0DA8-4E76-A85B-9E27B8BD93C7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_75722699-0DA8-4E76-A85B-9E27B8BD93C7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 27 dec. 2011, om 23:00 heeft Saul Wold het volgende geschreven:

> On 12/27/2011 12:35 PM, Frans Meulenbroeks wrote:
>> This adds building the u-boot tools for target.
>> (fw_printenv, fw_setenv).
>> They are put into a separate package
>> With these files it becomes possible to modify
>> the u-boot environment when linux is booted
>>=20
>> The #ifdef's in fw_env.h were needed to avoid compilation issues
>> The constants have been changed to more meaningful defaults
>> (as 128k flash pages are much more common than 4k pages)
>> but can be overridden using a configuration file.
>>=20
>> This resolves bug 1800
>>=20
> Thanks for the fix, in the future please mark this as [YOCTO #1800]
>=20
> Reviewing and someone will test also.

This seems to be copying =
http://cgit.openembedded.org/openembedded/commit/?id=3Dfde321de556abd8ce66=
e494ab21bc4a2d4e28699 without credit=

--Apple-Mail=_75722699-0DA8-4E76-A85B-9E27B8BD93C7
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk76QmgACgkQMkyGM64RGpHOYgCeIenNRlT3QLNzKb6mv9kez9tk
/H0AoKOd0ycOmPV/IQiYEuQseZ7SYh9L
=fVXu
-----END PGP SIGNATURE-----

--Apple-Mail=_75722699-0DA8-4E76-A85B-9E27B8BD93C7--
