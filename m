Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Qf50I-00066F-Bf
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 08:57:34 +0200
Received: by gwb11 with SMTP id 11so731049gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2011 23:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=nGkfr5TjAp2YZ9c94g/lodrtmBwrNaZ7tEGrlCmQyIo=;
	b=VD5kiKnnJgqU9cGWft2IFFSMSHPsc+JjWkzdxHCXDE38QEguOxkU027BOKoFCdfmWA
	Wfi0msrsn92NNM9Zd7h7dNDTU692iv7zCz+Uv7IRZieiApY9i7cf/rNRFwAJR+H4qRge
	eNyPe1xdHfZfLGBJdO61BgH7gdQNAGHUch2Fs=
MIME-Version: 1.0
Received: by 10.91.50.12 with SMTP id c12mr1648390agk.171.1310108021461; Thu,
	07 Jul 2011 23:53:41 -0700 (PDT)
Received: by 10.91.220.7 with HTTP; Thu, 7 Jul 2011 23:53:41 -0700 (PDT)
In-Reply-To: <d188228df9d99be77ec2b3becc354a1fc905ab65.1310081443.git.sgw@linux.intel.com>
References: <cover.1310081443.git.sgw@linux.intel.com>
	<d188228df9d99be77ec2b3becc354a1fc905ab65.1310081443.git.sgw@linux.intel.com>
Date: Fri, 8 Jul 2011 08:53:41 +0200
Message-ID: <CACW_hTYw_nBv=fftJOevnoDCpXXN5OuuGzgT9AXOSziGDaqprA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] eglibc: Add RDEPENDS on bash
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
X-List-Received-Date: Fri, 08 Jul 2011 06:57:34 -0000
Content-Type: multipart/alternative; boundary=001485f9f4163c94c704a7894bda

--001485f9f4163c94c704a7894bda
Content-Type: text/plain; charset=ISO-8859-1

2011/7/8 Saul Wold <sgw@linux.intel.com>

