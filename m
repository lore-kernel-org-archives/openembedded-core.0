Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USOXS-0000B9-C8
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 11:20:38 +0200
Received: by mail-pb0-f44.google.com with SMTP id wz12so782372pbc.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 02:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=BkiTvwcxw6EmissseaC8DnVaUpRjzx/IPXbctxsORM4=;
	b=pfGDxCp8kzTIWuBjDp2wtuVu4UPzXiH6yBglxSVd5S8TxJFj+Zl9eu8KQnOr6Hgb5D
	crVR9Gk1PcdFp4aGTgYqVgs7X/ldU1q9O4LfKQnB72nWwv00xcmh+Pr1r1pkf8heX7Jb
	h90kDUMh73XjsMTIzn03cz/CfZLgeKxwjcZWZOPnaexC6K1L+980T4hEXX07TW0dJqeI
	vmgPis5KNzx37z3qALlGyv86gKVgaquXYiMjmc24WEejZJZPzqGMCDrKUyLZ2d6TBf18
	ByDg3i81e1weuOPeLDfM2g3t9MOYAzCS3wurVyv4/T76atAfRqeAhtO2kdwruc6jQpJQ
	ST9g==
X-Received: by 10.67.1.97 with SMTP id bf1mr7845766pad.118.1366189336957;
	Wed, 17 Apr 2013 02:02:16 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id z18sm6333485paf.22.2013.04.17.02.02.14
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 02:02:15 -0700 (PDT)
Date: Wed, 17 Apr 2013 11:02:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130417090215.GB26007@jama>
References: <1366115411-15270-1-git-send-email-Martin.Jansa@gmail.com>
	<1366147707.8670.110.camel@ted>
	<72299C10-2B6D-4295-80B1-C509C186B326@gmail.com>
MIME-Version: 1.0
In-Reply-To: <72299C10-2B6D-4295-80B1-C509C186B326@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: use AC_CHECK_TOOL instead of AC_PATH_TOOL when checking objcopy, strings, gperf
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
X-List-Received-Date: Wed, 17 Apr 2013 09:20:47 -0000
X-Groupsio-MsgNum: 38059
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Content-Disposition: inline

--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2013 at 05:59:53PM -0700, Khem Raj wrote:
>=20
> On Apr 16, 2013, at 2:28 PM, Richard Purdie <richard.purdie@linuxfoundati=
on.org> wrote:
>=20
> > On Tue, 2013-04-16 at 14:30 +0200, Martin Jansa wrote:
> >> * with external toolchain I have different HOST_PREFIX and HOST_SYS
> >>  AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objcopy
> >>  then it tries objcopy without prefix which is found on host, but
> >>  that objcopy does not work for arm libs
> >> * with internal toolchain gperf is not prefixed with HOST_PREFIX, but
> >>  fallback to "gperf" only finds the one in native sysroot first
> >> * based on http://lists.linuxtogo.org/pipermail/openembedded-core/2013=
-April/037985.html
> >>  Khem suggested to export strings and gperf from bitbake.conf instead
> >>=20
> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> ---
> >> meta/conf/bitbake.conf                             |  2 ++
> >> ...se-AC_CHECK_TOOL-for-objcopy-strings-and-.patch | 41 ++++++++++++++=
++++++++
> >> meta/recipes-core/systemd/systemd_199.bb           |  1 +
> >> 3 files changed, 44 insertions(+)
> >> create mode 100644 meta/recipes-core/systemd/systemd/0001-configure-us=
e-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
> >>=20
> >> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> >> index cd5d61e..a84ae38 100644
> >> --- a/meta/conf/bitbake.conf
> >> +++ b/meta/conf/bitbake.conf
> >> @@ -455,6 +455,8 @@ export RANLIB =3D "${HOST_PREFIX}ranlib"
> >> export STRIP =3D "${HOST_PREFIX}strip"
> >> export OBJCOPY =3D "${HOST_PREFIX}objcopy"
> >> export OBJDUMP =3D "${HOST_PREFIX}objdump"
> >> +export STRINGS =3D "${HOST_PREFIX}strings"
> >> +export GPERF =3D "${HOST_PREFIX}gperf"
> >> export NM =3D "${HOST_PREFIX}nm"
> >> PYTHON =3D "${@sys.executable}"
> >=20
> > At this point in the release cycle I'm not adding new global exports to
> > ever piece of software in the system. I appreciate in theory nothing bad
> > should happen however the reality is sometimes different :/. I'm taking
> > a *lot* of risks in including as many changes as I have, I don't want to
> > add this one too.
> >=20
> > I'm also not sure its a good idea in general to build up more exports in
> > bitbake.conf if we haven't yet needed them.
> >=20
>=20
> We can not be certain we did not need them autoconfed packages will defau=
lt to one on host
> so it might be that many recipes have been wrongly using non-cross versio=
n of tools and succeeding
> the build. Problem is there in though.=20
>=20
> I think on master this patch should be considered as such
>=20
> > I'll take a version of this which does this in the systemd recipe.
>=20
> For dylan this seems ok

