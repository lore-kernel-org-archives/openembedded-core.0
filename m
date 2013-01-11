Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TtbHK-0008Eh-Gt; Fri, 11 Jan 2013 10:51:59 +0100
Received: by mail-da0-f45.google.com with SMTP id w4so694323dam.4
	for <multiple recipients>; Fri, 11 Jan 2013 01:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ikqwyS5MUKk4AsY4qoZlYjYsEGYt/3CZjMhIK7WSzJQ=;
	b=ciCgD98j+Ca+x1KGWe2Gr0u7qbNqQpF1R+CItbVoaL7G8aH417nDE9AR7Ao2mjuxDz
	nHOvW76uhVGwgorr0NQKo0QjS18z0hpRWQ/EGD9oJ1P5W2Y8OrfYJIciCtGwJkgHgRZz
	+qHQaK4RgiwmUJfH8q8XPuKZ+y6uhDwjQgVIQVT8mV69lO8RzCiIxPTtPrtuBM10cAtd
	subQ2Bo2DuE6OQTpgW2zFchA9X3RNq+tu4ViRKMI1IScQjosLnbYt6Ldhz9YJt20Faeh
	/PAGPhxWTpHUX7wxaB1QaOZtzV/xzrX5NZmkanlgGaL1luVjvWaslEIce2g3JOXq5ClD
	bSrg==
X-Received: by 10.68.135.67 with SMTP id pq3mr227819280pbb.127.1357897000909; 
	Fri, 11 Jan 2013 01:36:40 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ni8sm2488256pbc.70.2013.01.11.01.36.38
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 11 Jan 2013 01:36:39 -0800 (PST)
Date: Fri, 11 Jan 2013 10:36:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130111093645.GL3722@jama.palm1.palmone.com>
References: <20130110235229.77FB2103D8@opal>
MIME-Version: 1.0
In-Reply-To: <20130110235229.77FB2103D8@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Otavio Salvador : libnl: Update to 3.2.18
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
X-List-Received-Date: Fri, 11 Jan 2013 09:52:02 -0000
X-Groupsio-MsgNum: 33702
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mN69Y7OHXGepfYh"
Content-Disposition: inline

--5mN69Y7OHXGepfYh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 11:52:29PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 5de138939c42b0a6d80732130b2617fd60a7d545
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D5de138939c42b0a6d80732130b2617fd60a7d545
>=20
> Author: Otavio Salvador <otavio@ossystems.com.br>
> Date:   Tue Jan  8 12:19:39 2013 -0200
>=20
> libnl: Update to 3.2.18
>=20
> This release fixes the build failures found when building against old
> Linux kernel headers and also includes the fix for to use 'flex'
> instead of 'lex'.
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Warning for those who are still using OEBasic or not using PR service.

=2Eso version changed, libnl-route-3-200, libnl-3-200, libnl-nf-3-200 are
gone if you're using debian.bbclass. All recipes (r)depending on one of
those need to be rebuild and reinstalled on target (ideally PR bumped)
to rebuild against libnl-route-3-201, libnl-3-201, libnl-nf-3-201.

Cheers,

>=20
> ---
>=20
>  .../libnl/libnl/fix-build-using-flex.patch         |   55 --------------=
------
>  .../libnl/libnl/fix-pktloc_syntax_h-race.patch     |    2 +-
>  .../libnl/{libnl_3.2.16.bb =3D> libnl_3.2.18.bb}     |    7 +--
>  3 files changed, 4 insertions(+), 60 deletions(-)
>=20
> diff --git a/meta/recipes-support/libnl/libnl/fix-build-using-flex.patch =
b/meta/recipes-support/libnl/libnl/fix-build-using-flex.patch
> deleted file mode 100644
> index 89a36ba..0000000
> --- a/meta/recipes-support/libnl/libnl/fix-build-using-flex.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From 89ab8d4f1229a1d2605193686cc00e6b2c9786ff Mon Sep 17 00:00:00 2001
> -From: Otavio Salvador <otavio@ossystems.com.br>
> -Date: Mon, 7 Jan 2013 15:44:38 -0200
> -Subject: [PATCH] Fix build using flex
> -
> -Upstream-Status: Backport [3.2.17]
> ----
> - lib/Makefile.am     |    4 ++--
> - src/lib/Makefile.am |    4 ++--
> - 2 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/lib/Makefile.am b/lib/Makefile.am
> -index 98c7b90..89cc5d2 100644
> ---- a/lib/Makefile.am
> -+++ b/lib/Makefile.am
> -@@ -43,14 +43,14 @@ CLEANFILES =3D \
> - route/pktloc.lo: route/pktloc_syntax.h route/pktloc_grammar.h
> - route/pktloc_grammar.h: route/pktloc_grammar.c
> - route/pktloc_grammar.c: route/pktloc_grammar.l
> --	$(AM_V_GEN) $(LEX) --header-file=3Droute/pktloc_grammar.h $(LFLAGS) -o=
 $@ $^
