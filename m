Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Uakir-00034A-J9
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 12:38:46 +0200
Received: by mail-ee0-f53.google.com with SMTP id d49so2113582eek.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 03:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=wqKA8S848Z5qc7aYHU34dAoR1H1vJjKBxNhgQtYzCu0=;
	b=RMuIzoiFS2l5riNeuBnjWOsPIPya+Q7Vz6FdWr5ZRyeDJb4Rd0a8FSSbWXw+BEUbqG
	AAul4mzeKRL4MgwgewsH6GWLeD/vQ97mAefr+OpsLmqKRaXrzf9F3zZOafSxI9iArw3e
	a1YOUDpxfKgitdjTM+tAlxB2BkTMahOGmlzsG9iXGtFf+kEb6r/Ah+HZRZV4c+X55sPC
	sYW+slSgMimeRHczc4qrJrPR3QxviabK627XeY2met52OIzdpRPORpSV0AuT7faB0d05
	6rVo3Jc7a5rov13Cnlywogmwosz4RvpYmt2zXpq4Pc14ZxFe1Y8UIhM6Y1fM32ZPiXvn
	hvig==
X-Received: by 10.15.95.74 with SMTP id bc50mr39630116eeb.36.1368181240636;
	Fri, 10 May 2013 03:20:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x41sm2579098eey.17.2013.05.10.03.20.39 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 10 May 2013 03:20:40 -0700 (PDT)
Date: Fri, 10 May 2013 12:20:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
Message-ID: <20130510102041.GA12329@jama.dyndns-home.com>
References: <1368180910-17476-1-git-send-email-bogdan.a.marinescu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1368180910-17476-1-git-send-email-bogdan.a.marinescu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] flex: updated to 2.5.37
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
X-List-Received-Date: Fri, 10 May 2013 10:38:51 -0000
X-Groupsio-MsgNum: 39004
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2013 at 01:15:10PM +0300, Bogdan Marinescu wrote:
> Removed the patches to flex, because they are now applied to the
> latest version.

Can you check if 2.5.37 still reports flex.real when you call
flex --version?

If yes, please integrate
http://lists.linuxtogo.org/pipermail/openembedded-core/2013-May/039425.html
I'll send v2 with added ${S} in a minute

Regards,

> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>  .../flex/flex/avoid-FORTIFY-warnings.patch         |   59 --------------=
------
>  .../flex/int-is-not-the-same-size-as-size_t.patch  |   42 --------------
>  meta/recipes-devtools/flex/flex_2.5.35.bb          |   11 ----
>  meta/recipes-devtools/flex/flex_2.5.37.bb          |    7 +++
>  4 files changed, 7 insertions(+), 112 deletions(-)
>  delete mode 100644 meta/recipes-devtools/flex/flex/avoid-FORTIFY-warning=
s.patch
>  delete mode 100644 meta/recipes-devtools/flex/flex/int-is-not-the-same-s=
ize-as-size_t.patch
>  delete mode 100644 meta/recipes-devtools/flex/flex_2.5.35.bb
>  create mode 100644 meta/recipes-devtools/flex/flex_2.5.37.bb
>=20
> diff --git a/meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch=
 b/meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch
