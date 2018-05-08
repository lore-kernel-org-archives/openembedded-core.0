Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 591B774EC9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 21:33:25 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g21-v6so33706266wrb.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2018 14:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=viZ6MIOFSqPg+V1xWCEMvd9xj5qc5mHfcFS9sZge1yc=;
	b=hivRbiPmqR+2Usk0sYM2/O5J5doCYBBEJwS9YiHVlAUZw8d4+UF7L2Oh8RkX5KOS4d
	w+VXvcZipSfKrmr2LO7ZzES1ACDJ1xSH1S5SkXQPbRfTKvtmXP5Xo364BzHOh9tPuxQs
	T3a29z90y/QsA7iMqthXnChtvtse8refdC9i75D+4YwFTMM+b7eIBdGlU0mOWliDDoeR
	AKSbhU2mVkxY15ewv2BQyB9a0NtnsVTyPMm9/uU2VWm1dpkl6uju44VrlttnNstEEkLy
	tiInE7Q1chV/Ck1FhLhYPGSleK2YMySyJUlFJglZWoEsdWppnvtn+rbWTlQQm1wQ26A8
	ksEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=viZ6MIOFSqPg+V1xWCEMvd9xj5qc5mHfcFS9sZge1yc=;
	b=hAqFPXwPrLUrghOU9HbOpQogr8BXZ3R3kAqiAMVWE0ykHRtEIOhm/9MIcuTQ8qY0Wj
	WM+xBEV1uNd5qtZdUYsJ6onO4NC2utLdibOAYDHOy15Fo/QUQs76V9ilM5txe1iXOQ4A
	QErBo+2O8CdLVZOKeJFOO6g2CQmnRs1+4iWw3PWqW5IP1UqGl1u5r0AIiNQtIOl4K1yP
	BBQZp9LtdZv8m+53v9oWzT+9+pLcLt6ky+dOZZJCiSEralfJlNE6iqY9pxptrkDSK9Wm
	hrf3WjKyiKZB9HeFDHVHyR0LNxkctP5falzPYoUKTeLWscACVC2bRprHJfMU14ZGgSK/
	mEXA==
X-Gm-Message-State: ALQs6tC9mBFr8MishObrhcStRtGdjCe8jUJ4DAad3Rgny0vsq7370yMA
	enVfQbU2PflfE97XRM5GY4+Aj1E1I4aXTLho1vo=
X-Google-Smtp-Source: AB8JxZrzlWjPH6tvbRfTWMevn6Bv1QyhHChpmkvS91EqqbS5z2AI7AR7BQgC3EInx9yHadfpeDI84Va+WTatgQr9tSc=
X-Received: by 2002:adf:e4c8:: with SMTP id
	v8-v6mr31094446wrm.133.1525815206017; 
	Tue, 08 May 2018 14:33:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Tue, 8 May 2018 14:33:25 -0700 (PDT)
In-Reply-To: <20180508212815.GX3228@denix.org>
References: <1523387170-30191-1-git-send-email-denis@denix.org>
	<20180508211844.GA2573@jama> <20180508212815.GX3228@denix.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 8 May 2018 23:33:25 +0200
Message-ID: <CA+chaQftORdJ=xzoEh4z8DzoS+zX=xnVy8Ns=ju3c+Ny5UNZMA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wayland: upgrade to 1.15.0
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
X-List-Received-Date: Tue, 08 May 2018 21:33:25 -0000
Content-Type: multipart/alternative; boundary="00000000000058febe056bb8899b"

--00000000000058febe056bb8899b
Content-Type: text/plain; charset="UTF-8"

It's possible to remove them globally with:
meta/classes/remove-libtool.bbclass
but mesa.inc already removes some of the .la files selectively, so it would
be nice to keep it working even for DISTROs which don't inherit
remove-libtool bbclass (for whatever reason).

