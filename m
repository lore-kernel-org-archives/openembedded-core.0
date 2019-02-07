Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6F4DC7C40D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 16:18:10 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p6so482457wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 08:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Aflx1lzWAHlu2wXgp+jOd4Nt/66qczj7kIH7yMqq/RM=;
	b=vEH9A0RL2PLWWeIK/WBS9dnuwjkUdzQrs5BxbLWPx1wKhpP0KL6DezSxiXNmvzANHv
	um15sqMTOcJTNStBWMtb+uibGUsYtJ1Q1972qyshl6VpZX4GxIjOXcdyYb+xaxujkKjn
	+4P4gkhEfoJFUnA5NLstztFsYukDVWf7jTMvzfYNFy7paXV5N7TAuLGQaMiZ0xu4198o
	1IGi52FGbzCfnxSza9Uauval6HUKKp9wiAfCR6Vp/d9bC/Ra4tlZy7quLQnBk8XGXQBy
	+iiZbC8wbd7jHcfivK+Ei6Ta43I65cZlR6TZU/W8BlYm3/ShyGcsZ8RxGkreHT78TJNl
	F+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Aflx1lzWAHlu2wXgp+jOd4Nt/66qczj7kIH7yMqq/RM=;
	b=EMxSfFDtgotqGsjfbdENOd3UAzpr/Q4FoiJsGdiM7fD/fivxPZSzkToDrZD20AJ5ZG
	RpjDn9wFSvkDwRuICeJrmqPnGF2m9F6PzVc/vY+HlW2MPu5zuZmXnn7pe/hTW9OEKRXQ
	qrgRc55ZruBlajUpuHpm45It1JinIqv7+ik6vlLeLZ1PQfcZxP+KiWImc6GSLAUHVP93
	1PC+pN+4hwb36wZxuwcXDix8eqMBvbYrc4icQHEtRzcAHduBz4mC7mN4Fo2hhB9Q5Jkc
	whkvMFvj5yWTCLZembFfys58zzhloNKbiThB1C5NM22W6mZw5q2i9H6ArZKjAFYdYxdW
	AZNQ==
X-Gm-Message-State: AHQUAubHhFiICSUedxMFmt2t0ry1EVT64HieQ2YGFu66eD6ab+HTRE9P
	OEvU8mkL+oeNNLxOvLeAdCxCfxqx8LO+CtX0hY0=
X-Google-Smtp-Source: AHgI3IaDGFeHPUePpVbdOizbt1W7qdk5GLWtsC3kgo8L5fGy/6gqcTdCbbBXIkDxG4EuR1IOOKcByIG+UKDZA9becoA=
X-Received: by 2002:a1c:44d6:: with SMTP id r205mr8324481wma.50.1549556290905; 
	Thu, 07 Feb 2019 08:18:10 -0800 (PST)
MIME-Version: 1.0
References: <20190207003537.7135-1-raj.khem@gmail.com>
	<88a02e81ed831ed4fba8adbd9e18f1a35dbf098d.camel@linuxfoundation.org>
	<CAMKF1sr9DyoaDpbz0O=1kur3-WRS=8FEuaq70YSfuSj71S_VkA@mail.gmail.com>
In-Reply-To: <CAMKF1sr9DyoaDpbz0O=1kur3-WRS=8FEuaq70YSfuSj71S_VkA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 7 Feb 2019 17:17:58 +0100
Message-ID: <CA+chaQcx9tecJLN1jytyn41DGrEyJVHYPDRREXYUbtjFzD5EJg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc-locale: Rewrite do_install using install utility instead of cp
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
X-List-Received-Date: Thu, 07 Feb 2019 16:18:10 -0000
Content-Type: multipart/alternative; boundary="00000000000047731c0581503026"

--00000000000047731c0581503026
Content-Type: text/plain; charset="UTF-8"

There are other rare reproducers which don't involve cp/install (e.g. older
qmake was triggering it quite often as well), I've mentioned some in:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12434

glibc-locale is the most common one for sure as pretty much everybody is
building that one, I don't have objection converting this from cp to
install to prevent this random error (very rare random failure doesn't
really help with #12434 reproducer and whoever work on it, can either
revert this change or try to reproduce with something else) - I've included
few hundreds of INSANE_SKIPs to ignore _random_ host-user-contaminated QAs
in LG layers to prevent our builds failing randomly and the one for
glibc-locale is the longest part:
https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-core/glibc/glibc-locale_%25.bbappend

