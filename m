Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 388CC77E66
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 12:15:02 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id p186so9668931ioe.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7Vw1OoSHtEM2kZlIV7ja2O8r6WJd6E/R5EBo7FS25Wg=;
	b=FEj6gJvTp58h84lTJtQrz/dCWcEPInMKvGToNbG9fehrBWMkwVwMhuUk6uuSwy+xjq
	aKcLu0+Ab4Y8K2EFjgS9roKUkD9MoI3IrQnB+isrvmEPJLeb0fKFTF0MXMK3EETwJpZt
	w6Th6pJZWavUVmdVLQPxnKzFIZge6tcU1O7hQElKXjroAAecIniyQiHeTBdbUf4Ed9Mj
	ylO33lPtnkBCiRiuBy9bSkheqT74e29l1Nxqcr6+RDqf37rhhblcMpJKFpXKfCh1x8G/
	LQZMiCxfzmcR9vdQY0+eHXMgKBOYKGjnmMnVc+iqby9A0bMmEIGhBVLt+jP/5lAuOuoN
	bNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7Vw1OoSHtEM2kZlIV7ja2O8r6WJd6E/R5EBo7FS25Wg=;
	b=dyCQ+5nSRMXZuX0chIvtSJZmL++zSvG/is8QGiKhmi0aRRHBiXHuvKQFCYNg38igEe
	ijuvpPGSUyNaGQyPfYSGV2AMTN/gKBcRts4JPk4gd2tKGIL0SCDcA7UN0hPvRt2xWtvn
	Dapnyl0t0BDdjNiTFPyw1X6UyqXhPTH38qV5271TplbcuGCVF8Cox7J9ktaIbO0ogGkI
	W/w9IN2KlksaDYLVGzwYXpRx4Ho7XDSz/nGkAMTlRw1gaJw5bMA2HOunlsor7E5xbEFA
	tmAOCgcQhKuVMrRYVSPhUqMgRgp2rA/TRuCi2uo+OJtxYtqcXqFIVQ06inTur7x+1dL/
	IEog==
X-Gm-Message-State: AMCzsaWc+QuelHFzP8iBsME1hq4nNI7VPBVfVkw06teXvU8CCTZt/X3s
	ZJ0xloCNapjesjK584Ss7TnB30e6U7X09DmnJFXSbzAW
X-Google-Smtp-Source: AOwi7QAdjeCHO0xTEtWvNeZVvMAxTrFLoaI8u3eKLh2RB9xNnDJMRbIahglcdxpAZP6bu1Yz1Y5T/dz24nik7wBY7DY=
X-Received: by 10.107.36.80 with SMTP id k77mr10854713iok.176.1508156104012;
	Mon, 16 Oct 2017 05:15:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Mon, 16 Oct 2017 05:14:43 -0700 (PDT)
In-Reply-To: <1506614485-31675-3-git-send-email-fabien.lahoudere@collabora.co.uk>
References: <1506614485-31675-1-git-send-email-fabien.lahoudere@collabora.co.uk>
	<1506614485-31675-3-git-send-email-fabien.lahoudere@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Oct 2017 13:14:43 +0100
Message-ID: <CAJTo0Law3mNK557=Nr+Fne3J5KNxwD=vNHO3FvHS=b2i3CkJEA@mail.gmail.com>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 3/3] weston: Bump version to 3.0.0
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
X-List-Received-Date: Mon, 16 Oct 2017 12:15:03 -0000
Content-Type: multipart/alternative; boundary="001a1141909ed88eb9055ba8f4ca"

--001a1141909ed88eb9055ba8f4ca
Content-Type: text/plain; charset="UTF-8"

Fails on the autobuilder when build against musl:

http://errors.yoctoproject.org/Errors/Details/157183/

Ross

On 28 September 2017 at 17:01, Fabien Lahoudere <
fabien.lahoudere@collabora.co.uk> wrote:

> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> ---
>  .../wayland/{weston_2.0.0.bb => weston_3.0.0.bb}          | 15
> +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>  rename meta/recipes-graphics/wayland/{weston_2.0.0.bb => weston_3.0.0.bb}
> (90%)
>
> diff --git a/meta/recipes-graphics/wayland/weston_2.0.0.bb
> b/meta/recipes-graphics/wayland/weston_3.0.0.bb
> similarity index 90%
> rename from meta/recipes-graphics/wayland/weston_2.0.0.bb
> rename to meta/recipes-graphics/wayland/weston_3.0.0.bb
> index 8160f55..6b3fad7 100644
> --- a/meta/recipes-graphics/wayland/weston_2.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_3.0.0.bb
> @@ -9,12 +9,11 @@ SRC_URI = "https://wayland.freedesktop.
> org/releases/${BPN}-${PV}.tar.xz \
>             file://weston.png \
>             file://weston.desktop \
>             file://0001-make-error-portable.patch \
> -           file://0001-configure.ac-Fix-wayland-protocols-path.patch \
>             file://xwayland.weston-start \
>             file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
> \
>  "
> -SRC_URI[md5sum] = "15f38945942bf2a91fe2687145fb4c7d"
> -SRC_URI[sha256sum] = "b4e446ac27f118196f1609dab89bb3
> cb3e81652d981414ad860e733b355365d8"
> +SRC_URI[md5sum] = "9c42a4c51a1b9f35d040fa9d45ada36d"
> +SRC_URI[sha256sum] = "cde1d55e8dd70c3cbb3d1ec72f60e6
> 0000041579caa1d6a262bd9c35e93723a5"
>
>  inherit autotools pkgconfig useradd distro_features_check
>  # depends on virtual/egl
> @@ -76,7 +75,7 @@ PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
>
>  do_install_append() {
>         # Weston doesn't need the .la files to load modules, so wipe them
> -       rm -f ${D}/${libdir}/libweston-2/*.la
> +       rm -f ${D}/${libdir}/libweston-3/*.la
>
>         # If X11, ship a desktop file to launch it
>         if [ "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" ]; then
> @@ -93,16 +92,16 @@ do_install_append() {
>  }
>
>  PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'xwayland',
> '${PN}-xwayland', '', d)} \
> -             libweston-2 ${PN}-examples"
> +             libweston-3 ${PN}-examples"
>
>  FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal
> ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode
> ${libexecdir} ${libdir}/${BPN}/*.so ${datadir}"
>
> -FILES_libweston-2 = "${libdir}/lib*${SOLIBS} ${libdir}/libweston-2/*.so"
> -SUMMARY_libweston-2 = "Helper library for implementing 'wayland window
> managers'."
> +FILES_libweston-3 = "${libdir}/lib*${SOLIBS} ${libdir}/libweston-3/*.so"
> +SUMMARY_libweston-3 = "Helper library for implementing 'wayland window
> managers'."
>
>  FILES_${PN}-examples = "${bindir}/*"
>
> -FILES_${PN}-xwayland = "${libdir}/libweston-2/xwayland.so"
> +FILES_${PN}-xwayland = "${libdir}/libweston-3/xwayland.so"
>  RDEPENDS_${PN}-xwayland += "xserver-xorg-xwayland"
>
>  RDEPENDS_${PN} += "xkeyboard-config"
> --
> 1.8.3.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141909ed88eb9055ba8f4ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Fails on the autobuilder when build against musl:<div><br>=
</div><div><a href=3D"http://errors.yoctoproject.org/Errors/Details/157183/=
">http://errors.yoctoproject.org/Errors/Details/157183/</a><br></div><div><=
br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On 28 September 2017 at 17:01, Fabien Lahoudere <span dir=3D"l=
tr">&lt;<a href=3D"mailto:fabien.lahoudere@collabora.co.uk" target=3D"_blan=
k">fabien.lahoudere@collabora.co.uk</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Signed-off-by: Fabien Lahoudere &lt;<a href=3D"mailto:fabi=
en.lahoudere@collabora.co.uk">fabien.lahoudere@collabora.<wbr>co.uk</a>&gt;=
<br>
---<br>
=C2=A0.../wayland/{<a href=3D"http://weston_2.0.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">weston_2.0.0.bb</a> =3D&gt; <a href=3D"http://weston_3.0.0.=
bb" rel=3D"noreferrer" target=3D"_blank">weston_3.0.0.bb</a>}=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 15 +++++++--------<br>
=C2=A01 file changed, 7 insertions(+), 8 deletions(-)<br>
=C2=A0rename meta/recipes-graphics/wayland/<wbr>{<a href=3D"http://weston_2=
.0.0.bb" rel=3D"noreferrer" target=3D"_blank">weston_2.0.0.bb</a> =3D&gt; <=
a href=3D"http://weston_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">west=
on_3.0.0.bb</a>} (90%)<br>
<br>
diff --git a/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://weston_2.=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">weston_2.0.0.bb</a> b/meta/rec=
ipes-graphics/<wbr>wayland/<a href=3D"http://weston_3.0.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">weston_3.0.0.bb</a><br>
similarity index 90%<br>
rename from meta/recipes-graphics/wayland/<a href=3D"http://weston_2.0.0.bb=
" rel=3D"noreferrer" target=3D"_blank"><wbr>weston_2.0.0.bb</a><br>
rename to meta/recipes-graphics/wayland/<a href=3D"http://weston_3.0.0.bb" =
rel=3D"noreferrer" target=3D"_blank"><wbr>weston_3.0.0.bb</a><br>
index 8160f55..6b3fad7 100644<br>
--- a/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://weston_2.0.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">weston_2.0.0.bb</a><br>
+++ b/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://weston_3.0.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">weston_3.0.0.bb</a><br>
@@ -9,12 +9,11 @@ SRC_URI =3D &quot;<a href=3D"https://wayland.freedesktop.=
org/releases/${BPN}-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">http=
s://wayland.freedesktop.<wbr>org/releases/${BPN}-${PV}.tar.<wbr>xz</a> \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://weston.png \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://weston.desktop \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-make-error-<wbr>porta=
ble.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.ac-Fix-<wbr=
>wayland-protocols-path.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://xwayland.weston-start \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-weston-launch-<wbr>Pr=
ovide-a-default-version-<wbr>that-doesn-t.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>15f38945942bf2a91fe2687145fb4c<wbr>7d&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>b4e446ac27f118196f1609dab89bb3<wbr>cb3e8=
1652d981414ad860e733b3553<wbr>65d8&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>9c42a4c51a1b9f35d040fa9d45ada3<wbr>6d&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>cde1d55e8dd70c3cbb3d1ec72f60e6<wbr>00000=
41579caa1d6a262bd9c35e937<wbr>23a5&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig useradd distro_features_check<br>
=C2=A0# depends on virtual/egl<br>
@@ -76,7 +75,7 @@ PACKAGECONFIG[pam] =3D &quot;--with-pam,--without-pam,<wb=
r>libpam&quot;<br>
<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Weston doesn&#39;t need the .la files to load=
 modules, so wipe them<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/libweston-2/*.<wbr>la<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/libweston-3/*.<wbr>la<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If X11, ship a desktop file to launch it<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${@bb.utils.filter(&#39;DISTRO_<wbr>=
FEATURES&#39;, &#39;x11&#39;, d)}&quot; ]; then<br>
@@ -93,16 +92,16 @@ do_install_append() {<br>
=C2=A0}<br>
<br>
=C2=A0PACKAGES +=3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&#39;=
, &#39;xwayland&#39;, &#39;${PN}-xwayland&#39;, &#39;&#39;, d)} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libweston-2 ${PN}-examples=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libweston-3 ${PN}-examples=
&quot;<br>
<br>
=C2=A0FILES_${PN} =3D &quot;${bindir}/weston ${bindir}/weston-terminal ${bi=
ndir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdi=
r} ${libdir}/${BPN}/*.so ${datadir}&quot;<br>
<br>
-FILES_libweston-2 =3D &quot;${libdir}/lib*${SOLIBS} ${libdir}/libweston-2/=
*.so&quot;<br>
-SUMMARY_libweston-2 =3D &quot;Helper library for implementing &#39;wayland=
 window managers&#39;.&quot;<br>
+FILES_libweston-3 =3D &quot;${libdir}/lib*${SOLIBS} ${libdir}/libweston-3/=
*.so&quot;<br>
+SUMMARY_libweston-3 =3D &quot;Helper library for implementing &#39;wayland=
 window managers&#39;.&quot;<br>
<br>
=C2=A0FILES_${PN}-examples =3D &quot;${bindir}/*&quot;<br>
<br>
-FILES_${PN}-xwayland =3D &quot;${libdir}/libweston-2/<wbr>xwayland.so&quot=
;<br>
+FILES_${PN}-xwayland =3D &quot;${libdir}/libweston-3/<wbr>xwayland.so&quot=
;<br>
=C2=A0RDEPENDS_${PN}-xwayland +=3D &quot;xserver-xorg-xwayland&quot;<br>
<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;xkeyboard-config&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.3.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1141909ed88eb9055ba8f4ca--
