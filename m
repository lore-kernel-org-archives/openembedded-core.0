Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QmVnD-0001sI-8j
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 20:58:47 +0200
Received: by fxg11 with SMTP id 11so1694432fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 11:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=owdMvk2Lf+ggfuexZ++9U1DeHC/pgJSrtYwNXTuf28U=;
	b=G7tLGTOnI8uekJth1/QTM5JaNt/xasCRr39laKlv561Mahwk2l5QvMLFfbcjPQLhXt
	GgJERoN8sLEjAeob79HjOZlqQw1qW5CjHbqq3r8poaty8M0SZq5OguyYKHMn8ebalvP4
	b/6oS6iWywus2mZ2PB5RuzH/nPk/GvkMzadT4=
Received: by 10.223.55.209 with SMTP id v17mr437638fag.77.1311879249599;
	Thu, 28 Jul 2011 11:54:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h10sm641175fai.19.2011.07.28.11.54.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jul 2011 11:54:08 -0700 (PDT)
Date: Thu, 28 Jul 2011 20:54:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Kumar Gala <galak@kernel.crashing.org>
Message-ID: <20110728185400.GK15286@jama.jama.net>
References: <1F827C13-EF18-4D1E-AAA1-381361929F39@kernel.crashing.org>
	<65A75BC37EC7EE4F88AB5EB98759A97003E6E32F@LONMLVEM04.e2k.ad.ge.com>
	<315B4992-8E1A-4DD3-8D3D-E8FD2436B365@kernel.crashing.org>
	<4E3188D3.8040405@linux.intel.com>
	<312066B0-7200-477F-A875-B610335E6153@kernel.crashing.org>
MIME-Version: 1.0
In-Reply-To: <312066B0-7200-477F-A875-B610335E6153@kernel.crashing.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] mpc8315e-rdb core-image-minimal fails (PACKAGE_ARCHS question)
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
X-List-Received-Date: Thu, 28 Jul 2011 18:58:47 -0000
X-Groupsio-MsgNum: 7013
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mGCtrYeZ202LI9ZG"
Content-Disposition: inline

--mGCtrYeZ202LI9ZG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2011 at 01:43:45PM -0500, Kumar Gala wrote:
>=20
> On Jul 28, 2011, at 11:05 AM, Saul Wold wrote:
>=20
> > On 07/28/2011 08:45 AM, Kumar Gala wrote:
> >> I think I know the cause, let me dig up the change that is related.  W=
hat bit is looking for just ppc603e?
> >>=20
> > This might also be related to the PACKAGE_EXTRA_ARCHS issue, please try=
 the patch that Koen posted.
> >=20
> > Thanks
> > 	Sau!
>=20
> so in conf/bitbake.conf
>=20
> PACKAGE_ARCH =3D "${TUNE_PKGARCH}"
> MACHINE_ARCH =3D "${@[bb.data.getVar('TUNE_PKGARCH', d, 1), bb.data.getVa=
r('MACHINE', d, 1)][bool(bb.data.getVar('MACHINE', d, 1))].replace('-', '_'=
)}"
> PACKAGE_EXTRA_ARCHS ??=3D "${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}"
> PACKAGE_ARCHS =3D "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
>=20
>=20
> Shouldn't PACKAGE_ARCHS be:
>=20
> PACKAGE_ARCHS =3D "all any noarch ${PACKAGE_ARCH} ${PACKAGE_EXTRA_ARCHS} =
${MACHINE_ARCH}"

this change causes ERROR here with nokia900:
Error, the PACKAGE_ARCHS variable contains duplicates. The following archs =
are listed more than once: armv7a-vfp-neon

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mGCtrYeZ202LI9ZG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk4xsEgACgkQN1Ujt2V2gBwRBACeJqARX2LM/zHCpBm9H/xzDJem
ACAAn0EpdVFRG7RE0HdD5+oVVa9u9QdP
=wiaH
-----END PGP SIGNATURE-----

--mGCtrYeZ202LI9ZG--
