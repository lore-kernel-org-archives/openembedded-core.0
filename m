Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T4YM5-00069R-LT
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 16:25:53 +0200
Received: by weyr6 with SMTP id r6so417152wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 07:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=resent-from:resent-date:resent-message-id:resent-to:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=SYypUu8tqWYIZEZPjK2Dg64MOCNuchEL32s+8ssvYik=;
	b=QpMPXtGhO/VFThBSfeoWgq45wJsH+ixHZU28Nni+tkYIZs1WPDV6Iu9+NgKj1sirgL
	XUZseuPDECxctyFZZkbsF+z/BdndZidjVv2mlqN4ES/NZZBuWIwgKjY/T8bMe3RwGGHH
	0B5Azl5WRXhercT2Fz3Z0hP4byQK0vQJe1oB6Oj0xdcAaLnyosxfbo3YQATyIkP4c4fV
	qXRt0ReOXRBiBAJycu+aCEddY21Gkdhw+fzgqMl+fK7kvFR94h2R4RZ6Cxp6ja1uVZuk
	DHl2SHv8zqptHzeUVSw4szf2HVZWNkWrROTwARXKMP/O1yEWXi0l5RdBIiJJ5NjG9T+2
	s0BA==
Received: by 10.216.29.10 with SMTP id h10mr916192wea.126.1345731227446;
	Thu, 23 Aug 2012 07:13:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm44990948wiz.4.2012.08.23.07.13.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Aug 2012 07:13:46 -0700 (PDT)
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Thu, 23 Aug 2012 16:13:53 +0200
Resent-Message-ID: <20120823141353.GO3029@jama.jama.net>
Resent-To: Matthew McClintock <msm@freescale.com>;,
	openembedded-core@lists.openembedded.org
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm44958267wiz.0.2012.08.23.07.09.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Aug 2012 07:09:46 -0700 (PDT)
Date: Thu, 23 Aug 2012 16:09:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120823140952.GN3029@jama.jama.net>
References: <20120822132435.26657103C9@opal>
MIME-Version: 1.0
In-Reply-To: <20120822132435.26657103C9@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Matthew McClintock : distutils.bblass: change order of args to install step
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
X-List-Received-Date: Thu, 23 Aug 2012 14:25:53 -0000
X-Groupsio-MsgNum: 28131
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9v2bTOXBzuB5Piju"
Content-Disposition: inline

--9v2bTOXBzuB5Piju
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 22, 2012 at 01:24:34PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 3b23feca31480cc56f55301fd0274e622c40b522
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D3b23feca31480cc56f55301fd0274e622c40b522
>=20
> Author: Matthew McClintock <msm@freescale.com>
> Date:   Tue Aug 21 13:44:21 2012 -0500
>=20
> distutils.bblass: change order of args to install step
>=20
> This let's the user override install-lib argument again if it needs
> to be something else, otherwise things like python-setuptools
> won't be able to modify the install-lib dir
>=20
> This fixes a new issue exposed by my previous distutils patch
> that fixed the python modules default install location. Also,
> it removes running the install step twice which was inadvertant
>=20
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/classes/distutils.bbclass |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbcl=
ass
> index 7588b81..52a1aa8 100644
> --- a/meta/classes/distutils.bbclass
> +++ b/meta/classes/distutils.bbclass
> @@ -38,8 +38,7 @@ distutils_do_install() {
>          STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>          PYTHONPATH=3D${D}/${PYTHON_SITEPACKAGES_DIR} \
>          BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
> -        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install $=
{DISTUTILS_INSTALL_ARGS} || \
> -        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install $=
{DISTUTILS_INSTALL_ARGS} --install-lib=3D${D}${libdir}/${PYTHON_DIR} || \
> +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install -=
-install-lib=3D${D}${libdir}/${PYTHON_DIR} ${DISTUTILS_INSTALL_ARGS} || \
>          bbfatal "python setup.py install execution failed."
> =20
>          for i in `find ${D} -name "*.py"` ; do \

This seems to break recipes which inherit distutils only, now libs are inst=
alled in
/usr/lib/python2.7 directly instead of /usr/lib/python2.7/site-packages and=
 packaging fails with fatal QA
NOTE: Executing RunQueue Tasks
ERROR: QA Issue: non debug package contains .debug directory: python-pyrtc =
path /work/armv7a-vfp-neon-oe-linux-gnueabi/python-pyrtc-1_1.0.0+gitr1+63b1=
dff1bc8ac22efabcee8a90e957c3b2423317-ml2/packages-split/python-pyrtc/usr/li=
b/python2.7/.debug/pyrtc.so
ERROR: QA run found fatal errors. Please consider fixing them.

OE @ ~/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi $ find pyt=
hon-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old/pa=
ckages-split/
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc.shlibdeps
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc/usr
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc/usr/lib
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc/usr/lib/python2.7
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc/usr/lib/python2.7/.debug
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc/usr/lib/python2.7/.debug/pyrtc.so
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc/usr/lib/python2.7/PyRTC-1.0.0-py2.7.egg-info
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc/usr/lib/python2.7/site-packages
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc/usr/lib/python2.7/pyrtc.so
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc-doc
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc-dbg
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc-dbg/usr
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc-dbg/usr/src
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc-dbg/usr/src/debug
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1+6=
3b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1+6=
3b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/git
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1+6=
3b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/git/pyrtc
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1+6=
3b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/git/pyrtc/pyrtc.c
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1+6=
3b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/git/pyrtc/rtc.c
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old=
/packages-split/python-pyrtc-dev
OE @ ~/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi $ find pyt=
hon-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/packag=
es-split/
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc.shlibdeps
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc/usr
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc/usr/lib
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc/usr/lib/python2.7
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc/usr/lib/python2.7/site-packages
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc/usr/lib/python2.7/site-packages/PyRTC-1.0.0-py2.7.=
egg-info
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc/usr/lib/python2.7/site-packages/pyrtc.so
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc-doc
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc-dbg
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc-dbg/usr
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc-dbg/usr/src
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc-dbg/usr/src/debug
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1+63b1d=
ff1bc8ac22efabcee8a90e957c3b2423317-ml2
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1+63b1d=
ff1bc8ac22efabcee8a90e957c3b2423317-ml2/git
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1+63b1d=
ff1bc8ac22efabcee8a90e957c3b2423317-ml2/git/pyrtc
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1+63b1d=
ff1bc8ac22efabcee8a90e957c3b2423317-ml2/git/pyrtc/pyrtc.c
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1+63b1d=
ff1bc8ac22efabcee8a90e957c3b2423317-ml2/git/pyrtc/rtc.c
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc-dbg/usr/lib
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc-dbg/usr/lib/python2.7
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc-dbg/usr/lib/python2.7/site-packages
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc-dbg/usr/lib/python2.7/site-packages/.debug
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc-dbg/usr/lib/python2.7/site-packages/.debug/pyrtc.so
python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pac=
kages-split/python-pyrtc-dev

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9v2bTOXBzuB5Piju
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlA2ObAACgkQN1Ujt2V2gBxb5QCdFRagMeesBFRIx9dGu+UlKsYK
Mk4AoKGyk29/NOPmphr9QcPTuERBlTU8
=U2Y/
-----END PGP SIGNATURE-----

--9v2bTOXBzuB5Piju--
