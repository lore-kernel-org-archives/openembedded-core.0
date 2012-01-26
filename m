Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1RqRvQ-0002Gq-AC; Thu, 26 Jan 2012 17:11:48 +0100
Received: by eekd41 with SMTP id d41so197255eek.6
	for <multiple recipients>; Thu, 26 Jan 2012 08:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6/NLIAuJ0tDCouTHhf7TEHTXjgNkusO+DBVxCE5zER0=;
	b=e/2IlnvXtV8EFiOyaKXN/dOFhcH4WhafzpgI/ZpLMQbKKfzy9rnM7wrG1GH0Zx6RJL
	kIN4oYu8R9FZyDj4R8RNehn/1NAo6sJSnmscDrIYnrXWQtCb4CWSSIatLlz9rjZUuoN3
	X/9qRoBHLoITpHdbF1bhgGS3yyRLkPWV7/zrM=
Received: by 10.14.50.206 with SMTP id z54mr905440eeb.127.1327593840336;
	Thu, 26 Jan 2012 08:04:00 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y12sm16815024eeb.11.2012.01.26.08.03.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 08:03:59 -0800 (PST)
Date: Thu, 26 Jan 2012 17:03:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120126160357.GC3747@jama.jama.net>
References: <CACW_hTYUec2LiZCzA42DP1o8G59QK7awNCcFi4VD2t5q3zYYvw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACW_hTYUec2LiZCzA42DP1o8G59QK7awNCcFi4VD2t5q3zYYvw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: DEFAULT_PREFERENCE = -1
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
X-List-Received-Date: Thu, 26 Jan 2012 16:11:48 -0000
X-Groupsio-MsgNum: 16590
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qtZFehHsKgwS5rPz"
Content-Disposition: inline

--qtZFehHsKgwS5rPz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2012 at 03:55:45PM +0100, Frans Meulenbroeks wrote:
> Dear all,
>=20
> Triggered by the discussion on oe devel on splitting meta-oe I decided to
> do some quick greps on who uses DEFAULT_PREFERENCE in oe-core and meta-oe.
>=20
> Below are the results.
> My questions:
> - are recipes with D_P =3D -1 good enough to enter oe core and/or meta oe.

yes, it allows people/layer maintainers to decide which version they
want easily

> - is it desirable to have a D_P -1 in an inc file (as happens in
> mesa-dri.inc)

see below

>=20
> Best regards, Frans.
>=20
> PS: I found the -2 ones especially odd. This seems only useful if there is
> someone else already with a -1, which might make the recipe even more
> questionable.

see below

> frans@frans-desktop:~/workspace$ grep -r DEFAULT_PREFERENCE
> openembedded-core

> openembedded-core/meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb:DEFAULT_PREFE=
RENCE
> =3D "-1"
> openembedded-core/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb:DEFAULT_PREFE=
RENCE
> =3D "-1"
> openembedded-core/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb:DEFAUL=
T_PREFERENCE
> =3D "-1"
> openembedded-core/meta/recipes-qt/qt4/qt4-native_4.8.0.bb:DEFAULT_PREFERE=
NCE
> =3D "-1"

this is fine as there is stable 4.7.4 and some people already started to
use 4.8.0 by their choice (which is easier to do with P_V then
adding/removing some fancy qt-4.8 layer).

> openembedded-core/meta/recipes-graphics/libmatchbox/libmatchbox_git.bb:DE=
FAULT_PREFERENCE
> =3D "-1"
> openembedded-core/meta/recipes-graphics/mutter/mutter_git.bb:DEFAULT_PREF=
ERENCE
> =3D "-1"
> openembedded-core/meta/recipes-graphics/xcb/libxcb_git.bb:DEFAULT_PREFERE=
NCE
> =3D "-1"
> openembedded-core/meta/recipes-graphics/xcb/xcb-proto_git.bb:DEFAULT_PREF=
ERENCE
> =3D "-1"
> openembedded-core/meta/recipes-graphics/clutter/cogl_git.bb:DEFAULT_PREFE=
RENCE
> =3D "-1"
> openembedded-core/meta/recipes-graphics/clutter/clutter_git.bb:DEFAULT_PR=
EFERENCE
> =3D "-1"
> openembedded-core/meta/recipes-graphics/mesa/mesa-dri_git.bb:DEFAULT_PREF=
ERENCE
> =3D "-2"

if someone really wants to use development version of it, why force him
to use different layer? and -2 is because other mesa-dri versions have
-1 from .inc.

> openembedded-core/meta/recipes-graphics/mesa/mesa-dri.inc:DEFAULT_PREFERE=
NCE
> =3D "-1"

