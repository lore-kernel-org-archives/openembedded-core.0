Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id BCF2D6AD0D;
	Thu,  4 Jun 2015 09:54:00 +0000 (UTC)
Received: by wifw1 with SMTP id w1so52243653wif.0;
	Thu, 04 Jun 2015 02:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=z7CW8/SnoF6/nLTS0UmDf9VhrJ/kq4Nt2rPuMgE1kQs=;
	b=UeUcMlpgC7W+jWNk8GxuAcWuC6IfQ2V94thEQSLSa40DDQVUX5JOzqlBDRZo6sMPxo
	woMzQQy5kbON5Tr5FrA9cOZq5Jpg33P/ZF3TkCD46BAVN3PYE3BVZMNuc3UP8u25TQOm
	ta8g/2BA/dnYnSk4x487UgeF4MFDtKQdMGsKV9lb8AzohWlLuJLxMZV0IswiLlbqGa1h
	O+7A/bDdWfa8ba1DFn76i/OKFGq8tIrP9fPvT1B3G/Ygp9/v4663iugfzx6m4AWBFu3o
	fqVm3prhb6edZTXhqw9l+G49mznNNOUOJRoFTt90Iup19rzawgMJBLKOqDAswuBujbYf
	JUIw==
X-Received: by 10.180.96.167 with SMTP id dt7mr5935720wib.80.1433411641812;
	Thu, 04 Jun 2015 02:54:01 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id yz3sm4962409wjc.19.2015.06.04.02.54.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 02:54:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 Jun 2015 11:54:22 +0200
To: openembedded-core@lists.openembedded.org,
	Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20150604095422.GG2376@jama>
References: <20150421062058.65B1E5039B@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150421062058.65B1E5039B@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : bison: 2.7.1 -> 3.0.4
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
X-List-Received-Date: Thu, 04 Jun 2015 09:54:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2015 at 06:20:58AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: fbb26d8db8e71fd979edd2bafa7e0bab7632950c
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dfbb26d8db8e71fd979edd2bafa7e0bab7632950c
>=20
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Tue Apr 14 02:07:12 2015 -0700
>=20
> bison: 2.7.1 -> 3.0.4
>=20
> * Based on Chong Lu's previous upgrade to 3.0.2
> * Remove unneeded patches:
>   dont-depend-on-help2man.patch and
>   fix_cross_manpage_building.patch

It seems to cause occasional hang in configure script when calling
javac, this is example from one world build:

|-python /home/jenkins/oe/world/shr-core/bitbake/bin/bitbake-worker decafbad
  `-python /home/jenkins/oe/world/shr-core/bitbake/bin/bitbake-worker decaf=
bad
      `-run.do_configur /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586=
-oe-linux/bison/3.0.4-r0/temp/run.do_configure.14060
          `-bash /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-lin=
ux/bison/3.0.4-r0/bison-3.0.4/configure --build=3Dx86_64-linux --host=3Di58=
6-oe-linux --target=3Di586-oe-linux --prefix=3D/usr --exec_prefix=3D/usr --=
bindir=3D/usr/bin --sbindir=3D/usr/sbin --libexecdir=3D/usr/lib/bison --dat=
adir=3D/usr/share --sysconfdir=3D/etc --sharedstatedir=3D/com --localstated=
ir=3D/var --libdir=3D/usr/lib --includedir=3D/usr/include --oldincludedir=
=3D/usr/include --infodir=3D/usr/share/info --mandir=3D/usr/share/man --dis=
able-silent-rules --disable-dependency-tracking --with-libtool-sysroot=3D/h=
ome/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86 M4=3Dm4 --enable-n=
ls
              `-javac -version
                  `-9*[{javac}]
 `-3*[{python}]

jenkins@aruba:~$ javac -version
javac 1.6.0_24

Killing that javac process unblocked it.

