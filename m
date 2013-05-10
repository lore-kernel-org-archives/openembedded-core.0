Received: from mail-wg0-f54.google.com ([74.125.82.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Uakbv-0001tD-Cm
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 12:31:37 +0200
Received: by mail-wg0-f54.google.com with SMTP id x12so4047405wgg.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 03:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=FBjHS3JetOcIOUH7aac+78YRO9gKEAOm4HAEpD5i+QE=;
	b=Uwy3aiF+EWOpFT5uDVxyQfKHig+s8jPxIabeF70MH/Sa/8jShV29WWNScCiqMqmvFy
	JaszBg9JsTr7viC1au0OSXjcQ7RZxaMmJ8wQAEoVrFtONdbG84j7ajgSgbqfT41xPWXJ
	I4WmsqPzqOGBmbiuD56+VEHc9rjEtDD/Kr8ed63z27TIVsnsh6EruKzLohxBwka7ptyT
	0xFrOaMOWq/tstBKLMhDHomiwiirWqYGxoVjkx+DTV6Ugb3dsP5RODIhMM0WtyBsHywd
	lsZE5NtTddhXsXQ/5ncKW42qMWrGpD3bKugxt07+BQc9ygrY1e8TKzaLmFuJDJcm7m9E
	tfyQ==
X-Received: by 10.180.38.48 with SMTP id d16mr2735005wik.16.1368180810467;
	Fri, 10 May 2013 03:13:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.6.38 with HTTP; Fri, 10 May 2013 03:13:10 -0700 (PDT)
In-Reply-To: <1368180910-17476-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1368180910-17476-1-git-send-email-bogdan.a.marinescu@intel.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Fri, 10 May 2013 13:13:10 +0300
Message-ID: <CAMZjud3bfqjTEoZ5kND7-Hs5CDdBgZjvKxvOSZx0NOM2bEz-tQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmezZ1CrDSFu8Tk7RF66N/A0aMT1Ka3ggCOQqtdu/oftjNmLhJCHtJSiiHZEuoNyQc/ZMJr
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
X-List-Received-Date: Fri, 10 May 2013 10:31:42 -0000
Content-Type: multipart/alternative; boundary=e89a8f643344325fea04dc5a6bcd

--e89a8f643344325fea04dc5a6bcd
Content-Type: text/plain; charset=ISO-8859-1

On Fri, May 10, 2013 at 1:15 PM, Bogdan Marinescu <
bogdan.a.marinescu@intel.com> wrote:

> Removed the patches to flex, because they are now applied to the
> latest version.
>
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>  .../flex/flex/avoid-FORTIFY-warnings.patch         |   59
> --------------------
>  .../flex/int-is-not-the-same-size-as-size_t.patch  |   42 --------------
>  meta/recipes-devtools/flex/flex_2.5.35.bb          |   11 ----
>  meta/recipes-devtools/flex/flex_2.5.37.bb          |    7 +++
>  4 files changed, 7 insertions(+), 112 deletions(-)
>  delete mode 100644
> meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch
>  delete mode 100644
> meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.patch
>  delete mode 100644 meta/recipes-devtools/flex/flex_2.5.35.bb
>  create mode 100644 meta/recipes-devtools/flex/flex_2.5.37.bb
>
> diff --git a/meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch
> b/meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch
> deleted file mode 100644
> index c71eb82..0000000
> --- a/meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -Wrap ECHO macro to avoid FORTIFY warnings
> -
> -This change will enable flex scanners to be compiled with
> --D_FORTIFY_SOURCE=2.
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
> -
> - /* Gets input and stuffs it into "buf".  number of characters read, or
> YY_NULL,
> -diff --git a/skel.c b/skel.c
> -index ee9f6ef..b8a2b4b 100644
> ---- a/skel.c
> -+++ b/skel.c
> -@@ -1141,7 +1141,7 @@ const char *skel[] = {
> -   "/* This used to be an fputs(), but since the string might contain
> NUL's,",
> -   " * we now use fwrite().",
> -   " */",
> --  "#define ECHO fwrite( yytext, yyleng, 1, yyout )",
> -+  "#define ECHO do { if (fwrite( yytext, yyleng, 1, yyout )) {} } while
> (0)",
> -   "%endif",
> -   "%if-c++-only C++ definition",
> -   "#define ECHO LexerOutput( yytext, yyleng )",
> ---
> -1.7.9.5
> -
> diff --git
> a/meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.patch
> b/meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.patch
> deleted file mode 100644
> index 8d05ee4..0000000
> ---
> a/meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.patch
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
> -                       outn ("\tif (
> YY_CURRENT_BUFFER_LVALUE->yy_is_interactive ) \\");
> -                       outn ("\t\t{ \\");
> -                       outn ("\t\tint c = '*'; \\");
> --                      outn ("\t\tint n; \\");
> -+                      outn ("\t\tsize_t n; \\");
> -                       outn ("\t\tfor ( n = 0; n < max_size && \\");
> -                       outn ("\t\t\t     (c = getc( yyin )) != EOF && c
> != '\\n'; ++n ) \\");
> -                       outn ("\t\t\tbuf[n] = (char) c; \\");
> -diff --git a/scan.c b/scan.c
> -index 44559b6..15e2058 100644
> ---- a/scan.c
> -+++ b/scan.c
> -@@ -2105,7 +2105,7 @@ static int input (void );
> -       if ( YY_CURRENT_BUFFER_LVALUE->yy_is_interactive ) \
> -               { \
> -               int c = '*'; \
> --              int n; \
> -+              size_t n; \
> -               for ( n = 0; n < max_size && \
> -                            (c = getc( yyin )) != EOF && c != '\n'; ++n )
> \
> -                       buf[n] = (char) c; \
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-devtools/flex/flex_2.5.35.bbb/meta/recipes-devtools/flex/
> flex_2.5.35.bb
> deleted file mode 100644
> index 2218c91..0000000
> --- a/meta/recipes-devtools/flex/flex_2.5.35.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require flex.inc
> -PR = "r3"
> -LICENSE="BSD"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
> -BBCLASSEXTEND = "native nativesdk"
> -
> -SRC_URI += "file://avoid-FORTIFY-warnings.patch \
> -            file://int-is-not-the-same-size-as-size_t.patch"
> -
> -SRC_URI[md5sum] = "10714e50cea54dc7a227e3eddcd44d57"
> -SRC_URI[sha256sum] =
> "0becbd4b2b36b99c67f8c22ab98f7f80c9860aec70f0350a0018f29a88704e7b"
> diff --git a/meta/recipes-devtools/flex/flex_2.5.37.bbb/meta/recipes-devtools/flex/
> flex_2.5.37.bb
> new file mode 100644
> index 0000000..e699fee
> --- /dev/null
> +++ b/meta/recipes-devtools/flex/flex_2.5.37.bb
> @@ -0,0 +1,7 @@
> +require flex.inc
> +LICENSE="BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
> +BBCLASSEXTEND = "native nativesdk"
> +
> +SRC_URI[md5sum] = "c75940e1fc25108f2a7b3ef42abdae06"
> +SRC_URI[sha256sum] =
> "17aa7b4ebf19a13bc2dff4115b416365c95f090061539a932a68092349ac052a"
> --
> 1.7.10.4
>
>
Last time I've sent this patch, I've been told that it caused some build
problems. I was unable to reproduce this issue, so if this happens again,
please let me know what I need to do in order to reproduce the build
failures.

Thanks,
Bogdan

--e89a8f643344325fea04dc5a6bcd
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Fri, May 10, 2013 at 1:15 PM, Bogdan Marinescu <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:bogdan.a.marinescu@intel.com" target=3D"_blank">bogd=
an.a.marinescu@intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Removed the patches to flex, because they ar=
e now applied to the<br>
latest version.<br>
<br>
Signed-off-by: Bogdan Marinescu &lt;<a href=3D"mailto:bogdan.a.marinescu@in=
tel.com">bogdan.a.marinescu@intel.com</a>&gt;<br>
---<br>
=A0.../flex/flex/avoid-FORTIFY-warnings.patch =A0 =A0 =A0 =A0 | =A0 59 ----=
----------------<br>
=A0.../flex/int-is-not-the-same-size-as-size_t.patch =A0| =A0 42 ----------=
----<br>
=A0meta/recipes-devtools/flex/<a href=3D"http://flex_2.5.35.bb" target=3D"_=
blank">flex_2.5.35.bb</a> =A0 =A0 =A0 =A0 =A0| =A0 11 ----<br>
=A0meta/recipes-devtools/flex/<a href=3D"http://flex_2.5.37.bb" target=3D"_=
blank">flex_2.5.37.bb</a> =A0 =A0 =A0 =A0 =A0| =A0 =A07 +++<br>
=A04 files changed, 7 insertions(+), 112 deletions(-)<br>
=A0delete mode 100644 meta/recipes-devtools/flex/flex/avoid-FORTIFY-warning=
s.patch<br>
=A0delete mode 100644 meta/recipes-devtools/flex/flex/int-is-not-the-same-s=
ize-as-size_t.patch<br>
=A0delete mode 100644 meta/recipes-devtools/flex/<a href=3D"http://flex_2.5=
.35.bb" target=3D"_blank">flex_2.5.35.bb</a><br>
=A0create mode 100644 meta/recipes-devtools/flex/<a href=3D"http://flex_2.5=
.37.bb" target=3D"_blank">flex_2.5.37.bb</a><br>
<br>
diff --git a/meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch b=
/meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch<br>
deleted file mode 100644<br>
index c71eb82..0000000<br>
--- a/meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch<br>
+++ /dev/null<br>
@@ -1,59 +0,0 @@<br>
-Wrap ECHO macro to avoid FORTIFY warnings<br>
-<br>
-This change will enable flex scanners to be compiled with<br>
--D_FORTIFY_SOURCE=3D2.<br>
-<br>
-Signed-off-by: Manoj Srivastava &lt;<a href=3D"mailto:srivasta@debian.org"=
>srivasta@debian.org</a>&gt;<br>
-Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.=
br">otavio@ossystems.com.br</a>&gt;<br>
-<br>
-Origin: Cherry picked from Debian<br>
-Upstream-Status: Pending<br>
-<br>
----<br>
- flex.skl | =A0 =A02 +-<br>
- scan.c =A0 | =A0 =A02 +-<br>
- skel.c =A0 | =A0 =A02 +-<br>
- 3 files changed, 3 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/flex.skl b/flex.skl<br>
-index 6ebf2fd..eaa355e 100644<br>
---- a/flex.skl<br>
-+++ b/flex.skl<br>
-@@ -1074,7 +1074,7 @@ m4_ifdef( [[M4_YY_NOT_IN_HEADER]],<br>
- /* This used to be an fputs(), but since the string might contain NUL&#39=
;s,<br>
- =A0* we now use fwrite().<br>
- =A0*/<br>
--#define ECHO fwrite( yytext, yyleng, 1, yyout )<br>
-+#define ECHO do { if (fwrite( yytext, yyleng, 1, yyout )) {} } while (0)<=
br>
- %endif<br>
- %if-c++-only C++ definition<br>
- #define ECHO LexerOutput( yytext, yyleng )<br>
-diff --git a/scan.c b/scan.c<br>
-index d7f5db3..1a079bf 100644<br>
---- a/scan.c<br>
-+++ b/scan.c<br>
-@@ -2093,7 +2093,7 @@ static int input (void );<br>
- /* This used to be an fputs(), but since the string might contain NUL&#39=
;s,<br>
- =A0* we now use fwrite().<br>
- =A0*/<br>
--#define ECHO fwrite( yytext, yyleng, 1, yyout )<br>
-+#define ECHO do { if (fwrite( yytext, yyleng, 1, yyout )) {} } while (0)<=
br>
- #endif<br>
-<br>
- /* Gets input and stuffs it into &quot;buf&quot;. =A0number of characters=
 read, or YY_NULL,<br>
-diff --git a/skel.c b/skel.c<br>
-index ee9f6ef..b8a2b4b 100644<br>
---- a/skel.c<br>
-+++ b/skel.c<br>
-@@ -1141,7 +1141,7 @@ const char *skel[] =3D {<br>
- =A0 &quot;/* This used to be an fputs(), but since the string might conta=
in NUL&#39;s,&quot;,<br>
- =A0 &quot; * we now use fwrite().&quot;,<br>
- =A0 &quot; */&quot;,<br>
-- =A0&quot;#define ECHO fwrite( yytext, yyleng, 1, yyout )&quot;,<br>
-+ =A0&quot;#define ECHO do { if (fwrite( yytext, yyleng, 1, yyout )) {} } =
while (0)&quot;,<br>
- =A0 &quot;%endif&quot;,<br>
- =A0 &quot;%if-c++-only C++ definition&quot;,<br>
- =A0 &quot;#define ECHO LexerOutput( yytext, yyleng )&quot;,<br>
---<br>
-1.7.9.5<br>
-<br>
diff --git a/meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-si=
ze_t.patch b/meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-si=
ze_t.patch<br>
deleted file mode 100644<br>
index 8d05ee4..0000000<br>
--- a/meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.pa=
tch<br>
+++ /dev/null<br>
@@ -1,42 +0,0 @@<br>
-int is not the same size as size_t.<br>
-<br>
-Signed-off-by: Manoj Srivastava &lt;<a href=3D"mailto:srivasta@debian.org"=
>srivasta@debian.org</a>&gt;<br>
-Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.=
br">otavio@ossystems.com.br</a>&gt;<br>
-<br>
-Origin: Cherry picked from Debian<br>
-Upstream-Status: Pending<br>
-<br>
----<br>
- gen.c =A0| =A0 =A02 +-<br>
- scan.c | =A0 =A02 +-<br>
- 2 files changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/gen.c b/gen.c<br>
-index 848e2c5..5a5daef 100644<br>
---- a/gen.c<br>
-+++ b/gen.c<br>
-@@ -1890,7 +1890,7 @@ void make_tables ()<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 outn (&quot;\tif ( YY_CURRENT=
_BUFFER_LVALUE-&gt;yy_is_interactive ) \\&quot;);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 outn (&quot;\t\t{ \\&quot;);<=
br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 outn (&quot;\t\tint c =3D &#3=
9;*&#39;; \\&quot;);<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0outn (&quot;\t\tint n; \\&quo=
t;);<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0outn (&quot;\t\tsize_t n; \\&=
quot;);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 outn (&quot;\t\tfor ( n =3D 0=
; n &lt; max_size &amp;&amp; \\&quot;);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 outn (&quot;\t\t\t =A0 =A0 (c=
 =3D getc( yyin )) !=3D EOF &amp;&amp; c !=3D &#39;\\n&#39;; ++n ) \\&quot;=
);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 outn (&quot;\t\t\tbuf[n] =3D =
(char) c; \\&quot;);<br>
-diff --git a/scan.c b/scan.c<br>
-index 44559b6..15e2058 100644<br>
---- a/scan.c<br>
-+++ b/scan.c<br>
-@@ -2105,7 +2105,7 @@ static int input (void );<br>
- =A0 =A0 =A0 if ( YY_CURRENT_BUFFER_LVALUE-&gt;yy_is_interactive ) \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 { \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 int c =3D &#39;*&#39;; \<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0int n; \<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0size_t n; \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 for ( n =3D 0; n &lt; max_size &amp;&amp; \<b=
r>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(c =3D getc( yyin =
)) !=3D EOF &amp;&amp; c !=3D &#39;\n&#39;; ++n ) \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf[n] =3D (char) c; \<br>
---<br>
-1.7.9.5<br>
-<br>
diff --git a/meta/recipes-devtools/flex/<a href=3D"http://flex_2.5.35.bb" t=
arget=3D"_blank">flex_2.5.35.bb</a> b/meta/recipes-devtools/flex/<a href=3D=
"http://flex_2.5.35.bb" target=3D"_blank">flex_2.5.35.bb</a><br>
deleted file mode 100644<br>
index 2218c91..0000000<br>
--- a/meta/recipes-devtools/flex/<a href=3D"http://flex_2.5.35.bb" target=
=3D"_blank">flex_2.5.35.bb</a><br>
+++ /dev/null<br>
@@ -1,11 +0,0 @@<br>
-require flex.inc<br>
-PR =3D &quot;r3&quot;<br>
-LICENSE=3D&quot;BSD&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3De4742cf92e89040b39486a6219=
b68067&quot;<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-<br>
-SRC_URI +=3D &quot;file://avoid-FORTIFY-warnings.patch \<br>
- =A0 =A0 =A0 =A0 =A0 =A0file://int-is-not-the-same-size-as-size_t.patch&qu=
ot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;10714e50cea54dc7a227e3eddcd44d57&quot;<br>
-SRC_URI[sha256sum] =3D &quot;0becbd4b2b36b99c67f8c22ab98f7f80c9860aec70f03=
50a0018f29a88704e7b&quot;<br>
diff --git a/meta/recipes-devtools/flex/<a href=3D"http://flex_2.5.37.bb" t=
arget=3D"_blank">flex_2.5.37.bb</a> b/meta/recipes-devtools/flex/<a href=3D=
"http://flex_2.5.37.bb" target=3D"_blank">flex_2.5.37.bb</a><br>
new file mode 100644<br>
index 0000000..e699fee<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/flex/<a href=3D"http://flex_2.5.37.bb" target=
=3D"_blank">flex_2.5.37.bb</a><br>
@@ -0,0 +1,7 @@<br>
+require flex.inc<br>
+LICENSE=3D&quot;BSD&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3De4742cf92e89040b39486a6219=
b68067&quot;<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;c75940e1fc25108f2a7b3ef42abdae06&quot;<br>
+SRC_URI[sha256sum] =3D &quot;17aa7b4ebf19a13bc2dff4115b416365c95f090061539=
a932a68092349ac052a&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10.4<br>
<br></font></span></blockquote><div><br></div><div style>Last time I&#39;ve=
 sent this patch, I&#39;ve been told that it caused some build problems. I =
was unable to reproduce this issue, so if this happens again, please let me=
 know what I need to do in order to reproduce the build failures.</div>

<div style><br></div><div style>Thanks,</div><div style>Bogdan=A0</div></di=
v><br></div></div>

--e89a8f643344325fea04dc5a6bcd--