On Tue, May 8, 2018 at 11:28 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Tue, May 08, 2018 at 11:18:44PM +0200, Martin Jansa wrote:
> > On Tue, Apr 10, 2018 at 03:06:09PM -0400, Denys Dmytriyenko wrote:
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > Official announcement:
> > > https://lists.freedesktop.org/archives/wayland-devel/2018-
> April/037767.html
> > >
> > > | libwayland-egl is now part of libwayland, and will presumably be
> removed
> > > | from mesa in the not too distant future.
> > >
> > > Update mesa recipe by removing corresponding libwayland-egl entries.
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  meta/recipes-graphics/mesa/mesa.inc                                |
> 7 ++++---
> > >  .../wayland/{wayland_1.14.0.bb => wayland_1.15.0.bb}               |
> 4 ++--
> > >  2 files changed, 6 insertions(+), 5 deletions(-)
> > >  rename meta/recipes-graphics/wayland/{wayland_1.14.0.bb =>
> wayland_1.15.0.bb} (92%)
> > >
> > > diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> > > index b501b7e..c3a8e76 100644
> > > --- a/meta/recipes-graphics/mesa/mesa.inc
> > > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > > @@ -119,7 +119,6 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
> > >               libgles1-mesa libgles1-mesa-dev \
> > >               libgles2-mesa libgles2-mesa-dev \
> > >               libgles3-mesa libgles3-mesa-dev \
> > > -             libwayland-egl libwayland-egl-dev \
> > >               libxatracker libxatracker-dev \
> > >               mesa-megadriver mesa-vulkan-drivers \
> > >              "
> > > @@ -134,6 +133,10 @@ do_install_append () {
> > >      # it was packaged in libdricore9.1.3-1 and preventing upgrades
> when debian.bbclass was used
> > >      rm -f ${D}${sysconfdir}/drirc
> > >      chrpath --delete ${D}${libdir}/dri/*_dri.so || true
> > > +
> > > +    # libwayland-egl has been moved to wayland 1.15+
> > > +    rm -f ${D}${libdir}/libwayland-egl.so*
> > > +    rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
> >
> > Shouldn't /usr/lib/libwayland-egl.la be removed as well? Now I'm getting
> > many do_prepare_recipe_sysroot failures because both mesa and wayland
> > provide this file.
>
> Don't we remove .la files in bulk? I didn't see this problem when I was
> testing it. Plus it went through Ross' mut branch, then master-next and
> presumably few autobuilder iterations?
>
> I can make the change to also remove .la, if it's really required.
>
>
> > >  }
> > >
> > >  # For the packages that make up the OpenGL interfaces, inject
> variables so that
> > > @@ -204,7 +207,6 @@ FILES_libgles2-mesa = "${libdir}/libGLESv2.so.*"
> > >  FILES_libgl-mesa = "${libdir}/libGL.so.*"
> > >  FILES_libglapi = "${libdir}/libglapi.so.*"
> > >  FILES_libosmesa = "${libdir}/libOSMesa.so.*"
> > > -FILES_libwayland-egl = "${libdir}/libwayland-egl.so.*"
> > >  FILES_libxatracker = "${libdir}/libxatracker.so.*"
> > >
> > >  FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan"
> > > @@ -216,7 +218,6 @@ FILES_libgles1-mesa-dev = "${libdir}/libGLESv1*.*
> ${includedir}/GLES ${libdir}/p
> > >  FILES_libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2
> ${libdir}/pkgconfig/glesv2.pc"
> > >  FILES_libgles3-mesa-dev = "${includedir}/GLES3"
> > >  FILES_libosmesa-dev = "${libdir}/libOSMesa.*
> ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
> > > -FILES_libwayland-egl-dev = "${libdir}/pkgconfig/wayland-egl.pc
> ${libdir}/libwayland-egl.*"
> > >  FILES_libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/
> libxatracker.la \
> > >                            ${includedir}/xa_tracker.h
> ${includedir}/xa_composite.h ${includedir}/xa_context.h \
> > >                            ${libdir}/pkgconfig/xatracker.pc"
> > > diff --git a/meta/recipes-graphics/wayland/wayland_1.14.0.bb
> b/meta/recipes-graphics/wayland/wayland_1.15.0.bb
> > > similarity index 92%
> > > rename from meta/recipes-graphics/wayland/wayland_1.14.0.bb
> > > rename to meta/recipes-graphics/wayland/wayland_1.15.0.bb
> > > index 1a9ff98..788105b 100644
> > > --- a/meta/recipes-graphics/wayland/wayland_1.14.0.bb
> > > +++ b/meta/recipes-graphics/wayland/wayland_1.15.0.bb
> > > @@ -15,8 +15,8 @@ DEPENDS = "expat libxml2 libffi wayland-native"
> > >  SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.
> xz \
> > >        file://fixpathinpcfiles.patch \
> > >             "
> > > -SRC_URI[md5sum] = "0235f6075c32c3be61cff94fa0b9f108"
> > > -SRC_URI[sha256sum] = "ed80cabc0961a759a42092e2c39aab
> fc1ec9a13c86c98bbe2b812f008da27ab8"
> > > +SRC_URI[md5sum] = "b7393c17fdce9a8d383edab656c92fd2"
> > > +SRC_URI[sha256sum] = "eb3fbebb8559d56a80ad3753ec3db8
> 00f587329067962dbf65e14488b4b7aeb0"
> > >
> > >  inherit autotools pkgconfig
> > >
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
>

--00000000000058febe056bb8899b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It&#39;s possible to remove them globally with:</div>=
meta/classes/remove-libtool.bbclass<br><div>but mesa.inc already removes so=
me of the .la files selectively, so it would be nice to keep it working eve=
n for DISTROs which don&#39;t inherit remove-libtool bbclass (for whatever =
reason).</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Tue, May 8, 2018 at 11:28 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt=
;<a href=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><d=
iv class=3D"h5">On Tue, May 08, 2018 at 11:18:44PM +0200, Martin Jansa wrot=
e:<br>
&gt; On Tue, Apr 10, 2018 at 03:06:09PM -0400, Denys Dmytriyenko wrote:<br>
&gt; &gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys=
@ti.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; Official announcement:<br>
&gt; &gt; <a href=3D"https://lists.freedesktop.org/archives/wayland-devel/2=
018-April/037767.html" rel=3D"noreferrer" target=3D"_blank">https://lists.f=
reedesktop.org/<wbr>archives/wayland-devel/2018-<wbr>April/037767.html</a><=
br>
&gt; &gt; <br>
&gt; &gt; | libwayland-egl is now part of libwayland, and will presumably b=
e removed<br>
&gt; &gt; | from mesa in the not too distant future.<br>
&gt; &gt; <br>
&gt; &gt; Update mesa recipe by removing corresponding libwayland-egl entri=
es.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.c=
om">denys@ti.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-graphics/mesa/<wbr>mesa.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 7 ++++---<br>
&gt; &gt;=C2=A0 .../wayland/{<a href=3D"http://wayland_1.14.0.bb" rel=3D"no=
referrer" target=3D"_blank">wayland_1.14.0.bb</a> =3D&gt; <a href=3D"http:/=
/wayland_1.15.0.bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.15.0.bb<=
/a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt; &gt;=C2=A0 2 files changed, 6 insertions(+), 5 deletions(-)<br>
&gt; &gt;=C2=A0 rename meta/recipes-graphics/wayland/<wbr>{<a href=3D"http:=
//wayland_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.14.0.bb=
</a> =3D&gt; <a href=3D"http://wayland_1.15.0.bb" rel=3D"noreferrer" target=
=3D"_blank">wayland_1.15.0.bb</a>} (92%)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-graphics/mesa/<wbr>mesa.inc b/meta/reci=
pes-graphics/mesa/<wbr>mesa.inc<br>
&gt; &gt; index b501b7e..c3a8e76 100644<br>
&gt; &gt; --- a/meta/recipes-graphics/mesa/<wbr>mesa.inc<br>
&gt; &gt; +++ b/meta/recipes-graphics/mesa/<wbr>mesa.inc<br>
&gt; &gt; @@ -119,7 +119,6 @@ PACKAGES =3D+ &quot;libegl-mesa libegl-mesa-d=
ev \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libgles1-me=
sa libgles1-mesa-dev \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libgles2-me=
sa libgles2-mesa-dev \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libgles3-me=
sa libgles3-mesa-dev \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libwayland-egl l=
ibwayland-egl-dev \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libxatracke=
r libxatracker-dev \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mesa-megadr=
iver mesa-vulkan-drivers \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; &gt; @@ -134,6 +133,10 @@ do_install_append () {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # it was packaged in libdricore9.1.3-1 and pr=
eventing upgrades when debian.bbclass was used <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 rm -f ${D}${sysconfdir}/drirc<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 chrpath --delete ${D}${libdir}/dri/*_dri.so |=
| true<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 # libwayland-egl has been moved to wayland 1.15+<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 rm -f ${D}${libdir}/libwayland-egl.<wbr>so*<br>
&gt; &gt; +=C2=A0 =C2=A0 rm -f ${D}${libdir}/pkgconfig/<wbr>wayland-egl.pc<=
br>
&gt; <br>
&gt; Shouldn&#39;t /usr/lib/<a href=3D"http://libwayland-egl.la" rel=3D"nor=
eferrer" target=3D"_blank">libwayland-egl.la</a> be removed as well? Now I&=
#39;m getting<br>
&gt; many do_prepare_recipe_sysroot failures because both mesa and wayland<=
br>
&gt; provide this file.<br>
<br>
</div></div>Don&#39;t we remove .la files in bulk? I didn&#39;t see this pr=
oblem when I was <br>
testing it. Plus it went through Ross&#39; mut branch, then master-next and=
 <br>
presumably few autobuilder iterations?<br>
<br>
I can make the change to also remove .la, if it&#39;s really required.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 # For the packages that make up the OpenGL interfaces, inje=
ct variables so that<br>
&gt; &gt; @@ -204,7 +207,6 @@ FILES_libgles2-mesa =3D &quot;${libdir}/libGL=
ESv2.so.*&quot;<br>
&gt; &gt;=C2=A0 FILES_libgl-mesa =3D &quot;${libdir}/libGL.so.*&quot;<br>
&gt; &gt;=C2=A0 FILES_libglapi =3D &quot;${libdir}/libglapi.so.*&quot;<br>
&gt; &gt;=C2=A0 FILES_libosmesa =3D &quot;${libdir}/libOSMesa.so.*&quot;<br=
>
&gt; &gt; -FILES_libwayland-egl =3D &quot;${libdir}/libwayland-egl.so.*<wbr=
>&quot;<br>
&gt; &gt;=C2=A0 FILES_libxatracker =3D &quot;${libdir}/libxatracker.so.*&qu=
ot;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 FILES_${PN}-dev =3D &quot;${libdir}/pkgconfig/dri.pc ${incl=
udedir}/vulkan&quot;<br>
&gt; &gt; @@ -216,7 +218,6 @@ FILES_libgles1-mesa-dev =3D &quot;${libdir}/l=
ibGLESv1*.* ${includedir}/GLES ${libdir}/p<br>
&gt; &gt;=C2=A0 FILES_libgles2-mesa-dev =3D &quot;${libdir}/libGLESv2.* ${i=
ncludedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc&quot;<br>
&gt; &gt;=C2=A0 FILES_libgles3-mesa-dev =3D &quot;${includedir}/GLES3&quot;=
<br>
&gt; &gt;=C2=A0 FILES_libosmesa-dev =3D &quot;${libdir}/libOSMesa.* ${inclu=
dedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc&quot;<br>
&gt; &gt; -FILES_libwayland-egl-dev =3D &quot;${libdir}/pkgconfig/wayland-<=
wbr>egl.pc ${libdir}/libwayland-egl.*&quot;<br>
&gt; &gt;=C2=A0 FILES_libxatracker-dev =3D &quot;${libdir}/libxatracker.so =
${libdir}/<a href=3D"http://libxatracker.la" rel=3D"noreferrer" target=3D"_=
blank">libxatracker.la</a> \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${includedir}/xa_tracker.h ${includedir}/xa=
_composite.h ${includedir}/xa_context.h \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir}/pkgconfig/xatracker.<wbr>pc&quot;=
<br>
&gt; &gt; diff --git a/meta/recipes-graphics/<wbr>wayland/<a href=3D"http:/=
/wayland_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.14.0.bb<=
/a> b/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://wayland_1.15.0.b=
b" rel=3D"noreferrer" target=3D"_blank">wayland_1.15.0.bb</a><br>
&gt; &gt; similarity index 92%<br>
&gt; &gt; rename from meta/recipes-graphics/wayland/<a href=3D"http://wayla=
nd_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>wayland_1.14.0.bb</=
a><br>
&gt; &gt; rename to meta/recipes-graphics/wayland/<a href=3D"http://wayland=
_1.15.0.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>wayland_1.15.0.bb</a>=
<br>
&gt; &gt; index 1a9ff98..788105b 100644<br>
&gt; &gt; --- a/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://waylan=
d_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.14.0.bb</a><br>
&gt; &gt; +++ b/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://waylan=
d_1.15.0.bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.15.0.bb</a><br>
&gt; &gt; @@ -15,8 +15,8 @@ DEPENDS =3D &quot;expat libxml2 libffi wayland-=
native&quot;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://wayland.freedesktop.or=
g/releases/${BPN}-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:=
//wayland.freedesktop.<wbr>org/releases/${BPN}-${PV}.tar.<wbr>xz</a> \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fixpathinpcfiles.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt; -SRC_URI[md5sum] =3D &quot;<wbr>0235f6075c32c3be61cff94fa0b9f1<wb=
r>08&quot;<br>
&gt; &gt; -SRC_URI[sha256sum] =3D &quot;<wbr>ed80cabc0961a759a42092e2c39aab=
<wbr>fc1ec9a13c86c98bbe2b812f008da2<wbr>7ab8&quot;<br>
&gt; &gt; +SRC_URI[md5sum] =3D &quot;<wbr>b7393c17fdce9a8d383edab656c92f<wb=
r>d2&quot;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;<wbr>eb3fbebb8559d56a80ad3753ec3db8=
<wbr>00f587329067962dbf65e14488b4b7<wbr>aeb0&quot;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 inherit autotools pkgconfig<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -- <br>
&gt; &gt; 2.7.4<br>
&gt; &gt; <br>
&gt; &gt; -- <br>
&gt; &gt; ______________________________<wbr>_________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Opene=
mbedded-core@lists.<wbr>openembedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.=
org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt; <br>
&gt; -- <br>
&gt; Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mail=
to:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
<br>
<br>
</div></div></blockquote></div><br></div>

--00000000000058febe056bb8899b--
