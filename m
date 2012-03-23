Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB6rb-0006sb-1Z
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 16:57:15 +0100
Received: by wibhj13 with SMTP id hj13so1940929wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 08:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lXTY3DrfuYUkVhWd0d+O0R7qwA8qi1NXn4Qx0xo6dCg=;
	b=ElVhi9DC08oOTU0/tiAI5b6RMoNTbWu8r/Md+eBNmrUCHSEODT18pir2FgoJVUfMwr
	kJegM5gwdSN8CoYKhQF0ydWEXHIvxwY+5ZnDk3MOikCaTRRdDYOGg+ADoF6jpDrtoSEu
	tbklG/AcdstpYBqHy84T31U3NVw6NO9GQEBv7WVyNArOmZgG63IpEYhp17HcRzWoV/p8
	t5txpNhw8ZPcBPv3z6FYVdxm1h0CWcf27mCTP/jeNH7cPUULZhOilUvcBJOCOkMAMYCJ
	m0r5AhIpsNL9ytpd69cMyaklcqo8UKG/qclgstN4sgSVFxFsLB0cLDhtGn0/zlJ8tTqp
	XVtA==
Received: by 10.180.107.101 with SMTP id hb5mr7713791wib.7.1332517698880;
	Fri, 23 Mar 2012 08:48:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 9sm24480530wid.2.2012.03.23.08.48.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 08:48:18 -0700 (PDT)
Date: Fri, 23 Mar 2012 16:48:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120323154819.GK3879@jama.jama.net>
References: <1332516428-9675-1-git-send-email-gary@mlbassoc.com>
	<1332516428-9675-3-git-send-email-gary@mlbassoc.com>
	<20120323153553.GJ3879@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120323153553.GJ3879@jama.jama.net>
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
X-List-Received-Date: Fri, 23 Mar 2012 15:57:15 -0000
X-Groupsio-MsgNum: 19572
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLauP2uySp+9cKYP"
Content-Disposition: inline

--SLauP2uySp+9cKYP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 04:35:53PM +0100, Martin Jansa wrote:
> On Fri, Mar 23, 2012 at 09:27:08AM -0600, Gary Thomas wrote:
> > If you install the top-level python package only on a minimal
> > system which has no other python packages installed then python
> > is not functional at all.  Without any extra packages installed
> > this error is seen:
> >   # python
> >   Traceback (most recent call last):
> >     File "/usr/lib/python2.7/site.py", line 64, in <module>
> >       import traceback
> >   ImportError: No module named traceback
> >=20
> > Installing python-lang only partly fixes the problem as this
> > error still exists:
> >   # python
> >   Traceback (most recent call last):
> >     File "/usr/lib/python2.7/site.py", line 569, in <module>
> >       main()
> >     File "/usr/lib/python2.7/site.py", line 551, in main
> >       known_paths =3D addusersitepackages(known_paths)
> >     File "/usr/lib/python2.7/site.py", line 278, in addusersitepackages
> >       user_site =3D getusersitepackages()
> >     File "/usr/lib/python2.7/site.py", line 253, in getusersitepackages
> >       user_base =3D getuserbase() # this will also set USER_BASE
> >     File "/usr/lib/python2.7/site.py", line 243, in getuserbase
> >       USER_BASE =3D get_config_var('userbase')
> >     File "/usr/lib/python2.7/sysconfig.py", line 520, in get_config_var
> >       return get_config_vars().get(name)
> >     File "/usr/lib/python2.7/sysconfig.py", line 400, in get_config_vars
> >       import re
> >   ImportError: No module named re
> >=20
> > Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> > ---
> >  meta/recipes-devtools/python/python_2.7.2.bb |    3 ++-
> >  1 files changed, 2 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipe=
s-devtools/python/python_2.7.2.bb
> > index 8111b31..f1ba42d 100644
> > --- a/meta/recipes-devtools/python/python_2.7.2.bb
> > +++ b/meta/recipes-devtools/python/python_2.7.2.bb
> > @@ -1,6 +1,6 @@
> >  require python.inc
> >  DEPENDS =3D "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
> > -PR =3D "${INC_PR}.8"
> > +PR =3D "${INC_PR}.9"
> > =20
> >  DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
> >  DISTRO_SRC_URI_linuxstdbase =3D ""
> > @@ -123,6 +123,7 @@ py_package_preprocess () {
> >  require python-${PYTHON_MAJMIN}-manifest.inc
>=20
> This should be fixed probably in=20
> scripts/contrib/python/generate-manifest-2.7.py
>=20
> > =20
> >  # manual dependency additions
> > +RRDEPENDS_${PN} =3D "${PN}-lang ${PN}-re"
>=20
> And here is typo, how did you test this change?

And also notice that there is no ${PN} in PACKAGES, so by "top-level
python package" you mean python-core right?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SLauP2uySp+9cKYP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9sm0MACgkQN1Ujt2V2gBw5hwCeJEeWab7Uy5N65Ai/kL1aMaTH
7r0An1MyiEpaMIy/crTW/MFgJeir4S/Y
=mcZw
-----END PGP SIGNATURE-----

--SLauP2uySp+9cKYP--
