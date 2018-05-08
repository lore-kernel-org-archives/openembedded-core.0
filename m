Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A9D1874A32
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 22:12:25 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o78-v6so24229749wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2018 15:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EMKGlR1l5ZVaoZeF5EF9Od7sJbYQvo727IVyksC7jms=;
	b=u8rclB/NePAK+zKexU8gFW64TsB9/x3drdXvSKjHzJEhEicoN3cbxXLlF7uz699q2d
	upJvKVWqcSV2LUki/C0ALoWBs3WX5dgVOizIL2IUtwt/jI6e9O9KV9CMMM2MOtzXpBtS
	xvvB9Rvy6tjN+L4s70BjFE/PdDjPIFpztDMiQ07YiB8HaQcDVJ9bUVNO6Yi9tDk9jA0i
	OOOuGqnQje5em64JyyHrxEu8C9n0NyRCTPGNslOcyYnwe1Ug2e/lQ4kifDkKncIe4RiY
	G/143i8MBCqmAdez3t8DaXmfA0LjWKYdA1BEmL/7eDqHlJQCwHCQiODDWj4W+NJfJrNp
	Jo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EMKGlR1l5ZVaoZeF5EF9Od7sJbYQvo727IVyksC7jms=;
	b=F1XPpgHvQYVIa1cCmC1yxsC1KvjOxhmMsG2S/M6l3RqEimvf3/dzsl2l7veb3vT0Ur
	il2V2lYzNdF9jXupyfsp4Fti3oCYykDFIaFHK7nl4YfOqRfKUNjfbXeHN3OW+v5nqqLV
	KTtCyeJS9tUXq98mwym4OUZFEX4dEVwm6ITLzwd4tIxlmc9bZgjwtEqeFZA2rwQCK7ck
	KpfdtfMrvva3vEowq2lGTo1A0+0BJPLtRdQrvCFD5Vnp/8XIlS6P3RV5D81jHxvNzgkp
	GkV5/7yovCPemwXgrHnZP2COe3rVNgvaTwUrfYgqu6gbsGU2mamHbKWgWIUofzwtxfCw
	+SPw==
X-Gm-Message-State: ALKqPwegvUp4PrrDaghlT3wejAXL+mSE61xxeQMY2yqXrPh75mN6oAb9
	Wlp2ffAl1YkggGVudr6AI3ecEcbqXue62WrSFek=
X-Google-Smtp-Source: AB8JxZqvGy1lmywv1y6xs5iHrXGPrMt6kSSWuYYd0bRzAE58PpHgUjz4BnkViQzxSZWi+7Bk2eCFlmEpDwOofm34hrM=
X-Received: by 2002:a1c:5946:: with SMTP id
	n67-v6mr4039884wmb.32.1525817546286; 
	Tue, 08 May 2018 15:12:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Tue, 8 May 2018 15:12:25 -0700 (PDT)
In-Reply-To: <CAJTo0LY+Lyb5vQ5P-81QDD3w3FhBTn6Y=M7g2e1X_rd4AOsu0A@mail.gmail.com>
References: <1523387170-30191-1-git-send-email-denis@denix.org>
	<20180508211844.GA2573@jama> <20180508212815.GX3228@denix.org>
	<CAJTo0LY+Lyb5vQ5P-81QDD3w3FhBTn6Y=M7g2e1X_rd4AOsu0A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 9 May 2018 00:12:25 +0200
Message-ID: <CA+chaQdO679hxOTbmNabp+==HwdeWrjXWcyMbOfp366JRGdEbA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Tue, 08 May 2018 22:12:26 -0000
Content-Type: multipart/alternative; boundary="000000000000d6ac13056bb914de"

--000000000000d6ac13056bb914de
Content-Type: text/plain; charset="UTF-8"

Ross: nodistro includes remove-libtool as well

I've noticed the issue in DISTRO which doesn't use INHERIT_DISTRO from
defaultsetup.inc.

On Tue, May 8, 2018 at 11:59 PM, Burton, Ross <ross.burton@intel.com> wrote:

