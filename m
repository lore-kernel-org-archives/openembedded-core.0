Received: from mail-pa0-f41.google.com ([209.85.220.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USuLb-0003bF-Jc
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 21:18:25 +0200
Received: by mail-pa0-f41.google.com with SMTP id kx1so1805859pab.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 12:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=3OXBk0gi/Dyik0kMN3BEKrQgJajOAb4wNwEa62kJqqs=;
	b=b0rOg6VdCMRE/ERJdWEh/pzqfzO0f3yM1dpIAXn5utVFHs1XVsi6qDIUxtAYCSB+34
	KOQJW74BWoxoao5fx1jEiEtJ3VPx3beEKcUClRd1mLqnJtHwBaOlv/ky4KrfVq+BirxF
	MBiSWxzXkueEXzFKmOd1fixByHjzEill+GD/a4ZKEBylnfWuYkQ6ZtZFl0MjTFYR5Yu4
	qKrmrtjtTvkIv2vYArwaaJp7uHXEorszGEXU1B1ypxezWNTjilfxuHa3fvI7S/P3rbp4
	jB6McmfuDysV3c/9id4ctaCZg0BW4utw250bvmSDtMCGA3cjGXHO7btnm1cwKFHWm21v
	Fl3A==
X-Received: by 10.68.36.230 with SMTP id t6mr15003665pbj.218.1366311645256;
	Thu, 18 Apr 2013 12:00:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ew5sm10749314pbc.9.2013.04.18.12.00.41
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 12:00:44 -0700 (PDT)
Date: Thu, 18 Apr 2013 21:00:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130418190043.GA2489@jama>
References: <1366115411-15270-1-git-send-email-Martin.Jansa@gmail.com>
	<1366147707.8670.110.camel@ted>
	<72299C10-2B6D-4295-80B1-C509C186B326@gmail.com>
	<20130417090215.GB26007@jama>
MIME-Version: 1.0
In-Reply-To: <20130417090215.GB26007@jama>
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
X-List-Received-Date: Thu, 18 Apr 2013 19:18:29 -0000
X-Groupsio-MsgNum: 38151
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline

--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2013 at 11:02:15AM +0200, Martin Jansa wrote:
> On Tue, Apr 16, 2013 at 05:59:53PM -0700, Khem Raj wrote:
> >=20
> > On Apr 16, 2013, at 2:28 PM, Richard Purdie <richard.purdie@linuxfounda=
tion.org> wrote:
> >=20
> > > On Tue, 2013-04-16 at 14:30 +0200, Martin Jansa wrote:
> > >> * with external toolchain I have different HOST_PREFIX and HOST_SYS
> > >>  AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objcopy
> > >>  then it tries objcopy without prefix which is found on host, but
> > >>  that objcopy does not work for arm libs
> > >> * with internal toolchain gperf is not prefixed with HOST_PREFIX, but
> > >>  fallback to "gperf" only finds the one in native sysroot first
> > >> * based on http://lists.linuxtogo.org/pipermail/openembedded-core/20=
13-April/037985.html
> > >>  Khem suggested to export strings and gperf from bitbake.conf instead
> > >>=20
> > >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > >> ---
> > >> meta/conf/bitbake.conf                             |  2 ++
> > >> ...se-AC_CHECK_TOOL-for-objcopy-strings-and-.patch | 41 ++++++++++++=
++++++++++
> > >> meta/recipes-core/systemd/systemd_199.bb           |  1 +
> > >> 3 files changed, 44 insertions(+)
> > >> create mode 100644 meta/recipes-core/systemd/systemd/0001-configure-=
use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
> > >>=20
> > >> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > >> index cd5d61e..a84ae38 100644
> > >> --- a/meta/conf/bitbake.conf
> > >> +++ b/meta/conf/bitbake.conf
> > >> @@ -455,6 +455,8 @@ export RANLIB =3D "${HOST_PREFIX}ranlib"
> > >> export STRIP =3D "${HOST_PREFIX}strip"
> > >> export OBJCOPY =3D "${HOST_PREFIX}objcopy"
> > >> export OBJDUMP =3D "${HOST_PREFIX}objdump"
> > >> +export STRINGS =3D "${HOST_PREFIX}strings"
> > >> +export GPERF =3D "${HOST_PREFIX}gperf"
> > >> export NM =3D "${HOST_PREFIX}nm"
> > >> PYTHON =3D "${@sys.executable}"
> > >=20
> > > At this point in the release cycle I'm not adding new global exports =
to
> > > ever piece of software in the system. I appreciate in theory nothing =
bad
> > > should happen however the reality is sometimes different :/. I'm taki=
ng
> > > a *lot* of risks in including as many changes as I have, I don't want=
 to
> > > add this one too.
> > >=20
> > > I'm also not sure its a good idea in general to build up more exports=
 in
> > > bitbake.conf if we haven't yet needed them.
> > >=20
> >=20
> > We can not be certain we did not need them autoconfed packages will def=
ault to one on host
> > so it might be that many recipes have been wrongly using non-cross vers=
ion of tools and succeeding
> > the build. Problem is there in though.=20
> >=20
> > I think on master this patch should be considered as such
> >=20
> > > I'll take a version of this which does this in the systemd recipe.
> >=20
> > For dylan this seems ok
>=20
> I have patch moving exports to bitbake.conf in my local tree, I'll send
> it for master after dylan is released.

It was good call to keep it local for systemd in dylan

x86_64-oe-linux-gperf: No such file or directory
in webkit-efl and kconfig-frontends
| sh: 1: x86_64-oe-linux-gperf: not found
| calling gperf failed: 32512 at /home/jenkins/oe/shr-core-branches/shr-cor=
e/tmp-eglibc/work/x86_64-oe-linux/webkit-efl/1.9.3+svnr120144-r2/src/Source=
/WebCore/make-hash-tools.pl line 36.

x86_64-oe-linux-strings: No such file or directory
in tcp-wrappers, interestingly in gcc call:

| x86_64-oe-linux-gcc    -m64
--sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots=
/qemux86-64
-DFACILITY=3DLOG_DAEMON -DHOSTS_ACCESS  -DNETGROUP -DUSE_GETDOMAIN
-DDAEMON_UMASK=3D022 -DREAL_DAEMON_DIR=3D\"/usr/sbin\" -DPROCESS_OPTIONS
-DKILL_IP_OPTIONS -DSEVERITY=3DLOG_INFO -DRFC931_TIMEOUT=3D10
-DHOSTS_DENY=3D\"/etc/hosts.deny\" -DHOSTS_ALLOW=3D\"/etc/hosts.allow\"
x86_64-oe-linux-strings  -O2 -pipe -g -feliminate-unused-debug-types
-DSYS_ERRLIST_DEFINED -DHAVE_STRERROR -DHAVE_WEAKSYMS -D_REENTRANT
-DINET6=3D1 -Dss_family=3D__ss_family -Dss_len=3D__ss_len    -o tcpd.o -c
tcpd.c
| x86_64-oe-linux-gcc: error: x86_64-oe-linux-strings: No such file or
directory

> > >> diff --git a/meta/recipes-core/systemd/systemd/0001-configure-use-AC=
_CHECK_TOOL-for-objcopy-strings-and-.patch b/meta/recipes-core/systemd/syst=
emd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
> > >> new file mode 100644
> > >> index 0000000..d847bbc
> > >> --- /dev/null
> > >> +++ b/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_=
TOOL-for-objcopy-strings-and-.patch
> > >> @@ -0,0 +1,41 @@
> > >> +From d6f92bcbbae9a577adb9588c7b2783a5d0bf343d Mon Sep 17 00:00:00 2=
001
> > >> +From: Martin Jansa <Martin.Jansa@gmail.com>
> > >> +Date: Tue, 16 Apr 2013 14:20:41 +0200
> > >> +Subject: [PATCH] configure: use AC_CHECK_TOOL for objcopy, strings =
and gperf
> > >> +
> > >> +* using AC_PATH_TOOL does not allow to override it from shell envir=
onment
> > >> +  which is useful when cross-compiling
> > >> +* with external toolchain I have different HOST_PREFIX and HOST_SYS
> > >> +  AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objcopy
> > >> +  which is available only as ${TARGET_PREFIX}objcopy then it tries
> > >> +  objcopy without prefix which is found on host, but that objcopy
> > >> +  does not work for !host (e.g. arm when building on x86) libs
> > >> +
> > >> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > >> +Upstream-Status: Submitted
> > >> +http://lists.freedesktop.org/archives/systemd-devel/2013-April/0104=
68.html
> > >> +
> > >> +---
> > >> + configure.ac | 6 +++---
> > >> + 1 file changed, 3 insertions(+), 3 deletions(-)
> > >> +
> > >> +diff --git a/configure.ac b/configure.ac
> > >> +index 33b0ca9..519f1a9 100644
> > >> +--- a/configure.ac
> > >> ++++ b/configure.ac
> > >> +@@ -86,9 +86,9 @@ GOBJECT_INTROSPECTION_CHECK([1.31.1])
> > >> +    AM_CONDITIONAL([HAVE_INTROSPECTION], [false])
> > >> +    enable_introspection=3Dno])
> > >> +=20
> > >> +-AC_PATH_TOOL(OBJCOPY, objcopy)
> > >> +-AC_PATH_TOOL(STRINGS, strings)
> > >> +-AC_PATH_TOOL(GPERF, gperf)
> > >> ++AC_CHECK_TOOL(OBJCOPY, objcopy)
> > >> ++AC_CHECK_TOOL(STRINGS, strings)
> > >> ++AC_CHECK_TOOL(GPERF, gperf)
> > >> + if test -z "$GPERF" ; then
> > >> +         AC_MSG_ERROR([*** gperf not found])
> > >> + fi
> > >> +--=20
> > >> +1.8.1.5
> > >> +
> > >> diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes=
-core/systemd/systemd_199.bb
> > >> index d22df12..e8ad8f5 100644
> > >> --- a/meta/recipes-core/systemd/systemd_199.bb
> > >> +++ b/meta/recipes-core/systemd/systemd_199.bb
> > >> @@ -27,6 +27,7 @@ SRC_URI =3D "http://www.freedesktop.org/software/s=
ystemd/systemd-${PV}.tar.xz \
> > >>            file://0002-readahead-chunk-on-spinning-media.patch \
> > >>            file://0003-readahead-cleanups.patch \
> > >>            file://0013-systemd-sysctl-Handle-missing-etc-sysctl.conf=
-proper.patch \
> > >> +           file://0001-configure-use-AC_CHECK_TOOL-for-objcopy-stri=
ngs-and-.patch \
> > >>            file://199-firmware.patch \
> > >>            file://init \
> > >>           "
> > >=20
> > >=20
> > >=20
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFwQtsACgkQN1Ujt2V2gBw2pwCgg7uZgy8xMNTOsvpbTt085CCR
lsUAn1hI2tQLRcH6lhajKg5uy5G4aXMN
=4M+x
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
