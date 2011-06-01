Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QRqvA-0006Sn-DR
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 21:17:36 +0200
Received: by bwz5 with SMTP id 5so388609bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 12:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=nXyumKE7nq92uoz4tQMlfN1Zm+vAFmIeBICyUD14RH8=;
	b=chqICSXHi8yKCYAY7scIYHBW92v15FqxgYnjTUqGLpK/AZSAvfYkFgkh0/etICmZNj
	rJHFwFMeZmx+vfH6qJOXuODg9sNRzmCpYpjgP5NnyTkUVUeerLQeXn0qmseHNIDFXD19
	jJhzGKgMn4VJcgDIhN8qhmfUThbGbj2Gioh6o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=i6z0dE9lK3LUhRL65foFPoLd1xWjLhDDb7m5stPGTq6LaWf0UhEHhUcra6qJK82DtE
	N4mgJPLf5f+Ao8kfjEfLTjiOAINeRTp877VOm4VdlyfB+t7JJKdopIMdl71qsQfluxgT
	gkLVj9752ARni91wGr1YKtrlcyj9jmvFecSD4=
MIME-Version: 1.0
Received: by 10.204.47.103 with SMTP id m39mr430230bkf.4.1306955665544; Wed,
	01 Jun 2011 12:14:25 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.203 with HTTP; Wed, 1 Jun 2011 12:14:25 -0700 (PDT)
In-Reply-To: <2ba21f918bf0dbbc775471b17cefce8ae3b97143.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
	<2ba21f918bf0dbbc775471b17cefce8ae3b97143.1306909184.git.sgw@linux.intel.com>
Date: Wed, 1 Jun 2011 19:14:25 +0000
X-Google-Sender-Auth: 6Z_kWDfINYQboJsUHfTaN5uFB0Q
Message-ID: <BANLkTinUCJyLBZAMixF35trNhGGpH0ZDbA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 22/32] gnutls: update to 2.12.5
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
X-List-Received-Date: Wed, 01 Jun 2011 19:17:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

After updating it, gnutls started failing to compile due missing
dlopen and like.

Cheers,

