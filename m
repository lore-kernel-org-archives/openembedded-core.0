Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3B58360232
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 22:26:47 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id b13so2474241wgh.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 15:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OUlBJyH1h2IqnJlMfhxwJ6yCYNTGq3Po/4CjpUim9Ps=;
	b=yF/mXieyAon6kdtaVsFBTScATHMgKV6QZV8TwBJjvfLyap4hyJLHIbZzRTFas8tjCC
	Cqf9++KeAcb0QX8MSGgG72sE5FFOfuG6ACkFv4g3QklXq910CIZ7ItWBoTCDdVd7TZBl
	PW6tEGaHAgDE2BKPWjYYZrv+e0RQhDYrscAR0GqjuhYHQYIo94o4TSMhip9WDeFgsPes
	wKeGGxRwptKid5cTnzFPqg0IiG32bOFBBGL/YqzcWmatA8GGq7KkbBtNCeFjq6DYIJjY
	GZRbu/arn0eyrUsEutow9jLdwyeLud25fCKBdKkjxMUfZltt5QjYTmg0lbMsn+4Mu6PY
	A2HQ==
X-Received: by 10.180.100.106 with SMTP id ex10mr33480775wib.63.1413930407960; 
	Tue, 21 Oct 2014 15:26:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id fa3sm334809wid.0.2014.10.21.15.26.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Oct 2014 15:26:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 Oct 2014 00:26:48 +0200
To: Mike Holmes <mike.holmes@linaro.org>
Message-ID: <20141021222648.GG2455@jama>
References: <1413925357-53983-1-git-send-email-mike.holmes@linaro.org>
	<1413925357-53983-2-git-send-email-mike.holmes@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1413925357-53983-2-git-send-email-mike.holmes@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] add CUnit test suite
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Oct 2014 22:26:52 -0000
X-Groupsio-MsgNum: 58795
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwgQ89ZNnFUwFHTC"
Content-Disposition: inline

--rwgQ89ZNnFUwFHTC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2014 at 05:02:37PM -0400, Mike Holmes wrote:
> Signed-off-by: Mike Holmes <mike.holmes@linaro.org>
> ---
>  meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb | 18 ++++++++++++++++++

meta-oe changes belong to openembedded-devel@lists.openembedded.org

>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
>=20
> diff --git a/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb b/meta-oe/reci=
pes-devtools/cunit/cunit_2.1-3.bb
> new file mode 100644
> index 0000000..0e9b2ff
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "CUnit is a C framework for unit testing. Test output su=
pports comandline and GUI reults reporting"
> +HOMEPAGE =3D "http://cunit.sourceforge.net"
> +LICENSE =3D "LGPL-2"
> +SECTION =3D "libs"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7734aa853b85d6f935466f081490d=
dbb"
> +
> +S =3D "${WORKDIR}/CUnit-${PV}"
> +
> +SRC_URI =3D "http://downloads.sourceforge.net/project/cunit/CUnit/${PV}/=
CUnit-${PV}.tar.bz2"
> +SRC_URI[md5sum] =3D "b5f1a9f6093869c070c6e4a9450cc10c"
> +SRC_URI[sha256sum] =3D "f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249=
a464efa49a40f214"
> +
> +inherit autotools-brokensep
> +
> +EXTRA_OECONF =3D "--srcdir=3D`pwd` --prefix=3D$INSTALL_HOME --enable-deb=
ug --enable-memtrace --enable-automated --enable-basic --enable-console"

`pwd` =3D=3D ${S}?
what's INSTALL_HOME?

> +FILES_${PN}-doc +=3D "doc"
this doesn't look correct

> +FILES_${PN}-dev +=3D "${prefix}/share"

this is datadir

> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rwgQ89ZNnFUwFHTC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRG3agACgkQN1Ujt2V2gBxMRgCgsq+TpAGMs+WoXx0tFQS78tKS
ZzoAn225LIWO0lQPMmbyOr69WBdR3LMX
=ozmm
-----END PGP SIGNATURE-----

--rwgQ89ZNnFUwFHTC--