I have patch moving exports to bitbake.conf in my local tree, I'll send
it for master after dylan is released.

> >> diff --git a/meta/recipes-core/systemd/systemd/0001-configure-use-AC_C=
HECK_TOOL-for-objcopy-strings-and-.patch b/meta/recipes-core/systemd/system=
d/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
> >> new file mode 100644
> >> index 0000000..d847bbc
> >> --- /dev/null
> >> +++ b/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TO=
OL-for-objcopy-strings-and-.patch
> >> @@ -0,0 +1,41 @@
> >> +From d6f92bcbbae9a577adb9588c7b2783a5d0bf343d Mon Sep 17 00:00:00 2001
> >> +From: Martin Jansa <Martin.Jansa@gmail.com>
> >> +Date: Tue, 16 Apr 2013 14:20:41 +0200
> >> +Subject: [PATCH] configure: use AC_CHECK_TOOL for objcopy, strings an=
d gperf
> >> +
> >> +* using AC_PATH_TOOL does not allow to override it from shell environ=
ment
> >> +  which is useful when cross-compiling
> >> +* with external toolchain I have different HOST_PREFIX and HOST_SYS
> >> +  AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objcopy
> >> +  which is available only as ${TARGET_PREFIX}objcopy then it tries
> >> +  objcopy without prefix which is found on host, but that objcopy
> >> +  does not work for !host (e.g. arm when building on x86) libs
> >> +
> >> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> +Upstream-Status: Submitted
> >> +http://lists.freedesktop.org/archives/systemd-devel/2013-April/010468=
=2Ehtml
> >> +
> >> +---
> >> + configure.ac | 6 +++---
> >> + 1 file changed, 3 insertions(+), 3 deletions(-)
> >> +
> >> +diff --git a/configure.ac b/configure.ac
> >> +index 33b0ca9..519f1a9 100644
> >> +--- a/configure.ac
> >> ++++ b/configure.ac
> >> +@@ -86,9 +86,9 @@ GOBJECT_INTROSPECTION_CHECK([1.31.1])
> >> +    AM_CONDITIONAL([HAVE_INTROSPECTION], [false])
> >> +    enable_introspection=3Dno])
> >> +=20
> >> +-AC_PATH_TOOL(OBJCOPY, objcopy)
> >> +-AC_PATH_TOOL(STRINGS, strings)
> >> +-AC_PATH_TOOL(GPERF, gperf)
> >> ++AC_CHECK_TOOL(OBJCOPY, objcopy)
> >> ++AC_CHECK_TOOL(STRINGS, strings)
> >> ++AC_CHECK_TOOL(GPERF, gperf)
> >> + if test -z "$GPERF" ; then
> >> +         AC_MSG_ERROR([*** gperf not found])
> >> + fi
> >> +--=20
> >> +1.8.1.5
> >> +
> >> diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-c=
ore/systemd/systemd_199.bb
> >> index d22df12..e8ad8f5 100644
> >> --- a/meta/recipes-core/systemd/systemd_199.bb
> >> +++ b/meta/recipes-core/systemd/systemd_199.bb
> >> @@ -27,6 +27,7 @@ SRC_URI =3D "http://www.freedesktop.org/software/sys=
temd/systemd-${PV}.tar.xz \
> >>            file://0002-readahead-chunk-on-spinning-media.patch \
> >>            file://0003-readahead-cleanups.patch \
> >>            file://0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-p=
roper.patch \
> >> +           file://0001-configure-use-AC_CHECK_TOOL-for-objcopy-string=
s-and-.patch \
> >>            file://199-firmware.patch \
> >>            file://init \
> >>           "
> >=20
> >=20
> >=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFuZRcACgkQN1Ujt2V2gBwBtwCgka4km6fLSZMmPmIRiuKjRMQP
T68An17IIksWwJb/WvjAj24wN706e/9c
=9t8G
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--
