Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RSuCP-0008UJ-SL
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 18:32:01 +0100
Received: by wwo1 with SMTP id 1so298238wwo.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 09:25:30 -0800 (PST)
Received: by 10.227.203.147 with SMTP id fi19mr15489918wbb.14.1321982730670;
	Tue, 22 Nov 2011 09:25:30 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id m25sm17310844wbp.6.2011.11.22.09.25.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Nov 2011 09:25:29 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 22 Nov 2011 18:25:25 +0100
In-Reply-To: <cover.1321972798.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321972798.git.paul.eggleton@linux.intel.com>
Message-Id: <503E71C5-C1CA-4A51-82EF-C52CBC2E43C5@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [RFC PATCH 0/1] packagehistory improvement
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
X-List-Received-Date: Tue, 22 Nov 2011 17:32:02 -0000
X-Groupsio-MsgNum: 12724
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C776F5F8-830B-4151-8BD8-7E228B376953";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C776F5F8-830B-4151-8BD8-7E228B376953
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 22 nov. 2011, om 15:52 heeft Paul Eggleton het volgende geschreven:

> This is the initial implementation of the improvement for
> packagehistory.bbclass. This bbclass is intended to be used to help
> track changes to package output over time and hopefully catch unusual
> situations such as a package doubling in size. You can try it out by
> adding INHERIT +=3D "packagehistory" to your local.conf, building
> something that performs do_package and then looking in =
TMPDIR/pkghistory
> to view the output.
>=20
> I've tried to keep it fairly simple - i.e. no new storage backend, =
just
> plain files, although I anticipate most people using it will want to
> store the output in a git repository. There's potential for recording
> more per-recipe / per-package information, if there are suggestions =
I'd
> be keen to hear them.
>=20
>=20
> Please review the following changes for suitability for inclusion. If =
you have
> any objections or suggestions for improvement, please respond to the =
patches.

I have a question instead:

Does it still suffer from the bug where it will break if you change =
machine and something goes backward in PV (e.g. gcc 4.6 is used on arm, =
but 4.5 on ppc)?

regards,

Koen=

--Apple-Mail=_C776F5F8-830B-4151-8BD8-7E228B376953
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7L2wcACgkQMkyGM64RGpHF2wCcDZ6nGECbwnUVIixbCx74wZK6
GoQAoJM6rAL3lADxOVXYL6CK5gv/sy0H
=pgMA
-----END PGP SIGNATURE-----

--Apple-Mail=_C776F5F8-830B-4151-8BD8-7E228B376953--
