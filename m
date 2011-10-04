Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RB3JR-00023y-1E
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 13:37:29 +0200
Received: by bke11 with SMTP id 11so516066bke.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 04:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=20mri51ZuL0BZVvdhINiu89KTvez8YLcKsrgofHrDG4=;
	b=cFa9RUkgfuswdnNPXm6aIEDDjvKgREgzRFgDFtmfNWjq0Sx5y0sEwLQxN6I4GsB/bv
	/VEQr7BA4YegcVuGAeUt7+DHwOnJw2Hv5nOAqHWg+dCByDXhX2oBTuDReytUoufVKp7o
	sf4UrVyYcsPdY+PfEKWuVT58BooIINY7tc1Aw=
Received: by 10.204.139.68 with SMTP id d4mr648834bku.90.1317727915751;
	Tue, 04 Oct 2011 04:31:55 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm16269862bka.0.2011.10.04.04.31.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Oct 2011 04:31:54 -0700 (PDT)
Date: Tue, 4 Oct 2011 13:31:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111004113148.GE19366@jama.jama.net>
References: <cover.1317344910.git.nitin.a.kamble@intel.com>
	<efb11f0fc00b6406194a37db473d25409569ba81.1317344910.git.nitin.a.kamble@intel.com>
	<20110930183732.GH7364@jama.jama.net>
	<87E5B689-06D2-4E3C-81E1-D4DA363CD0C1@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <87E5B689-06D2-4E3C-81E1-D4DA363CD0C1@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 4/4] python, python-native: upgrade from 2.6.6 to 2.7.2
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
X-List-Received-Date: Tue, 04 Oct 2011 11:37:29 -0000
X-Groupsio-MsgNum: 10468
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EXKGNeO8l0xGFBjy"
Content-Disposition: inline

--EXKGNeO8l0xGFBjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 04, 2011 at 06:03:16AM -0500, Koen Kooi wrote:
>=20
>=20
> Op 30 sep. 2011 om 13:37 heeft Martin Jansa <martin.jansa@gmail.com> het =
volgende geschreven:
>=20
> > On Thu, Sep 29, 2011 at 06:27:11PM -0700, nitin.a.kamble@intel.com wrot=
e:
> >> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >>=20
> >> Rebased these patches to the newer code
> >>    modified:   python-native/nohostlibs.patch
> >>    modified:   python/01-use-proper-tools-for-cross-build.patch
> >>    modified:   python/06-avoid_usr_lib_termcap_path_in_linking.patch
> >>    modified:   python/06-ctypes-libffi-fix-configure.patch
> >>    modified:   python/multilib.patch
> >>=20
> >> Deleted these patches are the are now upstream
> >>    deleted:    python/02-remove-test-for-cross.patch
> >>    deleted:    python/security_issue_2254_fix.patch
> >>=20
> >> Added this patch to python-native
> >>    new file:   python-native/multilib.patch
> >>=20
> >> Updated site config files for python
> >>    modified:   ../../site/arm-common
> >>    modified:   ../../site/mips-common
> >>=20
> >> Updated default python version
> >>    modified:   ../../conf/distro/include/default-versions.inc
> >>=20
> >> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> >> ---
> >> meta/conf/distro/include/default-versions.inc      |    6 +-
> >> ...on-2.6-manifest.inc =3D> python-2.7-manifest.inc} |    0
> >> .../python/python-native/multilib.patch            |  240 ++++++++++++=
++++++++
> >> .../python/python-native/nohostlibs.patch          |   36 ++-
> >> ...thon-native_2.6.6.bb =3D> python-native_2.7.2.bb} |   13 +-
> >> meta/recipes-devtools/python/python.inc            |   16 +-
> >> .../01-use-proper-tools-for-cross-build.patch      |  118 +++++++---
> >> .../python/python/02-remove-test-for-cross.patch   |  108 ---------
> >> .../06-avoid_usr_lib_termcap_path_in_linking.patch |   16 +-
> >> .../python/06-ctypes-libffi-fix-configure.patch    |   42 ++---
> >> meta/recipes-devtools/python/python/multilib.patch |  126 ++++++-----
> >> .../python/python/security_issue_2254_fix.patch    |  184 ------------=
---
> >> .../python/{python_2.6.6.bb =3D> python_2.7.2.bb}    |   10 +-
> >> meta/site/arm-common                               |    3 +
> >> meta/site/mips-common                              |    3 +
> >> 15 files changed, 467 insertions(+), 454 deletions(-)
> >> rename meta/recipes-devtools/python/{python-2.6-manifest.inc =3D> pyth=
on-2.7-manifest.inc} (100%)
> >> create mode 100644 meta/recipes-devtools/python/python-native/multilib=
=2Epatch
> >> rename meta/recipes-devtools/python/{python-native_2.6.6.bb =3D> pytho=
n-native_2.7.2.bb} (74%)
> >> delete mode 100644 meta/recipes-devtools/python/python/02-remove-test-=
for-cross.patch
> >> delete mode 100644 meta/recipes-devtools/python/python/security_issue_=
2254_fix.patch
> >> rename meta/recipes-devtools/python/{python_2.6.6.bb =3D> python_2.7.2=
=2Ebb} (92%)
> >>=20
> >> diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf=
/distro/include/default-versions.inc
> >> index e3ef1e6..90ff005 100644
> >> --- a/meta/conf/distro/include/default-versions.inc
> >> +++ b/meta/conf/distro/include/default-versions.inc
> >> @@ -4,9 +4,9 @@
> >> PREFERRED_VERSION_pulseaudio ?=3D "0.9.23"
> >>=20
> >> # Force the python versions in one place
> >> -PYTHON_BASEVERSION ?=3D "2.6"
> >> -PREFERRED_VERSION_python ?=3D "2.6.6"
> >> -PREFERRED_VERSION_python-native ?=3D "2.6.6"
> >> +PYTHON_BASEVERSION ?=3D "2.7"
> >> +PREFERRED_VERSION_python ?=3D "2.7.2"
> >> +PREFERRED_VERSION_python-native ?=3D "2.7.2"
> >>=20
> >> # Force the older version of liberation-fonts until we fix the fontfor=
ge issue
> >> PREFERRED_VERSION_liberation-fonts ?=3D "1.04"
> >> diff --git a/meta/recipes-devtools/python/python-2.6-manifest.inc b/me=
ta/recipes-devtools/python/python-2.7-manifest.inc
> >> similarity index 100%
> >> rename from meta/recipes-devtools/python/python-2.6-manifest.inc
> >> rename to meta/recipes-devtools/python/python-2.7-manifest.inc
> >=20
> > this is wrong.. just to rename it isn't enough
>=20
> It also drops the source checksums :(

They are moved to python.inc which is then included to both python and
python-native recipes.

But maybe we should drop=20
DEFAULT_PREFERENCE =3D "-27"
as there is only one python version anyways

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EXKGNeO8l0xGFBjy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6K7qQACgkQN1Ujt2V2gByNTQCfb66og8esZNxpp5PUTvHMqYDy
tHcAn2Yi3hJvsGTGTBC/Fsw1fmlmfEX7
=THAz
-----END PGP SIGNATURE-----

--EXKGNeO8l0xGFBjy--
