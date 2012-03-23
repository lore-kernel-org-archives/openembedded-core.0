Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB6fZ-0006eH-H4
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 16:44:49 +0100
Received: by wibhj13 with SMTP id hj13so2000134wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 08:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FCimaGWW3FwHNXVSGiUHNHMxztphhBGe8aiNtx07QX8=;
	b=wrY/00RHSj0ZCibQjOmdfsv0PG44CreuYKGt1+7azTAGZkD782dZD6ZMkriW35+1Li
	OoV8nIJOxTJ7XYhDzN+Ni1ZtJMKkACcskiqBQbPjB2TvlCLMTv9f9aZq1rlfhpTflaJ0
	QxAc7d8prYRr1Q7x+8eAMq4GzSHNauApNIJvwC+87RBDnw5mxteEHhAvYomcA0PoW9sV
	Qu5ScUc/tNTud6f5KM4WMA+J9mbJIg1+mxMiTUJRwQS4ySws2kQ3lQZv4TyD4xlBJGd9
	MIo5eR55bfITU3KKWVn/ZL4EmUhbbPGABruKZiJUYzEg8e3U8/A+9nalwBMFhHnSujNn
	W5hQ==
Received: by 10.180.107.101 with SMTP id hb5mr7619569wib.7.1332516953100;
	Fri, 23 Mar 2012 08:35:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex2sm24288377wib.8.2012.03.23.08.35.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 08:35:51 -0700 (PDT)
Date: Fri, 23 Mar 2012 16:35:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120323153553.GJ3879@jama.jama.net>
References: <1332516428-9675-1-git-send-email-gary@mlbassoc.com>
	<1332516428-9675-3-git-send-email-gary@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <1332516428-9675-3-git-send-email-gary@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/2] python: Fix minimal packaging dependencies
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
X-List-Received-Date: Fri, 23 Mar 2012 15:44:49 -0000
X-Groupsio-MsgNum: 19569
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iRjOs3ViPWHdlw/I"
Content-Disposition: inline

--iRjOs3ViPWHdlw/I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 09:27:08AM -0600, Gary Thomas wrote:
> If you install the top-level python package only on a minimal
> system which has no other python packages installed then python
> is not functional at all.  Without any extra packages installed
> this error is seen:
>   # python
>   Traceback (most recent call last):
>     File "/usr/lib/python2.7/site.py", line 64, in <module>
>       import traceback
>   ImportError: No module named traceback
>=20
> Installing python-lang only partly fixes the problem as this
> error still exists:
>   # python
>   Traceback (most recent call last):
>     File "/usr/lib/python2.7/site.py", line 569, in <module>
>       main()
>     File "/usr/lib/python2.7/site.py", line 551, in main
>       known_paths =3D addusersitepackages(known_paths)
>     File "/usr/lib/python2.7/site.py", line 278, in addusersitepackages
>       user_site =3D getusersitepackages()
>     File "/usr/lib/python2.7/site.py", line 253, in getusersitepackages
>       user_base =3D getuserbase() # this will also set USER_BASE
>     File "/usr/lib/python2.7/site.py", line 243, in getuserbase
>       USER_BASE =3D get_config_var('userbase')
>     File "/usr/lib/python2.7/sysconfig.py", line 520, in get_config_var
>       return get_config_vars().get(name)
>     File "/usr/lib/python2.7/sysconfig.py", line 400, in get_config_vars
>       import re
>   ImportError: No module named re
>=20
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  meta/recipes-devtools/python/python_2.7.2.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-=
devtools/python/python_2.7.2.bb
> index 8111b31..f1ba42d 100644
> --- a/meta/recipes-devtools/python/python_2.7.2.bb
> +++ b/meta/recipes-devtools/python/python_2.7.2.bb
> @@ -1,6 +1,6 @@
>  require python.inc
>  DEPENDS =3D "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
> -PR =3D "${INC_PR}.8"
> +PR =3D "${INC_PR}.9"
> =20
>  DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
>  DISTRO_SRC_URI_linuxstdbase =3D ""
> @@ -123,6 +123,7 @@ py_package_preprocess () {
>  require python-${PYTHON_MAJMIN}-manifest.inc

This should be fixed probably in=20
scripts/contrib/python/generate-manifest-2.7.py

> =20
>  # manual dependency additions
> +RRDEPENDS_${PN} =3D "${PN}-lang ${PN}-re"

And here is typo, how did you test this change?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iRjOs3ViPWHdlw/I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9smFkACgkQN1Ujt2V2gBy7cwCgmPV1R3crch4snG6DYIiykl5x
dcYAn3kJItCt9zHpS5gz0Af7UC06e1Ap
=ptsB
-----END PGP SIGNATURE-----

--iRjOs3ViPWHdlw/I--
