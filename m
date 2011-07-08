Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qf587-0006Wy-4j
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 09:05:39 +0200
Received: by fxh10 with SMTP id 10so2015431fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 00:01:46 -0700 (PDT)
Received: by 10.223.67.194 with SMTP id s2mr2588722fai.124.1310108506677;
	Fri, 08 Jul 2011 00:01:46 -0700 (PDT)
Received: from [10.105.55.80] (62-50-199-254.client.stsn.net [62.50.199.254])
	by mx.google.com with ESMTPS id m6sm5138479fac.1.2011.07.08.00.01.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jul 2011 00:01:45 -0700 (PDT)
References: <cover.1310081443.git.sgw@linux.intel.com>
	<d188228df9d99be77ec2b3becc354a1fc905ab65.1310081443.git.sgw@linux.intel.com>
	<CACW_hTYw_nBv=fftJOevnoDCpXXN5OuuGzgT9AXOSziGDaqprA@mail.gmail.com>
In-Reply-To: <CACW_hTYw_nBv=fftJOevnoDCpXXN5OuuGzgT9AXOSziGDaqprA@mail.gmail.com>
Mime-Version: 1.0 (iPhone Mail 8J2)
Message-Id: <A538C871-F8A8-4F13-BAD7-F883E76EF0C5@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8J2)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 8 Jul 2011 08:01:39 +0100
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
X-List-Received-Date: Fri, 08 Jul 2011 07:05:39 -0000
Content-Transfer-Encoding: 7bit
Content-Type: multipart/alternative;
	boundary=Apple-Mail-6--1058661119

--Apple-Mail-6--1058661119
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 8 jul. 2011 om 07:53 heeft Frans Meulenbroeks <fransmeulenbroeks@gmail.co=
m> het volgende geschreven:

