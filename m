Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RBp2l-0006RB-7A
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 16:35:27 +0200
Received: by bke11 with SMTP id 11so3661731bke.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2011 07:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bEISBnki7osAlJmo4rj6y3cvOyqZjC176Um8f7SGWBM=;
	b=WbbheowuZDIHWfCfK4uZoqsiO1883RqLS6ampiivFusbC7I1ONlPqqp3ejXy6n21Sk
	2+IXA0w2tJKd/4CvYJxixaW76anIweOjyg67oU8/1pmufIDuR82bTJgC+ZyoC//S72ya
	C1uAopeiSeVMZ6sqwMHEPr0cRJFHa8oWW/ic8=
Received: by 10.204.133.16 with SMTP id d16mr579631bkt.189.1317911391156;
	Thu, 06 Oct 2011 07:29:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm5776201bka.0.2011.10.06.07.29.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Oct 2011 07:29:49 -0700 (PDT)
Date: Thu, 6 Oct 2011 16:29:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111006142944.GB3485@jama.jama.net>
References: <1317910901.6398.88.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1317910901.6398.88.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] xserver-xf86: Use PACKAGECONFIG for udev/hal choice and default to udev
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
X-List-Received-Date: Thu, 06 Oct 2011 14:35:27 -0000
X-Groupsio-MsgNum: 10595
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Content-Disposition: inline

--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 06, 2011 at 03:21:33PM +0100, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc b=
/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
> index 000aea3..4c8b732 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
> @@ -35,3 +35,8 @@ FILES_${PN}-dbg +=3D "${libdir}/xorg/modules/.debug \
>  SRC_URI +=3D "file://macro_tweak.patch"
> =20
>  EXTRA_OECONF =3D "--with-fop=3Dno"
> +
> +PACKAGECONFIG ??=3D "udev"
> +PACKAGECONFIG[hal] =3D "--enable-config-hal,--disable-config-hal,,hal"
> +PACKAGECONFIG[udev] =3D "--enable-config-udev,--disable-config-udev,,ude=
v"

This should probably be=20
+PACKAGECONFIG[hal] =3D "--enable-config-hal,--disable-config-hal,,hal"
+PACKAGECONFIG[udev] =3D "--enable-config-udev,--disable-config-udev,udev,"

as we don't want udev in RDEPENDS (libudev is enough).

And can we apply this after my Xorg patchset? Because I don't want to
rebase it for 4th time ;).

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6Nu1gACgkQN1Ujt2V2gBxBPACgjVRQMzwntamuzi1H1Kr/4LWf
aQcAoK9MdaL6v2PMENHSc0ikHlGlNKt2
=T4JX
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--
