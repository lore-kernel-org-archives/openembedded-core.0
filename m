Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RO4XL-0002Jh-N0
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 10:33:39 +0100
Received: by wwf4 with SMTP id 4so1695656wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 01:27:24 -0800 (PST)
Received: by 10.227.197.71 with SMTP id ej7mr1082616wbb.15.1320830844263;
	Wed, 09 Nov 2011 01:27:24 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gd6sm4970509wbb.1.2011.11.09.01.27.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 01:27:22 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 9 Nov 2011 10:27:18 +0100
In-Reply-To: <dd949a69e2e7c9379caf5bb6162259c4f2584ea5.1320799787.git.josh@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320799787.git.josh@linux.intel.com>
	<dd949a69e2e7c9379caf5bb6162259c4f2584ea5.1320799787.git.josh@linux.intel.com>
Message-Id: <8EF5D367-6159-471F-8F2C-F3FA3216F05D@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 2/3] classes/[gnome|gnomebase|mime]: enhance gnome related classes
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
X-List-Received-Date: Wed, 09 Nov 2011 09:33:39 -0000
X-Groupsio-MsgNum: 12190
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9E4850BF-82AA-4F34-997C-CBEFD94224B8";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9E4850BF-82AA-4F34-997C-CBEFD94224B8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 9 nov. 2011, om 01:53 heeft Joshua Lock het volgende geschreven:

> This patch pulls in the gnome related classes from oe-core which
> adds extra packaging rules and functionality whilst modularising =
things
> so that one can get a subset of gnome functionality without adding a =
lot
> of extra dependencies.
>=20
> These aren't an exact copy of the classes from meta-openembedded, =
notable
> differences are:
> * gnome.bbclass - I dropped the BBCLASSEXTEND

It looks that will break a number of things in meta-oe, why was it =
dropped?


> * mime.bbclass:
>  - updated coding style
>  - use which to find update-mime-database program rather than hard =
coded
>  - fix typo in populate_packges_append such that it's actually called

Will it drag in the shared-mime-info-data package you created =
automatically now?

Also, do you have matching patches to update meta-oe now that these =
things are heading into oe-core?

regards,

Koen=

--Apple-Mail=_9E4850BF-82AA-4F34-997C-CBEFD94224B8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk66R3kACgkQMkyGM64RGpGmJwCdFlRYE8mKV8ooFUM/9GuyKFAa
nKMAoLR6wr40xm4j4St/jfQM5hIrjzl0
=e9hS
-----END PGP SIGNATURE-----

--Apple-Mail=_9E4850BF-82AA-4F34-997C-CBEFD94224B8--