this is because there are other virtual/libgl providers and this was
used to demote mesa-dri as provider for it

> openembedded-core/meta/recipes-graphics/mesa/qemugl_git.bb:DEFAULT_PREFER=
ENCE
> =3D "-1"
> openembedded-core/meta/recipes-graphics/mesa/mesa-xlib_git.bb:DEFAULT_PRE=
FERENCE
> =3D "-2"
> openembedded-core/meta/recipes-devtools/opkg/opkg-nogpg_svn.bb:DEFAULT_PR=
EFERENCE
> =3D "-1"
> openembedded-core/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb:DEFAULT_=
PREFERENCE
> =3D "-1"
> openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:DEFAUL=
T_PREFERENCE
> =3D "-1"
> openembedded-core/meta/recipes-devtools/qemu/qemu_git.bb:DEFAULT_PREFEREN=
CE
> =3D "-1"
> openembedded-core/meta/recipes-devtools/subversion/subversion_1.7.2.bb:DE=
FAULT_PREFERENCE
> =3D "-1"

Because people need to think before switching from 1.6 to 1.7 because of
tarballs of svn checkouts are not compatible.

> openembedded-core/meta/recipes-devtools/binutils/binutils_csl-arm-2008q1.=
bb:DEFAULT_PREFERENCE
> =3D "-1"
> openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:DEFAULT_PREF=
ERENCE
> =3D "-1"
> frans@frans-desktop:~/workspace$ grep -r DEFAULT_PREFERENCE
> meta-openembedded/
> meta-openembedded/meta-efl/recipes-support/libsoup/libsoup-2.4_2.37.2.bb:=
DEFAULT_PREFERENCE
> =3D "-1"

explained in previous thread.

> meta-openembedded/meta-efl/recipes-efl/efl/eet_svn.bb:DEFAULT_PREFERENCE =
=3D
> "-1"
> meta-openembedded/meta-efl/recipes-efl/efl/eina_svn.bb:DEFAULT_PREFERENCE=
 =3D
> "-1"
> meta-openembedded/meta-efl/recipes-efl/efl/edbus_svn.bb:DEFAULT_PREFERENCE
> =3D "-1"
> meta-openembedded/meta-efl/recipes-efl/efl/efreet_svn.bb:DEFAULT_PREFEREN=
CE
> =3D "-1"
> meta-openembedded/meta-efl/recipes-efl/efl/edje_svn.bb:DEFAULT_PREFERENCE=
 =3D
> "-1"
> meta-openembedded/meta-efl/recipes-efl/efl/embryo_svn.bb:DEFAULT_PREFEREN=
CE
> =3D "-1"
> meta-openembedded/meta-efl/recipes-efl/efl/eeze_svn.bb:DEFAULT_PREFERENCE=
 =3D
> "-1"
> meta-openembedded/meta-efl/recipes-efl/efl/evas_svn.bb:DEFAULT_PREFERENCE=
 =3D
> "-1"
> meta-openembedded/meta-efl/recipes-efl/efl/eio_svn.bb:DEFAULT_PREFERENCE =
=3D
> "-1"
> meta-openembedded/meta-efl/recipes-efl/efl/ecore_svn.bb:DEFAULT_PREFERENCE
> =3D "-1"

Because there were recipes for released versions and there will be
again, so it makes sense to use releases by default if they are not
lacking behind much - like they do now.

> meta-openembedded/meta-oe/recipes-core/udev/udev_175.bb:DEFAULT_PREFERENCE
> =3D "-1"
> meta-openembedded/meta-oe/recipes-graphics/tslib/tslib_git.bb:DEFAULT_PRE=
FERENCE
> =3D "-1"
> meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0.6.8.bb:DEFAULT=
_PREFERENCE
> =3D "-1"
> meta-openembedded/contrib/oe-stylize.py:    'DEFAULT_PREFERENCE',
> meta-openembedded/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2=
=2Ebb:DEFAULT_PREFERENCE
> =3D "-1"
> meta-openembedded/meta-gnome/recipes-gnome/gobject-introspection/gobject-=
introspection_git.bb:DEFAULT_PREFERENCE
> =3D "-1"

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qtZFehHsKgwS5rPz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8heW0ACgkQN1Ujt2V2gByq4gCeKsnrwPKn4qH8Cd6v1XnnawUH
J2YAn2YlOAKGRnhbh4jXsyXKZTwBJoaS
=B+hI
-----END PGP SIGNATURE-----

--qtZFehHsKgwS5rPz--