On Wed, Jun 1, 2011 at 06:21, Saul Wold <sgw@linux.intel.com> wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> =A0.../gnutls/gnutls-2.10.4/configure-fix.patch =A0 =A0 =A0 | =A0 66 ----=
---------------
> =A0.../gnutls/gnutls-2.12.5/configure-fix.patch =A0 =A0 =A0 | =A0 67 ++++=
++++++++++++++++
> =A0.../gnutls-openssl.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 =A00
> =A0.../gnutls-texinfo-euro.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A00
> =A0meta/recipes-support/gnutls/gnutls.inc =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A06 +-
> =A0meta/recipes-support/gnutls/gnutls_2.10.4.bb =A0 =A0 =A0 | =A0 10 ---
> =A0meta/recipes-support/gnutls/gnutls_2.12.5.bb =A0 =A0 =A0 | =A0 =A09 ++=
+
> =A07 files changed, 79 insertions(+), 79 deletions(-)
> =A0delete mode 100644 meta/recipes-support/gnutls/gnutls-2.10.4/configure=
-fix.patch
> =A0create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.5/configure=
-fix.patch
> =A0rename meta/recipes-support/gnutls/{gnutls-2.10.4 =3D> gnutls-2.12.5}/=
gnutls-openssl.patch (100%)
> =A0rename meta/recipes-support/gnutls/{gnutls-2.10.4 =3D> gnutls-2.12.5}/=
gnutls-texinfo-euro.patch (100%)
> =A0delete mode 100644 meta/recipes-support/gnutls/gnutls_2.10.4.bb
> =A0create mode 100644 meta/recipes-support/gnutls/gnutls_2.12.5.bb
>
> diff --git a/meta/recipes-support/gnutls/gnutls-2.10.4/configure-fix.patc=
h b/meta/recipes-support/gnutls/gnutls-2.10.4/configure-fix.patch
> deleted file mode 100644
> index 2ce3f55..0000000
> --- a/meta/recipes-support/gnutls/gnutls-2.10.4/configure-fix.patch
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -Upstream-Status: Inappropriate [distribution]
> -
> -rebased from original configure_madness.patch
> -
> -libtasn1 provides an .pc file in upstream,
> -and a libgcrypt.pc is added in libgcrypt recipe,
> -so use Requires.private for these two.
> -
> -against 2.8.6
> -
> -07/02/2010 - qhe
> -
> ----
> -diff --git a/lib/configure.ac b/lib/configure.ac
> -index 80d3375..1a486f7 100644
> ---- a/lib/configure.ac
> -+++ b/lib/configure.ac
> -@@ -81,8 +81,8 @@ fi
> -
> - lgl_INIT
> -
> --LIBGNUTLS_LIBS=3D"-L${libdir} -lgnutls $LIBS"
> --LIBGNUTLS_CFLAGS=3D"-I${includedir}"
> -+LIBGNUTLS_LIBS=3D"-lgnutls $LIBS"
> -+LIBGNUTLS_CFLAGS=3D""
> - AC_SUBST(LIBGNUTLS_LIBS)
> - AC_SUBST(LIBGNUTLS_CFLAGS)
> -
> -diff --git a/lib/gnutls.pc.in b/lib/gnutls.pc.in
> -index 3b01c17..de31469 100644
> ---- a/lib/gnutls.pc.in
> -+++ b/lib/gnutls.pc.in
> -@@ -20,6 +20,6 @@ Name: GnuTLS
> - Description: Transport Security Layer implementation for the GNU system
> - URL: http://www.gnu.org/software/gnutls/
> - Version: @VERSION@
> -+Requires.private: libgcrypt, libtasn1
> - Libs: -L${libdir} -lgnutls
> --Libs.private: @LIBGNUTLS_LIBS@ @LTLIBTASN1@
> - Cflags: -I${includedir}
> -diff --git a/libextra/configure.ac b/libextra/configure.ac
> -index c08e73f..3313886 100644
> ---- a/libextra/configure.ac
> -+++ b/libextra/configure.ac
> -@@ -40,8 +40,8 @@ LIBGNUTLS_EXTRA_HOOKS
> -
> - xgl_INIT
> -
> --LIBGNUTLS_EXTRA_LIBS=3D"-L${libdir} -lgnutls-extra $LZO_LIBS $LIBGNUTLS=
_LIBS"
> --LIBGNUTLS_EXTRA_CFLAGS=3D"-I${includedir}"
> -+LIBGNUTLS_EXTRA_LIBS=3D"-lgnutls-extra $LZO_LIBS $LIBGNUTLS_LIBS"
> -+LIBGNUTLS_EXTRA_CFLAGS=3D""
> - AC_SUBST(LIBGNUTLS_EXTRA_LIBS)
> - AC_SUBST(LIBGNUTLS_EXTRA_CFLAGS)
> -
> -diff --git a/libextra/gnutls-extra.pc.in b/libextra/gnutls-extra.pc.in
> -index 9e7b8f6..e228ec9 100644
> ---- a/libextra/gnutls-extra.pc.in
> -+++ b/libextra/gnutls-extra.pc.in
> -@@ -21,5 +21,5 @@ URL: http://www.gnu.org/software/gnutls/
> - Requires: gnutls
> - Version: @VERSION@
> - Libs: -L${libdir} -lgnutls-extra
> --Libs.private: @LIBGNUTLS_EXTRA_LIBS@
> -+Libs.private: -llzo2
> - Cflags: -I${includedir}
> diff --git a/meta/recipes-support/gnutls/gnutls-2.12.5/configure-fix.patc=
h b/meta/recipes-support/gnutls/gnutls-2.12.5/configure-fix.patch
> new file mode 100644
> index 0000000..e6f9785
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls-2.12.5/configure-fix.patch
> @@ -0,0 +1,67 @@
> +Upstream-Status: Inappropriate [distribution]
> +
> +rebased from original configure_madness.patch
> +
> +libtasn1 provides an .pc file in upstream,
> +and a libgcrypt.pc is added in libgcrypt recipe,
> +so use Requires.private for these two.
> +
> +against 2.8.6
> +
> +07/02/2010 - qhe
> +
> +---
> +Index: gnutls-2.12.5/lib/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnutls-2.12.5.orig/lib/configure.ac =A0 =A0 =A0 =A02011-05-11 00:05:=
33.000000000 -0700
> ++++ gnutls-2.12.5/lib/configure.ac =A0 =A0 2011-05-25 19:45:23.721180103=
 -0700
