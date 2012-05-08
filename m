Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRou1-00016R-Hg
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 20:12:49 +0200
Received: by eekc1 with SMTP id c1so1667438eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 11:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=B4Btx1UKPTw6w5SjBo4BIU+pE5saWle/tCGQCxlbvmk=;
	b=rdESjyKKfIXE1lVZLGmWYeV+LvNeAEElASqUNc/MdD0A+AZVjK0MBU6yARTJzn9B1F
	1jlp4DfhiFlcH0obr/b9Vy5MY6b7j4qKl7ZfRedMXjS4qH5f/nmd+EoMM3BrYdkN87sg
	LQbyK6/VV+cVQSdOBbxxTb6QSLO37Zy97dVaurhoAlK5Clclyj9G/e4cOKlmt0JOVcCu
	g2mQhHrNrPl0c6ZUjerUSN46wrODFYY6Ytuu3K2xYDCfaawn3IchWIKiVE3Vaxd/X98e
	T6PtLJOtx8J0gofYQ0DmulCKhTh3MxwZxNY7Lnkn45xZllsxIg3yb/LrrC9pVR9/2eNk
	8dEw==
Received: by 10.14.27.131 with SMTP id e3mr2309829eea.10.1336500176793;
	Tue, 08 May 2012 11:02:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m42sm87814eef.0.2012.05.08.11.02.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 May 2012 11:02:55 -0700 (PDT)
Date: Tue, 8 May 2012 20:02:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120508180256.GB3138@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: CONFLICTS as keyword or just misspelled RCONFLICTS?
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
X-List-Received-Date: Tue, 08 May 2012 18:12:49 -0000
X-Groupsio-MsgNum: 21840
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline

--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

It's used in few recipes (lately used in kmod recipe), but no .bbclass and =
no match in bitbake

OE @ ~/openembedded-core $ git grep CONFLICTS | grep -v RCONFLICTS | grep -=
v TUNE_CONFLICTS | grep -v TUNECONFLICTS
meta/recipes-connectivity/openssh/openssh_6.0p1.bb:CONFLICTS_${PN} =3D "dro=
pbear"
meta/recipes-core/gettext/gettext_0.18.1.1.bb:CONFLICTS_${PN} =3D "proxy-li=
bintl"
meta/recipes-graphics/xorg-proto/compositeproto_0.4.2.bb:CONFLICTS =3D "com=
positeext"
meta/recipes-graphics/xorg-proto/damageproto_1.2.1.bb:CONFLICTS =3D "damage=
ext"
meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb:CONFLICTS =3D "fixesext"
meta/recipes-graphics/xorg-proto/randrproto_1.3.2.bb:CONFLICTS =3D "randrex=
t"
meta/recipes-graphics/xorg-proto/recordproto_1.14.1.bb:CONFLICTS =3D "recor=
dext"
meta/recipes-graphics/xorg-proto/renderproto_0.11.1.bb:CONFLICTS =3D "rende=
rext"
meta/recipes-graphics/xorg-proto/resourceproto_1.2.0.bb:CONFLICTS =3D "reso=
urceext"
meta/recipes-graphics/xorg-proto/xf86dgaproto_2.1.bb:CONFLICTS =3D "xxf86dg=
aext"
meta/recipes-graphics/xorg-proto/xf86vidmodeproto_2.3.1.bb:CONFLICTS =3D "x=
xf86vmext"
meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb:CONFLI=
CTS =3D "matchbox-common"
meta/recipes-support/db/db_5.1.19.bb:CONFLICTS =3D "db3"

BTW: IIRC TUNE_CONFLICTS/TUNECONFLICTS inconsistency was discussed on ML al=
ready=20
(I could not find that thread, but still it's used in meta/conf/machine/inc=
lude/arm

Cheers,

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+pX9AACgkQN1Ujt2V2gBwTIgCgrba5EI3SqFcDldGPaSIs+wZl
MogAnjsuCgQihXdRk0er9+yj4+J3k4zL
=/XIP
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
