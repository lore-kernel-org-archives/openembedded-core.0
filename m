Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwA5B-00006y-8o
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 12:53:45 +0200
Received: by wibhm11 with SMTP id hm11so2398338wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 03:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=piMdK03T1dO7zCmdHLM9OCFuadnzwObxibJq+L5eKQU=;
	b=jw9zBXSTWbAfgyqGUsVhKWtowzqax5oNgSG8OzjxDW0mgUz0I5ppd/LaOvPrVm2dRI
	ubwvk3XmlrbZd4+vu1vj0jihioML6Ts9Y0kCN2ftDYSW/wVLxyXj4c4ST6SXp755Yne7
	A1ff+py2SZKeZIjknExX4XGg4jOQaUS3LrdaPE9jZ5VPkTRFl7MlEHyJ4Qt9nMdnkKuZ
	A+SpZDew0j/0yRfxfqWCsu1fZoQuTVw8pPTGSOCMxJH7kGEpFThMop+WKE797SFwi+ZI
	/8noNudEGrXLVsDuvMnNdQqAUw4o+pU1SkBNCJk9be2QIv0ouyEEjFNxU/+7JDQ1DNJD
	hwSA==
Received: by 10.217.1.79 with SMTP id m57mr6963245wes.121.1343731328230;
	Tue, 31 Jul 2012 03:42:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm21587383wiv.11.2012.07.31.03.42.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jul 2012 03:42:07 -0700 (PDT)
Date: Tue, 31 Jul 2012 12:42:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120731104203.GQ3261@jama.jama.net>
References: <CALbNGRR4weykX9t_XwJ6ACVoXS2SbogcxXLPAj7vpAC2+AQpww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRR4weykX9t_XwJ6ACVoXS2SbogcxXLPAj7vpAC2+AQpww@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: do_rootfs fails
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
X-List-Received-Date: Tue, 31 Jul 2012 10:53:45 -0000
X-Groupsio-MsgNum: 26543
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UJEqbsikIZBgizPR"
Content-Disposition: inline

--UJEqbsikIZBgizPR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2012 at 12:37:52PM +0200, Andreas M=FCller wrote:
> Hi,
>=20
> after long journey mending recipes I now get with latest updates:
>=20
> |  * opkg_install_cmd: Cannot install package gnome-icon-theme-locale-fr.
> |  * opkg_install_cmd: Cannot install package gnome-icon-theme-locale-en-=
gb.
> |  * opkg_install_cmd: Cannot install package gnome-icon-theme-locale-de.
> |  * satisfy_dependencies_for: Cannot satisfy the following
> dependencies for gcc-runtime-locale-fr:
> |  * 	gcc-runtime *
> |  * opkg_install_cmd: Cannot install package gcc-runtime-locale-fr.
> |  * satisfy_dependencies_for: Cannot satisfy the following
> dependencies for gcc-runtime-locale-de:
> |  * 	gcc-runtime *
> |  * opkg_install_cmd: Cannot install package gcc-runtime-locale-de.
>=20
> I checked:
>=20
> * gnome-icon-theme-locale-* are empty
> * gcc-runtime is not there
>=20
> Any suggestion what causes this?

yup, test this:
http://patchwork.openembedded.org/patch/33273/

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UJEqbsikIZBgizPR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAXtnsACgkQN1Ujt2V2gBzGTwCgoS5RVBgRDyJxhvtV/xhlz6no
78UAmwYIxRmA88StVucCOR/r6riIIr6E
=XpVK
-----END PGP SIGNATURE-----

--UJEqbsikIZBgizPR--
