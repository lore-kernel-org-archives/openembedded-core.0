Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWOPb-0000jy-Ak
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 09:51:47 +0200
Received: by wye20 with SMTP id 20so4249162wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 00:48:21 -0700 (PDT)
Received: by 10.227.170.74 with SMTP id c10mr6045189wbz.104.1308037701696;
	Tue, 14 Jun 2011 00:48:21 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fm14sm4816267wbb.7.2011.06.14.00.48.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 00:48:20 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <f1001141de7bf605c79b8ae9b44160e4cda9e736.1308000501.git.sgw@linux.intel.com>
Date: Tue, 14 Jun 2011 09:48:18 +0200
Message-Id: <59F3EB02-7EFE-4E50-AD6E-A953952FEA6B@dominion.thruhere.net>
References: <cover.1308000501.git.sgw@linux.intel.com>
	<f1001141de7bf605c79b8ae9b44160e4cda9e736.1308000501.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] autoconf/automake: Bump PR to resolve perl-native issue
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
X-List-Received-Date: Tue, 14 Jun 2011 07:51:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

To be clear: does the PR bump fix the issues or was there a fix earlier =
that lacked a PR bump?

Op 13 jun 2011, om 23:30 heeft Saul Wold het volgende geschreven:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-devtools/autoconf/autoconf_2.68.bb |    2 +-
> meta/recipes-devtools/automake/automake.inc     |    2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb =
b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
> index c647a15..638e677 100644
> --- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
> +++ b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
> @@ -1,6 +1,6 @@
> require autoconf.inc
>=20
> -PR =3D "r0"
> +PR =3D "r1"
>=20
> PARALLEL_MAKE =3D ""
>=20
> diff --git a/meta/recipes-devtools/automake/automake.inc =
b/meta/recipes-devtools/automake/automake.inc
> index 524e93e..beeec7b 100644
> --- a/meta/recipes-devtools/automake/automake.inc
> +++ b/meta/recipes-devtools/automake/automake.inc
> @@ -4,7 +4,7 @@ Standards. Automake requires the use of Autoconf."
> LICENSE =3D "GPLv2"
> HOMEPAGE =3D "http://www.gnu.org/software/automake/"
> SECTION =3D "devel"
> -PR =3D "r1"
> +PR =3D "r2"
>=20
> SRC_URI =3D "${GNU_MIRROR}/automake/automake-${PV}.tar.bz2 "
>=20
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



