Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TB3Ym-0007DK-6j; Mon, 10 Sep 2012 14:57:52 +0200
Received: by eaad12 with SMTP id d12so793054eaa.6
	for <multiple recipients>; Mon, 10 Sep 2012 05:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0USUyj0Gjc8fVEnyrHlwsuzOGOxo75Hutq9XK+t0TX0=;
	b=RsrbOuHp5QGRYTE8xgn7kiHcXVapQvM3UyqpGjaYhmAXN4jWCoYu+a+rdfRSoxTWLK
	RqT8gJLyzISMlpuIAowWvdD2liS8qvKoD9Bp07/NlkULHs5/57Wo1ZbuL5BRHR1XICCB
	UCOhVXa7QxEjuh3vGjeWTYM8e5NhIrai6evbyS76oVbglr13fy1ZBm8mf/W6cGhRM6Go
	dfAA3BQbLhaxPyrbDVsZpUUZrswgjNkw/BKksgKpZm/ppQDXtie6MfMmYPnKci7+CRWY
	Muv+OMGxH/KYLQteTZaU5wZqihv/0MLa7dCadoc4oTTarQjsP1nLf/Xkfnrb76KMd9lv
	5jPg==
Received: by 10.204.128.196 with SMTP id l4mr3872384bks.21.1347281122169;
	Mon, 10 Sep 2012 05:45:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m9sm7022863bkm.10.2012.09.10.05.45.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Sep 2012 05:45:21 -0700 (PDT)
Date: Mon, 10 Sep 2012 14:45:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120910124518.GB3502@jama.jama.net>
References: <20120910120835.C24EF10348@opal>
MIME-Version: 1.0
In-Reply-To: <20120910120835.C24EF10348@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Khem Raj : eglibc-2.16: Add kconfig infrastructure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2012 12:57:52 -0000
X-Groupsio-MsgNum: 28936
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Content-Disposition: inline

--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 10, 2012 at 12:08:35PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 4282b86072fd5a916d0d12082d6ba575bce691f2
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D4282b86072fd5a916d0d12082d6ba575bce691f2
>=20
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Wed Sep  5 21:52:34 2012 -0700
>=20
> eglibc-2.16: Add kconfig infrastructure
>=20
> This will let eglibc use kernel like option
> management through kconfig
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

eglibc-initial now fails to build with
| make[1]: Entering directory
`/OE/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/eglibc-initial-2.16-=
r8+svnr20393/eglibc-2_16/libc'
| make[1]: *** No rule to make target
`/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/conf', needed by
`config'.  Stop.
| make[1]: Leaving directory
`/OE/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/eglibc-initial-2.16-=
r8+svnr20393/eglibc-2_16/libc'

do you have any hint for that?

I guess it's because, eglibc-initial.inc overwrites DEPENDS from eglibc_2.1=
6.bb
OE @ ~/openembedded-core/meta/recipes-core/eglibc $ grep DEPENDS eglibc_2.1=
6.bb=20
DEPENDS +=3D "gperf-native kconfig-frontends-native"
OE @ ~/openembedded-core/meta/recipes-core/eglibc $ grep DEPENDS eglibc-ini=
tial.inc=20
DEPENDS =3D "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"

and it's included after eglibc_2.16.bb
OE @ ~/openembedded-core/meta/recipes-core/eglibc $ head -n 3 eglibc-initia=
l_2.16.bb=20
require eglibc_${PV}.bb
require eglibc-initial.inc

Cheers,

>=20
> ---
>=20
>  .../0001-eglibc-menuconfig-support.patch           | 1007 ++++++++++++++=
++++++
>  ...0002-eglibc-menuconfig-hex-string-options.patch |  169 ++++
>  ...0003-eglibc-menuconfig-build-instructions.patch |  176 ++++
>  meta/recipes-core/eglibc/eglibc_2.16.bb            |    5 +-
>  4 files changed, 1356 insertions(+), 1 deletions(-)
>=20
> Diff:   http://git.openembedded.org/?p=3Dopenembedded-core.git/?a=3Dcommi=
tdiff;h=3D4282b86072fd5a916d0d12082d6ba575bce691f2
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBN4N4ACgkQN1Ujt2V2gByoYACfbR5OLqadIqnzQSr7Yfx6tNFk
fMQAnAhESvUcyx52ipsJmPm5erceqc69
=SCAn
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--