Regards,

On Thu, Feb 7, 2019 at 3:50 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Feb 7, 2019 at 1:00 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2019-02-06 at 16:35 -0800, Khem Raj wrote:
> > > This has been a constant source of trouble for build failures due to
> host-user-contaminated QA
> > > errors of sort
> > >
> > > ERROR: QA Issue: glibc-locale:
> /glibc-binary-localedata-ca-es+valencia/usr/lib/locale/ca_ES@valencia/LC_MONETARY
> is owned by uid 3004, which is the same as the user running bitbake. This
> may be due to host contamination [host-user-contaminated]
> > >
> > > So far we have tried to mould cp command into not carrying the build
> > > user permissions into install area but it is never entirely fixed since
> > > the issue keeps popping up in various scenes
> > >
> > > This patch replaces use of cp with install utility and specifies
> install
> > > mode for files explcitly
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-core/glibc/glibc-locale.inc | 44 ++++++++++++++----------
> > >  1 file changed, 25 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/meta/recipes-core/glibc/glibc-locale.inc
> b/meta/recipes-core/glibc/glibc-locale.inc
> > > index 6384f9cbf1..9b256a5108 100644
> > > --- a/meta/recipes-core/glibc/glibc-locale.inc
> > > +++ b/meta/recipes-core/glibc/glibc-locale.inc
> > > @@ -72,27 +72,33 @@ FILES_localedef = "${bindir}/localedef"
> > >  LOCALETREESRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
> > >
> > >  do_install () {
> > > -     mkdir -p ${D}${bindir} ${D}${datadir}
> > > -     if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
> > > -             cp -R --no-dereference --preserve=mode,links
> ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
> > > -     fi
> > > -     if [ -n "$(ls ${LOCALETREESRC}/${localedir})" ]; then
> > > -             mkdir -p ${D}${localedir}
> > > -             cp -R --no-dereference --preserve=mode,links
> ${LOCALETREESRC}/${localedir}/* ${D}${localedir}
> > > -     fi
> > > +        install -d ${D}${bindir}
> > > +        find "${LOCALETREESRC}/${bindir}" -maxdepth 1 -type f \
> > > +        -exec install -m 0755 -t "${D}${bindir}" {} \;
> > > +
> > > +        for d in . $(find "${LOCALETREESRC}/${localedir}" -type d
> -printf '%P ') ; do
> > > +                install -d "${D}${localedir}/$d"
> > > +                find "${LOCALETREESRC}/${localedir}/$d" -maxdepth 1
> -type f \
> > > +                -exec install -m 0644 -t "${D}${localedir}/$d" {} \;
> > > +        done
> > >       if [ ${@d.getVar('PACKAGE_NO_GCONV')} -eq 0 ]; then
> > > -             mkdir -p ${D}${libdir}
> > > -             if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
> > > -                     cp -R --no-dereference --preserve=mode,links
> ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
> > > -             fi
> > > -             if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
> > > -                     cp -R --no-dereference --preserve=mode,links
> ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
> > > -             fi
> > > -     fi
> > > -     if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
> > > -             cp -R --no-dereference --preserve=mode,links
> ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
> > > +                for d in . $(find "${LOCALETREESRC}/${libdir}/gconv"
> -type d -printf '%P ') ; do
> > > +                        install -d "${D}${libdir}/gconv/$d"
> > > +                        find "${LOCALETREESRC}/${libdir}/gconv/$d"
> -maxdepth 1 -type f \
> > > +                        -exec install -m 0755 -t
> "${D}${libdir}/gconv/$d" {} \;
> > > +                done
> > > +                for d in . $(find "${LOCALETREESRC}/${datadir}/i18n"
> -type d -printf '%P ') ; do
> > > +                        install -d "${D}${datadir}/i18n/$d"
> > > +                        find "${LOCALETREESRC}/${datadir}/i18n/$d"
> -maxdepth 1 -type f \
> > > +                        -exec install -m 0644 -t
> "${D}${datadir}/i18n/$d" {} \;
> > > +                done
> > >       fi
> > > -     cp -R --no-dereference --preserve=mode,links
> ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
> > > +        for d in . $(find "${LOCALETREESRC}/${datadir}/locale" -type
> d -printf '%P ') ; do
> > > +                install -d "${D}${datadir}/locale/$d"
> > > +                find "${LOCALETREESRC}/${datadir}/locale/$d"
> -maxdepth 1 -type f \
> > > +                -exec install -m 0644 -t "${D}${datadir}/locale/$d"
> {} \;
> > > +        done
> > > +     install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTED
> > >  }
> > >
> > >  inherit libc-package
> >
> > The trouble is this is a workaround. The cp commands should work and
> > there is some underlying issue in pseudo causing this. We really need
> > to figure out what that is since this will likely just mean we see the
> > problem somewhere else :(
>
> so far this is the only place where it shows in world builds that
> meta-oe does which includes many layers.
>
> >
> > I still suspect some kind of inode number reuse problem which these cp
> > commands trigger...
>
> cp and install are not same when it comes to how they operate
> underneath. install is better when it comes to what we are doing here
> it also gives better control of permissions and mods,as a recipe writer
> someone would prefer then to let the tool ( cp ) assume it.
>
> So there might be a pseudo issue, I dont disagree but not obvious and
> I believe using cp is subpar anyway.
>
> >
> > Cheers,
> >
> > Richard
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000047731c0581503026
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">There are other rare rep=
roducers which don&#39;t involve cp/install (e.g. older qmake was triggerin=
g it quite often as well), I&#39;ve mentioned some in:<div><a href=3D"https=
://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12434">https://bugzilla.yoct=
oproject.org/show_bug.cgi?id=3D12434</a><br></div><div><br></div><div>glibc=
-locale is the most common one for sure as pretty much everybody is buildin=
g that one, I don&#39;t have objection converting this from cp to install t=
o prevent this random error (very rare random failure doesn&#39;t really he=
lp with #12434 reproducer and whoever work on it, can either revert this ch=
ange or try to reproduce with something else) - I&#39;ve included few hundr=
eds of INSANE_SKIPs to ignore _random_ host-user-contaminated QAs in LG lay=
ers to prevent our builds failing randomly and the one for glibc-locale is =
the longest part:</div><div><a href=3D"https://github.com/webosose/meta-web=
osose/blob/master/meta-webos/recipes-core/glibc/glibc-locale_%25.bbappend">=
https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-co=
re/glibc/glibc-locale_%25.bbappend</a><br></div><div><br></div><div>Regards=
,</div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Thu, Feb 7, 2019 at 3:50 PM Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Thu, Feb 7, 2019 at 1:00 AM =
Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, 2019-02-06 at 16:35 -0800, Khem Raj wrote:<br>
&gt; &gt; This has been a constant source of trouble for build failures due=
 to host-user-contaminated QA<br>
&gt; &gt; errors of sort<br>
&gt; &gt;<br>
&gt; &gt; ERROR: QA Issue: glibc-locale: /glibc-binary-localedata-ca-es+val=
encia/usr/lib/locale/ca_ES@valencia/LC_MONETARY is owned by uid 3004, which=
 is the same as the user running bitbake. This may be due to host contamina=
tion [host-user-contaminated]<br>
&gt; &gt;<br>
&gt; &gt; So far we have tried to mould cp command into not carrying the bu=
ild<br>
&gt; &gt; user permissions into install area but it is never entirely fixed=
 since<br>
&gt; &gt; the issue keeps popping up in various scenes<br>
&gt; &gt;<br>
&gt; &gt; This patch replaces use of cp with install utility and specifies =
install<br>
&gt; &gt; mode for files explcitly<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-core/glibc/glibc-locale.inc | 44 +++++++++++++=
+----------<br>
&gt; &gt;=C2=A0 1 file changed, 25 insertions(+), 19 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/reci=
pes-core/glibc/glibc-locale.inc<br>
&gt; &gt; index 6384f9cbf1..9b256a5108 100644<br>
&gt; &gt; --- a/meta/recipes-core/glibc/glibc-locale.inc<br>
&gt; &gt; +++ b/meta/recipes-core/glibc/glibc-locale.inc<br>
&gt; &gt; @@ -72,27 +72,33 @@ FILES_localedef =3D &quot;${bindir}/localedef=
&quot;<br>
&gt; &gt;=C2=A0 LOCALETREESRC =3D &quot;${COMPONENTS_DIR}/${PACKAGE_ARCH}/g=
libc-stash-locale&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 do_install () {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${bindir} ${D}${datadir}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if [ -n &quot;$(ls ${LOCALETREESRC}/${bindir=
})&quot; ]; then<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -R --no-deref=
erence --preserve=3Dmode,links ${LOCALETREESRC}/${bindir}/* ${D}${bindir}<b=
r>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if [ -n &quot;$(ls ${LOCALETREESRC}/${locale=
dir})&quot; ]; then<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${l=
ocaledir}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -R --no-deref=
erence --preserve=3Dmode,links ${LOCALETREESRC}/${localedir}/* ${D}${locale=
dir}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 find &quot;${LOCALETREESRC}/${bindir=
}&quot; -maxdepth 1 -type f \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -exec install -m 0755 -t &quot;${D}$=
{bindir}&quot; {} \;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in . $(find &quot;${LOCALETREE=
SRC}/${localedir}&quot; -type d -printf &#39;%P &#39;) ; do<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install =
-d &quot;${D}${localedir}/$d&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 find &qu=
ot;${LOCALETREESRC}/${localedir}/$d&quot; -maxdepth 1 -type f \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -exec in=
stall -m 0644 -t &quot;${D}${localedir}/$d&quot; {} \;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${@d.getVar(&#39;PACKAGE_NO_GCONV&=
#39;)} -eq 0 ]; then<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${l=
ibdir}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${LOCALE=
TREESRC}/${libdir}/gconv ]; then<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0cp -R --no-dereference --preserve=3Dmode,links ${LOCALETREESRC=
}/${libdir}/gconv ${D}${libdir}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${LOCALE=
TREESRC}/${datadir}/i18n ]; then<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0cp -R --no-dereference --preserve=3Dmode,links ${LOCALETREESRC=
}/${datadir}/i18n ${D}${datadir}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if [ -e ${LOCALETREESRC}/${datadir}/locale ]=
; then<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -R --no-deref=
erence --preserve=3Dmode,links ${LOCALETREESRC}/${datadir}/locale ${D}${dat=
adir}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in=
 . $(find &quot;${LOCALETREESRC}/${libdir}/gconv&quot; -type d -printf &#39=
;%P &#39;) ; do<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 install -d &quot;${D}${libdir}/gconv/$d&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 find &quot;${LOCALETREESRC}/${libdir}/gconv/$d&quot; -=
maxdepth 1 -type f \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 -exec install -m 0755 -t &quot;${D}${libdir}/gconv/$d&=
quot; {} \;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in=
 . $(find &quot;${LOCALETREESRC}/${datadir}/i18n&quot; -type d -printf &#39=
;%P &#39;) ; do<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 install -d &quot;${D}${datadir}/i18n/$d&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 find &quot;${LOCALETREESRC}/${datadir}/i18n/$d&quot; -=
maxdepth 1 -type f \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 -exec install -m 0644 -t &quot;${D}${datadir}/i18n/$d&=
quot; {} \;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0cp -R --no-dereference --preserve=3Dmode,lin=
ks ${LOCALETREESRC}/SUPPORTED ${WORKDIR}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in . $(find &quot;${LOCALETREE=
SRC}/${datadir}/locale&quot; -type d -printf &#39;%P &#39;) ; do<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install =
-d &quot;${D}${datadir}/locale/$d&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 find &qu=
ot;${LOCALETREESRC}/${datadir}/locale/$d&quot; -maxdepth 1 -type f \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -exec in=
stall -m 0644 -t &quot;${D}${datadir}/locale/$d&quot; {} \;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0install -m 0644 ${LOCALETREESRC}/SUPPORTED $=
{WORKDIR}/SUPPORTED<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 inherit libc-package<br>
&gt;<br>
&gt; The trouble is this is a workaround. The cp commands should work and<b=
r>
&gt; there is some underlying issue in pseudo causing this. We really need<=
br>
&gt; to figure out what that is since this will likely just mean we see the=
<br>
&gt; problem somewhere else :(<br>
<br>
so far this is the only place where it shows in world builds that<br>
meta-oe does which includes many layers.<br>
<br>
&gt;<br>
&gt; I still suspect some kind of inode number reuse problem which these cp=
<br>
&gt; commands trigger...<br>
<br>
cp and install are not same when it comes to how they operate<br>
underneath. install is better when it comes to what we are doing here<br>
it also gives better control of permissions and mods,as a recipe writer<br>
someone would prefer then to let the tool ( cp ) assume it.<br>
<br>
So there might be a pseudo issue, I dont disagree but not obvious and<br>
I believe using cp is subpar anyway.<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000047731c0581503026--
