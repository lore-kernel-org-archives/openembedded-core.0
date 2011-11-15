Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RQE3H-0005r9-Mg
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 09:07:31 +0100
Received: by wwp14 with SMTP id 14so5213765wwp.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 00:01:06 -0800 (PST)
Received: by 10.227.206.81 with SMTP id ft17mr15522491wbb.23.1321344066603;
	Tue, 15 Nov 2011 00:01:06 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff6sm27888574wbb.10.2011.11.15.00.01.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Nov 2011 00:01:05 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 15 Nov 2011 09:00:56 +0100
In-Reply-To: <1321315894.26881.117.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EC1A8A1.5010303@balister.org> <1321315894.26881.117.camel@ted>
Message-Id: <EE00B0A1-9D71-46B3-9114-44B80A870E85@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: Build failure in samba
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
X-List-Received-Date: Tue, 15 Nov 2011 08:07:32 -0000
X-Groupsio-MsgNum: 12467
Content-Type: multipart/signed;
	boundary="Apple-Mail=_341554A1-E6A7-4BDA-BD9C-767BB6D94757";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_341554A1-E6A7-4BDA-BD9C-767BB6D94757
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 15 nov. 2011, om 01:11 heeft Richard Purdie het volgende geschreven:

> On Mon, 2011-11-14 at 18:47 -0500, Philip Balister wrote:
>> Anyone have an idea about this failure building samba?
>>=20
>> http://pastebin.com/5PGX6MZr
>>=20
>> I'm going to look more tomorrow, just hoping someone sees something =
obvious.
>=20
> Maybe this might help:
>=20
>=20
> commit ce064001e628597cab9c5713f1351e03478a4aa5
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Wed Nov 2 14:24:37 2011 +0000
>=20
>    samba: Force python disabled for now to avoid host contamination
>=20
> diff --git a/recipes-support/samba/samba_3.5.6.bb =
b/recipes-support/samba/samba_3.5.6.bb
> index d5945f9..a44ce02 100644
> --- a/recipes-support/samba/samba_3.5.6.bb
> +++ b/recipes-support/samba/samba_3.5.6.bb

Weird, samba is in recipes-connectivity over here:

koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe$ find . | =
grep samba_3.5.6
./recipes-connectivity/samba/samba_3.5.6.bb



--Apple-Mail=_341554A1-E6A7-4BDA-BD9C-767BB6D94757
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7CHD8ACgkQMkyGM64RGpEGOgCcCUd+KjoYvX28ManG2LjgGsTZ
K3sAnjkJ4CReBlsT8fI5eLBCClB7KPcf
=PmCB
-----END PGP SIGNATURE-----

--Apple-Mail=_341554A1-E6A7-4BDA-BD9C-767BB6D94757--
