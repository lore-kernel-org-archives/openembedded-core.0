Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RLFJg-00089L-9H
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 15:27:52 +0100
Received: by eyd9 with SMTP id 9so6184687eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 07:21:46 -0700 (PDT)
Received: by 10.216.210.38 with SMTP id t38mr6376407weo.48.1320157305701;
	Tue, 01 Nov 2011 07:21:45 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id es5sm38644836wbb.11.2011.11.01.07.21.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 07:21:44 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <326c1a05ec310abcb0ec8363bcbe952c05fdf9fb.1319665176.git.julian.pidancet@gmail.com>
Date: Tue, 1 Nov 2011 15:21:41 +0100
Message-Id: <187337B8-18D1-4D7D-926C-EE015A8CD801@dominion.thruhere.net>
References: <326c1a05ec310abcb0ec8363bcbe952c05fdf9fb.1319665176.git.julian.pidancet@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: Julian Pidancet <julian.pidancet@gmail.com>
Subject: Re: [PATCH v2] Give coreutils a chance to build the df utility
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
X-List-Received-Date: Tue, 01 Nov 2011 14:27:52 -0000
X-Groupsio-MsgNum: 11741
Content-Type: multipart/signed;
	boundary="Apple-Mail=_16B61EF9-AA08-446D-81E4-B6739A8CD0CD";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_16B61EF9-AA08-446D-81E4-B6739A8CD0CD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 26 okt. 2011, om 23:41 heeft Julian Pidancet het volgende geschreven:

> The coreutils configure script is unable determine how to get free
> space from the Operating System when cross-compiling.
> This changes caches the result of the "statfs2_bsize" test for the
> coreutils configure script.
> Both glibc and uclibc defines statfs as a two-argument function
> and uses a struct statfs containing a f_bsize field. That's why
> the fu_cv_sys_stat_statfs2_bsize variable has to be defined for
> both libcs.
>=20
> Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>
> ---
> meta/recipes-core/coreutils/coreutils_8.14.bb |    2 +-
> meta/site/common-glibc                        |    3 +++
> meta/site/common-uclibc                       |    3 +++
> 3 files changed, 7 insertions(+), 1 deletions(-)


A bit late, but this is missing a PR bump, could you please send a =
followup patch to fix that?

regards,

Koen



--Apple-Mail=_16B61EF9-AA08-446D-81E4-B6739A8CD0CD
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6wAHUACgkQMkyGM64RGpH2PgCfVrrF+lqAKfafDmpYrodlDKEh
x5kAoLaDy8Ra/h0qoNRXy2nTg534jK3l
=bUSr
-----END PGP SIGNATURE-----

--Apple-Mail=_16B61EF9-AA08-446D-81E4-B6739A8CD0CD--
