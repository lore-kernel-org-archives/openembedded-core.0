Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RYgK5-0007ws-GH
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 16:55:50 +0100
Received: by eekb15 with SMTP id b15so1123728eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 07:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TM/ME8mV78ylzJYkgOK9tjzuhX6DoEbUOht49fhxOuk=;
	b=t/6nQauw5AUI6axfQT4EPQGfP5xVcB19almfXosBZBbWw1tdR67gZeJKIeccHtVF8v
	TXLIawO0wmjQfStBR6v46SUTMGdArljDvoI/3UuY9DKwvWUEXFCMd6099PIlk4t5MEbv
	K4C0YOrfxxcfooyJLS+/EdR0xCRbK+MuvGX2I=
Received: by 10.14.20.5 with SMTP id o5mr276831eeo.152.1323359335100;
	Thu, 08 Dec 2011 07:48:55 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 49sm19154992eec.1.2011.12.08.07.48.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Dec 2011 07:48:53 -0800 (PST)
Date: Thu, 8 Dec 2011 16:48:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20111208154840.GD3761@jama.jama.net>
References: <1323281084-30590-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1323281084-30590-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][RFC] conf/machine/include/arm add extra MACHINEOVERRIDES like x86 does
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
X-List-Received-Date: Thu, 08 Dec 2011 15:55:50 -0000
X-Groupsio-MsgNum: 13871
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hoZxPH4CaxYzWscb"
Content-Disposition: inline

--hoZxPH4CaxYzWscb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2011 at 07:04:44PM +0100, Martin Jansa wrote:
> * motivated by this NAK
>   http://patchwork.openembedded.org/patch/15777/
>   and today's discussion on #yocto I hope it's worth it to send this RFC

FWIW some armv6/armv7a overrides are already used in oe-core=20

meta/conf/bitbake.conf:QEMU_OPTIONS_armv6   =3D "-cpu arm1136"
meta/conf/bitbake.conf:QEMU_OPTIONS_armv7a   =3D "-cpu cortex-a8"
meta/recipes-devtools/python/python_2.7.2.bb:TARGET_CC_ARCH_append_armv6 =
=3D " -D__SOFTFP__"
meta/recipes-devtools/python/python_2.7.2.bb:TARGET_CC_ARCH_append_armv7a =
=3D " -D__SOFTFP__"
meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb:EXTRA_OECONF_arm=
v7a =3D " --enable-neon "
meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb:do_compile_prepe=
nd_armv7a () {

And also armv6-vfp
meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb:QT_CONFIG_FLAGS_append_armv6-vfp =
=3D " -no-neon "
meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb:QT_CONFIG_FLAGS_append_armv6-vfp =
=3D " -no-neon "

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hoZxPH4CaxYzWscb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7g3FgACgkQN1Ujt2V2gBz0TACgkYZXsKwoFM7xYlAOIX6sJAe0
bh0AoKlSO99ipK53dEGSt4sJM1FC6+Kc
=EWs4
-----END PGP SIGNATURE-----

--hoZxPH4CaxYzWscb--
