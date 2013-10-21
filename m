Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2F26A6D092
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 18:03:01 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so3719852eaj.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=oq0ww7mrFG07hUdm12FXL+KdalyjsPKInyEvYSL/1Eo=;
	b=jCIWkz/LHcu9+imKi2+HNto9zjm97dUJeANSU7Co0vIo65Gv47bFZx0lehRoPvfYtY
	EX4ABdzbXhVSlDYx2xWpIc6bb0RXmI3AyPU6GvbmMGOsSYKqSPUwQgXw46YBW48kM2eL
	3eqHkjUx7sFWpLB0E3UsMRXFr7dR8gkw44UT/DYmi6trJ4NzAh8PIua4ghdG4Wf4sxJq
	nXBMoLubL3TSXfSX6pzcxYLeyRAO5RfE+O/ebKu4pn+n5JOcP5bKOWpWfP3F55EisR2e
	FgYZdECV1gD1kBAF8RKv0jtvxO5q0GzCf/VO6B/dQ2bfwBDL5RaS4k5bxGYt4yaO3Kgp
	g46g==
MIME-Version: 1.0
X-Received: by 10.14.69.206 with SMTP id n54mr36101eed.118.1382378582557; Mon,
	21 Oct 2013 11:03:02 -0700 (PDT)
Received: by 10.14.206.133 with HTTP; Mon, 21 Oct 2013 11:03:02 -0700 (PDT)
Received: by 10.14.206.133 with HTTP; Mon, 21 Oct 2013 11:03:02 -0700 (PDT)
In-Reply-To: <1382092046-25109-1-git-send-email-david.nystrom@enea.com>
References: <1382018386-25389-12-git-send-email-david.nystrom@enea.com>
	<1382092046-25109-1-git-send-email-david.nystrom@enea.com>
Date: Mon, 21 Oct 2013 20:03:02 +0200
Message-ID: <CAAKB1h1H-TGs0=XX4XaNA_5x2pn-aQznmhkwE_Ha5gunDSfAAw@mail.gmail.com>
From: David Nystrom <david.c.nystrom@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] rpm: Add nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Mon, 21 Oct 2013 18:03:01 -0000
Content-Type: multipart/alternative; boundary=089e0160cf925bc79604e94418fd

--089e0160cf925bc79604e94418fd
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ping?

Was this patch forgotten ?

//DD
On 18 Oct 2013 11:27, "David Nystr=F6m" <david.c.nystrom@gmail.com> wrote:

