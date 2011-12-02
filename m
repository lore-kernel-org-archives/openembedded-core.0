Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RWa6Z-0005W6-DL
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 21:53:11 +0100
Received: by faaa19 with SMTP id a19so2384229faa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2011 12:46:25 -0800 (PST)
Received: by 10.180.81.163 with SMTP id b3mr11835153wiy.20.1322858785494;
	Fri, 02 Dec 2011 12:46:25 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id em4sm11988123wbb.20.2011.12.02.12.46.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 12:46:24 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2489509.77F1RcmAmb@helios>
Date: Fri, 2 Dec 2011 21:46:19 +0100
Message-Id: <43AA1B4B-2E70-4CCA-A1FC-D2E895AAEB05@dominion.thruhere.net>
References: <cover.1322782677.git.paul.eggleton@linux.intel.com>
	<4517756.DZJl4RxAdk@helios>
	<188E020B-4FA5-4554-A145-E7581C3001A3@dominion.thruhere.net>
	<2489509.77F1RcmAmb@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 2/2] classes/buildhistory: merge in package history functionality
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
X-List-Received-Date: Fri, 02 Dec 2011 20:53:11 -0000
X-Groupsio-MsgNum: 13591
Content-Type: multipart/signed;
	boundary="Apple-Mail=_ECF4949A-E7C7-4F60-8681-061948AA015D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_ECF4949A-E7C7-4F60-8681-061948AA015D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 2 dec. 2011, om 12:49 heeft Paul Eggleton het volgende geschreven:

> On Friday 02 December 2011 12:46:40 Koen Kooi wrote:
>> I noticed the extra bitbake spew :)
>> https://github.com/Angstrom-distribution/buildhistory/commits/master
>=20
> Yes, once you've established a baseline of course it should get much =
quieter=20
> :)

I did uncover a case of duplicate depends in the dot files:

=
https://github.com/Angstrom-distribution/buildhistory/commit/9954a4a87f325=
0fbf96c2509c75a279b89c20fe6

Could that be caused by rebuilds due to sstate confusion when switching =
machines?=

--Apple-Mail=_ECF4949A-E7C7-4F60-8681-061948AA015D
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7ZOR4ACgkQMkyGM64RGpFlQgCbBaGzvMDjgkMgGL+9uEOjh7m1
vvkAn22RHocfGvy9lmhKGRjNE5ePv/pX
=txxH
-----END PGP SIGNATURE-----

--Apple-Mail=_ECF4949A-E7C7-4F60-8681-061948AA015D--