>=20
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  .../bison/bison/dont-depend-on-help2man.patch      | 32 ----------------=
------
>  .../bison/bison/fix_cross_manpage_building.patch   | 19 -------------
>  .../bison/{bison_2.7.1.bb =3D> bison_3.0.4.bb}       | 22 +++++++--------
>  3 files changed, 10 insertions(+), 63 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.pa=
tch b/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch
> deleted file mode 100644
> index 21b44bf..0000000
> --- a/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Upstream-Status: Inappropriate
> -
> -Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> -diff -Nurd bison-2.7/doc/Makefile.am bison-2.7/doc/Makefile.am
> ---- bison-2.7/doc/Makefile.am	2012-12-09 17:51:03.000000000 +0200
> -+++ bison-2.7/doc/Makefile.am	2013-01-02 06:49:50.804894071 +0200
> -@@ -52,15 +52,11 @@
> - ## Man Pages.  ##
> - ## ----------- ##
> -
> --dist_man_MANS =3D $(srcdir)/bison.1
> --
> --EXTRA_DIST +=3D $(dist_man_MANS:.1=3D.x) common.x
> --MAINTAINERCLEANFILES +=3D $(dist_man_MANS)
> -+EXTRA_DIST +=3D bison.x common.x
> -
> - # Depend on configure to get version number changes.
> - common_dep =3D $(top_srcdir)/configure $(srcdir)/common.x
> - srcsrcdir =3D $(top_srcdir)/bin
> --$(srcdir)/bison.1:      $(common_dep) $(top_srcdir)/src/getargs.c
> -
> - # Differences to ignore when comparing the man page (the date).
> - remove_time_stamp =3D \
> -@@ -94,8 +90,6 @@
> -	fi
> -	$(AM_V_at)rm -f $@*.t
> -
> --nodist_man_MANS =3D yacc.1
> --
> - ## ------------------------------ ##
> - ## Graphviz examples generation.  ##
> - ## ------------------------------ ##
> diff --git a/meta/recipes-devtools/bison/bison/fix_cross_manpage_building=
=2Epatch b/meta/recipes-devtools/bison/bison/fix_cross_manpage_building.pat=
ch
> deleted file mode 100644
> index 8b68379..0000000
> --- a/meta/recipes-devtools/bison/bison/fix_cross_manpage_building.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -help2man is looking at the generated binary for help output. This does n=
ot work for cross compilations. So taking out the local PREPATH (../src) di=
rectory from path so that help2 man can find the native version of the biso=
n in the native sysroot directory.
> -
> -Date: 2010/06/28
> -Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> -
> -diff --git a/doc/Makefile.am b/doc/Makefile.am
> -index c7f2755..af9453a 100644
> ---- a/doc/Makefile.am
> -+++ b/doc/Makefile.am
> -@@ -80,7 +80,6 @@ PREPATH =3D $(top_builddir)/src
> - 	  echo cd $$dir '&&' $(MAKE) $(AM_MAKEFLAGS) $$program &&	\
> - 	  (cd $$dir && $(MAKE) $(AM_MAKEFLAGS) $$program) || exit;	\
> - 	done
> --	$(AM_V_at)PATH=3D"$(PREPATH)$(PATH_SEPARATOR)$$PATH";		     \
> - 	export PATH;							     \
> - 	$(HELP2MAN)							     \
> - 	    --include=3D$*.x						     \
> diff --git a/meta/recipes-devtools/bison/bison_2.7.1.bb b/meta/recipes-de=
vtools/bison/bison_3.0.4.bb
> similarity index 66%
> rename from meta/recipes-devtools/bison/bison_2.7.1.bb
> rename to meta/recipes-devtools/bison/bison_3.0.4.bb
> index 025fc97..5061410 100644
> --- a/meta/recipes-devtools/bison/bison_2.7.1.bb
> +++ b/meta/recipes-devtools/bison/bison_3.0.4.bb
> @@ -9,29 +9,27 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673=
463ab874e80d47fae504"
>  SECTION =3D "devel"
>  DEPENDS =3D "bison-native flex-native"
> =20
> -BASE_SRC_URI =3D "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
> -	        file://m4.patch \
> -                file://dont-depend-on-help2man.patch \
> -	       "
> +SRC_URI =3D "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
> +           file://m4.patch \
> +           file://0001-Unset-need_charset_alias-when-building-for-musl.p=
atch \
> +"
> =20
>  # No point in hardcoding path to m4, just use PATH
>  EXTRA_OECONF +=3D "M4=3Dm4"
> =20
> -SRC_URI =3D "${BASE_SRC_URI} \
> -           file://fix_cross_manpage_building.patch \
> -	   file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
> -          "
> -
> -SRC_URI[md5sum] =3D "7be02eb973eccf388f1ae750fc09eed0"
> -SRC_URI[sha256sum] =3D "b409adcbf245baadb68d2f66accf6fdca5e282cafec1b865=
f4b5e963ba8ea7fb"
> +SRC_URI[md5sum] =3D "c342201de104cc9ce0a21e0ad10d4021"
> +SRC_URI[sha256sum] =3D "a72428c7917bdf9fa93cb8181c971b6e22834125848cf1d0=
3ce10b1bb0716fe1"
> =20
>  LDFLAGS_prepend_libc-uclibc =3D " -lrt "
>  DEPENDS_class-native =3D "gettext-minimal-native"
> -SRC_URI_class-native =3D "${BASE_SRC_URI}"
> =20
>  inherit autotools gettext texinfo
>  acpaths =3D "-I ${S}/m4"
> =20
> +do_compile_prepend() {
> +	for i in mfcalc calc++ rpcalc; do mkdir -p ${B}/examples/$i; done
> +}
> +
>  do_install_append_class-native() {
>  	create_wrapper ${D}/${bindir}/bison \
>  		BISON_PKGDATADIR=3D${STAGING_DATADIR_NATIVE}/bison
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

