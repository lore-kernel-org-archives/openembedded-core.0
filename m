Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9i3F-0000yx-29
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 20:43:13 +0200
Received: by fxi1 with SMTP id 1so3400287fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 11:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tQgwlZ5+DJbrI/sIhwHohlANqKfdnb7g1Wi+lqUzdDo=;
	b=PY77rdyL8vodENR+cyHeMlmvvQQgGVmHDo8xOH308c4DH+uvlfBjZHOXep0i/ADGgi
	ECHebuvbv7/VxMT2+9bcZUYfhi+OTvqZv52g6ZmOVoqty4W7z/8H11097qaOXvsyQy1X
	S9hs3cn7sPreRfSIOIs69Y1z3yu603A1GqObY=
Received: by 10.223.30.27 with SMTP id s27mr11755326fac.129.1317407861611;
	Fri, 30 Sep 2011 11:37:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o16sm7771563fag.21.2011.09.30.11.37.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 11:37:40 -0700 (PDT)
Date: Fri, 30 Sep 2011 20:37:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110930183732.GH7364@jama.jama.net>
References: <cover.1317344910.git.nitin.a.kamble@intel.com>
	<efb11f0fc00b6406194a37db473d25409569ba81.1317344910.git.nitin.a.kamble@intel.com>
MIME-Version: 1.0
In-Reply-To: <efb11f0fc00b6406194a37db473d25409569ba81.1317344910.git.nitin.a.kamble@intel.com>
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
X-List-Received-Date: Fri, 30 Sep 2011 18:43:13 -0000
X-Groupsio-MsgNum: 10347
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ewQ5hdP4CtoTt3oD"
Content-Disposition: inline

--ewQ5hdP4CtoTt3oD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2011 at 06:27:11PM -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> Rebased these patches to the newer code
> 	modified:   python-native/nohostlibs.patch
> 	modified:   python/01-use-proper-tools-for-cross-build.patch
> 	modified:   python/06-avoid_usr_lib_termcap_path_in_linking.patch
> 	modified:   python/06-ctypes-libffi-fix-configure.patch
> 	modified:   python/multilib.patch
>=20
> Deleted these patches are the are now upstream
> 	deleted:    python/02-remove-test-for-cross.patch
> 	deleted:    python/security_issue_2254_fix.patch
>=20
> Added this patch to python-native
> 	new file:   python-native/multilib.patch
>=20
> Updated site config files for python
> 	modified:   ../../site/arm-common
> 	modified:   ../../site/mips-common
>=20
> Updated default python version
> 	modified:   ../../conf/distro/include/default-versions.inc
>=20
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/conf/distro/include/default-versions.inc      |    6 +-
>  ...on-2.6-manifest.inc =3D> python-2.7-manifest.inc} |    0
>  .../python/python-native/multilib.patch            |  240 ++++++++++++++=
++++++
>  .../python/python-native/nohostlibs.patch          |   36 ++-
>  ...thon-native_2.6.6.bb =3D> python-native_2.7.2.bb} |   13 +-
>  meta/recipes-devtools/python/python.inc            |   16 +-
>  .../01-use-proper-tools-for-cross-build.patch      |  118 +++++++---
>  .../python/python/02-remove-test-for-cross.patch   |  108 ---------
>  .../06-avoid_usr_lib_termcap_path_in_linking.patch |   16 +-
>  .../python/06-ctypes-libffi-fix-configure.patch    |   42 ++---
>  meta/recipes-devtools/python/python/multilib.patch |  126 ++++++-----
>  .../python/python/security_issue_2254_fix.patch    |  184 ---------------
>  .../python/{python_2.6.6.bb =3D> python_2.7.2.bb}    |   10 +-
>  meta/site/arm-common                               |    3 +
>  meta/site/mips-common                              |    3 +
>  15 files changed, 467 insertions(+), 454 deletions(-)
>  rename meta/recipes-devtools/python/{python-2.6-manifest.inc =3D> python=
-2.7-manifest.inc} (100%)
>  create mode 100644 meta/recipes-devtools/python/python-native/multilib.p=
atch
>  rename meta/recipes-devtools/python/{python-native_2.6.6.bb =3D> python-=
native_2.7.2.bb} (74%)
>  delete mode 100644 meta/recipes-devtools/python/python/02-remove-test-fo=
r-cross.patch
>  delete mode 100644 meta/recipes-devtools/python/python/security_issue_22=
54_fix.patch
>  rename meta/recipes-devtools/python/{python_2.6.6.bb =3D> python_2.7.2.b=
b} (92%)
>=20
> diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/di=
stro/include/default-versions.inc
> index e3ef1e6..90ff005 100644
> --- a/meta/conf/distro/include/default-versions.inc
> +++ b/meta/conf/distro/include/default-versions.inc
> @@ -4,9 +4,9 @@
>  PREFERRED_VERSION_pulseaudio ?=3D "0.9.23"
> =20
>  # Force the python versions in one place
> -PYTHON_BASEVERSION ?=3D "2.6"
> -PREFERRED_VERSION_python ?=3D "2.6.6"
> -PREFERRED_VERSION_python-native ?=3D "2.6.6"
> +PYTHON_BASEVERSION ?=3D "2.7"
> +PREFERRED_VERSION_python ?=3D "2.7.2"
> +PREFERRED_VERSION_python-native ?=3D "2.7.2"
> =20
>  # Force the older version of liberation-fonts until we fix the fontforge=
 issue
>  PREFERRED_VERSION_liberation-fonts ?=3D "1.04"
> diff --git a/meta/recipes-devtools/python/python-2.6-manifest.inc b/meta/=
recipes-devtools/python/python-2.7-manifest.inc
> similarity index 100%
> rename from meta/recipes-devtools/python/python-2.6-manifest.inc
> rename to meta/recipes-devtools/python/python-2.7-manifest.inc

this is wrong.. just to rename it isn't enough

I will send patch which regenerates manifest with right paths to
actually package something..

Regards,

--ewQ5hdP4CtoTt3oD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6GDGwACgkQN1Ujt2V2gBwppQCglgkMv4n1ETTabNMGJc2lBGIR
lq0AmgN/+tETRa2iSNjTBAzJOz2BQB+6
=4eMD
-----END PGP SIGNATURE-----

--ewQ5hdP4CtoTt3oD--
