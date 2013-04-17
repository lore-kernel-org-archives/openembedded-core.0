Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USQXE-0006p6-Qb
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 13:28:21 +0200
Received: by mail-pb0-f44.google.com with SMTP id wz12so841029pbc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 04:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=mSNS5iHVHaGM7+zoj/dBmMR9HQbLrFr2hpdshn1jJn8=;
	b=IfyerzAxtvf3xA37wpQ7MC3r7YjwsYZqSWccJXviSvJIVkgN2w1jeaDcOuYh412k8Y
	1n8KdTAZCkm5ay9pFRGoBpv505SYP1n9i8PYhpsW3RWUoNKj5b4H5aEVcIxMDE9x3+se
	Y6OBvRLebo7xM09oz6WgYwY015GJOlBowwZeRiBtBh3kj7J6cNUHQ83JlBtq0A4jntef
	sQDNmZ0MohO7Q07koLmv9/Hlk1W9wGW+fnPO3FiKhSGC2suGDl/LMrZFRp99caRfYJIN
	39XVlDbUzsYCOHtCPHBxRem3oCrTHYn4BLppNqAA7S3L7aIkbonLbMYsmBvmTNXGaeDi
	PO2w==
X-Received: by 10.68.129.232 with SMTP id nz8mr8741384pbb.25.1366197044957;
	Wed, 17 Apr 2013 04:10:44 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id tx9sm5945483pbc.27.2013.04.17.04.10.41
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 04:10:43 -0700 (PDT)
Date: Wed, 17 Apr 2013 13:10:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Message-ID: <20130417111042.GF26007@jama>
References: <1366195597-13363-1-git-send-email-ml@communistcode.co.uk>
	<1366195597-13363-2-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <1366195597-13363-2-git-send-email-ml@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCHv2 2/2] net-snmp: Update to 5.7.2
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
X-List-Received-Date: Wed, 17 Apr 2013 11:28:25 -0000
X-Groupsio-MsgNum: 38072
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Il7n/DHsA0sMLmDu"
Content-Disposition: inline

--Il7n/DHsA0sMLmDu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2013 at 11:46:37AM +0100, Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>=20
> - Removed some un-needed patches
>=20
> diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb b/meta-o=
e/recipes-extended/net-snmp/net-snmp_5.7.2.bb
> similarity index 76%
> rename from meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
> rename to meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
> index 19aa163..048ecb8 100644
> --- a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
> +++ b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
> @@ -1,11 +1,8 @@
>  require net-snmp.inc
> =20
> -PR =3D "${INC_PR}.4"

This can surprise people editing net-snmp.inc and bumping INC_PR there
without any effect on net-snmp_5.7.2.bb.

I understand why you wanted to remove it, but I would prefer to keep
PR =3D "${INC_PR}.0" there as long as we have .inc with INC_PR.

I wouldn't mind merging .inc in .bb as people probably don't have own
versions of net-snmp in their layers (just guessing here).

And it was send to wrong ML this time..

>  LIC_FILES_CHKSUM =3D "file://README;beginline=3D3;endline=3D8;md5=3D7f7f=
00ba639ac8e8deb5a622ea24634e"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
> -        file://sync-with-5.7-branch.patch \
> -        file://libnl-3-support.patch \
>          file://init \
>          file://snmpd.conf \
>          file://snmptrapd.conf \
> @@ -30,5 +27,5 @@ do_configure_prepend() {
>  PARALLEL_MAKE =3D ""
>  CCACHE =3D ""
> =20
> -SRC_URI[md5sum] =3D "c95d08fd5d93df0c11a2e1bdf0e01e0b"
> -SRC_URI[sha256sum] =3D "7c71c9650c65b715356547e20ca2dbe6313944278af8cc19=
c32a5337f46b181f"
> +SRC_URI[md5sum] =3D "5bddd02e2f82b62daa79f82717737a14"
> +SRC_URI[sha256sum] =3D "09ed31b4cc1f3c0411ef9a16eff79ef3b30d89c32ca46d5a=
01a41826c4ceb816"
> --=20
> 1.8.2
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Il7n/DHsA0sMLmDu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFugzIACgkQN1Ujt2V2gBzhQgCghZvs9Od4lBo3RXnsKaLPatGB
9xMAn2r8FmQMD1ks4Nglf8voE1uN41K0
=Bha6
-----END PGP SIGNATURE-----

--Il7n/DHsA0sMLmDu--
