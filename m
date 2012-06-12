Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SeRBO-0007eM-42
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 15:30:54 +0200
Received: by vcbfl15 with SMTP id fl15so2750501vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 06:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=b4p/noTl4c6eo7zcEY6J+c30TAMlNIysJ7Xr2YqLeUk=;
	b=YuisFMkzHUpTx/ZL3LjT5HkckOhmiTOefn+ReNlole/iQ/Adph8Odd3VbtwL6R1sNv
	vjtLr4bGlxfLPJygDTwVDldHyzS6ZpOhNAlsmjsPnZ+4Zzro1U67MS9eZvRV7WTBPlq9
	PP80b9DYaUv9gnNfplGdDSELr3aRK4J07gc5goZ42JXytq4KjB0AK4Zo+9SU706DPzRH
	fjO12rauqoFdTu14A2zUOVV1WZQFLcycFuzVzkwxGxrpuvFogYO/gKNnPNxG3ySFMa1u
	NFBA1RZotHTIWEov+KF+Vf3N+KmRaVq2ILsmsmSiMEbItPio18ELIA2orurq2REy71fn
	IPSQ==
MIME-Version: 1.0
Received: by 10.52.92.228 with SMTP id cp4mr12236244vdb.42.1339507219055; Tue,
	12 Jun 2012 06:20:19 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.155.130 with HTTP; Tue, 12 Jun 2012 06:20:19 -0700 (PDT)
In-Reply-To: <1339506707.8065.0.camel@ted>
References: <1339506707.8065.0.camel@ted>
Date: Tue, 12 Jun 2012 10:20:19 -0300
X-Google-Sender-Auth: T8IZ7BxUl1sgri8EhNbfOU8K5Yc
Message-ID: <CAP9ODKrT-xSo5G-itZE_W4je68CZcpcBERzHUZD6TsdO=EC__w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openjade-native: Ensure we reautoconf the package
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
X-List-Received-Date: Tue, 12 Jun 2012 13:30:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 12, 2012 at 10:11 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> +++ b/meta/recipes-devtools/openjade/openjade-1.3.2/reautoconf.patch
> @@ -0,0 +1,83 @@
> +Ensure we reautoconf the packag
> +
> +Currently since configure.in in is in a subdirectory, we don't reautocon=
f the
> +ecipe. We really need to do this, to update things like the libtool scri=
pt used

Missing the 'r' from 'recipe'.

> + and fix various issues such as those that could creep in if a reautocon=
f is
> +triggered for some reason. Since this source only calls AM_INIT_AUTOMAKE=
 to
