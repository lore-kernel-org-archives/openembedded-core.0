Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RiW2b-00021z-Lq
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 19:58:26 +0100
Received: by werm13 with SMTP id m13so9594799wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2012 10:51:03 -0800 (PST)
Received: by 10.216.136.34 with SMTP id v34mr2958391wei.13.1325703062839;
	Wed, 04 Jan 2012 10:51:02 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id g11sm26792366wbo.6.2012.01.04.10.51.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Jan 2012 10:51:02 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 4 Jan 2012 19:51:00 +0100
In-Reply-To: <1325697336.20759.40.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325101673.git.otavio@ossystems.com.br>
	<a4ffb960e298bf423adcda013c5b58c1db2f6b48.1325101675.git.otavio@ossystems.com.br>
	<1325697336.20759.40.camel@ted>
Message-Id: <45F2E71B-A037-400A-9B76-01700C2030D0@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 14/16] udev: run depmod if modules.dep doesn't exist
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
X-List-Received-Date: Wed, 04 Jan 2012 18:58:26 -0000
X-Groupsio-MsgNum: 15282
Content-Type: multipart/signed;
	boundary="Apple-Mail=_684519FC-A658-4A5D-AB7A-09ECAC7D4DA4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_684519FC-A658-4A5D-AB7A-09ECAC7D4DA4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 4 jan. 2012, om 18:15 heeft Richard Purdie het volgende geschreven:

> On Wed, 2011-12-28 at 19:55 +0000, Otavio Salvador wrote:
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>> meta/recipes-core/udev/udev/init   |    5 +++++
>> meta/recipes-core/udev/udev_164.bb |    2 +-
>> 2 files changed, 6 insertions(+), 1 deletions(-)
>>=20
>> diff --git a/meta/recipes-core/udev/udev/init =
b/meta/recipes-core/udev/udev/init
>> index 322e7e7..8d89d51 100644
>> --- a/meta/recipes-core/udev/udev/init
>> +++ b/meta/recipes-core/udev/udev/init
>> @@ -52,6 +52,11 @@ if [ "$DEVCACHE" !=3D "" ]; then
>> 	fi
>> fi
>>=20
>> +if [ -x /sbin/depmod ] && [ ! -e "/lib/modules/$(uname =
-r)"/modules.dep ]; then
>> +	mkdir -p /lib/modules/$(uname -r)
>> +	depmod -ae
>> +fi
>> +
>> # make_extra_nodes
>> kill_udevd > "/dev/null" 2>&1
>=20
> Why does udev need to do this instead of the kernel module =
postinstalls?
> This strikes me as the wrong thing to be doing here...

Udev runs before those installs get run on first boot.

regards,

Koen=

--Apple-Mail=_684519FC-A658-4A5D-AB7A-09ECAC7D4DA4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.17 (Darwin)

iEYEARECAAYFAk8En5QACgkQMkyGM64RGpGOCACfQrXhbt8DYW/Jp+7F6qQNS8sd
vU0An3Ys6OGDWYV58Yzztioj5GNwnjlM
=IJHe
-----END PGP SIGNATURE-----

--Apple-Mail=_684519FC-A658-4A5D-AB7A-09ECAC7D4DA4--
