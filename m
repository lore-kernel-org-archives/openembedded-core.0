Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id F280D6AB9F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 09:03:32 +0000 (UTC)
Received: by wibdq8 with SMTP id dq8so94537696wib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jul 2015 02:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ssW3mysXLzHGg2+RuxVYQtbNIpj2za5/vKnauaazzP4=;
	b=kqq9hA1ht7WrXxIgY3U3LkKJOZT23NXtRrkm2gxFMPjZiifsfpGSRU1OXvbgycXVf5
	v4hVE1MKcSwhI7Puw+qaxTbM93gvUDy/26Cjgq0HqFBoZNSDP2kfAro7yAMhl7cHvYnL
	mgLpNc+z/Ks7TIjbyI7fNUU5QpboXXQwWQgIT4lcPeU2esZAuH01eSRboPx0t4R+6JdN
	hCDXT7Sj6/7hXiv/E7q/4I7usfEVA6pA4/HD1lXvA3L4lk+/a2A2bZ7WubBzmkPzco4U
	i889t5vN+OeJ1VXMBYBWuGE9JL7ufmF6lJd6AYLbTizXOE4jZrbp1qmqegydEdXT3p5c
	eVnA==
X-Received: by 10.194.184.14 with SMTP id eq14mr65164475wjc.58.1435914211777; 
	Fri, 03 Jul 2015 02:03:31 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id k2sm12853579wif.4.2015.07.03.02.03.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Jul 2015 02:03:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 3 Jul 2015 11:04:05 +0200
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Message-ID: <20150703090405.GA2436@jama>
References: <1435737141-31961-1-git-send-email-jackie.huang@windriver.com>
	<CAJTo0LacneDbjFJR+uPQs__cqx+FVwXEuyCXe5zVui+Gu9tbpg@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AAF11F6D32@ALA-MBB.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AAF11F6D32@ALA-MBB.corp.ad.wrs.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xorg-proto-common: allow the empty package
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
X-List-Received-Date: Fri, 03 Jul 2015 09:03:35 -0000
X-Groupsio-MsgNum: 67514
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline

--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 03, 2015 at 01:34:31AM +0000, Huang, Jie (Jackie) wrote:
> Yeah I know it=E2=80=99s not good to have the empty package and we can re=
move dependencies to void error, but
> our customer may add the package through IMAGE_INSTALL in local.conf and =
blame it fails until do_rootfs:
>=20
> ERROR: bigreqsproto not found in the base feeds (intel_x86_64 core2-64 x8=
6_64 noarch any all).
>=20
> Do we have a way to find out a PN package is empty at an earlier time so =
that we may warn the user not
> to add this package into image?

I as a customer would definitely prefer error message even later in the
build then getting completely useless empty package installed in my
image and blame you for installing it when I was expecting to find
bigreqsproto in my rootfs.

> From: Burton, Ross [mailto:ross.burton@intel.com]
> Sent: Friday, July 03, 2015 3:40 AM
> To: Huang, Jie (Jackie)
> Cc: OE-core
> Subject: Re: [OE-core] [PATCH] xorg-proto-common: allow the empty package
>=20
>=20
> On 1 July 2015 at 08:52, <jackie.huang@windriver.com<mailto:jackie.huang@=
windriver.com>> wrote:
>  # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
> +# and allow ${PN} to be created empty
> +ALLOW_EMPTY_${PN} =3D "1"
>  RDEPENDS_${PN}-dev =3D ""
>  RRECOMMENDS_${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
>=20
> As the comment and surrounding lines state, the dependencies on PN from P=
N-dev and PN-dbg are already removed.  What other package has a runtime dep=
endency on PN, and when you find it a better solution is to remove the depe=
ndency instead of creating empty packages.
>=20
> Ross

> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWWT/8ACgkQN1Ujt2V2gBwuRwCguHdax+xPh0NAnjHL7yGJsCxI
Q8YAn32GUP8gWxC4kJKMwoyYWkjBstow
=AUDn
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
