Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RcOG2-0003Zh-Rt
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Dec 2011 22:26:58 +0100
Received: by werm13 with SMTP id m13so1058390wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 13:19:56 -0800 (PST)
Received: by 10.216.139.155 with SMTP id c27mr5887629wej.37.1324243196795;
	Sun, 18 Dec 2011 13:19:56 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	fy13sm23209384wbb.18.2011.12.18.13.19.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Dec 2011 13:19:56 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Sun, 18 Dec 2011 22:19:53 +0100
In-Reply-To: <CADkTA4OLwUcM86JbCXDOPXUOb1hH+vvKfShjaAsXP3e9Ek0f=A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
	<5C0105D4-44BE-4584-9ED9-36970B91A34C@dominion.thruhere.net>
	<CADkTA4OLwUcM86JbCXDOPXUOb1hH+vvKfShjaAsXP3e9Ek0f=A@mail.gmail.com>
Message-Id: <FB6AAD0F-5F91-48D3-8D02-FCBEC19A4B9E@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/5] kernel.bbclass: move uImage handling to separate task
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
X-List-Received-Date: Sun, 18 Dec 2011 21:26:59 -0000
X-Groupsio-MsgNum: 14410
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DD359FA1-B1E0-477A-8985-9C45B09E11BD";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DD359FA1-B1E0-477A-8985-9C45B09E11BD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 18 dec. 2011, om 21:27 heeft Bruce Ashfield het volgende geschreven:

> On Sun, Dec 18, 2011 at 3:13 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 18 dec. 2011, om 20:47 heeft Dmitry Eremin-Solenikov het volgende =
geschreven:
>>=20
>>> As per org.oe.dev and meta-oe's kernel.bbclass move uImage creation =
to
>>> separate task from do_deploy. This way the do_install task can also
>>> benefit from generated uImage.
>>>=20
>>> The only major feature of oe-core's version (not to recreate uImage
>>> if it exists) is retained in this patch.
>>=20
>> I still don't agree with that behaviour. The in-kernel uImage code is =
just like the in-kernel defconfigs: useless for people who aren't kernel =
developers.
>=20
> In that case, shouldn't people doing u-boot development (or other
> non-kernel developers),
> be building a uImage via something that isn't in kernel.bbclass ?

I use the kernel.bbclass in meta-oe, that does what I need.=

--Apple-Mail=_DD359FA1-B1E0-477A-8985-9C45B09E11BD
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7uWPsACgkQMkyGM64RGpHe8ACdEdFi1Nh17keaiRxAAWQI3Rh6
2CYAoKcYow2t+pnGOlJs7teSNB4IQARn
=3QuN
-----END PGP SIGNATURE-----

--Apple-Mail=_DD359FA1-B1E0-477A-8985-9C45B09E11BD--
