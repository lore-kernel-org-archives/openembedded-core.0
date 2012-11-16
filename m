Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TZTnp-00008X-Bm
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 22:50:21 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1208737eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 13:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5oWQqAZnBH0J0PmH8SKLzd7XdS4ObM2lCHiSwT+FvVA=;
	b=xTa8wfdEMoBOxEEkv9uYnakHFZaoByp68uFVGCfog8qNquke12y8nz3TmlquTdkJLM
	5L8qjrbhrydFvBMsuGAi8+HKVHVguFIr8/sYd3/UTIVcls4IleAF1As7j9uV88FLOVBz
	bwPlmVqIXor7n7CmkX7lARFMz7KHlsgNz3cqR4WG1vqwv54PJHNChfKCZxDXuqn4Ykah
	xzHn/9MJzqT9fSmRnTpeY5UdIqCYFYH4vGmiYKmrbOjArMD5DYlpJBtSYsssip7p3cib
	LH89M08C1gF/0Y7xUKCI/NtzPiIB4hbJQe6bIk2WQ6eJK+Xi5OaJO/QTsSmZVRy2LAs8
	zWtg==
Received: by 10.14.205.198 with SMTP id j46mr885502eeo.27.1353101782786;
	Fri, 16 Nov 2012 13:36:22 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s1sm5927962eem.9.2012.11.16.13.36.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Nov 2012 13:36:21 -0800 (PST)
Date: Fri, 16 Nov 2012 22:36:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: dromede@gmail.com
Message-ID: <20121116213636.GC3411@jama.jama.net>
References: <1353096699-19130-1-git-send-email-dromede@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1353096699-19130-1-git-send-email-dromede@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] [PATCH] udev: Remove deprecated binaries from packaging
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
X-List-Received-Date: Fri, 16 Nov 2012 21:50:21 -0000
X-Groupsio-MsgNum: 31467
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mvpLiMfbWzRoNl4x"
Content-Disposition: inline

--mvpLiMfbWzRoNl4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 16, 2012 at 09:11:39PM +0100, dromede@gmail.com wrote:
> From: Marko Katic <dromede.gmail.com>
>=20
> udev provides a udev-utils package that once provided utility binaries
> such as udevadm, udevtest and udevinfo. udevtest and udevinfo are
> deprecated and their functions are now handled by udevadm.
>=20
> https://bugzilla.redhat.com/show_bug.cgi?id=3D597539
>=20
> remove udevinfo and udevtest from the udev-utils package.

Are they still built? If yes then there should be warning about
unpackaged files (you would need to delete them in do_install) or they
are picked by some other package (PN probably).

Cheers,

>=20
> Signed-off-by: Marko Katic <dromede.gmail.com>
> ---
>  meta/recipes-core/udev/udev.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/ude=
v.inc
> index 4705b9b..7133cc4 100644
> --- a/meta/recipes-core/udev/udev.inc
> +++ b/meta/recipes-core/udev/udev.inc
> @@ -74,7 +74,7 @@ FILES_udev-cache =3D "${sysconfdir}/init.d/udev-cache $=
{sysconfdir}/default/udev-c
> =20
>  FILES_udev-acl =3D "${base_libdir}/udev/udev-acl ${base_libdir}/udev/rul=
es.d/70-acl.rules"
> =20
> -FILES_udev-utils =3D "${bindir}/udevinfo ${bindir}/udevtest ${base_sbind=
ir}/udevadm"
> +FILES_udev-utils =3D "${bindir}/udevadm"
> =20
>  RDEPENDS_udev-consolekit +=3D "udev-acl"
>  FILES_udev-consolekit =3D "${libdir}/ConsoleKit"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mvpLiMfbWzRoNl4x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCmseQACgkQN1Ujt2V2gByxLQCfSERe34/E140epUYC/B0kl1j8
F6oAn0EVIhCpWoItr8FrPTvcWDNN+m4U
=Cz7U
-----END PGP SIGNATURE-----

--mvpLiMfbWzRoNl4x--
