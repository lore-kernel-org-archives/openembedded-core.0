Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7E6E37DA94
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 16:15:01 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b1so245253wru.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 09:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=P06OpXAmVq3pPRwfppvKrlpnPiyRoS1PtrkeZnX0Cew=;
	b=UoA00lvBDmjv0wqrTB5vS5M9woaHH/MgTAqa96W8rVkvNmuUSELOR6cvLLGJ1zmQGU
	phN6oZVM3b+Rlyikvialdz1yPhBY/nTF4gDO17bJ7qEHNMHvGe50mrsZ8vj3094u4ibn
	LYebW9Q8UoV4emAQWJzFCybzpfGUX/X6XsCmVu5SooxZC3YmmPGcAZQIJd9KBKeH1z0L
	oqxmPJrU9qpaDBsN94lnEkB9q5ALWTiGXaci8fI00VkqTK+oPEg/oFko2YgjKpxMazcI
	8jAbuOJbgVbgagaAN2nyKmTUq7GNNm88KE97P2HfKwZtIyJ5R/qbnbe9xMWgcKUtvmtd
	sWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=P06OpXAmVq3pPRwfppvKrlpnPiyRoS1PtrkeZnX0Cew=;
	b=jlkAG1yf0dJrYjouqJTfkqIoZK5nFizVP07u4jdcorTmTC2Xk6HuJyvASroFnY2W5T
	PAVTtMLgBSk4RodjnumJKihhxlakwOTWGDnR7KlEaRVJLX/dQXf++B6VkVlISWgJ+k3/
	6YVphNpZ9Xq5UX4mKY84PZ3QgANAASWcbD4nzzuP5mpBMzQuKPgVA5/h/AzhXlY/xDot
	UZ5D2HfTBlZ1tOmLW3CH/SG9SEB3ukkVPU23MLHnNtxLBgFvclO4N5ZQZwCxqz3sP2HI
	ISwDIrkDJSD4YXbb1kED1WWlFDH5Uq+a2bw0Yj9TpaJmc/OYmTcEL+t9WywsU98rtEi6
	ZgxA==
X-Gm-Message-State: APjAAAUj06BFYK3NiKBmxAqe5EMJOex0s72ybruW8QJOUuaRob0HsapP
	9VqIlMp6XKes64zT4yuX1tM=
X-Google-Smtp-Source: APXvYqwIMudCKN/6oeUWxpkM1hdaNybVdXjZ0wDfmWYoGkKBfv/lXBHapMg6hHB2hJwtYG8eX4lkuQ==
X-Received: by 2002:adf:ce0b:: with SMTP id p11mr23021376wrn.196.1556208901908;
	Thu, 25 Apr 2019 09:15:01 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	a13sm6281296wmj.39.2019.04.25.09.15.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 25 Apr 2019 09:15:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 25 Apr 2019 18:15:05 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190425161505.GA3445@jama>
References: <20190424150842.7403-1-open.source@oleksandr-kravchuk.com>
	<CAJTo0Lb1j0dLx5bshJWVRNhbU+HNCKP09wrymbYCs-bNfb51+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb1j0dLx5bshJWVRNhbU+HNCKP09wrymbYCs-bNfb51+g@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH] apr: update to 1.7.0
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
X-List-Received-Date: Thu, 25 Apr 2019 16:15:01 -0000
X-Groupsio-MsgNum: 123746
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2019 at 04:21:22PM +0100, Burton, Ross wrote:
> Sadly this breaks subversion target builds:
>=20
> checking for linking Python libraries...
> checking for apr_int64_t Python/C API format string...
> configure: error: failed to recognize APR_INT64_T_FMT on this platform

I had recently the same on my gentoo host, the same fix might apply
here:
https://github.com/gentoo/gentoo/commit/94454a54314e0b471877ee2d1b44d8a6b91=
28cea