> Modified FILES-paths since nativesdk can't handle hardcoded paths,
> Also added *.real binaries to packaging since this is not done when built
> as native.
>
> As far as /var having to be hardcoded, I have a hard time seeing someone
> modifying bitbake.conf to place localstatedir somewhere else than /var.
>
> If there exists a target/nativesdk portable way of hardcoding FILES,
> please let me know, and we'll do it that way.
>
> Cleanup of FEATURES, since it was the same for native & target.
>
> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>
> ---
>  meta/recipes-devtools/rpm/rpm_5.4.9.bb | 30
> ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bbb/meta/recipes-devtool=
s/rpm/
> rpm_5.4.9.bb
> index 3c7e03b..9699639 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> @@ -105,12 +105,12 @@ acpaths =3D "-I ${S}/db/dist/aclocal -I
> ${S}/db/dist/aclocal_java"
>  # Specify the default rpm macros in terms of adjustable variables
>  rpm_macros =3D
> "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_tar=
get}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/macros:%{_etcrpm}/%{_target}/mac=
ros:~/.oerpmmacros"
>  rpm_macros_class-native =3D
> "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_tar=
get}/macros:~/.oerpmmacros"
> +rpm_macros_class-nativesdk =3D
> "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_tar=
get}/macros:~/.oerpmmacros"
>
>  # sqlite lua tcl augeas nss gcrypt neon xz xar keyutils perl selinux
>
>  # Note: perl and sqlite w/o db specified does not currently work.
>  #       tcl, augeas, nss, gcrypt, xar and keyutils support is untested.
> -PACKAGECONFIG_class-native ??=3D "db bzip2 zlib beecrypt openssl libelf
> python"
>  PACKAGECONFIG ??=3D "db bzip2 zlib beecrypt openssl libelf python"
>
>  PACKAGECONFIG[bzip2] =3D "--with-bzip2,--without-bzip2,bzip2,"
> @@ -224,8 +224,16 @@ FILES_${PN} =3D  "${bindir}/rpm \
>                 ${libdir}/rpm/bin/rpmrepo \
>                 ${libdir}/rpm/bin/rpmspecdump \
>                 ${libdir}/rpm/bin/wget \
> -               /var/lib/rpm \
> -               /var/cache/rpm \
> +               ${libdir}/rpm \
> +               ${localstatedir}/cache \
> +               ${localstatedir}/cache/rpm \
> +               ${localstatedir}/cache/wdj \
> +               ${localstatedir}/lib \
> +               ${localstatedir}/lib/rpm \
> +               ${localstatedir}/lib/wdj \
> +               ${bindir}/rpm.real \
> +               ${bindir}/rpmconstant.real \
> +               ${bindir}/rpm2cpio.real \
>                 "
>
>  FILES_${PN}-dbg +=3D "${libdir}/rpm/.debug \
> @@ -235,7 +243,7 @@ FILES_${PN}-dbg +=3D "${libdir}/rpm/.debug \
>  FILES_${PN}-common =3D "${bindir}/rpm2cpio \
>                 ${bindir}/gendiff \
>                 ${sysconfdir}/rpm \
> -               /var/spool/repackage \
> +               ${localstatedir}/spool/repackage \
>                 "
>
>  FILES_${PN}-libs =3D "${libdir}/librpm-*.so \
> @@ -250,6 +258,7 @@ RDEPENDS_${PN}-build +=3D "bash"
>
>  FILES_${PN}-build =3D "${prefix}/src/rpm \
>                 ${bindir}/rpmbuild \
> +               ${bindir}/rpmbuild.real \
>                 ${libdir}/rpm/brp-* \
>                 ${libdir}/rpm/check-files \
>                 ${libdir}/rpm/cross-build \
> @@ -313,6 +322,7 @@ FILES_${PN}-build =3D "${prefix}/src/rpm \
>                 "
>  RDEPENDS_${PN} =3D "base-files run-postinsts"
>  RDEPENDS_${PN}_class-native =3D ""
> +RDEPENDS_${PN}_class-nativesdk =3D ""
>  RDEPENDS_${PN}-build =3D "file"
>
>  RDEPENDS_python-rpm =3D "${PN}"
> @@ -452,7 +462,7 @@ do_install_append() {
>
>  }
>
> -do_install_append_class-native() {
> +add_native_wrapper() {
>          create_wrapper ${D}/${bindir}/rpm \
>                 RPM_USRLIBRPM=3D'`dirname
> $''realpath`'/${@os.path.relpath(d.getVar('libdir', True),
> d.getVar('bindir', True))}/rpm \
>                 RPM_ETCRPM=3D'$'{RPM_ETCRPM-'`dirname
> $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True),
> d.getVar('bindir', True))}/rpm} \
> @@ -481,4 +491,12 @@ do_install_append_class-native() {
>         done
>  }
>
> -BBCLASSEXTEND =3D "native"
> +do_install_append_class-native() {
> +       add_native_wrapper
> +}
> +
> +do_install_append_class-nativesdk() {
> +       add_native_wrapper
> +}
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 1.8.3.2
>
>

