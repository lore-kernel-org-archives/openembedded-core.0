Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 924C571B87
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 16:29:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id CDF25260DD5
Message-ID: <1508171375.9509.49.camel@collabora.co.uk>
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Oct 2017 18:29:35 +0200
In-Reply-To: <CAJTo0Law3mNK557=Nr+Fne3J5KNxwD=vNHO3FvHS=b2i3CkJEA@mail.gmail.com>
References: <1506614485-31675-1-git-send-email-fabien.lahoudere@collabora.co.uk>
	<1506614485-31675-3-git-send-email-fabien.lahoudere@collabora.co.uk>
	<CAJTo0Law3mNK557=Nr+Fne3J5KNxwD=vNHO3FvHS=b2i3CkJEA@mail.gmail.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 16 Oct 2017 16:29:39 -0000
Content-Type: multipart/alternative; boundary="=-0CvsqZ5moFWxaM9tPBxR"

--=-0CvsqZ5moFWxaM9tPBxR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Ross
I fix this by adding "#include <time.h>" in shared/timespec-util.hI will send a v5
Thanks
Fabien
On Mon, 2017-10-16 at 13:14 +0100, Burton, Ross wrote:
> Fails on the autobuilder when build against musl:
> http://errors.yoctoproject.org/Errors/Details/157183/
> 
> Ross
> On 28 September 2017 at 17:01, Fabien Lahoudere <fabien.lahoudere@collabora.co.uk> wrote:
> > Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> > 
> > ---
> > 
> >  .../wayland/{weston_2.0.0.bb => weston_3.0.0.bb}          | 15 +++++++--------
> > 
> >  1 file changed, 7 insertions(+), 8 deletions(-)
> > 
> >  rename meta/recipes-graphics/wayland/{weston_2.0.0.bb => weston_3.0.0.bb} (90%)
> > 
> > 
> > 
> > diff --git a/meta/recipes-graphics/wayland/weston_2.0.0.bb b/meta/recipes-
> > graphics/wayland/weston_3.0.0.bb
> > 
> > similarity index 90%
> > 
> > rename from meta/recipes-graphics/wayland/weston_2.0.0.bb
> > 
> > rename to meta/recipes-graphics/wayland/weston_3.0.0.bb
> > 
> > index 8160f55..6b3fad7 100644
> > 
> > --- a/meta/recipes-graphics/wayland/weston_2.0.0.bb
> > 
> > +++ b/meta/recipes-graphics/wayland/weston_3.0.0.bb
> > 
> > @@ -9,12 +9,11 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
> > 
> >             file://weston.png \
> > 
> >             file://weston.desktop \
> > 
> >             file://0001-make-error-portable.patch \
> > 
> > -           file://0001-configure.ac-Fix-wayland-protocols-path.patch \
> > 
> >             file://xwayland.weston-start \
> > 
> >             file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
> > 
> >  "
> > 
> > -SRC_URI[md5sum] = "15f38945942bf2a91fe2687145fb4c7d"
> > 
> > -SRC_URI[sha256sum] = "b4e446ac27f118196f1609dab89bb3cb3e81652d981414ad860e733b355365d8"
> > 
> > +SRC_URI[md5sum] = "9c42a4c51a1b9f35d040fa9d45ada36d"
> > 
> > +SRC_URI[sha256sum] = "cde1d55e8dd70c3cbb3d1ec72f60e60000041579caa1d6a262bd9c35e93723a5"
> > 
> > 
> > 
> >  inherit autotools pkgconfig useradd distro_features_check
> > 
> >  # depends on virtual/egl
> > 
> > @@ -76,7 +75,7 @@ PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
> > 
> > 
> > 
> >  do_install_append() {
> > 
> >         # Weston doesn't need the .la files to load modules, so wipe them
> > 
> > -       rm -f ${D}/${libdir}/libweston-2/*.la
> > 
> > +       rm -f ${D}/${libdir}/libweston-3/*.la
> > 
> > 
> > 
> >         # If X11, ship a desktop file to launch it
> > 
> >         if [ "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" ]; then
> > 
> > @@ -93,16 +92,16 @@ do_install_append() {
> > 
> >  }
> > 
> > 
> > 
> >  PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', '${PN}-xwayland', '', d)} \
> > 
> > -             libweston-2 ${PN}-examples"
> > 
> > +             libweston-3 ${PN}-examples"
> > 
> > 
> > 
> >  FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info
> > ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/${BPN}/*.so ${datadir}"
> > 
> > 
> > 
> > -FILES_libweston-2 = "${libdir}/lib*${SOLIBS} ${libdir}/libweston-2/*.so"
> > 
> > -SUMMARY_libweston-2 = "Helper library for implementing 'wayland window managers'."
> > 
> > +FILES_libweston-3 = "${libdir}/lib*${SOLIBS} ${libdir}/libweston-3/*.so"
> > 
> > +SUMMARY_libweston-3 = "Helper library for implementing 'wayland window managers'."
> > 
> > 
> > 
> >  FILES_${PN}-examples = "${bindir}/*"
> > 
> > 
> > 
> > -FILES_${PN}-xwayland = "${libdir}/libweston-2/xwayland.so"
> > 
> > +FILES_${PN}-xwayland = "${libdir}/libweston-3/xwayland.so"
> > 
> >  RDEPENDS_${PN}-xwayland += "xserver-xorg-xwayland"
> > 
> > 
> > 
> >  RDEPENDS_${PN} += "xkeyboard-config"
> > 
> > --
> > 
> > 1.8.3.1
> > 
> > 
> > 
> > --
> > 
> > _______________________________________________
> > 
> > Openembedded-core mailing list
> > 
> > Openembedded-core@lists.openembedded.org
> > 
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > 
> > 

--=-0CvsqZ5moFWxaM9tPBxR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode:=
 space; -webkit-line-break: after-white-space;"><div>Hi Ross</div><div><br>=
</div><div>I fix this by adding "#include &lt;time.h&gt;" in shared/timespe=
c-util.h</div><div>I will send a v5</div><div><br></div><div>Thanks</div><d=
iv><br></div><div>Fabien</div><div><br></div><div>On Mon, 2017-10-16 at 13:=
14 +0100, Burton, Ross wrote:</div><blockquote type=3D"cite"><div dir=3D"lt=
r">Fails on the autobuilder when build against musl:<div><br></div><div><a =
href=3D"http://errors.yoctoproject.org/Errors/Details/157183/">http://error=
s.yoctoproject.org/Errors/Details/157183/</a><br></div></div><div dir=3D"lt=
r"><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote">On 28 September 2017 at 17:01, Fabien Lahoudere <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:fabien.lahoudere@collabora.co.uk" target=
=3D"_blank">fabien.lahoudere@collabora.co.uk</a>&gt;</span> wrote:<br><bloc=
kquote type=3D"cite">Signed-off-by: Fabien Lahoudere &lt;<a href=3D"mailto:=
fabien.lahoudere@collabora.co.uk">fabien.lahoudere@collabora.<wbr>co.uk</a>=
&gt;<br>
---<br>
&nbsp;.../wayland/{<a href=3D"http://weston_2.0.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">weston_2.0.0.bb</a> =3D&gt; <a href=3D"http://weston_3.0.0.=
bb" rel=3D"noreferrer" target=3D"_blank">weston_3.0.0.bb</a>}&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; | 15 +++++++--------<br>
&nbsp;1 file changed, 7 insertions(+), 8 deletions(-)<br>
&nbsp;rename meta/recipes-graphics/wayland/{<a href=3D"http://weston_2.0.0.=
bb" rel=3D"noreferrer" target=3D"_blank">weston_2.0.0.bb</a> =3D&gt; <a hre=
f=3D"http://weston_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">weston_3.=
0.0.bb</a>} (90%)<br>
<br>
diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://weston_2.0.0.b=
b" rel=3D"noreferrer" target=3D"_blank">weston_2.0.0.bb</a> b/meta/recipes-=
graphics/wayland/<a href=3D"http://weston_3.0.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">weston_3.0.0.bb</a><br>
similarity index 90%<br>
rename from meta/recipes-graphics/wayland/<a href=3D"http://weston_2.0.0.bb=
" rel=3D"noreferrer" target=3D"_blank"><wbr>weston_2.0.0.bb</a><br>
rename to meta/recipes-graphics/wayland/<a href=3D"http://weston_3.0.0.bb" =
rel=3D"noreferrer" target=3D"_blank"><wbr>weston_3.0.0.bb</a><br>
index 8160f55..6b3fad7 100644<br>
--- a/meta/recipes-graphics/wayland/<a href=3D"http://weston_2.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">weston_2.0.0.bb</a><br>
+++ b/meta/recipes-graphics/wayland/<a href=3D"http://weston_3.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">weston_3.0.0.bb</a><br>
@@ -9,12 +9,11 @@ SRC_URI =3D "<a href=3D"https://wayland.freedesktop.org/r=
eleases/${BPN}-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://w=
ayland.freedesktop.<wbr>org/releases/${BPN}-${PV}.tar.<wbr>xz</a> \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://weston.png \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://weston.desktop \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://0001-make-error-portable.p=
atch \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0001-configure.ac-Fix-wayl=
and-protocols-path.patch \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://xwayland.weston-start \<br=
>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://0001-weston-launch-Provide=
-a-default-version-that-doesn-t.patch \<br>
&nbsp;"<br>
-SRC_URI[md5sum] =3D "15f38945942bf2a91fe2687145fb4c7d"<br>
-SRC_URI[sha256sum] =3D "b4e446ac27f118196f1609dab89bb3cb3e81652d981414ad86=
0e733b355365d8"<br>
+SRC_URI[md5sum] =3D "9c42a4c51a1b9f35d040fa9d45ada36d"<br>
+SRC_URI[sha256sum] =3D "cde1d55e8dd70c3cbb3d1ec72f60e60000041579caa1d6a262=
bd9c35e93723a5"<br>
<br>
&nbsp;inherit autotools pkgconfig useradd distro_features_check<br>
&nbsp;# depends on virtual/egl<br>
@@ -76,7 +75,7 @@ PACKAGECONFIG[pam] =3D "--with-pam,--without-pam,libpam"<=
br>
<br>
&nbsp;do_install_append() {<br>
&nbsp; &nbsp; &nbsp; &nbsp; # Weston doesn't need the .la files to load mod=
ules, so wipe them<br>
-&nbsp; &nbsp; &nbsp; &nbsp;rm -f ${D}/${libdir}/libweston-2/*.la<br>
+&nbsp; &nbsp; &nbsp; &nbsp;rm -f ${D}/${libdir}/libweston-3/*.la<br>
<br>
&nbsp; &nbsp; &nbsp; &nbsp; # If X11, ship a desktop file to launch it<br>
&nbsp; &nbsp; &nbsp; &nbsp; if [ "${@bb.utils.filter('DISTRO_FEATURES', 'x1=
1', d)}" ]; then<br>
@@ -93,16 +92,16 @@ do_install_append() {<br>
&nbsp;}<br>
<br>
&nbsp;PACKAGES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', '${P=
N}-xwayland', '', d)} \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;libweston-2 ${PN}-examples=
"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;libweston-3 ${PN}-examples=
"<br>
<br>
&nbsp;FILES_${PN} =3D "${bindir}/weston ${bindir}/weston-terminal ${bindir}=
/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${=
libdir}/${BPN}/*.so ${datadir}"<br>
<br>
-FILES_libweston-2 =3D "${libdir}/lib*${SOLIBS} ${libdir}/libweston-2/*.so"=
<br>
-SUMMARY_libweston-2 =3D "Helper library for implementing 'wayland window m=
anagers'."<br>
+FILES_libweston-3 =3D "${libdir}/lib*${SOLIBS} ${libdir}/libweston-3/*.so"=
<br>
+SUMMARY_libweston-3 =3D "Helper library for implementing 'wayland window m=
anagers'."<br>
<br>
&nbsp;FILES_${PN}-examples =3D "${bindir}/*"<br>
<br>
-FILES_${PN}-xwayland =3D "${libdir}/libweston-2/xwayland.so"<br>
+FILES_${PN}-xwayland =3D "${libdir}/libweston-3/xwayland.so"<br>
&nbsp;RDEPENDS_${PN}-xwayland +=3D "xserver-xorg-xwayland"<br>
<br>
&nbsp;RDEPENDS_${PN} +=3D "xkeyboard-config"<br>
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
</font></span><br></blockquote></div><br></div>
</blockquote></body></html>

--=-0CvsqZ5moFWxaM9tPBxR--
