Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 446006F280
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 16:12:59 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c13so426271eek.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 08:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yOAFdvUGNEc7c0c46tZTJdON9wL0MM5YPOZy53iaYZs=;
	b=0mRj7qT4fy5P+UJRaQuQAIxGO9d8M7vZXG8u/XdcBI03gVk3eovs2M3a87xgRB0DqL
	61cud1bKM5HmACt56GDAn+6Nu2SrFA0MOV/wddSm1OsIoi47ofzzvy+7ccOfDeMlLurG
	fE1ASBbtgoGlEd1gByGgYSAXRM98QLSPdVxeEKW61AP6957Z44By9mML54ZRTXq8WaMq
	fNXEKF2X2CDcCqGYh4kFMFi4QVl19jW8Ghv8P3uHyZD9tOYqDWEjOxE4oWFG09L9Wjzg
	+Ln1hHwy/DATzwfNWKg/UcZlfIb8ESuppzyn3A1g6sM6Uhwjc8nXJVx1pJMbrSqvXLDP
	A0cQ==
X-Received: by 10.14.215.133 with SMTP id e5mr25445006eep.103.1393258379862;
	Mon, 24 Feb 2014 08:12:59 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	k41sm65438495een.19.2014.02.24.08.12.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Feb 2014 08:12:57 -0800 (PST)
Date: Mon, 24 Feb 2014 17:12:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Valentin Popa <valentin.popa@intel.com>
Message-ID: <20140224161251.GJ26981@jama>
References: <cover.1393233958.git.liezhi.yang@windriver.com>
	<641185084afb8d76865faa13879547f8e546e553.1393233958.git.liezhi.yang@windriver.com>
	<530B5AD0.5010708@intel.com> <530B6566.3090804@intel.com>
MIME-Version: 1.0
In-Reply-To: <530B6566.3090804@intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] weston: disable-egl when no wayland
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
X-List-Received-Date: Mon, 24 Feb 2014 16:13:00 -0000
X-Groupsio-MsgNum: 50525
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rmUrFcWP4LYae1gV"
Content-Disposition: inline

--rmUrFcWP4LYae1gV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2014 at 05:29:42PM +0200, Valentin Popa wrote:
> On 02/24/2014 04:44 PM, Valentin Popa wrote:
> > On 02/24/2014 11:26 AM, Robert Yang wrote:
> >> There was a configure error when build weston without wayland:
> >>
> >> configure: error: Package requirements (egl >=3D 7.10 glesv2=20
> >> wayland-client wayland-egl) were not met:
> >>
> >> No package 'wayland-egl' found
> >>
> >> [YOCTO #5867]
> >>
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> ---
> >>   meta/recipes-graphics/wayland/weston_1.4.0.bb |    2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-graphics/wayland/weston_1.4.0.bb=20
> >> b/meta/recipes-graphics/wayland/weston_1.4.0.bb
> >> index 5c389a0..e0c354d 100644
> >> --- a/meta/recipes-graphics/wayland/weston_1.4.0.bb
> >> +++ b/meta/recipes-graphics/wayland/weston_1.4.0.bb
> >> @@ -39,7 +39,7 @@ PACKAGECONFIG ??=3D=20
> >> "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms fbdev way
> >>   # Weston on KMS
> >>   PACKAGECONFIG[kms] =3D=20
> >> "--enable-drm-compositor,--disable-drm-compositor,drm udev=20
> >> virtual/mesa mtdev"
> >>   # Weston on Wayland (nested Weston)
> >> -PACKAGECONFIG[wayland] =3D=20
> >> "--enable-wayland-compositor,--disable-wayland-compositor,virtual/mesa"
> >> +PACKAGECONFIG[wayland] =3D "--enable-wayland-compositor,--disable-egl=
=20
> >> --disable-wayland-compositor,virtual/mesa"
> >>   # Weston on X11
> >>   PACKAGECONFIG[x11] =3D=20
> >> "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11=20
> >> libxcb libxcb libxcursor cairo"
> >>   # Headless Weston
> > How did you build weston without wayland?
> > Have you built wayland without libwayland-egl and then tried to build=
=20
> > weston?
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20
> I got it, so you are building with :
> DISTRO_FEATURES_remove=3D"wayland"
> DISTRO_FEATURES_append =3D " x11"

BTW: This is the reason why weston was failing in:
http://www.openembedded.org/wiki/Bitbake_World_Status

> and mesa doesn't build libwayland-egl, but weston checks for EGL.
>=20
> Looks good to me, but the subject/message is not so clear. Can you=20
> please modify it and resend?
>=20
> Thanks!
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rmUrFcWP4LYae1gV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMLb4MACgkQN1Ujt2V2gBxSqgCgn5OVt2L5smyMU99XyQNWuZH4
JbAAoLMs8x6LOA4aCRaFfN2DTixYTEFW
=tyR8
-----END PGP SIGNATURE-----

--rmUrFcWP4LYae1gV--
