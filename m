Received: from mail-pd0-f172.google.com ([209.85.192.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UNgCw-00014A-FC
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 11:11:48 +0200
Received: by mail-pd0-f172.google.com with SMTP id 5so1325349pdd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 01:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=LKUzibkwpOazf6XSlMmZo9Xjx12lONk4/XZRocef1WY=;
	b=Hy76/fxm9OO8VlXaaZ50JrfR8LjGDCaYoh51MIupAbIZdRGQlNQFE2O7tCGpi1J4gN
	v7A34K6yl+oEaly47LwgtGlC2YAKcA6S+4v7f+x9mEUVCKQYjUeuaOIXSaaU3PCRBIGa
	dRYyweufKQk0JYoFKrnsBvuhbOVF4FPzEMnWSpubslx3aGCC6z/YXmc+c/PmMT/+UCFb
	QbURv43IUWwthGiTNI31D+PUroRyZWAjSEr5lbg9E87aGh9eKipXG/we5041io8TgURa
	BFcAqPSaRhODcg95QqYuZAR98YE/SM4g6fOMvyRdbaqTdT7fO3ZfY7n+AuTcNfHeLLB2
	9DkQ==
X-Received: by 10.66.157.195 with SMTP id wo3mr8258650pab.79.1365065673131;
	Thu, 04 Apr 2013 01:54:33 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id jz5sm8605734pbc.26.2013.04.04.01.54.31
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 01:54:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1365064501-15679-2-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 4 Apr 2013 01:54:30 -0700
Message-Id: <78DCDBB2-9F97-42B0-8BAC-BA85C3959D97@gmail.com>
References: <1365064501-15679-1-git-send-email-Martin.Jansa@gmail.com>
	<1365064501-15679-2-git-send-email-Martin.Jansa@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] gcc: add patch to disable texinfo when texinfo is 5.0 or newer
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
X-List-Received-Date: Thu, 04 Apr 2013 09:11:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 4, 2013, at 1:35 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> * this is needed only for 4.7 series, newer works fine with texinfo-5*
>=20
> [YOCTO #3947]
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


Looks ok to me.=20

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> meta/recipes-devtools/gcc/gcc-4.7.inc              |   1 +
> .../gcc/gcc-4.7/disable-texinfo-5.patch            | 107 =
+++++++++++++++++++++
> 2 files changed, 108 insertions(+)
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.7/disable-texinfo-5.patch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc =
b/meta/recipes-devtools/gcc/gcc-4.7.inc
> index 49f4010..a05cac9 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> @@ -76,6 +76,7 @@ SRC_URI =3D =
"${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
> 	   =
file://0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch \
> 	   file://use-ml-conf-files-from-B.patch \
> 	   file://wcast-qual-PR55383.patch \
> +	   file://disable-texinfo-5.patch \
> 	  "
> SRC_URI[md5sum] =3D "cc308a0891e778cfda7a151ab8a6e762"
> SRC_URI[sha256sum] =3D =
"8a9283d7010fb9fe5ece3ca507e0af5c19412626384f8a5e9434251ae100b084"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7/disable-texinfo-5.patch =
b/meta/recipes-devtools/gcc/gcc-4.7/disable-texinfo-5.patch
> new file mode 100644
> index 0000000..d5c9165
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.7/disable-texinfo-5.patch
> @@ -0,0 +1,107 @@
> +Upstream-Status: Pending
> +
> +gcc-4.8 is compatible with texinfo-5, so this is only temporary fix=20=

> +(we don't need info files on target)
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +
> +diff -uNr gcc-4.7.2.orig/configure.ac gcc-4.7.2/configure.ac
> +--- gcc-4.7.2.orig/configure.ac	2013-04-04 09:10:24.600848496 =
+0200
> ++++ gcc-4.7.2/configure.ac	2013-04-04 09:51:51.808031042 +0200
> +@@ -3031,7 +3031,7 @@
> +     # For an installed makeinfo, we require it to be from texinfo =
4.7 or
> +     # higher, else we use the "missing" dummy.
> +     if ${MAKEINFO} --version \
> +-       | egrep =
'texinfo[^0-9]*(4\.([7-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null =
2>&1; then
> ++       | egrep 'texinfo[^0-9]*(4\.([7-9]|[1-9][0-9]))' >/dev/null =
2>&1; then
> +       :
> +     else
> +       MAKEINFO=3D"$MISSING makeinfo"
> +diff -uNr gcc-4.7.2.orig/gcc/configure.ac gcc-4.7.2/gcc/configure.ac
> +--- gcc-4.7.2.orig/gcc/configure.ac	2013-04-04 09:10:30.523848931 =
+0200
> ++++ gcc-4.7.2/gcc/configure.ac	2013-04-04 09:52:16.111032826 =
+0200
> +@@ -871,7 +871,7 @@
> + # that we can use it.
> + ACX_CHECK_PROG_VER(MAKEINFO, makeinfo, --version,
> +   [GNU texinfo.* \([0-9][0-9.]*\)],
> +-  [4.[7-9]*|4.[1-9][0-9]*|[5-9]*|[1-9][0-9]*])
> ++  [4.[7-9]*|4.[1-9][0-9]*])
> + if test $gcc_cv_prog_makeinfo_modern =3D no; then
> +   AC_MSG_WARN([
> + *** Makeinfo is missing or too old.
> +diff -uNr gcc-4.7.2.orig/libgomp/configure.ac =
gcc-4.7.2/libgomp/configure.ac
> +--- gcc-4.7.2.orig/libgomp/configure.ac	2010-12-06 =
01:50:04.000000000 +0100
> ++++ gcc-4.7.2/libgomp/configure.ac	2013-04-04 09:51:29.571029410 =
+0200
> +@@ -129,7 +129,7 @@
> + # that we can use it.
> + ACX_CHECK_PROG_VER([MAKEINFO], [makeinfo], [--version],
> +                    [GNU texinfo.* \([0-9][0-9.]*\)],
> +-                   [4.[4-9]*|4.[1-9][0-9]*|[5-9]*|[1-9][0-9]*])
> ++                   [4.[4-9]*|4.[1-9][0-9]*])
> + AM_CONDITIONAL(BUILD_INFO, test $gcc_cv_prog_makeinfo_modern =3D =
"yes")
> +=20
> +=20
> +diff -uNr gcc-4.7.2.orig/libiberty/configure.ac =
gcc-4.7.2/libiberty/configure.ac
> +--- gcc-4.7.2.orig/libiberty/configure.ac	2011-08-22 =
18:54:02.000000000 +0200
> ++++ gcc-4.7.2/libiberty/configure.ac	2013-04-04 09:51:20.685028758 =
+0200
> +@@ -84,6 +84,12 @@
> + 	    AC_MSG_WARN([
> + *** Makeinfo is too old. Info documentation will not be built.])
> + 	  ;;
> ++	  x*\ [[5-9]].* )
> ++	    MAKEINFO=3D"@echo $MAKEINFO is too new, 5.0 or newer does =
not work; true"
> ++	    BUILD_INFO=3D
> ++	    AC_MSG_WARN([
> ++*** Makeinfo is too new. Info documentation will not be built.])
> ++	  ;;
> + 	esac
> + 	;;
> +     esac
> +diff -uNr gcc-4.7.2.orig/libitm/configure.ac =
gcc-4.7.2/libitm/configure.ac
> +--- gcc-4.7.2.orig/libitm/configure.ac	2012-02-13 =
22:46:38.000000000 +0100
> ++++ gcc-4.7.2/libitm/configure.ac	2013-04-04 09:51:59.676031620 =
+0200
> +@@ -140,7 +140,7 @@
> + # that we can use it.
> + ACX_CHECK_PROG_VER([MAKEINFO], [makeinfo], [--version],
> +                    [GNU texinfo.* \([0-9][0-9.]*\)],
> +-                   [4.[4-9]*|4.[1-9][0-9]*|[5-9]*|[1-9][0-9]*])
> ++                   [4.[4-9]*|4.[1-9][0-9]*])
> + AM_CONDITIONAL(BUILD_INFO, test $gcc_cv_prog_makeinfo_modern =3D =
"yes")
> +=20
> +=20
> +diff -uNr gcc-4.7.2.orig/libquadmath/configure.ac =
gcc-4.7.2/libquadmath/configure.ac
> +--- gcc-4.7.2.orig/libquadmath/configure.ac	2012-05-31 =
20:57:56.000000000 +0200
> ++++ gcc-4.7.2/libquadmath/configure.ac	2013-04-04 =
09:49:52.432022281 +0200
> +@@ -48,7 +48,7 @@
> + # that we can use it.
> + ACX_CHECK_PROG_VER([MAKEINFO], [makeinfo], [--version],
> +                    [GNU texinfo.* \([0-9][0-9.]*\)],
> +-                   [4.[4-9]*|4.[1-9][0-9]*|[5-9]*|[1-9][0-9]*])
> ++                   [4.[4-9]*|4.[1-9][0-9]*])
> + AM_CONDITIONAL(BUILD_INFO, test $gcc_cv_prog_makeinfo_modern =3D =
"yes")
> +=20
> + ACX_BUGURL([http://gcc.gnu.org/bugs.html])
> +diff -uNr gcc-4.7.2.orig/libstdc++-v3/configure.ac =
gcc-4.7.2/libstdc++-v3/configure.ac
> +--- gcc-4.7.2.orig/libstdc++-v3/configure.ac	2012-08-06 =
16:34:27.000000000 +0200
> ++++ gcc-4.7.2/libstdc++-v3/configure.ac	2013-04-04 =
09:49:57.483022652 +0200
> +@@ -344,7 +344,7 @@
> + # that we can use it.
> + ACX_CHECK_PROG_VER([MAKEINFO], [makeinfo], [--version],
> + 		   [GNU texinfo.* \([0-9][0-9.]*\)],
> +-		   [4.[4-9]*|4.[1-9][0-9]*|[5-9]*|[1-9][0-9]*])
> ++		   [4.[4-9]*|4.[1-9][0-9]*])
> + AM_CONDITIONAL(BUILD_INFO, test $gcc_cv_prog_makeinfo_modern =3D =
"yes")
> +=20
> + # Check for doxygen
> +diff -uNr gcc-4.7.2.orig/configure gcc-4.7.2/configure
> +--- gcc-4.7.2.orig/configure	2013-04-04 10:23:58.009172414 +0200
> ++++ gcc-4.7.2/configure	2013-04-04 10:26:42.696184501 +0200
> +@@ -7858,7 +7858,7 @@
> +     # For an installed makeinfo, we require it to be from texinfo =
4.7 or
> +     # higher, else we use the "missing" dummy.
> +     if ${MAKEINFO} --version \
> +-       | egrep =
'texinfo[^0-9]*(4\.([7-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null =
2>&1; then
> ++       | egrep 'texinfo[^0-9]*(4\.([7-9]|[1-9][0-9]))' >/dev/null =
2>&1; then
> +       :
> +     else
> +       MAKEINFO=3D"$MISSING makeinfo"
> --=20
> 1.8.1.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