> Yeah the problem here is that poky uses remove-libtool, and the nodistro
> builds apparently don't build anything Wayland.
>
> I'll check the AB configure and ensure more coverage for the nodistro
> buildset.
>
> Ross
>
> On 8 May 2018 at 22:28, Denys Dmytriyenko <denis@denix.org> wrote:
>
>> On Tue, May 08, 2018 at 11:18:44PM +0200, Martin Jansa wrote:
>> > On Tue, Apr 10, 2018 at 03:06:09PM -0400, Denys Dmytriyenko wrote:
>> > > From: Denys Dmytriyenko <denys@ti.com>
>> > >
>> > > Official announcement:
>> > > https://lists.freedesktop.org/archives/wayland-devel/2018-Ap
>> ril/037767.html
>> > >
>> > > | libwayland-egl is now part of libwayland, and will presumably be
>> removed
>> > > | from mesa in the not too distant future.
>> > >
>> > > Update mesa recipe by removing corresponding libwayland-egl entries.
>> > >
>> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> > > ---
>> > >  meta/recipes-graphics/mesa/mesa.inc
>> | 7 ++++---
>> > >  .../wayland/{wayland_1.14.0.bb => wayland_1.15.0.bb}
>>  | 4 ++--
>> > >  2 files changed, 6 insertions(+), 5 deletions(-)
>> > >  rename meta/recipes-graphics/wayland/{wayland_1.14.0.bb =>
>> wayland_1.15.0.bb} (92%)
>> > >
>> > > diff --git a/meta/recipes-graphics/mesa/mesa.inc
>> b/meta/recipes-graphics/mesa/mesa.inc
>> > > index b501b7e..c3a8e76 100644
>> > > --- a/meta/recipes-graphics/mesa/mesa.inc
>> > > +++ b/meta/recipes-graphics/mesa/mesa.inc
>> > > @@ -119,7 +119,6 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
>> > >               libgles1-mesa libgles1-mesa-dev \
>> > >               libgles2-mesa libgles2-mesa-dev \
>> > >               libgles3-mesa libgles3-mesa-dev \
>> > > -             libwayland-egl libwayland-egl-dev \
>> > >               libxatracker libxatracker-dev \
>> > >               mesa-megadriver mesa-vulkan-drivers \
>> > >              "
>> > > @@ -134,6 +133,10 @@ do_install_append () {
>> > >      # it was packaged in libdricore9.1.3-1 and preventing upgrades
>> when debian.bbclass was used
>> > >      rm -f ${D}${sysconfdir}/drirc
>> > >      chrpath --delete ${D}${libdir}/dri/*_dri.so || true
>> > > +
>> > > +    # libwayland-egl has been moved to wayland 1.15+
>> > > +    rm -f ${D}${libdir}/libwayland-egl.so*
>> > > +    rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
>> >
>> > Shouldn't /usr/lib/libwayland-egl.la be removed as well? Now I'm
>> getting
>> > many do_prepare_recipe_sysroot failures because both mesa and wayland
>> > provide this file.
>>
>> Don't we remove .la files in bulk? I didn't see this problem when I was
>> testing it. Plus it went through Ross' mut branch, then master-next and
>> presumably few autobuilder iterations?
>>
>> I can make the change to also remove .la, if it's really required.
>>
>>
>> > >  }
>> > >
>> > >  # For the packages that make up the OpenGL interfaces, inject
>> variables so that
>> > > @@ -204,7 +207,6 @@ FILES_libgles2-mesa = "${libdir}/libGLESv2.so.*"
>> > >  FILES_libgl-mesa = "${libdir}/libGL.so.*"
>> > >  FILES_libglapi = "${libdir}/libglapi.so.*"
>> > >  FILES_libosmesa = "${libdir}/libOSMesa.so.*"
>> > > -FILES_libwayland-egl = "${libdir}/libwayland-egl.so.*"
>> > >  FILES_libxatracker = "${libdir}/libxatracker.so.*"
>> > >
>> > >  FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan"
>> > > @@ -216,7 +218,6 @@ FILES_libgles1-mesa-dev = "${libdir}/libGLESv1*.*
>> ${includedir}/GLES ${libdir}/p
>> > >  FILES_libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2
>> ${libdir}/pkgconfig/glesv2.pc"
>> > >  FILES_libgles3-mesa-dev = "${includedir}/GLES3"
>> > >  FILES_libosmesa-dev = "${libdir}/libOSMesa.*
>> ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
>> > > -FILES_libwayland-egl-dev = "${libdir}/pkgconfig/wayland-egl.pc
>> ${libdir}/libwayland-egl.*"
>> > >  FILES_libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/
>> libxatracker.la \
>> > >                            ${includedir}/xa_tracker.h
>> ${includedir}/xa_composite.h ${includedir}/xa_context.h \
>> > >                            ${libdir}/pkgconfig/xatracker.pc"
>> > > diff --git a/meta/recipes-graphics/wayland/wayland_1.14.0.bb
>> b/meta/recipes-graphics/wayland/wayland_1.15.0.bb
>> > > similarity index 92%
>> > > rename from meta/recipes-graphics/wayland/wayland_1.14.0.bb
>> > > rename to meta/recipes-graphics/wayland/wayland_1.15.0.bb
>> > > index 1a9ff98..788105b 100644
>> > > --- a/meta/recipes-graphics/wayland/wayland_1.14.0.bb
>> > > +++ b/meta/recipes-graphics/wayland/wayland_1.15.0.bb
>> > > @@ -15,8 +15,8 @@ DEPENDS = "expat libxml2 libffi wayland-native"
>> > >  SRC_URI = "https://wayland.freedesktop.o
>> rg/releases/${BPN}-${PV}.tar.xz \
>> > >        file://fixpathinpcfiles.patch \
>> > >             "
>> > > -SRC_URI[md5sum] = "0235f6075c32c3be61cff94fa0b9f108"
>> > > -SRC_URI[sha256sum] = "ed80cabc0961a759a42092e2c39aa
>> bfc1ec9a13c86c98bbe2b812f008da27ab8"
>> > > +SRC_URI[md5sum] = "b7393c17fdce9a8d383edab656c92fd2"
>> > > +SRC_URI[sha256sum] = "eb3fbebb8559d56a80ad3753ec3db
>> 800f587329067962dbf65e14488b4b7aeb0"
>> > >
>> > >  inherit autotools pkgconfig
>> > >
>> > > --
>> > > 2.7.4
>> > >
>> > > --
>> > > _______________________________________________
>> > > Openembedded-core mailing list
>> > > Openembedded-core@lists.openembedded.org
>> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >
>> > --
>> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--000000000000d6ac13056bb914de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ross: nodistro includes remove-libtool as well<div><br></d=
iv><div>I&#39;ve noticed the issue in DISTRO which doesn&#39;t use INHERIT_=
DISTRO from defaultsetup.inc.</div></div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On Tue, May 8, 2018 at 11:59 PM, Burton, Ross <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank"=
>ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr">Yeah the problem here is that poky uses remove-libtool=
, and the nodistro builds apparently don&#39;t build anything Wayland.<div>=
<br></div><div>I&#39;ll check the AB configure and ensure more coverage for=
 the nodistro buildset.</div><span class=3D"HOEnZb"><font color=3D"#888888"=
><div><br></div><div>Ross</div></font></span></div><div class=3D"HOEnZb"><d=
iv class=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n 8 May 2018 at 22:28, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div class=3D"m_-7731596195213158602H=
OEnZb"><div class=3D"m_-7731596195213158602h5">On Tue, May 08, 2018 at 11:1=
8:44PM +0200, Martin Jansa wrote:<br>
&gt; On Tue, Apr 10, 2018 at 03:06:09PM -0400, Denys Dmytriyenko wrote:<br>
&gt; &gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" targe=
t=3D"_blank">denys@ti.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; Official announcement:<br>
&gt; &gt; <a href=3D"https://lists.freedesktop.org/archives/wayland-devel/2=
018-April/037767.html" rel=3D"noreferrer" target=3D"_blank">https://lists.f=
reedesktop.org/<wbr>archives/wayland-devel/2018-Ap<wbr>ril/037767.html</a><=
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
om" target=3D"_blank">denys@ti.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-graphics/mesa/mes<wbr>a.inc=C2=A0 =C2=A0 =C2=
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
&gt; &gt; diff --git a/meta/recipes-graphics/mesa/m<wbr>esa.inc b/meta/reci=
pes-graphics/mesa/m<wbr>esa.inc<br>
&gt; &gt; index b501b7e..c3a8e76 100644<br>
&gt; &gt; --- a/meta/recipes-graphics/mesa/m<wbr>esa.inc<br>
&gt; &gt; +++ b/meta/recipes-graphics/mesa/m<wbr>esa.inc<br>
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
&gt; &gt; +=C2=A0 =C2=A0 rm -f ${D}${libdir}/libwayland-egl.s<wbr>o*<br>
&gt; &gt; +=C2=A0 =C2=A0 rm -f ${D}${libdir}/pkgconfig/waylan<wbr>d-egl.pc<=
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
<div class=3D"m_-7731596195213158602HOEnZb"><div class=3D"m_-77315961952131=
58602h5"><br>
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
&gt; &gt; -FILES_libwayland-egl-dev =3D &quot;${libdir}/pkgconfig/wayland-e=
<wbr>gl.pc ${libdir}/libwayland-egl.*&quot;<br>
&gt; &gt;=C2=A0 FILES_libxatracker-dev =3D &quot;${libdir}/libxatracker.so =
${libdir}/<a href=3D"http://libxatracker.la" rel=3D"noreferrer" target=3D"_=
blank">libxatracker.la</a> \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${includedir}/xa_tracker.h ${includedir}/xa=
_composite.h ${includedir}/xa_context.h \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir}/pkgconfig/xatracker.<wbr>pc&quot;=
<br>
&gt; &gt; diff --git a/meta/recipes-graphics/waylan<wbr>d/<a href=3D"http:/=
/wayland_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.14.0.bb<=
/a> b/meta/recipes-graphics/waylan<wbr>d/<a href=3D"http://wayland_1.15.0.b=
b" rel=3D"noreferrer" target=3D"_blank">wayland_1.15.0.bb</a><br>
&gt; &gt; similarity index 92%<br>
&gt; &gt; rename from meta/recipes-graphics/wayland/<a href=3D"http://wayla=
nd_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>wayland_1.14.0.bb</=
a><br>
&gt; &gt; rename to meta/recipes-graphics/wayland/<a href=3D"http://wayland=
_1.15.0.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>wayland_1.15.0.bb</a>=
<br>
&gt; &gt; index 1a9ff98..788105b 100644<br>
&gt; &gt; --- a/meta/recipes-graphics/waylan<wbr>d/<a href=3D"http://waylan=
d_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.14.0.bb</a><br>
&gt; &gt; +++ b/meta/recipes-graphics/waylan<wbr>d/<a href=3D"http://waylan=
d_1.15.0.bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.15.0.bb</a><br>
&gt; &gt; @@ -15,8 +15,8 @@ DEPENDS =3D &quot;expat libxml2 libffi wayland-=
native&quot;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://wayland.freedesktop.or=
g/releases/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank=
">https://wayland.freedesktop.o<wbr>rg/releases/${BPN}-${PV}.tar.x<wbr>z</a=
> \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fixpathinpcfiles.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt; -SRC_URI[md5sum] =3D &quot;0235f6075c32c3be61cff94fa0b9f<wbr>108&=
quot;<br>
&gt; &gt; -SRC_URI[sha256sum] =3D &quot;ed80cabc0961a759a42092e2c39aa<wbr>b=
fc1ec9a13c86c98bbe2b812f008da<wbr>27ab8&quot;<br>
&gt; &gt; +SRC_URI[md5sum] =3D &quot;b7393c17fdce9a8d383edab656c92<wbr>fd2&=
quot;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;eb3fbebb8559d56a80ad3753ec3db<wbr>8=
00f587329067962dbf65e14488b4b<wbr>7aeb0&quot;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 inherit autotools pkgconfig<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -- <br>
&gt; &gt; 2.7.4<br>
&gt; &gt; <br>
&gt; &gt; -- <br>
&gt; &gt; ______________________________<wbr>_________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" targe=
t=3D"_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.=
org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt; <br>
&gt; -- <br>
&gt; Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mail=
to:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a><br>
<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--000000000000d6ac13056bb914de--