> +@@ -96,8 +96,8 @@
> + dnl for pakchois
> + AC_LIB_HAVE_LINKFLAGS(dl,, [#include <dlfcn.h>], [dlclose (0);])
> +
> +-LIBGNUTLS_LIBS=3D"-L${libdir} -lgnutls $LIBS"
> +-LIBGNUTLS_CFLAGS=3D"-I${includedir}"
> ++LIBGNUTLS_LIBS=3D"-lgnutls $LIBS"
> ++LIBGNUTLS_CFLAGS=3D""
> + AC_SUBST(LIBGNUTLS_LIBS)
> + AC_SUBST(LIBGNUTLS_CFLAGS)
> +
> +Index: gnutls-2.12.5/lib/gnutls.pc.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnutls-2.12.5.orig/lib/gnutls.pc.in =A0 =A0 =A0 =A02011-04-23 08:00:=
07.000000000 -0700
> ++++ gnutls-2.12.5/lib/gnutls.pc.in =A0 =A0 2011-05-25 19:50:11.926102288=
 -0700
> +@@ -19,7 +19,6 @@
> + Description: Transport Security Layer implementation for the GNU system
> + URL: http://www.gnu.org/software/gnutls/
> + Version: @VERSION@
> ++Requires.private: libgcrypt, libtasn1
> + Libs: -L${libdir} -lgnutls
> +-Libs.private: @LTLIBGCRYPT@ @NETTLE_LIBS@
> +-@GNUTLS_REQUIRES_PRIVATE@
> + Cflags: -I${includedir}
> +Index: gnutls-2.12.5/libextra/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnutls-2.12.5.orig/libextra/configure.ac =A0 2011-05-11 00:05:31.000=
000000 -0700
> ++++ gnutls-2.12.5/libextra/configure.ac =A0 =A0 =A0 =A02011-05-25 19:45:=
23.722186801 -0700
> +@@ -41,8 +41,8 @@
> +
> + xgl_INIT
> +
> +-LIBGNUTLS_EXTRA_LIBS=3D"-L${libdir} -lgnutls-extra $LZO_LIBS $LIBGNUTLS=
_LIBS"
> +-LIBGNUTLS_EXTRA_CFLAGS=3D"-I${includedir}"
> ++LIBGNUTLS_EXTRA_LIBS=3D"-lgnutls-extra $LZO_LIBS $LIBGNUTLS_LIBS"
> ++LIBGNUTLS_EXTRA_CFLAGS=3D""
> + AC_SUBST(LIBGNUTLS_EXTRA_LIBS)
> + AC_SUBST(LIBGNUTLS_EXTRA_CFLAGS)
> +
> +Index: gnutls-2.12.5/libextra/gnutls-extra.pc.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnutls-2.12.5.orig/libextra/gnutls-extra.pc.in =A0 =A0 2011-04-07 17=
:30:45.000000000 -0700
> ++++ gnutls-2.12.5/libextra/gnutls-extra.pc.in =A02011-05-25 19:45:23.722=
186801 -0700
> +@@ -22,5 +22,5 @@
> + Requires: gnutls
> + Version: @VERSION@
> + Libs: -L${libdir} -lgnutls-extra
> +-Libs.private: @LIBGNUTLS_EXTRA_LIBS@
> ++Libs.private: -llzo2
> + Cflags: -I${includedir}
> diff --git a/meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-openssl.pat=
ch b/meta/recipes-support/gnutls/gnutls-2.12.5/gnutls-openssl.patch
> similarity index 100%
> rename from meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-openssl.patc=
h
> rename to meta/recipes-support/gnutls/gnutls-2.12.5/gnutls-openssl.patch
> diff --git a/meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-texinfo-eur=
o.patch b/meta/recipes-support/gnutls/gnutls-2.12.5/gnutls-texinfo-euro.pat=
ch
> similarity index 100%
> rename from meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-texinfo-euro=
.patch
> rename to meta/recipes-support/gnutls/gnutls-2.12.5/gnutls-texinfo-euro.p=
atch
> diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-suppor=
t/gnutls/gnutls.inc
> index fd77af4..9f8d81b 100644
> --- a/meta/recipes-support/gnutls/gnutls.inc
> +++ b/meta/recipes-support/gnutls/gnutls.inc
> @@ -21,9 +21,9 @@ inherit autotools binconfig pkgconfig gettext
>
> =A0EXTRA_OECONF=3D"--with-included-opencdk --with-included-libcfg --disab=
le-rpath \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 --with-libtasn1-prefix=3D${STAGING_DIR_HOST}$=
{prefix} \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0--with-libgcrypt-prefix=3D${STAGING_DIR_HOST=
}${prefix} \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0--with-libz-prefix=3D${STAGING_DIR_HOST}${pr=
efix} --with-lzo --disable-guile"
> -
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0--with-libgcrypt --with-libgcrypt-prefix=3D$=
{STAGING_DIR_HOST}${prefix} \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0--with-lzo --disable-guile \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0"
> =A0do_configure_prepend() {
> =A0 =A0 =A0 =A0for dir in . lib libextra; do
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rm ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 =
${dir}/m4/lt*.m4
> diff --git a/meta/recipes-support/gnutls/gnutls_2.10.4.bb b/meta/recipes-=
support/gnutls/gnutls_2.10.4.bb
> deleted file mode 100644
> index cc2fa27..0000000
> --- a/meta/recipes-support/gnutls/gnutls_2.10.4.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require gnutls.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI +=3D "file://gnutls-openssl.patch \
> - =A0 =A0 =A0 =A0 =A0 =A0file://gnutls-texinfo-euro.patch \
> - =A0 =A0 =A0 =A0 =A0 =A0file://configure-fix.patch"
> -
> -SRC_URI[md5sum] =3D "4e1517084018a8b1fdc96daabea40528"
> -SRC_URI[sha256sum] =3D "b8bfe36450fe671e99db5ff1e44e6b65fda8a79cacd9e77d=
550eff7da3745fc8"
> diff --git a/meta/recipes-support/gnutls/gnutls_2.12.5.bb b/meta/recipes-=
support/gnutls/gnutls_2.12.5.bb
> new file mode 100644
> index 0000000..b27a065
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls_2.12.5.bb
> @@ -0,0 +1,9 @@
> +require gnutls.inc
> +
> +PR =3D "r0"
> +
> +SRC_URI +=3D "file://gnutls-openssl.patch \
> + =A0 =A0 =A0 =A0 =A0 =A0file://configure-fix.patch"
> +
> +SRC_URI[md5sum] =3D "2d0bd5ae11534074fcd78da6ea384e64"
> +SRC_URI[sha256sum] =3D "bf263880f327ac34a561d8e66b5a729cbe33eea56728bfed=
3406ff2898448b60"
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


