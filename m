Received: from mail-da0-f48.google.com ([209.85.210.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USyIL-0001Fd-J8
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 01:31:16 +0200
Received: by mail-da0-f48.google.com with SMTP id f10so44dak.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 16:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=62sze+f4njZXQp9vhAyG2YzanuJ1SEQ9JGHx5BmaFuc=;
	b=hbdEE8koIFgihj5gO0VHp3+PeDjIcGOiP/RD6PloYjdBgTp+lmFcB026t9jpYJQXRj
	B96rpBM1nhBgPapzkV6q9ppfbcdLBS5K7P0BgcxmyD8uakDQDilv7Nno3vPMHVJRWNx0
	aIZcZfDHj0gTbpQg87iMe2eVkHPt5YZ8x4ogym8+d4yongnU2+2/GF0sBSUtmP2jF5kr
	CHsCjud2HXg81gtRKDs9PysVswu2t+sMTtWhOIyoYnjPJiwFoseNlObglFWdUwT7/6es
	IfgRLXcB0NRFGDiFLijzx4FziQ93hQHMr2cfCTkHNvNwfFgnXY0y2lFxYJuvXnbuDB0o
	jHTg==
X-Received: by 10.66.183.10 with SMTP id ei10mr2529257pac.39.1366326818946;
	Thu, 18 Apr 2013 16:13:38 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b7sm11169197pba.39.2013.04.18.16.13.35
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 16:13:37 -0700 (PDT)
Date: Fri, 19 Apr 2013 01:13:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130418231337.GC2489@jama>
References: <1366115411-15270-1-git-send-email-Martin.Jansa@gmail.com>
	<1366147707.8670.110.camel@ted>
	<72299C10-2B6D-4295-80B1-C509C186B326@gmail.com>
	<20130417090215.GB26007@jama> <20130418190043.GA2489@jama>
MIME-Version: 1.0
In-Reply-To: <20130418190043.GA2489@jama>
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
X-List-Received-Date: Thu, 18 Apr 2013 23:31:41 -0000
X-Groupsio-MsgNum: 38152
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p2kqVDKq5asng8Dg"
Content-Disposition: inline

--p2kqVDKq5asng8Dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2013 at 09:00:43PM +0200, Martin Jansa wrote:
> On Wed, Apr 17, 2013 at 11:02:15AM +0200, Martin Jansa wrote:
> > On Tue, Apr 16, 2013 at 05:59:53PM -0700, Khem Raj wrote:
> > >=20
> > > On Apr 16, 2013, at 2:28 PM, Richard Purdie <richard.purdie@linuxfoun=
dation.org> wrote:
> > >=20
> > > > On Tue, 2013-04-16 at 14:30 +0200, Martin Jansa wrote:
> > > >> * with external toolchain I have different HOST_PREFIX and HOST_SYS
> > > >>  AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objcopy
> > > >>  then it tries objcopy without prefix which is found on host, but
> > > >>  that objcopy does not work for arm libs
> > > >> * with internal toolchain gperf is not prefixed with HOST_PREFIX, =
but
> > > >>  fallback to "gperf" only finds the one in native sysroot first
> > > >> * based on http://lists.linuxtogo.org/pipermail/openembedded-core/=
2013-April/037985.html
> > > >>  Khem suggested to export strings and gperf from bitbake.conf inst=
ead
> > > >>=20
> > > >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > >> ---
> > > >> meta/conf/bitbake.conf                             |  2 ++
> > > >> ...se-AC_CHECK_TOOL-for-objcopy-strings-and-.patch | 41 ++++++++++=
++++++++++++
> > > >> meta/recipes-core/systemd/systemd_199.bb           |  1 +
> > > >> 3 files changed, 44 insertions(+)
> > > >> create mode 100644 meta/recipes-core/systemd/systemd/0001-configur=
e-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
> > > >>=20
> > > >> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > >> index cd5d61e..a84ae38 100644
> > > >> --- a/meta/conf/bitbake.conf
> > > >> +++ b/meta/conf/bitbake.conf
> > > >> @@ -455,6 +455,8 @@ export RANLIB =3D "${HOST_PREFIX}ranlib"
> > > >> export STRIP =3D "${HOST_PREFIX}strip"
> > > >> export OBJCOPY =3D "${HOST_PREFIX}objcopy"
> > > >> export OBJDUMP =3D "${HOST_PREFIX}objdump"
> > > >> +export STRINGS =3D "${HOST_PREFIX}strings"
> > > >> +export GPERF =3D "${HOST_PREFIX}gperf"
> > > >> export NM =3D "${HOST_PREFIX}nm"
> > > >> PYTHON =3D "${@sys.executable}"
> > > >=20
> > > > At this point in the release cycle I'm not adding new global export=
s to
> > > > ever piece of software in the system. I appreciate in theory nothin=
g bad
> > > > should happen however the reality is sometimes different :/. I'm ta=
king
> > > > a *lot* of risks in including as many changes as I have, I don't wa=
nt to
> > > > add this one too.
> > > >=20
> > > > I'm also not sure its a good idea in general to build up more expor=
ts in
> > > > bitbake.conf if we haven't yet needed them.
> > > >=20
> > >=20
> > > We can not be certain we did not need them autoconfed packages will d=
efault to one on host
> > > so it might be that many recipes have been wrongly using non-cross ve=
rsion of tools and succeeding
> > > the build. Problem is there in though.=20
> > >=20
> > > I think on master this patch should be considered as such
> > >=20
> > > > I'll take a version of this which does this in the systemd recipe.
> > >=20
> > > For dylan this seems ok
> >=20
> > I have patch moving exports to bitbake.conf in my local tree, I'll send
> > it for master after dylan is released.
>=20
> It was good call to keep it local for systemd in dylan
>=20
> x86_64-oe-linux-gperf: No such file or directory
> in webkit-efl and kconfig-frontends
> | sh: 1: x86_64-oe-linux-gperf: not found
> | calling gperf failed: 32512 at /home/jenkins/oe/shr-core-branches/shr-c=
ore/tmp-eglibc/work/x86_64-oe-linux/webkit-efl/1.9.3+svnr120144-r2/src/Sour=
ce/WebCore/make-hash-tools.pl line 36.
>=20
> x86_64-oe-linux-strings: No such file or directory
> in tcp-wrappers, interestingly in gcc call:
>=20
> | x86_64-oe-linux-gcc    -m64
> --sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroo=
ts/qemux86-64
> -DFACILITY=3DLOG_DAEMON -DHOSTS_ACCESS  -DNETGROUP -DUSE_GETDOMAIN
> -DDAEMON_UMASK=3D022 -DREAL_DAEMON_DIR=3D\"/usr/sbin\" -DPROCESS_OPTIONS
> -DKILL_IP_OPTIONS -DSEVERITY=3DLOG_INFO -DRFC931_TIMEOUT=3D10
> -DHOSTS_DENY=3D\"/etc/hosts.deny\" -DHOSTS_ALLOW=3D\"/etc/hosts.allow\"
> x86_64-oe-linux-strings  -O2 -pipe -g -feliminate-unused-debug-types
> -DSYS_ERRLIST_DEFINED -DHAVE_STRERROR -DHAVE_WEAKSYMS -D_REENTRANT
> -DINET6=3D1 -Dss_family=3D__ss_family -Dss_len=3D__ss_len    -o tcpd.o -c
> tcpd.c
> | x86_64-oe-linux-gcc: error: x86_64-oe-linux-strings: No such file or
> directory

I have fix for tcp-wrappers (oe-core-contrib/jansa/gperf), but gperf looks=
=20
a bit more complicated and maybe not right to export it with ${HOST_PREFIX}

In that external-toolchain I have it's indeed prefixed with
${HOST_PREFIX} and that change in systemd's configure.ac allows to find
it. When I was testing it with internal toolchain, I've seen that in
systemd/config.log I also have
configure:18082: checking for gperf
configure:18100: found /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bi=
n/gperf
configure:18112: result: /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/=
bin/gperf
-> so it works correctly for unprefixed gperf (internal toolchain) too.

But now the same fix for kconfig-frontends wasn't working and I've found
that systemd checks for gperf twice
AC_CHECK_TOOL(GPERF, gperf)
if test -z "$GPERF" ; then
        AC_MSG_ERROR([*** gperf not found])
fi

and a bit later
AS_IF([test "x$enable_keymap" =3D "xyes"], [
       AC_PATH_PROG([GPERF], [gperf])
       if test -z "$GPERF"; then
              AC_MSG_ERROR([gperf is needed])
       fi

And this 2nd check is what allows it to find unprefixed gperf.

So one way is to export unprefixed gperf (or not export at all from
bitbake.conf) and let external-toolchain.inc to export it if it provides
prefixed gperf or fix kconfig-frontends and webkit-efl to check for
exported and then fallback to checking gperf without prefix.

Cheers,

> > > >> diff --git a/meta/recipes-core/systemd/systemd/0001-configure-use-=
AC_CHECK_TOOL-for-objcopy-strings-and-.patch b/meta/recipes-core/systemd/sy=
stemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
> > > >> new file mode 100644
> > > >> index 0000000..d847bbc
> > > >> --- /dev/null
> > > >> +++ b/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHEC=
K_TOOL-for-objcopy-strings-and-.patch
> > > >> @@ -0,0 +1,41 @@
> > > >> +From d6f92bcbbae9a577adb9588c7b2783a5d0bf343d Mon Sep 17 00:00:00=
 2001
> > > >> +From: Martin Jansa <Martin.Jansa@gmail.com>
> > > >> +Date: Tue, 16 Apr 2013 14:20:41 +0200
> > > >> +Subject: [PATCH] configure: use AC_CHECK_TOOL for objcopy, string=
s and gperf
> > > >> +
> > > >> +* using AC_PATH_TOOL does not allow to override it from shell env=
ironment
> > > >> +  which is useful when cross-compiling
> > > >> +* with external toolchain I have different HOST_PREFIX and HOST_S=
YS
> > > >> +  AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objc=
opy
> > > >> +  which is available only as ${TARGET_PREFIX}objcopy then it tries
> > > >> +  objcopy without prefix which is found on host, but that objcopy
> > > >> +  does not work for !host (e.g. arm when building on x86) libs
> > > >> +
> > > >> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > >> +Upstream-Status: Submitted
> > > >> +http://lists.freedesktop.org/archives/systemd-devel/2013-April/01=
0468.html
> > > >> +
> > > >> +---
> > > >> + configure.ac | 6 +++---
> > > >> + 1 file changed, 3 insertions(+), 3 deletions(-)
> > > >> +
> > > >> +diff --git a/configure.ac b/configure.ac
> > > >> +index 33b0ca9..519f1a9 100644
> > > >> +--- a/configure.ac
> > > >> ++++ b/configure.ac
> > > >> +@@ -86,9 +86,9 @@ GOBJECT_INTROSPECTION_CHECK([1.31.1])
> > > >> +    AM_CONDITIONAL([HAVE_INTROSPECTION], [false])
> > > >> +    enable_introspection=3Dno])
> > > >> +=20
> > > >> +-AC_PATH_TOOL(OBJCOPY, objcopy)
> > > >> +-AC_PATH_TOOL(STRINGS, strings)
> > > >> +-AC_PATH_TOOL(GPERF, gperf)
> > > >> ++AC_CHECK_TOOL(OBJCOPY, objcopy)
> > > >> ++AC_CHECK_TOOL(STRINGS, strings)
> > > >> ++AC_CHECK_TOOL(GPERF, gperf)
> > > >> + if test -z "$GPERF" ; then
> > > >> +         AC_MSG_ERROR([*** gperf not found])
> > > >> + fi
> > > >> +--=20
> > > >> +1.8.1.5
> > > >> +
> > > >> diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recip=
es-core/systemd/systemd_199.bb
> > > >> index d22df12..e8ad8f5 100644
> > > >> --- a/meta/recipes-core/systemd/systemd_199.bb
> > > >> +++ b/meta/recipes-core/systemd/systemd_199.bb
> > > >> @@ -27,6 +27,7 @@ SRC_URI =3D "http://www.freedesktop.org/software=
/systemd/systemd-${PV}.tar.xz \
> > > >>            file://0002-readahead-chunk-on-spinning-media.patch \
> > > >>            file://0003-readahead-cleanups.patch \
> > > >>            file://0013-systemd-sysctl-Handle-missing-etc-sysctl.co=
nf-proper.patch \
> > > >> +           file://0001-configure-use-AC_CHECK_TOOL-for-objcopy-st=
rings-and-.patch \
> > > >>            file://199-firmware.patch \
> > > >>            file://init \
> > > >>           "
> > > >=20
> > > >=20
> > > >=20
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-co=
re
> > >=20
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--p2kqVDKq5asng8Dg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFwfiEACgkQN1Ujt2V2gBzaBQCaA8XnnX0gdTlcK7qHG8IChNME
JKMAn3APWm2NlLgKDAVgsfjOyd4FYf0v
=pRLX
-----END PGP SIGNATURE-----

--p2kqVDKq5asng8Dg--