>=20
>=20
> 2011/7/8 Saul Wold <sgw@linux.intel.com>
> [YOCTO #1214]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-core/eglibc/eglibc-package.inc |    2 +-
>  meta/recipes-core/eglibc/eglibc.inc         |    2 +-
>  meta/recipes-core/eglibc/eglibc_2.12.bb     |    2 +-
>  meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-co=
re/eglibc/eglibc-package.inc
> index 1c6626c..f0fac76 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -69,7 +69,7 @@ FILES_eglibc-utils =3D"${bindir}/* ${sbindir}/*"
>  FILES_${PN}-dbg +=3D"${libexecdir}/*/.debug ${libdir}/audit/.debug"
>  FILES_catchsegv${PKGSUFFIX} =3D"${bindir}/catchsegv"
>  RDEPENDS_catchsegv${PKGSUFFIX} =3D"libsegfault"
> -EDEPENDS_eglibc-utils =3D"libsotruss"
> +RDEPENDS_eglibc-utils +=3D"libsotruss bash"
>  FILES_eglibc-pcprofile =3D"${base_libdir}/libpcprofile.so"
>  FILES_eglibc-thread-db${PKGSUFFIX} =3D"${base_libdir}/libthread_db*"
>  RPROVIDES_eglibc-dev +=3D"libc-dev"
> diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglib=
c/eglibc.inc
> index 74afb9d..058d58e 100644
> --- a/meta/recipes-core/eglibc/eglibc.inc
> +++ b/meta/recipes-core/eglibc/eglibc.inc
> @@ -22,7 +22,7 @@ siteconfig_do_siteconfig_gencache_prepend =3D" \
>  # nptl needs unwind support in gcc, which can't be built without glibc.
>  DEPENDS =3D"virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
>  #this leads to circular deps, so lets not add it yet
> -#RDEPENDS_ldd +=3D" bash"
> +RDEPENDS_ldd +=3D" bash"
>=20
> Ah ok, now see that this is only for ldd.
> In that case the commit message is misleading. (and probably also not conf=
ormant with the commit message policy).
>=20

there's an ldd-unbash patch in . dev




> Frans
> =20
>  # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect thi=
s
>  #RDEPENDS_${PN} +=3D"${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
>  PROVIDES =3D"virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
> diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/e=
glibc/eglibc_2.12.bb
> index 85d58fa..fd7b485 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.12.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
> @@ -1,7 +1,7 @@
>  require eglibc.inc
>=20
>  DEPENDS +=3D"gperf-native"
> -PR =3D"r18"
> +PR =3D"r19"
>=20
>  SRCREV =3D"14158"
>=20
> diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/e=
glibc/eglibc_2.13.bb
> index 7986131..be65787 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.13.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
> @@ -4,7 +4,7 @@ SRCREV =3D"14157"
>=20
>  DEPENDS +=3D"gperf-native"
>  FILESPATHPKG =3D. "eglibc-svn:"
> -PR =3D"r5"
> +PR =3D"r6"
>  PR_append =3D"+svnr${SRCPV}"
>=20
>  EGLIBC_BRANCH=3D"eglibc-2_13"
> --
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--Apple-Mail-6--1058661119
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=utf-8

<html><body bgcolor="#FFFFFF"><div><br><br>Op 8 jul. 2011 om 07:53 heeft Frans Meulenbroeks &lt;<a href="mailto:fransmeulenbroeks@gmail.com">fransmeulenbroeks@gmail.com</a>&gt; het volgende geschreven:<br><br></div><div></div><blockquote type="cite"><div><br><br><div class="gmail_quote">2011/7/8 Saul Wold <span dir="ltr">&lt;<a href="mailto:sgw@linux.intel.com"><a href="mailto:sgw@linux.intel.com">sgw@linux.intel.com</a></a>&gt;</span><br><blockquote class="gmail_quote" style="margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
[YOCTO #1214]<br>
<br>
Signed-off-by: Saul Wold &lt;<a href="mailto:sgw@linux.intel.com"><a href="mailto:sgw@linux.intel.com">sgw@linux.intel.com</a></a>&gt;<br>
---<br>
&nbsp;meta/recipes-core/eglibc/eglibc-package.inc | &nbsp; &nbsp;2 +-<br>
&nbsp;meta/recipes-core/eglibc/eglibc.inc &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp;2 +-<br>
&nbsp;meta/recipes-core/eglibc/<a href="http://eglibc_2.12.bb" target="_blank">eglibc_2.12.bb</a> &nbsp; &nbsp; | &nbsp; &nbsp;2 +-<br>
&nbsp;meta/recipes-core/eglibc/<a href="http://eglibc_2.13.bb" target="_blank">eglibc_2.13.bb</a> &nbsp; &nbsp; | &nbsp; &nbsp;2 +-<br>
&nbsp;4 files changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc<br>
index 1c6626c..f0fac76 100644<br>
--- a/meta/recipes-core/eglibc/eglibc-package.inc<br>
+++ b/meta/recipes-core/eglibc/eglibc-package.inc<br>
@@ -69,7 +69,7 @@ FILES_eglibc-utils ="${bindir}/* ${sbindir}/*"<br>
&nbsp;FILES_${PN}-dbg +="${libexecdir}/*/.debug ${libdir}/audit/.debug"<br>
&nbsp;FILES_catchsegv${PKGSUFFIX} ="${bindir}/catchsegv"<br>
&nbsp;RDEPENDS_catchsegv${PKGSUFFIX} ="libsegfault"<br>
-EDEPENDS_eglibc-utils ="libsotruss"<br>
+RDEPENDS_eglibc-utils +="libsotruss bash"<br>
&nbsp;FILES_eglibc-pcprofile ="${base_libdir}/libpcprofile.so"<br>
&nbsp;FILES_eglibc-thread-db${PKGSUFFIX} ="${base_libdir}/libthread_db*"<br>
&nbsp;RPROVIDES_eglibc-dev +="libc-dev"<br>
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc<br>
index 74afb9d..058d58e 100644<br>
--- a/meta/recipes-core/eglibc/eglibc.inc<br>
+++ b/meta/recipes-core/eglibc/eglibc.inc<br>
@@ -22,7 +22,7 @@ siteconfig_do_siteconfig_gencache_prepend =" \<br>
&nbsp;# nptl needs unwind support in gcc, which can't be built without glibc.<br>
&nbsp;DEPENDS ="virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"<br>
&nbsp;#this leads to circular deps, so lets not add it yet<br>
-#RDEPENDS_ldd +=" bash"<br>
+RDEPENDS_ldd +=" bash"<br></blockquote><div><br>Ah ok, now see that this is only for ldd.<br>In that case the commit message is misleading. (and probably also not conformant with the commit message policy).<br>
<br></div></div></div></blockquote><div><br></div><div>there's an ldd-unbash patch in . dev</div><div><br></div><div><br></div><div><br></div><br><blockquote type="cite"><div><div class="gmail_quote"><div>Frans<br>&nbsp;<br></div><blockquote class="gmail_quote" style="margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
&nbsp;# nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this<br>
&nbsp;#RDEPENDS_${PN} +="${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"<br>
&nbsp;PROVIDES ="virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"<br>
diff --git a/meta/recipes-core/eglibc/<a href="http://eglibc_2.12.bb" target="_blank">eglibc_2.12.bb</a> b/meta/recipes-core/eglibc/<a href="http://eglibc_2.12.bb" target="_blank">eglibc_2.12.bb</a><br>
index 85d58fa..fd7b485 100644<br>
--- a/meta/recipes-core/eglibc/<a href="http://eglibc_2.12.bb" target="_blank">eglibc_2.12.bb</a><br>
+++ b/meta/recipes-core/eglibc/<a href="http://eglibc_2.12.bb" target="_blank">eglibc_2.12.bb</a><br>
@@ -1,7 +1,7 @@<br>
&nbsp;require eglibc.inc<br>
<br>
&nbsp;DEPENDS +="gperf-native"<br>
-PR ="r18"<br>
+PR ="r19"<br>
<br>
&nbsp;SRCREV ="14158"<br>
<br>
diff --git a/meta/recipes-core/eglibc/<a href="http://eglibc_2.13.bb" target="_blank">eglibc_2.13.bb</a> b/meta/recipes-core/eglibc/<a href="http://eglibc_2.13.bb" target="_blank">eglibc_2.13.bb</a><br>
index 7986131..be65787 100644<br>
--- a/meta/recipes-core/eglibc/<a href="http://eglibc_2.13.bb" target="_blank">eglibc_2.13.bb</a><br>
+++ b/meta/recipes-core/eglibc/<a href="http://eglibc_2.13.bb" target="_blank">eglibc_2.13.bb</a><br>
@@ -4,7 +4,7 @@ SRCREV ="14157"<br>
<br>
&nbsp;DEPENDS +="gperf-native"<br>
&nbsp;FILESPATHPKG =. "eglibc-svn:"<br>
-PR ="r5"<br>
+PR ="r6"<br>
&nbsp;PR_append ="+svnr${SRCPV}"<br>
<br>
&nbsp;EGLIBC_BRANCH="eglibc-2_13"<br>
<font color="#888888">--<br>
1.7.3.4<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href="mailto:Openembedded-core@lists.openembedded.org"><a href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a></a><br>
<a href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core" target="_blank"><a href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a></a><br>
</font></blockquote></div><br>
</div></blockquote><blockquote type="cite"><div><span>_______________________________________________</span><br><span>Openembedded-core mailing list</span><br><span><a href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a></span><br><span><a href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a></span><br></div></blockquote></body></html>

--Apple-Mail-6--1058661119--
