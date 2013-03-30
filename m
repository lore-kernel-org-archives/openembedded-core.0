Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1ULrxa-00071M-KT; Sat, 30 Mar 2013 10:20:29 +0100
Received: by mail-pb0-f52.google.com with SMTP id ma3so530646pbc.39
	for <multiple recipients>; Sat, 30 Mar 2013 02:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=o2fjRq+hSHgfzvJ51H/54QxQOyxNySySaNQVf+PhtUc=;
	b=mAcVDA2eou00apn6/wN9uZQQYUawQJKqBEK3bc8yvFfQuu4c3w50PaQRanPiXal/wC
	yluQaNuAco+vAJu1RRAnJNCtU+5LqPz6Sxz/Deb0Rl/AhHVwKY979TBF37VVClKxjJjm
	aj2NqC8WGKW+4izncLsI/7rM27Kg9dbouUojXoOE9EcIRvEK2BuBoanixiAG1np293Fy
	xr0VutkWpDj7nvg5TWwcuxBp3zwcCR9OLksFLvtN4R1vH0wRVadtan9TjQtYbSA+XJFz
	cXe1H5g/EmyaTol+MTp6cXmWhefEU7aHPC9Q2JZCvp33TP2ucgLnyeyoOhOY4TjaUZpb
	vmRQ==
X-Received: by 10.68.239.194 with SMTP id vu2mr7688608pbc.147.1364634200323;
	Sat, 30 Mar 2013 02:03:20 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id i10sm5926358pbd.1.2013.03.30.02.03.17
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 30 Mar 2013 02:03:18 -0700 (PDT)
Date: Sat, 30 Mar 2013 10:03:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130330090319.GM11120@jama>
References: <6B577862-4C24-49DB-80F2-3A1408AF8337@gmail.com>
	<20130329145514.GH11120@jama>
MIME-Version: 1.0
In-Reply-To: <20130329145514.GH11120@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 4.8 recipes
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
X-List-Received-Date: Sat, 30 Mar 2013 09:20:31 -0000
X-Groupsio-MsgNum: 37253
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DheUW4aQn8WJk6WR"
Content-Disposition: inline

--DheUW4aQn8WJk6WR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2013 at 03:55:14PM +0100, Martin Jansa wrote:
> On Wed, Mar 27, 2013 at 10:51:50PM -0700, Khem Raj wrote:
> > All,
> >=20
> > I have added gcc 4.8 recipes and the branch is here=20
> >=20
> > git://git.openembedded.org/openembedded-core-contrib kraj/gcc-4.8
> >=20
> > cgit
> >=20
> > http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc=
-4.8
> >=20
> > Please test it out on your respective environments if you can.
>=20
> First failed task in world rebuild:

And now the rest of qemuarm gcc-4.8 world failure

openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_comp=
ile
ICE as reported before

openembedded-core/meta/recipes-devtools/gcc/gcc_4.8.bb, do_compile
gcc-4.8.0/libatomic/config/linux/arm/store_n.c:46:0: fatal error:
opening dependency file .deps/store_1_.lo.Ppo: No such file or directory
|  #include "../../../store_n.c"

openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.0.bb=
, do_compile
xf86Crtc.c:391:5: error: implicit declaration of function 'xf86InputRotatio=
nNotify' [-Werror=3Dimplicit-function-declaration]

openembedded-core/meta/recipes-graphics/xorg-app/xmodmap_1.0.7.bb, do_compi=
le
xmodmap.c:289:5: error: implicit declaration of function 'asprintf' [-Werro=
r=3Dimplicit-function-declaration]

meta-openembedded/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb, do_compile
glib-2.0/glib/gmacros.h:162:53: error: typedef '_GStaticAssertCompileTimeAs=
sertion_0' locally defined but not used [-Werror=3Dunused-local-typedefs]

meta-openembedded/meta-oe/recipes-connectivity/networkmanager/modemmanager_=
0.6.0.0.bb, do_compile
glib-2.0/glib/gmacros.h:162:53: error: typedef '_GStaticAssertCompileTimeAs=
sertion_0' locally defined but not used

meta-openembedded/meta-oe/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb,=
 do_compile
ipsec_doi.c:1321:24: error: argument to 'sizeof' in 'memset' call is the sa=
me expression as the destination; did you mean to dereference it? [-Werror=
=3Dsizeof-pointer-memaccess]
|   memset(pair, 0, sizeof(pair));

And couple of old failures, which are not caused by gcc upgrade for sure.

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30329_124637.log/
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DheUW4aQn8WJk6WR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFWqlcACgkQN1Ujt2V2gBxtXgCeMOeP51A+gZxfZjpEa3yjkKj5
oQ0AoKZ/epJmtD+2dgqVgRyXkY2CrV8q
=w3oU
-----END PGP SIGNATURE-----

--DheUW4aQn8WJk6WR--