> [YOCTO #1214]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-core/eglibc/eglibc-package.inc |    2 +-
>  meta/recipes-core/eglibc/eglibc.inc         |    2 +-
>  meta/recipes-core/eglibc/eglibc_2.12.bb     |    2 +-
>  meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc
> b/meta/recipes-core/eglibc/eglibc-package.inc
> index 1c6626c..f0fac76 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -69,7 +69,7 @@ FILES_eglibc-utils = "${bindir}/* ${sbindir}/*"
>  FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
>  FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
>  RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
> -EDEPENDS_eglibc-utils = "libsotruss"
> +RDEPENDS_eglibc-utils += "libsotruss bash"
>  FILES_eglibc-pcprofile = "${base_libdir}/libpcprofile.so"
>  FILES_eglibc-thread-db${PKGSUFFIX} = "${base_libdir}/libthread_db*"
>  RPROVIDES_eglibc-dev += "libc-dev"
> diff --git a/meta/recipes-core/eglibc/eglibc.inc
> b/meta/recipes-core/eglibc/eglibc.inc
> index 74afb9d..058d58e 100644
> --- a/meta/recipes-core/eglibc/eglibc.inc
> +++ b/meta/recipes-core/eglibc/eglibc.inc
> @@ -22,7 +22,7 @@ siteconfig_do_siteconfig_gencache_prepend = " \
>  # nptl needs unwind support in gcc, which can't be built without glibc.
>  DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
>  #this leads to circular deps, so lets not add it yet
> -#RDEPENDS_ldd += " bash"
> +RDEPENDS_ldd += " bash"
>

Ah ok, now see that this is only for ldd.
In that case the commit message is misleading. (and probably also not
conformant with the commit message policy).

Frans


>  # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
>  #RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
>  PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
> diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bbb/meta/recipes-core/eglibc/
> eglibc_2.12.bb
> index 85d58fa..fd7b485 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.12.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
> @@ -1,7 +1,7 @@
>  require eglibc.inc
>
>  DEPENDS += "gperf-native"
> -PR = "r18"
> +PR = "r19"
>
>  SRCREV = "14158"
>
> diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bbb/meta/recipes-core/eglibc/
> eglibc_2.13.bb
> index 7986131..be65787 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.13.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
> @@ -4,7 +4,7 @@ SRCREV = "14157"
>
>  DEPENDS += "gperf-native"
>  FILESPATHPKG =. "eglibc-svn:"
> -PR = "r5"
> +PR = "r6"
>  PR_append = "+svnr${SRCPV}"
>
>  EGLIBC_BRANCH="eglibc-2_13"
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--001485f9f4163c94c704a7894bda
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/7/8 Saul Wold <span dir=3D"ltr">&lt=
;<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</a>&gt;</span><=
br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; bo=
rder-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
[YOCTO #1214]<br>
<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;<br>
---<br>
=A0meta/recipes-core/eglibc/eglibc-package.inc | =A0 =A02 +-<br>
=A0meta/recipes-core/eglibc/eglibc.inc =A0 =A0 =A0 =A0 | =A0 =A02 +-<br>
=A0meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.12.bb" target=3D"_bl=
ank">eglibc_2.12.bb</a> =A0 =A0 | =A0 =A02 +-<br>
=A0meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.13.bb" target=3D"_bl=
ank">eglibc_2.13.bb</a> =A0 =A0 | =A0 =A02 +-<br>
=A04 files changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-cor=
e/eglibc/eglibc-package.inc<br>
index 1c6626c..f0fac76 100644<br>
--- a/meta/recipes-core/eglibc/eglibc-package.inc<br>
+++ b/meta/recipes-core/eglibc/eglibc-package.inc<br>
@@ -69,7 +69,7 @@ FILES_eglibc-utils =3D &quot;${bindir}/* ${sbindir}/*&quo=
t;<br>
=A0FILES_${PN}-dbg +=3D &quot;${libexecdir}/*/.debug ${libdir}/audit/.debug=
&quot;<br>
=A0FILES_catchsegv${PKGSUFFIX} =3D &quot;${bindir}/catchsegv&quot;<br>
=A0RDEPENDS_catchsegv${PKGSUFFIX} =3D &quot;libsegfault&quot;<br>
-EDEPENDS_eglibc-utils =3D &quot;libsotruss&quot;<br>
+RDEPENDS_eglibc-utils +=3D &quot;libsotruss bash&quot;<br>
=A0FILES_eglibc-pcprofile =3D &quot;${base_libdir}/libpcprofile.so&quot;<br=
>
=A0FILES_eglibc-thread-db${PKGSUFFIX} =3D &quot;${base_libdir}/libthread_db=
*&quot;<br>
=A0RPROVIDES_eglibc-dev +=3D &quot;libc-dev&quot;<br>
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc=
/eglibc.inc<br>
index 74afb9d..058d58e 100644<br>
--- a/meta/recipes-core/eglibc/eglibc.inc<br>
+++ b/meta/recipes-core/eglibc/eglibc.inc<br>
@@ -22,7 +22,7 @@ siteconfig_do_siteconfig_gencache_prepend =3D &quot; \<br=
>
=A0# nptl needs unwind support in gcc, which can&#39;t be built without gli=
bc.<br>
=A0DEPENDS =3D &quot;virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-he=
aders&quot;<br>
=A0#this leads to circular deps, so lets not add it yet<br>
-#RDEPENDS_ldd +=3D &quot; bash&quot;<br>
+RDEPENDS_ldd +=3D &quot; bash&quot;<br></blockquote><div><br>Ah ok, now se=
e that this is only for ldd.<br>In that case the commit message is misleadi=
ng. (and probably also not conformant with the commit message policy).<br>
<br>Frans<br>=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-lef=
t: 1ex;">
=A0# nptl needs libgcc but dlopens it, so our shlibs code doesn&#39;t detec=
t this<br>
=A0#RDEPENDS_${PN} +=3D &quot;${@[&#39;&#39;,&#39;libgcc&#39;][&#39;nptl&#3=
9; in &#39;${GLIBC_ADDONS}&#39;]}&quot;<br>
=A0PROVIDES =3D &quot;virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc&quo=
t;<br>
diff --git a/meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.12.bb" tar=
get=3D"_blank">eglibc_2.12.bb</a> b/meta/recipes-core/eglibc/<a href=3D"htt=
p://eglibc_2.12.bb" target=3D"_blank">eglibc_2.12.bb</a><br>
index 85d58fa..fd7b485 100644<br>
--- a/meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.12.bb" target=3D"=
_blank">eglibc_2.12.bb</a><br>
+++ b/meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.12.bb" target=3D"=
_blank">eglibc_2.12.bb</a><br>
@@ -1,7 +1,7 @@<br>
=A0require eglibc.inc<br>
<br>
=A0DEPENDS +=3D &quot;gperf-native&quot;<br>
-PR =3D &quot;r18&quot;<br>
+PR =3D &quot;r19&quot;<br>
<br>
=A0SRCREV =3D &quot;14158&quot;<br>
<br>
diff --git a/meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.13.bb" tar=
get=3D"_blank">eglibc_2.13.bb</a> b/meta/recipes-core/eglibc/<a href=3D"htt=
p://eglibc_2.13.bb" target=3D"_blank">eglibc_2.13.bb</a><br>
index 7986131..be65787 100644<br>
--- a/meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.13.bb" target=3D"=
_blank">eglibc_2.13.bb</a><br>
+++ b/meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.13.bb" target=3D"=
_blank">eglibc_2.13.bb</a><br>
@@ -4,7 +4,7 @@ SRCREV =3D &quot;14157&quot;<br>
<br>
=A0DEPENDS +=3D &quot;gperf-native&quot;<br>
=A0FILESPATHPKG =3D. &quot;eglibc-svn:&quot;<br>
-PR =3D &quot;r5&quot;<br>
+PR =3D &quot;r6&quot;<br>
=A0PR_append =3D &quot;+svnr${SRCPV}&quot;<br>
<br>
=A0EGLIBC_BRANCH=3D&quot;eglibc-2_13&quot;<br>
<font color=3D"#888888">--<br>
1.7.3.4<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></blockquote></div><br>

--001485f9f4163c94c704a7894bda--
