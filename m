Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id A731B72374
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 07:46:46 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id j5so6721960qga.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 23:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qikuQUn6MyG6avtid/trcouQEaBUe6sv7cSYaSYoJNs=;
	b=lxsokd2pUlPoJMkfaUULJOw/dyIuR1LP4LCzxF6ruGYekkYAarft1Xc+lX2opsD0na
	PmBeP4I/8UIuahnlqbqGBTB0hRs9OpHBxIZMZaHUiozTwuyWXG2mZznc45zKQYDlDsji
	p6KKRDotSKcKEk5lQ/b0TAR7vUGvvP63HkPGGuKsWmCOANWVe+8MMJZvwfz1eHzMgAoa
	6CkLT+DB+CAmzB5vwD23NZax7wKysnI+H8F3DtnNcRBWw9iNFv+lmRvag3O/aGEPYkAi
	Gdquxs7M74GYJ1XChAWiEfihJ7PQTzKEA9oifJMV7y6fsnZZu3PTwGj3JAMVg3AALB3g
	hyhg==
X-Gm-Message-State: ALoCoQkANXruHQ4w6IUyPbMbnwiLAfD47GIWIXNW2jV+EnKYJHtGuLhn24W5GUEupop0FFcjvpzq
X-Received: by 10.140.104.234 with SMTP id a97mr6934652qgf.80.1423727207586;
	Wed, 11 Feb 2015 23:46:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 11 Feb 2015 23:46:27 -0800 (PST)
In-Reply-To: <1423500745-2142-2-git-send-email-ben.shelton@ni.com>
References: <1423500745-2142-1-git-send-email-ben.shelton@ni.com>
	<1423500745-2142-2-git-send-email-ben.shelton@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Feb 2015 07:46:27 +0000
Message-ID: <CAJTo0LbvkV1kVy3f_Qy95FCCAuZcJkqwRR_3v2FdoYrha6B51Q@mail.gmail.com>
To: Ben Shelton <ben.shelton@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernelshark: Update to version 2.5.2
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
X-List-Received-Date: Thu, 12 Feb 2015 07:46:49 -0000
Content-Type: multipart/alternative; boundary=001a11352ee27738bd050edf52ef

--001a11352ee27738bd050edf52ef
Content-Type: text/plain; charset=UTF-8

Hi Ben,

This is failing on the autobuilder:

http://errors.yoctoproject.org/Errors/Details/8571/
http://errors.yoctoproject.org/Errors/Details/8572/

Two problems - an exception during build that is probably being ignored,
and then swing not found.  Is swig a non-deterministic dependency?

Ross

On 9 February 2015 at 16:52, Ben Shelton <ben.shelton@ni.com> wrote:

