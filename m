Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SnKyu-0003sm-Da
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jul 2012 04:42:48 +0200
Received: by weyr6 with SMTP id r6so3355453wey.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2012 19:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bQGlGCSJUT62CFvHFvqPJdkCuUyM3qsx2DcbWRG6dEA=;
	b=ugrBwAsn44sDSUL9Ik6u5hpM5mYo1ftmQcL7miwTIe3iiXf1h/ObItiq96iVzz/3Nj
	Dutqlhop5szdOjH1pUjLqZIwxLlSCGymdpHfvFZH0GjQtaEkrj0Bkg9zVV2X5FUJerJ8
	JgotbEZtwEMWxYcSMRdpjiaFIoANQDrJooFLHMRrXNeQcUUV4ZCxIzOnkcMEmAf6c3ot
	FE2R1Z5J1li/Lb6d4x0Lbyq+MBiSSO5ohoXfp7tDZUnEdKCAR+eka7QH8jRenmWEvt5S
	EaPJTbjyaQCqGFgBuETpA/3wKDOLZC4hXuxIoLRtng5zG9vXnWJmkRJ1WzwdV28SdEKc
	f7dA==
Received: by 10.216.133.130 with SMTP id q2mr11976563wei.131.1341628302148;
	Fri, 06 Jul 2012 19:31:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id el6sm8968694wib.8.2012.07.06.19.31.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jul 2012 19:31:41 -0700 (PDT)
Date: Sat, 7 Jul 2012 04:31:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120707023136.GH3708@jama.jama.net>
References: <1341615750-25579-1-git-send-email-iyadkq@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1341615750-25579-1-git-send-email-iyadkq@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATH] fix build failure due to lic_files_chksum mismatch. The correction unpacks the source in the correct directory.
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
X-List-Received-Date: Sat, 07 Jul 2012 02:42:48 -0000
X-Groupsio-MsgNum: 24816
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yia77v5a8fyVHJSl"
Content-Disposition: inline

--Yia77v5a8fyVHJSl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 06, 2012 at 04:02:30PM -0700, Iyad Qumei wrote:
> Signed-off-by: Iyad Qumei <iyadkq@gmail.com>
> ---
>  meta/recipes-core/netbase/netbase_5.0.bb |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-core/netbase/netbase_5.0.bb b/meta/recipes-core=
/netbase/netbase_5.0.bb
> index 3aea874..ad80ef6 100644
> --- a/meta/recipes-core/netbase/netbase_5.0.bb
> +++ b/meta/recipes-core/netbase/netbase_5.0.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://packages.debian.org/netbase"
>  SECTION =3D "base"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3D3dd6192d306f582dee76=
87da3d8748ab"
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  inherit update-rc.d
> =20
> @@ -17,6 +17,8 @@ SRC_URI =3D "${DEBIAN_MIRROR}/main/n/netbase/netbase_${=
PV}.tar.gz \
>             file://interfaces \
>             file://nfsroot"
> =20
> +S =3D "${WORKDIR}/${P}"
> +

This is default, so it shouldn't change anything (and it checks
lic_files fine here).

Cheers,

>  SRC_URI[md5sum] =3D "a379d9199d44d817543eddc211a29b70"
>  SRC_URI[sha256sum] =3D "ac9424d3cb2bd3c07b6c5bc5875c434d3bc687a73cd7c54b=
7dc7122308afa9dc"
> =20
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Yia77v5a8fyVHJSl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/3n4gACgkQN1Ujt2V2gBwmXgCfZKCnac/ybcoeCnolA5wbtV/w
O1AAoKH4vIjADrSHLEmIYCki/qccLugN
=JDqI
-----END PGP SIGNATURE-----

--Yia77v5a8fyVHJSl--