--089e0160cf925bc79604e94418fd
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Ping?</p>
<p dir=3D"ltr">Was this patch forgotten ?</p>
<p dir=3D"ltr">//DD</p>
<div class=3D"gmail_quote">On 18 Oct 2013 11:27, &quot;David Nystr=F6m&quot=
; &lt;<a href=3D"mailto:david.c.nystrom@gmail.com">david.c.nystrom@gmail.co=
m</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Modified FILES-paths since nativesdk can&#39;t handle hardcoded paths,<br>
Also added *.real binaries to packaging since this is not done when built<b=
r>
as native.<br>
<br>
As far as /var having to be hardcoded, I have a hard time seeing someone<br=
>
modifying bitbake.conf to place localstatedir somewhere else than /var.<br>
<br>
If there exists a target/nativesdk portable way of hardcoding FILES,<br>
please let me know, and we&#39;ll do it that way.<br>
<br>
Cleanup of FEATURES, since it was the same for native &amp; target.<br>
<br>
Signed-off-by: David Nystr=F6m &lt;<a href=3D"mailto:david.nystrom@enea.com=
">david.nystrom@enea.com</a>&gt;<br>
---<br>
=A0meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb" target=3D"_bla=
nk">rpm_5.4.9.bb</a> | 30 ++++++++++++++++++++++++------<br>
=A01 file changed, 24 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb" targ=
et=3D"_blank">rpm_5.4.9.bb</a> b/meta/recipes-devtools/rpm/<a href=3D"http:=
//rpm_5.4.9.bb" target=3D"_blank">rpm_5.4.9.bb</a><br>
index 3c7e03b..9699639 100644<br>
--- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb" target=3D"_=
blank">rpm_5.4.9.bb</a><br>
+++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb" target=3D"_=
blank">rpm_5.4.9.bb</a><br>
@@ -105,12 +105,12 @@ acpaths =3D &quot;-I ${S}/db/dist/aclocal -I ${S}/db/=
dist/aclocal_java&quot;<br>
=A0# Specify the default rpm macros in terms of adjustable variables<br>
=A0rpm_macros =3D &quot;%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_u=
srlibrpm}/poky/%{_target}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/macros:%{_e=
tcrpm}/%{_target}/macros:~/.oerpmmacros&quot;<br>
=A0rpm_macros_class-native =3D &quot;%{_usrlibrpm}/macros:%{_usrlibrpm}/pok=
y/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros&quot;<br>
+rpm_macros_class-nativesdk =3D &quot;%{_usrlibrpm}/macros:%{_usrlibrpm}/po=
ky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros&quot;<br>
<br>
=A0# sqlite lua tcl augeas nss gcrypt neon xz xar keyutils perl selinux<br>
<br>
=A0# Note: perl and sqlite w/o db specified does not currently work.<br>
=A0# =A0 =A0 =A0 tcl, augeas, nss, gcrypt, xar and keyutils support is unte=
sted.<br>
-PACKAGECONFIG_class-native ??=3D &quot;db bzip2 zlib beecrypt openssl libe=
lf python&quot;<br>
=A0PACKAGECONFIG ??=3D &quot;db bzip2 zlib beecrypt openssl libelf python&q=
uot;<br>
<br>
=A0PACKAGECONFIG[bzip2] =3D &quot;--with-bzip2,--without-bzip2,bzip2,&quot;=
<br>
@@ -224,8 +224,16 @@ FILES_${PN} =3D =A0&quot;${bindir}/rpm \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/rpm/bin/rpmrepo \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/rpm/bin/rpmspecdump \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/rpm/bin/wget \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 /var/lib/rpm \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 /var/cache/rpm \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/rpm \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${localstatedir}/cache \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${localstatedir}/cache/rpm \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${localstatedir}/cache/wdj \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${localstatedir}/lib \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${localstatedir}/lib/rpm \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${localstatedir}/lib/wdj \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${bindir}/rpm.real \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${bindir}/rpmconstant.real \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${bindir}/rpm2cpio.real \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
<br>
=A0FILES_${PN}-dbg +=3D &quot;${libdir}/rpm/.debug \<br>
@@ -235,7 +243,7 @@ FILES_${PN}-dbg +=3D &quot;${libdir}/rpm/.debug \<br>
=A0FILES_${PN}-common =3D &quot;${bindir}/rpm2cpio \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${bindir}/gendiff \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${sysconfdir}/rpm \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 /var/spool/repackage \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${localstatedir}/spool/repackage \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
<br>
=A0FILES_${PN}-libs =3D &quot;${libdir}/librpm-*.so \<br>
@@ -250,6 +258,7 @@ RDEPENDS_${PN}-build +=3D &quot;bash&quot;<br>
<br>
=A0FILES_${PN}-build =3D &quot;${prefix}/src/rpm \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${bindir}/rpmbuild \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${bindir}/rpmbuild.real \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/rpm/brp-* \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/rpm/check-files \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/rpm/cross-build \<br>
@@ -313,6 +322,7 @@ FILES_${PN}-build =3D &quot;${prefix}/src/rpm \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
=A0RDEPENDS_${PN} =3D &quot;base-files run-postinsts&quot;<br>
=A0RDEPENDS_${PN}_class-native =3D &quot;&quot;<br>
+RDEPENDS_${PN}_class-nativesdk =3D &quot;&quot;<br>
=A0RDEPENDS_${PN}-build =3D &quot;file&quot;<br>
<br>
=A0RDEPENDS_python-rpm =3D &quot;${PN}&quot;<br>
@@ -452,7 +462,7 @@ do_install_append() {<br>
<br>
=A0}<br>
<br>
-do_install_append_class-native() {<br>
+add_native_wrapper() {<br>
=A0 =A0 =A0 =A0 =A0create_wrapper ${D}/${bindir}/rpm \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 RPM_USRLIBRPM=3D&#39;`dirname $&#39;&#39;re=
alpath`&#39;/${@os.path.relpath(d.getVar(&#39;libdir&#39;, True), d.getVar(=
&#39;bindir&#39;, True))}/rpm \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 RPM_ETCRPM=3D&#39;$&#39;{RPM_ETCRPM-&#39;`d=
irname $&#39;&#39;realpath`&#39;/${@os.path.relpath(d.getVar(&#39;sysconfdi=
r&#39;, True), d.getVar(&#39;bindir&#39;, True))}/rpm} \<br>
@@ -481,4 +491,12 @@ do_install_append_class-native() {<br>
=A0 =A0 =A0 =A0 done<br>
=A0}<br>
<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
+do_install_append_class-native() {<br>
+ =A0 =A0 =A0 add_native_wrapper<br>
+}<br>
+<br>
+do_install_append_class-nativesdk() {<br>
+ =A0 =A0 =A0 add_native_wrapper<br>
+}<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
--<br>
1.8.3.2<br>
<br>
</blockquote></div>

--089e0160cf925bc79604e94418fd--