> -+	$(AM_V_GEN) $(FLEX) --header-file=3Droute/pktloc_grammar.h $(LFLAGS) -=
o $@ $^
> -=20
> - route/pktloc_syntax.h: route/pktloc_syntax.c
> - route/pktloc_syntax.c: route/pktloc_syntax.y
> - 	$(AM_V_GEN) $(YACC) -d $(YFLAGS) -o $@ $^
> -=20
> - route/cls/ematch_grammar.c: route/cls/ematch_grammar.l
> --	$(AM_V_GEN) $(LEX) --header-file=3Droute/cls/ematch_grammar.h $(LFLAGS=
) -o $@ $^
> -+	$(AM_V_GEN) $(FLEX) --header-file=3Droute/cls/ematch_grammar.h $(LFLAG=
S) -o $@ $^
> -=20
> - route/cls/ematch_syntax.c: route/cls/ematch_syntax.y
> - 	$(AM_V_GEN) $(YACC) -d $(YFLAGS) -o $@ $^
> -diff --git a/src/lib/Makefile.am b/src/lib/Makefile.am
> -index 6688e7c..507635d 100644
> ---- a/src/lib/Makefile.am
> -+++ b/src/lib/Makefile.am
> -@@ -11,13 +11,13 @@ AM_LDFLAGS =3D \
> - #cls_ematch_cmp_la_LDFLAGS =3D -module -version-info 2:0:0
> -=20
> - #cls/ematch_grammar.c: cls/ematch_grammar.l
> --#	$(LEX) --header-file=3Dcls/ematch_grammar.h $(LFLAGS) -o $@ $^
> -+#	$(FLEX) --header-file=3Dcls/ematch_grammar.h $(LFLAGS) -o $@ $^
> -=20
> - #cls/ematch_syntax.c: cls/ematch_syntax.y
> - #	$(YACC) -d $(YFLAGS) -o $@ $^
> -=20
> - #cls/pktloc_grammar.c: cls/pktloc_grammar.l
> --#	$(LEX) --header-file=3Dcls/pktloc_grammar.h $(LFLAGS) -o $@ $^
> -+#	$(FLEX) --header-file=3Dcls/pktloc_grammar.h $(LFLAGS) -o $@ $^
> -=20
> - #cls/pktloc_syntax.c: cls/pktloc_syntax.y
> - #	$(YACC) -d $(YFLAGS) -o $@ $^
> ---=20
> -1.7.10.4
> -
> diff --git a/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.pa=
tch b/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
> index 332ec01..b93d97b 100644
> --- a/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
> +++ b/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
> @@ -17,7 +17,7 @@ Index: libnl-3.2.14/lib/Makefile.am
>  +route/pktloc.lo: route/pktloc_syntax.h route/pktloc_grammar.h
>  +route/pktloc_grammar.h: route/pktloc_grammar.c
>   route/pktloc_grammar.c: route/pktloc_grammar.l
> - 	$(AM_V_GEN) $(LEX) --header-file=3Droute/pktloc_grammar.h $(LFLAGS) -o=
 $@ $^
> + 	$(AM_V_GEN) $(FLEX) --header-file=3Droute/pktloc_grammar.h $(LFLAGS) -=
o $@ $^
>  =20
>  +route/pktloc_syntax.h: route/pktloc_syntax.c
>   route/pktloc_syntax.c: route/pktloc_syntax.y
> diff --git a/meta/recipes-support/libnl/libnl_3.2.16.bb b/meta/recipes-su=
pport/libnl/libnl_3.2.18.bb
> similarity index 87%
> rename from meta/recipes-support/libnl/libnl_3.2.16.bb
> rename to meta/recipes-support/libnl/libnl_3.2.18.bb
> index db9ae9d..0da7f20 100644
> --- a/meta/recipes-support/libnl/libnl_3.2.16.bb
> +++ b/meta/recipes-support/libnl/libnl_3.2.18.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.infradead.org/~tgr/libnl/"
>  SECTION =3D "libs/network"
> =20
>  PE =3D "1"
> -PR =3D "r1"
> +PR =3D "r0"
> =20
>  LICENSE =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
> @@ -12,11 +12,10 @@ DEPENDS =3D "flex-native bison-native"
> =20
>  SRC_URI =3D "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
>             file://fix-pktloc_syntax_h-race.patch \
> -           file://fix-build-using-flex.patch \
>             file://fix-pc-file.patch "
> =20
> -SRC_URI[md5sum] =3D "f06e6de102abb2cef71ed671957ee099"
> -SRC_URI[sha256sum] =3D "c43a42336c6a3cf559f390e202f8f029d165bd767da7cf7a=
32a815c570b31826"
> +SRC_URI[md5sum] =3D "378eafcca1f51d1c7498d78946cd891a"
> +SRC_URI[sha256sum] =3D "6563e4e72a35f9f96380086f6bd17307552977af98e98bd3=
dd0fdde8013d53a9"
> =20
>  inherit autotools pkgconfig
> =20
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5mN69Y7OHXGepfYh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDv3S0ACgkQN1Ujt2V2gByZCACfbse3oADXpnamW2mzYFD+hRCK
LZIAn05CkDaTxCKMQatDhbSAszFZ9H9w
=7msg
-----END PGP SIGNATURE-----

--5mN69Y7OHXGepfYh--
