Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 688CB7415A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 16:50:56 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so21751317wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 09:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Qqd9+e9XHQdIzmtw6eol8vQ3rJvab+/0C7+P2uTQfiI=;
	b=nlnsbxC7OP3+ypLl0Odkd9VUl2OPSaqygryw0/2CePDlAG0BBom7fdVLlWYpWqIajU
	4GjPoaNanI6X71vQmE6lWJrNt6TA8ZKxac3XmrfDqhXehN0KmGlJ/TQyJEVPwUSTc1Zi
	B9PZl3gWmMti2jKf6J8gFpeuOFE7x6YuZovwObMPDBVZpgQszXMzRmkW+cJSgFoRKWn/
	OFeh8uOP0OUrJWNteomN6IJOA49oTj+qqIP4W5X3hlx+HA3hSQDlPhp91qEsade7OVSM
	LGVoHBpc5rYQBvlENK6hDJ/9p5TbOREz2RbnlvrSKt/1VqkZfdrTZj4g1m9K6M7m2dsG
	aLSQ==
X-Received: by 10.194.235.227 with SMTP id up3mr22362272wjc.132.1437065456890; 
	Thu, 16 Jul 2015 09:50:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c2sm14007476wjf.18.2015.07.16.09.50.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jul 2015 09:50:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 16 Jul 2015 18:51:25 +0200
To: "Moseley, Drew" <drew_moseley@mentor.com>
Message-ID: <20150716165124.GG2134@jama>
References: <1437059524-15971-1-git-send-email-drew_moseley@mentor.com>
	<20150716154529.GE2134@jama>
	<DBF4FAB7-1F3A-4FAA-936E-8752FC32CC69@mentor.com>
MIME-Version: 1.0
In-Reply-To: <DBF4FAB7-1F3A-4FAA-936E-8752FC32CC69@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mesa-demos: Fix building demos which require GLU.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jul 2015 16:51:01 -0000
X-Groupsio-MsgNum: 68048
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WkfBGePaEyrk4zXB"
Content-Disposition: inline

--WkfBGePaEyrk4zXB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2015 at 04:38:42PM +0000, Moseley, Drew wrote:
>=20
> > On Jul 16, 2015, at 11:45 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> >=20
> > On Thu, Jul 16, 2015 at 11:12:04AM -0400, Drew Moseley wrote:
> >> The existing test for GLU support is backwards.  Reverse the
> >> sense of the conditional when built with "--enable-glu".
> >>=20
> >> Signed-off-by: Drew Moseley <drew_moseley@mentor.com <mailto:drew_mose=
ley@mentor.com>>
> >> ---
> >> ...figure-Allow-to-disable-demos-which-require-GLEW-.patch | 14 ++++++=
++------
> >> 1 file changed, 8 insertions(+), 6 deletions(-)
> >>=20
> >> diff --git a/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allo=
w-to-disable-demos-which-require-GLEW-.patch b/meta/recipes-graphics/mesa/m=
esa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
> >> index 4b07193..b25f5ce 100644
> >> --- a/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-di=
sable-demos-which-require-GLEW-.patch
> >> +++ b/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-di=
sable-demos-which-require-GLEW-.patch
> >> @@ -10,20 +10,21 @@ Subject: [PATCH 3/9] configure: Allow to disable d=
emos which require GLEW or
> >> Upstream-Status: Pending
> >>=20
> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com <mailto:Martin.Jan=
sa@gmail.com>>
> >> +Signed-off-by: Drew Moseley <drew_moseley@mentor.com <mailto:drew_mos=
eley@mentor.com>>
> >> ---
> >> - configure.ac                  | 49 ++++++++++++++++++++---------
> >> - src/Makefile.am               | 14 ++++++---
> >> + configure.ac                  | 50 ++++++++++++++++++++---------
> >> + src/Makefile.am               | 18 ++++++++---
> >>  src/demos/Makefile.am         | 73 ++++++++++++++++++++++++----------=
---------
> >>  src/egl/Makefile.am           |  8 +++--
> >>  src/egl/opengles1/Makefile.am | 44 +++++++++++++++-----------
> >>  src/egl/opengles2/Makefile.am | 33 ++++++++++---------
> >> - 6 files changed, 135 insertions(+), 86 deletions(-)
> >> + 6 files changed, 140 insertions(+), 86 deletions(-)
> >>=20
> >> diff --git a/configure.ac b/configure.ac
> >> index 9445424..bc4c8d1 100644
> >> --- a/configure.ac
> >> +++ b/configure.ac
> >> -@@ -93,25 +93,44 @@ AC_EGREP_HEADER([glutInitContextProfile],
> >> +@@ -89,25 +89,45 @@ AC_EGREP_HEADER([glutInitContextProfile],
> >>  		[AC_DEFINE(HAVE_FREEGLUT)],
> >>  		[])
> >>=20
> >> @@ -66,7 +67,7 @@ index 9445424..bc4c8d1 100644
> >> -DEMO_CFLAGS=3D"$DEMO_CFLAGS $GLU_CFLAGS"
> >> -DEMO_LIBS=3D"$DEMO_LIBS $GLU_LIBS"
> >> +if test "x$enable_glu" =3D xyes; then
> >> -+    PKG_CHECK_MODULES(GLU, [glu], [],
> >> ++    PKG_CHECK_MODULES(GLU, [glu],
> >=20
> > Are you sure? It was like this in original PKG_CHECK_MODULES and I think
> > it was correct. 4th parameter is used as fallback to find it manually
> > when pkg-config doesn't find it, with your change it would use
> > AC_CHECK_HEADER and ignore the values set returned by pkg-config.
>=20
>=20
> Hi Martin,
>=20
> I=E2=80=99m fairly certain this is needed however I=E2=80=99m not terribl=
y familiar with autotools so it=E2=80=99s possible I missed something.  I k=
now that without this change a number of the demo apps I expect do not get =
built.  It=E2=80=99s been a while since I looked but I seem to recall that =
the =E2=80=9Cgeartrain=E2=80=9D demo among others will not be available wit=
hout this change.
>=20
> From my reading of the PKG_CHECK_MODULES docs at https://autotools.io/pkg=
config/pkg_check_modules.html <https://autotools.io/pkgconfig/pkg_check_mod=
ules.html>, it seems the 3rd parameter is the action-if-found and my read o=
f the logic here is that if glu is found it then verifies the presence of t=
he header files and libs.

Yes, but if-found (by pkg-config) then the macro itself sets GLU_LIBS
and GLU_CFLAGS, so it doesn't make sense to call AC_CHECK_LIB to change
GLU_LIBS value.

action-if-not-found on the other hand is for cases where your GLU
implementation doesn't provide pkg-config and you want to try to find it
with AC_CHECK_LIB.

I believe you that there could be an issue with building glu demos, but
I guess it's issue in your GLU implementation (whatever that is) and
this change is not correct fix for it - it just happen to help in your
case and breaks other cases.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WkfBGePaEyrk4zXB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWn4QwACgkQN1Ujt2V2gBwu3QCgqKDZ5wZuWava822aLJ/6K9pq
4xIAniP0v4cCqHADR+OoJo7xkcsjpuTs
=ceW5
-----END PGP SIGNATURE-----

--WkfBGePaEyrk4zXB--