> deleted file mode 100644
> index c71eb82..0000000
> --- a/meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -Wrap ECHO macro to avoid FORTIFY warnings
> -
> -This change will enable flex scanners to be compiled with
> --D_FORTIFY_SOURCE=3D2.
> -
> -Signed-off-by: Manoj Srivastava <srivasta@debian.org>
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> -
> -Origin: Cherry picked from Debian
> -Upstream-Status: Pending
> -
> ----
> - flex.skl |    2 +-
> - scan.c   |    2 +-
> - skel.c   |    2 +-
> - 3 files changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/flex.skl b/flex.skl
> -index 6ebf2fd..eaa355e 100644
> ---- a/flex.skl
> -+++ b/flex.skl
> -@@ -1074,7 +1074,7 @@ m4_ifdef( [[M4_YY_NOT_IN_HEADER]],
> - /* This used to be an fputs(), but since the string might contain NUL's,
> -  * we now use fwrite().
> -  */
> --#define ECHO fwrite( yytext, yyleng, 1, yyout )
> -+#define ECHO do { if (fwrite( yytext, yyleng, 1, yyout )) {} } while (0)
> - %endif
> - %if-c++-only C++ definition
> - #define ECHO LexerOutput( yytext, yyleng )
> -diff --git a/scan.c b/scan.c
> -index d7f5db3..1a079bf 100644
> ---- a/scan.c
> -+++ b/scan.c
> -@@ -2093,7 +2093,7 @@ static int input (void );
> - /* This used to be an fputs(), but since the string might contain NUL's,
> -  * we now use fwrite().
> -  */
> --#define ECHO fwrite( yytext, yyleng, 1, yyout )
> -+#define ECHO do { if (fwrite( yytext, yyleng, 1, yyout )) {} } while (0)
> - #endif
> -=20
> - /* Gets input and stuffs it into "buf".  number of characters read, or =
YY_NULL,
> -diff --git a/skel.c b/skel.c
> -index ee9f6ef..b8a2b4b 100644
> ---- a/skel.c
> -+++ b/skel.c
> -@@ -1141,7 +1141,7 @@ const char *skel[] =3D {
> -   "/* This used to be an fputs(), but since the string might contain NU=
L's,",
> -   " * we now use fwrite().",
> -   " */",
> --  "#define ECHO fwrite( yytext, yyleng, 1, yyout )",
> -+  "#define ECHO do { if (fwrite( yytext, yyleng, 1, yyout )) {} } while=
 (0)",
> -   "%endif",
> -   "%if-c++-only C++ definition",
> -   "#define ECHO LexerOutput( yytext, yyleng )",
> ---=20
> -1.7.9.5
> -
> diff --git a/meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-=
size_t.patch b/meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-=
size_t.patch
> deleted file mode 100644
> index 8d05ee4..0000000
> --- a/meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.=
patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -int is not the same size as size_t.
> -
> -Signed-off-by: Manoj Srivastava <srivasta@debian.org>
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> -
> -Origin: Cherry picked from Debian
> -Upstream-Status: Pending
> -
> ----
> - gen.c  |    2 +-
> - scan.c |    2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/gen.c b/gen.c
> -index 848e2c5..5a5daef 100644
> ---- a/gen.c
> -+++ b/gen.c
> -@@ -1890,7 +1890,7 @@ void make_tables ()
> - 			outn ("\tif ( YY_CURRENT_BUFFER_LVALUE->yy_is_interactive ) \\");
> - 			outn ("\t\t{ \\");
> - 			outn ("\t\tint c =3D '*'; \\");
> --			outn ("\t\tint n; \\");
> -+			outn ("\t\tsize_t n; \\");
> - 			outn ("\t\tfor ( n =3D 0; n < max_size && \\");
> - 			outn ("\t\t\t     (c =3D getc( yyin )) !=3D EOF && c !=3D '\\n'; ++n=
 ) \\");
> - 			outn ("\t\t\tbuf[n] =3D (char) c; \\");
> -diff --git a/scan.c b/scan.c
> -index 44559b6..15e2058 100644
> ---- a/scan.c
> -+++ b/scan.c
> -@@ -2105,7 +2105,7 @@ static int input (void );
> - 	if ( YY_CURRENT_BUFFER_LVALUE->yy_is_interactive ) \
> - 		{ \
> - 		int c =3D '*'; \
> --		int n; \
> -+		size_t n; \
> - 		for ( n =3D 0; n < max_size && \
> - 			     (c =3D getc( yyin )) !=3D EOF && c !=3D '\n'; ++n ) \
> - 			buf[n] =3D (char) c; \
> ---=20
> -1.7.9.5
> -
> diff --git a/meta/recipes-devtools/flex/flex_2.5.35.bb b/meta/recipes-dev=
tools/flex/flex_2.5.35.bb
> deleted file mode 100644
> index 2218c91..0000000
> --- a/meta/recipes-devtools/flex/flex_2.5.35.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require flex.inc
> -PR =3D "r3"
> -LICENSE=3D"BSD"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4742cf92e89040b39486a6219b68=
067"
> -BBCLASSEXTEND =3D "native nativesdk"
> -
> -SRC_URI +=3D "file://avoid-FORTIFY-warnings.patch \
> -            file://int-is-not-the-same-size-as-size_t.patch"
> -
> -SRC_URI[md5sum] =3D "10714e50cea54dc7a227e3eddcd44d57"
> -SRC_URI[sha256sum] =3D "0becbd4b2b36b99c67f8c22ab98f7f80c9860aec70f0350a=
0018f29a88704e7b"
> diff --git a/meta/recipes-devtools/flex/flex_2.5.37.bb b/meta/recipes-dev=
tools/flex/flex_2.5.37.bb
> new file mode 100644
> index 0000000..e699fee
> --- /dev/null
> +++ b/meta/recipes-devtools/flex/flex_2.5.37.bb
> @@ -0,0 +1,7 @@
> +require flex.inc
> +LICENSE=3D"BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4742cf92e89040b39486a6219b68=
067"
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +SRC_URI[md5sum] =3D "c75940e1fc25108f2a7b3ef42abdae06"
> +SRC_URI[sha256sum] =3D "17aa7b4ebf19a13bc2dff4115b416365c95f090061539a93=
2a68092349ac052a"
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEUEARECAAYFAlGMyfkACgkQN1Ujt2V2gBzcFACXUb5cNGe4eeDVrFvP/RTiPVtZ
pQCfS+Wij8AUl9e+diBpoa61PQU2kN0=
=fpx1
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