>=20
> Ross
>=20
> On Wed, 24 Apr 2019 at 16:09, Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
> >
> > Refreshed patches with devtool.
> >
> > Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> > ---
> >  ...ldcheck.sh-improve-libtool-detection.patch | 10 +++----
> >  ...ir-path-references-from-installed-ap.patch |  9 +++----
> >  ...configure.in-support-cross-compiling.patch | 12 ++++-----
> >  ...04-Fix-packet-discards-HTTP-redirect.patch |  8 +++---
> >  ...-LTFLAGS-to-make-it-work-with-ccache.patch | 10 +++----
> >  ...ze-doesn-t-match-in-glibc-when-cross.patch | 27 +++++++++----------
> >  ...libapr-against-phtread-to-make-gold-.patch | 14 +++++-----
> >  .../apr/{apr_1.6.5.bb =3D> apr_1.7.0.bb}        |  4 +--
> >  8 files changed, 40 insertions(+), 54 deletions(-)
> >  rename meta/recipes-support/apr/{apr_1.6.5.bb =3D> apr_1.7.0.bb} (96%)
> >
> > diff --git a/meta/recipes-support/apr/apr/0001-build-buildcheck.sh-impr=
ove-libtool-detection.patch b/meta/recipes-support/apr/apr/0001-build-build=
check.sh-improve-libtool-detection.patch
> > index 097c195a19..c0426797bd 100644
> > --- a/meta/recipes-support/apr/apr/0001-build-buildcheck.sh-improve-lib=
tool-detection.patch
> > +++ b/meta/recipes-support/apr/apr/0001-build-buildcheck.sh-improve-lib=
tool-detection.patch
> > @@ -1,19 +1,20 @@
> > -From 4efdc06fb17b8a00a9eca923caa176be741d1e04 Mon Sep 17 00:00:00 2001
> > +From 507a36c128c22fad2e7183f3da5bc8424fb42729 Mon Sep 17 00:00:00 2001
> >  From: Hongxu Jia <hongxu.jia@windriver.com>
> >  Date: Thu, 1 Feb 2018 14:56:13 +0800
> > -Subject: [PATCH 1/7] build/buildcheck.sh: improve libtool detection
> > +Subject: [PATCH] build/buildcheck.sh: improve libtool detection
> >
> >  Support customize libtool by variable assigning, it is helpful
> >  for cross compileing (such as libtool=3Daarch64-linux-libtool)
> >
> >  Upstream-Status: Submitted [https://github.com/apache/apr/pull/8]
> >  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +
> >  ---
> >   build/buildcheck.sh | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> >  diff --git a/build/buildcheck.sh b/build/buildcheck.sh
> > -index ab5df44..f191a41 100755
> > +index 76ff8ce..44921b5 100755
> >  --- a/build/buildcheck.sh
> >  +++ b/build/buildcheck.sh
> >  @@ -40,7 +40,9 @@ fi
> > @@ -27,6 +28,3 @@ index ab5df44..f191a41 100755
> >   lt_pversion=3D`$libtool --version 2>/dev/null|sed -e 's/([^)]*)//g;s/=
^[^0-9]*//;s/[- ].*//g;q'`
> >   if test -z "$lt_pversion"; then
> >     echo "buildconf: libtool not found."
> > ---
> > -1.8.3.1
> > -
> > diff --git a/meta/recipes-support/apr/apr/0002-apr-Remove-workdir-path-=
references-from-installed-ap.patch b/meta/recipes-support/apr/apr/0002-apr-=
Remove-workdir-path-references-from-installed-ap.patch
> > index 72e706f966..6b7156a439 100644
> > --- a/meta/recipes-support/apr/apr/0002-apr-Remove-workdir-path-referen=
ces-from-installed-ap.patch
> > +++ b/meta/recipes-support/apr/apr/0002-apr-Remove-workdir-path-referen=
ces-from-installed-ap.patch
> > @@ -1,8 +1,7 @@
> > -From 5925b20da8bbc34d9bf5a5dca123ef38864d43c6 Mon Sep 17 00:00:00 2001
> > +From c06e33851c4b209996682897a02a4219ebf34197 Mon Sep 17 00:00:00 2001
> >  From: Hongxu Jia <hongxu.jia@windriver.com>
> >  Date: Tue, 30 Jan 2018 09:39:06 +0800
> > -Subject: [PATCH 2/7] apr: Remove workdir path references from installe=
d apr
> > - files
> > +Subject: [PATCH] apr: Remove workdir path references from installed ap=
r files
> >
> >  Upstream-Status: Inappropriate [configuration]
> >
> > @@ -14,6 +13,7 @@ packages at target run time, the workdir path caused =
confusion.
> >  Rebase to 1.6.3
> >
> >  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +
> >  ---
> >   apr-config.in | 26 ++------------------------
> >   1 file changed, 2 insertions(+), 24 deletions(-)
> > @@ -69,6 +69,3 @@ index 84b4073..bbbf651 100644
> >       ;;
> >       --shlib-path-var)
> >       echo "$SHLIBPATH_VAR"
> > ---
> > -1.8.3.1
> > -
> > diff --git a/meta/recipes-support/apr/apr/0003-Makefile.in-configure.in=
-support-cross-compiling.patch b/meta/recipes-support/apr/apr/0003-Makefile=
=2Ein-configure.in-support-cross-compiling.patch
> > index 4dd53bd8eb..95f45ca896 100644
> > --- a/meta/recipes-support/apr/apr/0003-Makefile.in-configure.in-suppor=
t-cross-compiling.patch
> > +++ b/meta/recipes-support/apr/apr/0003-Makefile.in-configure.in-suppor=
t-cross-compiling.patch
> > @@ -1,7 +1,7 @@
> > -From d5028c10f156c224475b340cfb1ba025d6797243 Mon Sep 17 00:00:00 2001
> > +From 90b35ba29588ec4359eb8e5f0b8477c46d7baa6b Mon Sep 17 00:00:00 2001
> >  From: Hongxu Jia <hongxu.jia@windriver.com>
> >  Date: Fri, 2 Feb 2018 15:51:42 +0800
> > -Subject: [PATCH 3/7] Makefile.in/configure.in: support cross compiling
> > +Subject: [PATCH] Makefile.in/configure.in: support cross compiling
> >
> >  While cross compiling, the tools/gen_test_char could not
> >  be executed at build time, use AX_PROG_CC_FOR_BUILD to
> > @@ -10,13 +10,14 @@ build native tools/gen_test_char
> >  Upstream-Status: Submitted [https://github.com/apache/apr/pull/8]
> >
> >  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +
> >  ---
> >   Makefile.in  | 10 +++-------
> >   configure.in |  3 +++
> >   2 files changed, 6 insertions(+), 7 deletions(-)
> >
> >  diff --git a/Makefile.in b/Makefile.in
> > -index 5fb760e..8675f90 100644
> > +index 7aeefd0..22d090d 100644
> >  --- a/Makefile.in
> >  +++ b/Makefile.in
> >  @@ -46,7 +46,7 @@ LT_VERSION =3D @LT_VERSION@
> > @@ -45,7 +46,7 @@ index 5fb760e..8675f90 100644
> >   include/private/apr_escape_test_char.h: tools/gen_test_char@EXEEXT@
> >         $(APR_MKDIR) include/private
> >  diff --git a/configure.in b/configure.in
> > -index 719f331..361120f 100644
> > +index 6833b32..c663a96 100644
> >  --- a/configure.in
> >  +++ b/configure.in
> >  @@ -183,6 +183,9 @@ dnl can only be used once within a configure scrip=
t, so this prevents a
> > @@ -58,6 +59,3 @@ index 719f331..361120f 100644
> >   dnl AC_PROG_SED is only avaliable in recent autoconf versions.
> >   dnl Use AC_CHECK_PROG instead if AC_PROG_SED is not present.
> >   ifdef([AC_PROG_SED],
> > ---
> > -1.8.3.1
> > -
> > diff --git a/meta/recipes-support/apr/apr/0004-Fix-packet-discards-HTTP=
-redirect.patch b/meta/recipes-support/apr/apr/0004-Fix-packet-discards-HTT=
P-redirect.patch
> > index 30fc07d4a0..9e34ec2dac 100644
> > --- a/meta/recipes-support/apr/apr/0004-Fix-packet-discards-HTTP-redire=
ct.patch
> > +++ b/meta/recipes-support/apr/apr/0004-Fix-packet-discards-HTTP-redire=
ct.patch
> > @@ -1,7 +1,7 @@
> > -From 7925eb1766a00ccee05c6e80b1d34f163a04b7b1 Mon Sep 17 00:00:00 2001
> > +From 6ffaed6bb44966c0ac6ee7a1c5afc4a47420e714 Mon Sep 17 00:00:00 2001
> >  From: Hongxu Jia <hongxu.jia@windriver.com>
> >  Date: Tue, 30 Jan 2018 09:43:34 +0800
> > -Subject: [PATCH 4/7] Fix packet discards HTTP redirect.
> > +Subject: [PATCH] Fix packet discards HTTP redirect.
> >
> >  Disconnect the connection by poll() timeout.
> >  If timeout=3D0 and apr_wait_for_io_or_timeout()=3DAPR_TIMEUP then
> > @@ -15,6 +15,7 @@ Signed-off-by: Li Wang <li.wang@windriver.com>
> >  Rebase to 1.6.3
> >
> >  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +
> >  ---
> >   network_io/unix/sendrecv.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > @@ -34,6 +35,3 @@ index 4c0e0a6..1bdafba 100644
> >           if (arv !=3D APR_SUCCESS) {
> >               *len =3D 0;
> >               return arv;
> > ---
> > -1.8.3.1
> > -
> > diff --git a/meta/recipes-support/apr/apr/0005-configure.in-fix-LTFLAGS=
-to-make-it-work-with-ccache.patch b/meta/recipes-support/apr/apr/0005-conf=
igure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
> > index 02634e6fde..d8cb18f381 100644
> > --- a/meta/recipes-support/apr/apr/0005-configure.in-fix-LTFLAGS-to-mak=
e-it-work-with-ccache.patch
> > +++ b/meta/recipes-support/apr/apr/0005-configure.in-fix-LTFLAGS-to-mak=
e-it-work-with-ccache.patch
> > @@ -1,7 +1,7 @@
> > -From 2e66cece0c3adff92733332111204ddc1d730a07 Mon Sep 17 00:00:00 2001
> > +From 8f3675678980d7032646ee88eafb061d5b2cd1a0 Mon Sep 17 00:00:00 2001
> >  From: Robert Yang <liezhi.yang@windriver.com>
> >  Date: Thu, 19 Nov 2015 18:25:38 -0800
> > -Subject: [PATCH 5/7] configure.in: fix LTFLAGS to make it work with cc=
ache
> > +Subject: [PATCH] configure.in: fix LTFLAGS to make it work with ccache
> >
> >  When ccache is enabled, libtool requires --tag=3DCC when use ccache,
> >  otherwise when building apr-util with ccache enabled:
> > @@ -14,12 +14,13 @@ otherwise when building apr-util with ccache enable=
d:
> >  Upstream-Status: Pending
> >
> >  Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > +
> >  ---
> >   configure.in | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/configure.in b/configure.in
> > -index 361120f..3b10422 100644
> > +index c663a96..27b8539 100644
> >  --- a/configure.in
> >  +++ b/configure.in
> >  @@ -249,7 +249,7 @@ case $host in
> > @@ -31,6 +32,3 @@ index 361120f..3b10422 100644
> >       fi
> >       if test "$experimental_libtool" =3D "yes"; then
> >           # Use a custom-made libtool replacement
> > ---
> > -1.8.3.1
> > -
> > diff --git a/meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-doesn=
-t-match-in-glibc-when-cross.patch b/meta/recipes-support/apr/apr/0006-apr-=
fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
> > index 5f5e7eac32..366e90bfd3 100644
> > --- a/meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-doesn-t-matc=
h-in-glibc-when-cross.patch
> > +++ b/meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-doesn-t-matc=
h-in-glibc-when-cross.patch
> > @@ -1,7 +1,8 @@
> > -From f4d6e45ed5d2ccffd1af4c2ccdf7099ba0dce137 Mon Sep 17 00:00:00 2001
> > +From b729e7d6d48590c5130e7f7b752acd4972cb9c8b Mon Sep 17 00:00:00 2001
> >  From: Dengke Du <dengke.du@windriver.com>
> >  Date: Wed, 14 Dec 2016 18:13:08 +0800
> > -Subject: [PATCH 6/7] apr: fix off_t size doesn't match in glibc when c=
ross
> > +Subject: [PATCH] apr: fix off_t size doesn't match in glibc when cross
> > +
> >   compiling
> >
> >  In configure.in, it contains the following:
> > @@ -29,15 +30,16 @@ Change the above correspondingly.
> >  Signed-off-by: Dengke Du <dengke.du@windriver.com>
> >
> >  Upstream-Status: Pending
> > +
> >  ---
> >   configure.in | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> >  diff --git a/configure.in b/configure.in
> > -index 3b10422..a227e72 100644
> > +index 27b8539..fb408d1 100644
> >  --- a/configure.in
> >  +++ b/configure.in
> > -@@ -1769,7 +1769,7 @@ else
> > +@@ -1801,7 +1801,7 @@ else
> >       socklen_t_value=3D"int"
> >   fi
> >
> > @@ -46,25 +48,25 @@ index 3b10422..a227e72 100644
> >
> >   if test "$ac_cv_sizeof_pid_t" =3D "$ac_cv_sizeof_short"; then
> >       pid_t_fmt=3D'#define APR_PID_T_FMT "hd"'
> > -@@ -1838,7 +1838,7 @@ APR_CHECK_TYPES_COMPATIBLE(ssize_t, long, [ssize=
_t_fmt=3D"ld"])
> > - APR_CHECK_TYPES_COMPATIBLE(size_t, unsigned int, [size_t_fmt=3D"u"])
> > - APR_CHECK_TYPES_COMPATIBLE(size_t, unsigned long, [size_t_fmt=3D"lu"])
> > +@@ -1873,7 +1873,7 @@ APR_CHECK_TYPES_FMT_COMPATIBLE(size_t, unsigned =
long, lu, [size_t_fmt=3D"lu"], [
> > + APR_CHECK_TYPES_FMT_COMPATIBLE(size_t, unsigned int, u, [size_t_fmt=
=3D"u"])
> > + ])
> >
> >  -APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], ssize_t, 8)
> >  +AC_CHECK_SIZEOF(ssize_t)
> >
> > + dnl the else cases below should no longer occur;
> >   AC_MSG_CHECKING([which format to use for apr_ssize_t])
> > - if test -n "$ssize_t_fmt"; then
> > -@@ -1855,7 +1855,7 @@ fi
> > +@@ -1891,7 +1891,7 @@ fi
> >
> >   ssize_t_fmt=3D"#define APR_SSIZE_T_FMT \"$ssize_t_fmt\""
> >
> >  -APR_CHECK_SIZEOF_EXTENDED([#include <stddef.h>], size_t, 8)
> >  +AC_CHECK_SIZEOF(size_t)
> >
> > + # else cases below should no longer occur;
> >   AC_MSG_CHECKING([which format to use for apr_size_t])
> > - if test -n "$size_t_fmt"; then
> > -@@ -1872,7 +1872,7 @@ fi
> > +@@ -1909,7 +1909,7 @@ fi
> >
> >   size_t_fmt=3D"#define APR_SIZE_T_FMT \"$size_t_fmt\""
> >
> > @@ -73,6 +75,3 @@ index 3b10422..a227e72 100644
> >
> >   if test "${ac_cv_sizeof_off_t}${apr_cv_use_lfs64}" =3D "4yes"; then
> >       # Enable LFS
> > ---
> > -1.8.3.1
> > -
> > diff --git a/meta/recipes-support/apr/apr/0007-explicitly-link-libapr-a=
gainst-phtread-to-make-gold-.patch b/meta/recipes-support/apr/apr/0007-expl=
icitly-link-libapr-against-phtread-to-make-gold-.patch
> > index 8760b0140c..b9c2e701e6 100644
> > --- a/meta/recipes-support/apr/apr/0007-explicitly-link-libapr-against-=
phtread-to-make-gold-.patch
> > +++ b/meta/recipes-support/apr/apr/0007-explicitly-link-libapr-against-=
phtread-to-make-gold-.patch
> > @@ -1,8 +1,8 @@
> > -From c6afc4a4a766478cb6aa6b43a50051881b6318d7 Mon Sep 17 00:00:00 2001
> > +From fa81248e15958a2c0bfc21fa852609f3742c991b Mon Sep 17 00:00:00 2001
> >  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googl=
email.com>
> >  Date: Fri, 3 Mar 2017 22:24:17 +0100
> > -Subject: [PATCH 7/7] explicitly link libapr against phtread to make go=
ld happy
> > - on test
> > +Subject: [PATCH] explicitly link libapr against phtread to make gold h=
appy on
> > + test
> >  MIME-Version: 1.0
> >  Content-Type: text/plain; charset=3DUTF-8
> >  Content-Transfer-Encoding: 8bit
> > @@ -29,15 +29,16 @@ Content-Transfer-Encoding: 8bit
> >  Upstream-Status: Pending
> >
> >  Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> > +
> >  ---
> >   configure.in | 1 +
> >   1 file changed, 1 insertion(+)
> >
> >  diff --git a/configure.in b/configure.in
> > -index a227e72..cbc0f90 100644
> > +index fb408d1..d9f32d6 100644
> >  --- a/configure.in
> >  +++ b/configure.in
> > -@@ -784,6 +784,7 @@ else
> > +@@ -787,6 +787,7 @@ else
> >             APR_PTHREADS_CHECK_RESTORE ] )
> >       fi
> >       if test "$pthreadh" =3D "1"; then
> > @@ -45,6 +46,3 @@ index a227e72..cbc0f90 100644
> >           APR_CHECK_PTHREAD_GETSPECIFIC_TWO_ARGS
> >           APR_CHECK_PTHREAD_ATTR_GETDETACHSTATE_ONE_ARG
> >           APR_CHECK_PTHREAD_RECURSIVE_MUTEX
> > ---
> > -1.8.3.1
> > -
> > diff --git a/meta/recipes-support/apr/apr_1.6.5.bb b/meta/recipes-suppo=
rt/apr/apr_1.7.0.bb
> > similarity index 96%
> > rename from meta/recipes-support/apr/apr_1.6.5.bb
> > rename to meta/recipes-support/apr/apr_1.7.0.bb
> > index 432e4ed744..a58651d077 100644
> > --- a/meta/recipes-support/apr/apr_1.6.5.bb
> > +++ b/meta/recipes-support/apr/apr_1.7.0.bb
> > @@ -20,8 +20,8 @@ SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz=
2 \
> >             file://0007-explicitly-link-libapr-against-phtread-to-make-=
gold-.patch \
> >             "
> >
> > -SRC_URI[md5sum] =3D "ad4add8efdfe87330b88e5e788241775"
> > -SRC_URI[sha256sum] =3D "a67ca9fcf9c4ff59bce7f428a323c8b5e18667fdea7b0e=
bad47d194371b0a105"
> > +SRC_URI[md5sum] =3D "7a14a83d664e87599ea25ff4432e48a7"
> > +SRC_URI[sha256sum] =3D "e2e148f0b2e99b8e5c6caa09f6d4fb4dd3e83f744aa72a=
952f94f5a14436f7ea"
> >
> >  inherit autotools-brokensep lib_package binconfig multilib_header ptest
> >
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXMHdCAAKCRA3VSO3ZXaA
HAs7AKC5/e7jguQ71JFjVFrrtPf1ORe9OACcD74EunTU+1r3wmQLsWlWEJ0T7Ns=
=y8qf
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