> Update to version 2.5.2 to match trace-cmd.
>
> Changes include:
>
>  - Remove kernelshark-fix-syntax-error-of-shell.patch (the syntax error
>    is no longer present in the new version).
>
>  - Specify bindir_relative and libdir in EXTRA_OEMAKE as in the
>    trace-cmd recipe so files get installed to the right place.
>    Additionally, remove unnecessary EXTRA_OEMAKE options.
>
>  - Fix up the do_install steps to remove the plugins directory; that
>    directory now lives under /usr/lib.
>
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> ---
>  .../kernelshark-fix-syntax-error-of-shell.patch    | 30
> ----------------------
>  .../{kernelshark_1.2.bb => kernelshark_git.bb}     | 17 +++++++-----
>  2 files changed, 10 insertions(+), 37 deletions(-)
>  delete mode 100644
> meta/recipes-kernel/trace-cmd/kernelshark/kernelshark-fix-syntax-error-of-shell.patch
>  rename meta/recipes-kernel/trace-cmd/{kernelshark_1.2.bb =>
> kernelshark_git.bb} (58%)
>
> diff --git
> a/meta/recipes-kernel/trace-cmd/kernelshark/kernelshark-fix-syntax-error-of-shell.patch
> b/meta/recipes-kernel/trace-cmd/kernelshark/kernelshark-fix-syntax-error-of-shell.patch
> deleted file mode 100644
> index faef049..0000000
> ---
> a/meta/recipes-kernel/trace-cmd/kernelshark/kernelshark-fix-syntax-error-of-shell.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -kernelshark: fix syntax error of shell
> -
> -Delete "<<<" syntax of bash in Makefile, else we would get following
> error:
> -
> -       Syntax error: redirection unexpected
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ----
> - Makefile |    3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index c1fa906..be84415 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -89,8 +89,7 @@ endif
> -
> - # $(call test-build, snippet, ret) -> ret if snippet compiles
> - #                                  -> empty otherwise
> --test-build = $(if $(shell $(CC) -o /dev/null -c -x c - > /dev/null 2>&1 \
> --                        <<<'$1' && echo y), $2)
> -+test-build = $(if $(shell echo '$1' |$(CC) -o /dev/null -c -x c - >
> /dev/null 2>&1 && echo y), $2)
> -
> - # have udis86 disassembler library?
> - udis86-flags := $(call test-build,\#include <udis86.h>,-DHAVE_UDIS86
> -ludis86)
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
> b/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
> similarity index 58%
> rename from meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
> rename to meta/recipes-kernel/trace-cmd/kernelshark_git.bb
> index 28412c7..814e8bf 100644
> --- a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
> +++ b/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
> @@ -9,9 +9,12 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>  DEPENDS = "gtk+ libxml2"
>  RDEPENDS_${PN} = "trace-cmd"
>
> -SRC_URI_append = "file://kernelshark-fix-syntax-error-of-shell.patch"
> -
> -EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}' 'prefix=${prefix}' gui"
> +EXTRA_OEMAKE = "\
> +    'prefix=${prefix}' \
> +    'bindir_relative=${@oe.path.relative(prefix, bindir)}' \
> +    'libdir=${@oe.path.relative(prefix, libdir)}' \
> +    gui \
> +"
>
>  do_compile_prepend() {
>      # Make sure the recompile is OK
> @@ -19,8 +22,8 @@ do_compile_prepend() {
>  }
>
>  do_install() {
> -       oe_runmake CC="${CC}" AR="${AR}" prefix="${prefix}" DESTDIR="${D}"
> install_gui
> -       rm ${D}${bindir}/trace-cmd
> -       rm -rf ${D}${datadir}/trace-cmd
> -       rmdir ${D}${datadir}
> +    oe_runmake DESTDIR="${D}" install_gui
> +    rm ${D}${bindir}/trace-cmd
> +    rm -rf ${D}${libdir}/trace-cmd
> +    rmdir ${D}${libdir}
>  }
> --
> 2.3.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11352ee27738bd050edf52ef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ben,<div><br></div><div>This is failing on the autobuil=
der:</div><div><br></div><div><a href=3D"http://errors.yoctoproject.org/Err=
ors/Details/8571/">http://errors.yoctoproject.org/Errors/Details/8571/</a><=
br></div><div><a href=3D"http://errors.yoctoproject.org/Errors/Details/8572=
/">http://errors.yoctoproject.org/Errors/Details/8572/</a><br></div><div><b=
r></div><div>Two problems - an exception during build that is probably bein=
g ignored, and then swing not found.=C2=A0 Is swig a non-deterministic depe=
ndency?</div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On 9 February 2015 at 16:52, Ben Shelton <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:ben.shelton@ni.com" target=3D"_blank"=
>ben.shelton@ni.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Update to version 2.5.2 to match trace-cmd.<br>
<br>
Changes include:<br>
<br>
=C2=A0- Remove kernelshark-fix-syntax-error-of-shell.patch (the syntax erro=
r<br>
=C2=A0 =C2=A0is no longer present in the new version).<br>
<br>
=C2=A0- Specify bindir_relative and libdir in EXTRA_OEMAKE as in the<br>
=C2=A0 =C2=A0trace-cmd recipe so files get installed to the right place.<br=
>
=C2=A0 =C2=A0Additionally, remove unnecessary EXTRA_OEMAKE options.<br>
<br>
=C2=A0- Fix up the do_install steps to remove the plugins directory; that<b=
r>
=C2=A0 =C2=A0directory now lives under /usr/lib.<br>
<br>
Signed-off-by: Ben Shelton &lt;<a href=3D"mailto:ben.shelton@ni.com">ben.sh=
elton@ni.com</a>&gt;<br>
---<br>
=C2=A0.../kernelshark-fix-syntax-error-of-shell.patch=C2=A0 =C2=A0 | 30 ---=
-------------------<br>
=C2=A0.../{<a href=3D"http://kernelshark_1.2.bb" target=3D"_blank">kernelsh=
ark_1.2.bb</a> =3D&gt; <a href=3D"http://kernelshark_git.bb" target=3D"_bla=
nk">kernelshark_git.bb</a>}=C2=A0 =C2=A0 =C2=A0| 17 +++++++-----<br>
=C2=A02 files changed, 10 insertions(+), 37 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-kernel/trace-cmd/kernelshark/kernelsh=
ark-fix-syntax-error-of-shell.patch<br>
=C2=A0rename meta/recipes-kernel/trace-cmd/{<a href=3D"http://kernelshark_1=
.2.bb" target=3D"_blank">kernelshark_1.2.bb</a> =3D&gt; <a href=3D"http://k=
ernelshark_git.bb" target=3D"_blank">kernelshark_git.bb</a>} (58%)<br>
<br>
diff --git a/meta/recipes-kernel/trace-cmd/kernelshark/kernelshark-fix-synt=
ax-error-of-shell.patch b/meta/recipes-kernel/trace-cmd/kernelshark/kernels=
hark-fix-syntax-error-of-shell.patch<br>
deleted file mode 100644<br>
index faef049..0000000<br>
--- a/meta/recipes-kernel/trace-cmd/kernelshark/kernelshark-fix-syntax-erro=
r-of-shell.patch<br>
+++ /dev/null<br>
@@ -1,30 +0,0 @@<br>
-kernelshark: fix syntax error of shell<br>
-<br>
-Delete &quot;&lt;&lt;&lt;&quot; syntax of bash in Makefile, else we would =
get following error:<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0Syntax error: redirection unexpected<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Chong Lu &lt;<a href=3D"mailto:Chong.Lu@windriver.com">Chon=
g.Lu@windriver.com</a>&gt;<br>
----<br>
- Makefile |=C2=A0 =C2=A0 3 +--<br>
- 1 file changed, 1 insertion(+), 2 deletions(-)<br>
-<br>
-diff --git a/Makefile b/Makefile<br>
-index c1fa906..be84415 100644<br>
---- a/Makefile<br>
-+++ b/Makefile<br>
-@@ -89,8 +89,7 @@ endif<br>
-<br>
- # $(call test-build, snippet, ret) -&gt; ret if snippet compiles<br>
- #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -&gt; empty otherwise<br>
--test-build =3D $(if $(shell $(CC) -o /dev/null -c -x c - &gt; /dev/null 2=
&gt;&amp;1 \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &lt;&lt;&lt;&#39;$1&#39; &amp;&amp; echo y), $2)<br>
-+test-build =3D $(if $(shell echo &#39;$1&#39; |$(CC) -o /dev/null -c -x c=
 - &gt; /dev/null 2&gt;&amp;1 &amp;&amp; echo y), $2)<br>
-<br>
- # have udis86 disassembler library?<br>
- udis86-flags :=3D $(call test-build,\#include &lt;udis86.h&gt;,-DHAVE_UDI=
S86 -ludis86)<br>
---<br>
-1.7.9.5<br>
-<br>
diff --git a/meta/recipes-kernel/trace-cmd/<a href=3D"http://kernelshark_1.=
2.bb" target=3D"_blank">kernelshark_1.2.bb</a> b/meta/recipes-kernel/trace-=
cmd/<a href=3D"http://kernelshark_git.bb" target=3D"_blank">kernelshark_git=
.bb</a><br>
similarity index 58%<br>
rename from meta/recipes-kernel/trace-cmd/<a href=3D"http://kernelshark_1.2=
.bb" target=3D"_blank">kernelshark_1.2.bb</a><br>
rename to meta/recipes-kernel/trace-cmd/<a href=3D"http://kernelshark_git.b=
b" target=3D"_blank">kernelshark_git.bb</a><br>
index 28412c7..814e8bf 100644<br>
--- a/meta/recipes-kernel/trace-cmd/<a href=3D"http://kernelshark_1.2.bb" t=
arget=3D"_blank">kernelshark_1.2.bb</a><br>
+++ b/meta/recipes-kernel/trace-cmd/<a href=3D"http://kernelshark_git.bb" t=
arget=3D"_blank">kernelshark_git.bb</a><br>
@@ -9,9 +9,12 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D751419260a=
a954499f7abaabaa882bbe \<br>
=C2=A0DEPENDS =3D &quot;gtk+ libxml2&quot;<br>
=C2=A0RDEPENDS_${PN} =3D &quot;trace-cmd&quot;<br>
<br>
-SRC_URI_append =3D &quot;file://kernelshark-fix-syntax-error-of-shell.patc=
h&quot;<br>
-<br>
-EXTRA_OEMAKE =3D &quot;&#39;CC=3D${CC}&#39; &#39;AR=3D${AR}&#39; &#39;pref=
ix=3D${prefix}&#39; gui&quot;<br>
+EXTRA_OEMAKE =3D &quot;\<br>
+=C2=A0 =C2=A0 &#39;prefix=3D${prefix}&#39; \<br>
+=C2=A0 =C2=A0 &#39;bindir_relative=3D${@oe.path.relative(prefix, bindir)}&=
#39; \<br>
+=C2=A0 =C2=A0 &#39;libdir=3D${@oe.path.relative(prefix, libdir)}&#39; \<br=
>
+=C2=A0 =C2=A0 gui \<br>
+&quot;<br>
<br>
=C2=A0do_compile_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0# Make sure the recompile is OK<br>
@@ -19,8 +22,8 @@ do_compile_prepend() {<br>
=C2=A0}<br>
<br>
=C2=A0do_install() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake CC=3D&quot;${CC}&quot; AR=3D&quot;${=
AR}&quot; prefix=3D&quot;${prefix}&quot; DESTDIR=3D&quot;${D}&quot; install=
_gui<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${bindir}/trace-cmd<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${datadir}/trace-cmd<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rmdir ${D}${datadir}<br>
+=C2=A0 =C2=A0 oe_runmake DESTDIR=3D&quot;${D}&quot; install_gui<br>
+=C2=A0 =C2=A0 rm ${D}${bindir}/trace-cmd<br>
+=C2=A0 =C2=A0 rm -rf ${D}${libdir}/trace-cmd<br>
+=C2=A0 =C2=A0 rmdir ${D}${libdir}<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.3.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--001a11352ee27738bd050edf52ef--