> +gain the PACKAGE and VERSION definitions and that macro now errors if Ma=
kefile.am
> +doesn't exist, we need to add these definitions manually.
> +
> +These changes avoid failures like:
> +----
> +| ...
> +| DssslApp.cxx:117:36: error: 'PACKAGE' was not declared in this scope
> +| DssslApp.cxx:118:36: error: 'VERSION' was not declared in this scope
> +| make[2]: *** [DssslApp.lo] Error 1 ----
> +
> +Upstream-Status: Pending
> +
> +RP 2012/6/12
> +
> +Index: openjade-1.3.2/acinclude.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- /dev/null =A01970-01-01 00:00:00.000000000 +0000
> ++++ openjade-1.3.2/acinclude.m4 =A0 =A0 =A0 =A02012-06-12 12:48:54.87136=
5344 +0000
> +@@ -0,0 +1,39 @@
> ++dnl Configure-time switch with default
> ++dnl
> ++dnl Each switch defines an --enable-FOO and --disable-FOO option in
> ++dnl the resulting configure script.
> ++dnl
> ++dnl Usage:
> ++dnl smr_SWITCH(name, description, default, pos-def, neg-def)
> ++dnl
> ++dnl where:
> ++dnl
> ++dnl name =A0 =A0 =A0 =A0name of switch; generates --enable-name & --dis=
able-name
> ++dnl =A0 =A0 =A0 =A0 =A0 =A0 options
> ++dnl description help string is set to this prefixed by "enable" or
> ++dnl =A0 =A0 =A0 =A0 =A0 =A0 "disable", whichever is the non-default val=
ue
> ++dnl default =A0 =A0 either "on" or "off"; specifies default if neither
> ++dnl =A0 =A0 =A0 =A0 =A0 =A0 --enable-name nor --disable-name is specifi=
ed
> ++dnl pos-def =A0 =A0 a symbol to AC_DEFINE if switch is on (optional)
> ++dnl neg-def =A0 =A0 a symbol to AC_DEFINE if switch is off (optional)
> ++dnl
> ++AC_DEFUN(smr_SWITCH, [
> ++ =A0 =A0AC_MSG_CHECKING(whether to enable $2)
> ++ =A0 =A0AC_ARG_ENABLE(
> ++ =A0 =A0 =A0 =A0$1,
> ++ =A0 =A0 =A0 =A0ifelse($3, on,
> ++ =A0 =A0 =A0 =A0 =A0 =A0[ =A0--disable-[$1] =A0 =A0disable [$2]],
> ++ =A0 =A0 =A0 =A0 =A0 =A0[ =A0--enable-[$1] =A0 =A0 enable [$2]]),
> ++ =A0 =A0 =A0 =A0[ if test "$enableval" =3D yes; then
> ++ =A0 =A0 =A0 =A0 =A0 =A0AC_MSG_RESULT(yes)
> ++ =A0 =A0 =A0 =A0 =A0 =A0ifelse($4, , , AC_DEFINE($4))
> ++ =A0 =A0 =A0 =A0else
> ++ =A0 =A0 =A0 =A0 =A0 =A0AC_MSG_RESULT(no)
> ++ =A0 =A0 =A0 =A0 =A0 =A0ifelse($5, , , AC_DEFINE($5))
> ++ =A0 =A0 =A0 =A0fi ],
> ++ =A0 =A0 =A0 =A0ifelse($3, on,
> ++ =A0 =A0 =A0 =A0 =A0 [ AC_MSG_RESULT(yes)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 ifelse($4, , , AC_DEFINE($4)) ],
> ++ =A0 =A0 =A0 =A0 =A0 [ AC_MSG_RESULT(no)
> ++ =A0 =A0 =A0 =A0 =A0 =A0ifelse($5, , , AC_DEFINE($5))]))])
> ++
> +Index: openjade-1.3.2/config/configure.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- openjade-1.3.2.orig/config/configure.in =A0 =A02012-06-12 12:47:20.7=
35365445 +0000
> ++++ openjade-1.3.2/config/configure.in 2012-06-12 12:48:17.507364080 +00=
00
> +@@ -12,9 +12,12 @@
> + dnl =A0Credits: this autoconf script was largely "inspired" <g> by the
> + dnl =A0autoconf script around SP made by Henry Thompson.
> + dnl
> +-AC_INIT(dsssl)
> ++AC_INIT([openjade], [1.3.2])
> + AC_CONFIG_AUX_DIR(config)
> +-AM_INIT_AUTOMAKE( openjade, 1.3.2)
> ++AC_SUBST([PACKAGE], [openjade])
> ++AC_SUBST([VERSION], [1.3.2])
> ++AC_DEFINE_UNQUOTED(PACKAGE, "$PACKAGE")
> ++AC_DEFINE_UNQUOTED(VERSION, "$VERSION")
> + TOP=3D`pwd`
> + AC_SUBST(TOP)
> + dnl
> diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/me=
ta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> index 18d311e..4bcc9f9 100644
> --- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> +++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> @@ -14,6 +14,7 @@ RDEPENDS_${PN} =3D "sgml-common-native"
>
> =A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
> =A0 =A0 =A0 =A0 =A0 =A0file://makefile.patch \
> + =A0 =A0 =A0 =A0 =A0 file://reautoconf.patch \
> =A0 =A0 =A0 =A0 =A0 file://user-declared-default-constructor.patch"
>
> =A0SRC_URI[md5sum] =3D "7df692e3186109cc00db6825b777201e"
> @@ -38,6 +39,9 @@ CFLAGS =3D+ "-I${S}/include"
> =A0SSTATEPOSTINSTFUNCS +=3D "openjade_sstate_postinst"
> =A0SYSROOT_PREPROCESS_FUNCS +=3D "openjade_sysroot_preprocess"
>
> +do_configure_prepend () {
> + =A0 =A0 =A0 cp ${S}/config/configure.in ${S}/
> +}

Good catch; I'd just add a comment saying this is required for
autoreconf to be triggered.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


