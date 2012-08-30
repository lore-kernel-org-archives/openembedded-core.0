Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T70t5-0004xA-Rm
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 11:18:07 +0200
Received: by wibhn17 with SMTP id hn17so1503055wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 02:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WxtAUDnSNc8VxGaoiRQ9NFk2fUe8aEdWR0DSYaS+vWs=;
	b=Kpc6MBMVC5ws9J6r0wv5Oi/034bvUQfcTXzOCvvs/PlcU9/qQ3hWZi7GcsSzT1Gms9
	gXKal8/jaex0ZuHH4MNFffBf5lMZjb1Hpe8Drj6g67bftDbzvBmiYPEj6cg4Botq4kvO
	0Rag4Wt87mTVzEq/JaVoj8uBfTp1XpDIRsARcRWDrR2iXLc0ZL0HLTYhYuH7vM032AId
	/3FGLCcNWxNF33Jt8zH83iKE2QrH+CB41vOn23RjTpOihismeVIgGv3s2652BnmVg+9F
	Fr0gL9y1F17IzHoq2DjALPuaaiTyu2ZbSlapUd2WVV3b0HpzVZeEOVrHhP6o3CboNv++
	zkNQ==
Received: by 10.180.100.35 with SMTP id ev3mr46517075wib.7.1346317552739;
	Thu, 30 Aug 2012 02:05:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cu1sm14770317wib.6.2012.08.30.02.05.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 02:05:50 -0700 (PDT)
Date: Thu, 30 Aug 2012 11:06:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120830090607.GA31247@jama.jama.net>
References: <20120730175903.GN3261@jama.jama.net>
	<1343674860-1523-1-git-send-email-Martin.Jansa@gmail.com>
	<1343734010.9756.3.camel@ted>
	<5861D2CF-C4A7-47E2-A355-C77DF52A2D3B@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <5861D2CF-C4A7-47E2-A355-C77DF52A2D3B@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] udev-extraconf: change LICENSE to MIT
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
X-List-Received-Date: Thu, 30 Aug 2012 09:18:08 -0000
X-Groupsio-MsgNum: 28411
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline

--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2012 at 02:46:40PM +0200, Koen Kooi wrote:
>=20
> Op 31 jul. 2012, om 13:26 heeft Richard Purdie <richard.purdie@linuxfound=
ation.org> het volgende geschreven:
>=20
> > On Mon, 2012-07-30 at 21:01 +0200, Martin Jansa wrote:
> >> * original recipe added by RP in fc128ab1e4fec27d44cebfa690a9bc233eda0=
caf was saying GPL
> >> * later it was changed to GPLv2
> >> * COPYING.GPL was added to reflect that
> >> * meta-oe has similar recipe with MIT license and even more scripts, s=
o lets change LICENSE here too
> >>=20
> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> ---
> >> meta/recipes-core/udev/udev-extraconf/COPYING.GPL |  339 -------------=
--------
> >> meta/recipes-core/udev/udev-extraconf_1.0.bb      |    8 +-
> >> 2 files changed, 4 insertions(+), 343 deletions(-)
> >> delete mode 100644 meta/recipes-core/udev/udev-extraconf/COPYING.GPL
> >=20
> > Er, I think we need to be a little more careful than this. Just because
> > you want something to be so, doesn't make it happen just like that...
> >=20
> > Looking at the commit, I've just copied the license from the original
> > source which was a GPLv2 recipe (udev). Where did mount.blacklist come
> > from originally? Is there evidence its MIT licensed? How did meta-oe
> > conclude this was MIT licensed?
>=20
> It was written for oe-classic -> MIT licensed

ping4, are some lawyers still working on this?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlA/LP8ACgkQN1Ujt2V2gBz0wACffRomgN3gfQ3I1NaxMgseT3r/
oQ0An32+T5jPBylclBWRnXu79e/NaJld
=EWZq
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
