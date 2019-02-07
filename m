Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id ACD476BD08
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 16:44:21 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id a6so1266774itl.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 08:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:user-agent:mime-version;
	bh=ttuzFeh8mOt9MU9EG26pWD0oeQmCbiU27nXjy/ZZM18=;
	b=LygCPj0BNurwxwUwCwpVrn24tRGUkYMJrALWP3eesgGtCYay77FoBnsXiJgfmFviRJ
	g2Z4s9sJn5v9JZHIZm37kHd16RDNKXySt5w78xxUE+XawHagsaXJNyPi3qFOh3TVfjaK
	l2rTxZkfW+lGvW5QQuZci9MI2aiWaX+0zmpN4WAGGTJYfXn/GS2jqVK5agZiBvXvFfrW
	60AbcTI01jDszJ0SX2EIxN0ggB+cifJmNf55m+QFV9UlfvOB4psc9fmt6eE14Vjyz1v5
	2821cICCYzqAM7ou6L1v6LXXg9KbYaZAHe9JhNljDGDN8q8CGGsnkPglKmaXWywb9Rhc
	KLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:user-agent:mime-version;
	bh=ttuzFeh8mOt9MU9EG26pWD0oeQmCbiU27nXjy/ZZM18=;
	b=SUhEP9aj8Dmq9k5A7nRWvczO6/zon2NsPcRm8ak0kNYXsUr8cKO2EiqRmQvYskaiNf
	fU9ceukhUuPyJF5lztrcw6YTjdlxWtu40+sYWg/KqORl7dZZ89IThLToCphDWsasE/lG
	LjwlK0MUkEv+GabPFasqtOB8QllXtcbWy832iy/u2KZaER5rqX4GJbvgsPW+75Lm22Q7
	le4ukTWw8hwkjFSEez5cqYU4hAWSKkbB2oOSI3ijEqeTo9FWVllVSHS8Lu8HnNcuG0pd
	BFQCjIGHyO72I0y/An3fUJNFphPrlC7ubRY7gz9sW9NRmTpIAm1FdUiSFckd02ENbv8U
	x+jw==
X-Gm-Message-State: AHQUAubjry3RtbAiugXEKDNs2HjKpS9ITox5yr1lD2jl7qNUx5oyR+ar
	qhbFERnkxSzTXQVpoFs8q5g=
X-Google-Smtp-Source: AHgI3IZQ21U28QK6aFLHAf+vXTulli177h/2OSlECeRNptp9495FRsauORx/t1Bu2THi9UKhsjFYMg==
X-Received: by 2002:a6b:e202:: with SMTP id z2mr9469667ioc.133.1549557862306; 
	Thu, 07 Feb 2019 08:44:22 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	13sm4461445itl.1.2019.02.07.08.44.20
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 07 Feb 2019 08:44:21 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <118388284a74868c06bf5205a2268aea605d24e3.camel@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Thu, 07 Feb 2019 10:44:19 -0600
In-Reply-To: <CA+chaQcx9tecJLN1jytyn41DGrEyJVHYPDRREXYUbtjFzD5EJg@mail.gmail.com>
References: <20190207003537.7135-1-raj.khem@gmail.com>
	<88a02e81ed831ed4fba8adbd9e18f1a35dbf098d.camel@linuxfoundation.org>
	<CAMKF1sr9DyoaDpbz0O=1kur3-WRS=8FEuaq70YSfuSj71S_VkA@mail.gmail.com>
	<CA+chaQcx9tecJLN1jytyn41DGrEyJVHYPDRREXYUbtjFzD5EJg@mail.gmail.com>
User-Agent: Evolution 3.30.3 (3.30.3-1.fc29) 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 07 Feb 2019 16:44:21 -0000
Content-Type: multipart/alternative; boundary="=-4wlwvi1pi/CweJdKfyLf"

--=-4wlwvi1pi/CweJdKfyLf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Martin,
Do you by any chance build in Docker (or some other transient
container)? We recently found an issue with building in docker where
when the primary container command would exit, causing the container to
terminate. When the container terminates, the kernel unceremoniously
sends SIGKILL to all its processes. This plays *very* poorly with
pseudo because pseudo keeps it's entire database in a in-memory sqlite
database and only flushes it out to disk on a periodic interval, or
when it get SIGTERM (maybe SIGQUIT?) or exits normally. By default the
pseudo daemon will also hang around for 20(?) seconds waiting for a new
connection from a pseudo client, meaning that when our docker container
was exiting, there were potentially several pseudo dameons sitting
around waiting for a client with unflushed databases in memory that
suddenly got a SIGKILL and all their data was lost. This was
particularly bad if you aborted a build while it was running, or some
build failure occurred. Since the pseudo database was lost, the only
way to correct these errors was to clean and rebuild.
I think pseudo could handle this better and keep the database on disk
instead of in memory, but in the short term you can hack bitbake to
pass the -S flag when invoking the pseudo client which will make it
tell the dameon to shutdown (and thus flush the database) if it is the
last connection.

On Thu, 2019-02-07 at 17:17 +0100, Martin Jansa wrote:
> There are other rare reproducers which don't involve cp/install (e.g.
> older qmake was triggering it quite often as well), I've mentioned
> some in:https://bugzilla.yoctoproject.org/show_bug.cgi?id=12434
> 
> glibc-locale is the most common one for sure as pretty much everybody
> is building that one, I don't have objection converting this from cp
> to install to prevent this random error (very rare random failure
> doesn't really help with #12434 reproducer and whoever work on it,
> can either revert this change or try to reproduce with something
> else) - I've included few hundreds of INSANE_SKIPs to ignore _random_
> host-user-contaminated QAs in LG layers to prevent our builds failing
> randomly and the one for glibc-locale is the longest part:
> https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-core/glibc/glibc-locale_%25.bbappend
> 
> Regards,
> 
> On Thu, Feb 7, 2019 at 3:50 PM Khem Raj <raj.khem@gmail.com> wrote:
> > On Thu, Feb 7, 2019 at 1:00 AM Richard Purdie
> > 
> > <richard.purdie@linuxfoundation.org> wrote:
> > 
> > >
> > 
> > > On Wed, 2019-02-06 at 16:35 -0800, Khem Raj wrote:
> > 
> > > > This has been a constant source of trouble for build failures
> > due to host-user-contaminated QA
> > 
> > > > errors of sort
> > 
> > > >
> > 
> > > > ERROR: QA Issue: glibc-locale: 
> > /glibc-binary-localedata-ca-es+valencia/usr/lib/locale/ca_ES@valencia
> > /LC_MONETARY is owned by uid 3004, which is the same as the user
> > running bitbake. This may be due to host contamination [host-user-
> > contaminated]
> > 
> > > >
> > 
> > > > So far we have tried to mould cp command into not carrying the
> > build
> > 
> > > > user permissions into install area but it is never entirely
> > fixed since
> > 
> > > > the issue keeps popping up in various scenes
> > 
> > > >
> > 
> > > > This patch replaces use of cp with install utility and
> > specifies install
> > 
> > > > mode for files explcitly
> > 
> > > >
> > 
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > 
> > > > ---
> > 
> > > >  meta/recipes-core/glibc/glibc-locale.inc | 44 ++++++++++++++
> > ----------
> > 
> > > >  1 file changed, 25 insertions(+), 19 deletions(-)
> > 
> > > >
> > 
> > > > diff --git a/meta/recipes-core/glibc/glibc-locale.inc
> > b/meta/recipes-core/glibc/glibc-locale.inc
> > 
> > > > index 6384f9cbf1..9b256a5108 100644
> > 
> > > > --- a/meta/recipes-core/glibc/glibc-locale.inc
> > 
> > > > +++ b/meta/recipes-core/glibc/glibc-locale.inc
> > 
> > > > @@ -72,27 +72,33 @@ FILES_localedef = "${bindir}/localedef"
> > 
> > > >  LOCALETREESRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-
> > stash-locale"
> > 
> > > >
> > 
> > > >  do_install () {
> > 
> > > > -     mkdir -p ${D}${bindir} ${D}${datadir}
> > 
> > > > -     if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
> > 
> > > > -             cp -R --no-dereference --preserve=mode,links
> > ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
> > 
> > > > -     fi
> > 
> > > > -     if [ -n "$(ls ${LOCALETREESRC}/${localedir})" ]; then
> > 
> > > > -             mkdir -p ${D}${localedir}
> > 
> > > > -             cp -R --no-dereference --preserve=mode,links
> > ${LOCALETREESRC}/${localedir}/* ${D}${localedir}
> > 
> > > > -     fi
> > 
> > > > +        install -d ${D}${bindir}
> > 
> > > > +        find "${LOCALETREESRC}/${bindir}" -maxdepth 1 -type f
> > \
> > 
> > > > +        -exec install -m 0755 -t "${D}${bindir}" {} \;
> > 
> > > > +
> > 
> > > > +        for d in . $(find "${LOCALETREESRC}/${localedir}"
> > -type d -printf '%P ') ; do
> > 
> > > > +                install -d "${D}${localedir}/$d"
> > 
> > > > +                find "${LOCALETREESRC}/${localedir}/$d"
> > -maxdepth 1 -type f \
> > 
> > > > +                -exec install -m 0644 -t "${D}${localedir}/$d"
> > {} \;
> > 
> > > > +        done
> > 
> > > >       if [ ${@d.getVar('PACKAGE_NO_GCONV')} -eq 0 ]; then
> > 
> > > > -             mkdir -p ${D}${libdir}
> > 
> > > > -             if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
> > 
> > > > -                     cp -R --no-dereference --
> > preserve=mode,links ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
> > 
> > > > -             fi
> > 
> > > > -             if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
> > 
> > > > -                     cp -R --no-dereference --
> > preserve=mode,links ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
> > 
> > > > -             fi
> > 
> > > > -     fi
> > 
> > > > -     if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
> > 
> > > > -             cp -R --no-dereference --preserve=mode,links
> > ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
> > 
> > > > +                for d in . $(find
> > "${LOCALETREESRC}/${libdir}/gconv" -type d -printf '%P ') ; do
> > 
> > > > +                        install -d "${D}${libdir}/gconv/$d"
> > 
> > > > +                        find
> > "${LOCALETREESRC}/${libdir}/gconv/$d" -maxdepth 1 -type f \
> > 
> > > > +                        -exec install -m 0755 -t
> > "${D}${libdir}/gconv/$d" {} \;
> > 
> > > > +                done
> > 
> > > > +                for d in . $(find
> > "${LOCALETREESRC}/${datadir}/i18n" -type d -printf '%P ') ; do
> > 
> > > > +                        install -d "${D}${datadir}/i18n/$d"
> > 
> > > > +                        find
> > "${LOCALETREESRC}/${datadir}/i18n/$d" -maxdepth 1 -type f \
> > 
> > > > +                        -exec install -m 0644 -t
> > "${D}${datadir}/i18n/$d" {} \;
> > 
> > > > +                done
> > 
> > > >       fi
> > 
> > > > -     cp -R --no-dereference --preserve=mode,links
> > ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
> > 
> > > > +        for d in . $(find "${LOCALETREESRC}/${datadir}/locale"
> > -type d -printf '%P ') ; do
> > 
> > > > +                install -d "${D}${datadir}/locale/$d"
> > 
> > > > +                find "${LOCALETREESRC}/${datadir}/locale/$d"
> > -maxdepth 1 -type f \
> > 
> > > > +                -exec install -m 0644 -t
> > "${D}${datadir}/locale/$d" {} \;
> > 
> > > > +        done
> > 
> > > > +     install -m 0644 ${LOCALETREESRC}/SUPPORTED
> > ${WORKDIR}/SUPPORTED
> > 
> > > >  }
> > 
> > > >
> > 
> > > >  inherit libc-package
> > 
> > >
> > 
> > > The trouble is this is a workaround. The cp commands should work
> > and
> > 
> > > there is some underlying issue in pseudo causing this. We really
> > need
> > 
> > > to figure out what that is since this will likely just mean we
> > see the
> > 
> > > problem somewhere else :(
> > 
> > 
> > 
> > so far this is the only place where it shows in world builds that
> > 
> > meta-oe does which includes many layers.
> > 
> > 
> > 
> > >
> > 
> > > I still suspect some kind of inode number reuse problem which
> > these cp
> > 
> > > commands trigger...
> > 
> > 
> > 
> > cp and install are not same when it comes to how they operate
> > 
> > underneath. install is better when it comes to what we are doing
> > here
> > 
> > it also gives better control of permissions and mods,as a recipe
> > writer
> > 
> > someone would prefer then to let the tool ( cp ) assume it.
> > 
> > 
> > 
> > So there might be a pseudo issue, I dont disagree but not obvious
> > and
> > 
> > I believe using cp is subpar anyway.
> > 
> > 
> > 
> > >
> > 
> > > Cheers,
> > 
> > >
> > 
> > > Richard
> > 
> > >
> > 
-- 
Joshua Watt <JPEWhacker@gmail.com>

--=-4wlwvi1pi/CweJdKfyLf
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>Martin,</div><div><br></div><div>Do you by any chance build in Doc=
ker (or some other transient container)? We recently found an issue with bu=
ilding in docker where when the primary container command would exit, causi=
ng the container to terminate. When the container terminates, the kernel un=
ceremoniously sends SIGKILL to all its processes. This plays *very* poorly =
with pseudo because pseudo keeps it's entire database in a in-memory sqlite=
 database and only flushes it out to disk on a periodic interval, or when i=
t get SIGTERM (maybe SIGQUIT?) or exits normally. By default the pseudo dae=
mon will also hang around for 20(?) seconds waiting for a new connection fr=
om a pseudo client, meaning that when our docker container was exiting, the=
re were potentially several pseudo dameons sitting around waiting for a cli=
ent with unflushed databases in memory that suddenly got a SIGKILL and all =
their data was lost. This was particularly bad if you aborted a build while=
 it was running, or some build failure occurred. Since the pseudo database =
was lost, the only way to correct these errors was to clean and rebuild.</d=
iv><div><br></div><div>I think pseudo could handle this better and keep the=
 database on disk instead of in memory, but in the short term you can hack =
bitbake to pass the -S flag when invoking the pseudo client which will make=
 it tell the dameon to shutdown (and thus flush the database) if it is the =
last connection.</div><div><br></div><div><br></div><div>On Thu, 2019-02-07=
 at 17:17 +0100, Martin Jansa wrote:</div><blockquote type=3D"cite" style=
=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">There are other rare reprodu=
cers which don't involve cp/install (e.g. older qmake was triggering it qui=
te often as well), I've mentioned some in:<div><a href=3D"https://bugzilla.=
yoctoproject.org/show_bug.cgi?id=3D12434">https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D12434</a><br></div><div><br></div><div>glibc-locale is t=
he most common one for sure as pretty much everybody is building that one, =
I don't have objection converting this from cp to install to prevent this r=
andom error (very rare random failure doesn't really help with #12434 repro=
ducer and whoever work on it, can either revert this change or try to repro=
duce with something else) - I've included few hundreds of INSANE_SKIPs to i=
gnore _random_ host-user-contaminated QAs in LG layers to prevent our build=
s failing randomly and the one for glibc-locale is the longest part:</div><=
div><a href=3D"https://github.com/webosose/meta-webosose/blob/master/meta-w=
ebos/recipes-core/glibc/glibc-locale_%25.bbappend">https://github.com/webos=
ose/meta-webosose/blob/master/meta-webos/recipes-core/glibc/glibc-locale_%2=
5.bbappend</a><br></div><div><br></div><div>Regards,</div></div></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, Feb 7, 2019 at 3:50 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote type=3D"cite" styl=
e=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">On =
Thu, Feb 7, 2019 at 1:00 AM Richard Purdie<br>
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
&gt; &gt;&nbsp; meta/recipes-core/glibc/glibc-locale.inc | 44 +++++++++++++=
+----------<br>
&gt; &gt;&nbsp; 1 file changed, 25 insertions(+), 19 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/reci=
pes-core/glibc/glibc-locale.inc<br>
&gt; &gt; index 6384f9cbf1..9b256a5108 100644<br>
&gt; &gt; --- a/meta/recipes-core/glibc/glibc-locale.inc<br>
&gt; &gt; +++ b/meta/recipes-core/glibc/glibc-locale.inc<br>
&gt; &gt; @@ -72,27 +72,33 @@ FILES_localedef =3D "${bindir}/localedef"<br>
&gt; &gt;&nbsp; LOCALETREESRC =3D "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-=
stash-locale"<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; do_install () {<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp;mkdir -p ${D}${bindir} ${D}${datadir}<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp;if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]=
; then<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cp -R --no-deref=
erence --preserve=3Dmode,links ${LOCALETREESRC}/${bindir}/* ${D}${bindir}<b=
r>
&gt; &gt; -&nbsp; &nbsp; &nbsp;fi<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp;if [ -n "$(ls ${LOCALETREESRC}/${localedir})=
" ]; then<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mkdir -p ${D}${l=
ocaledir}<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cp -R --no-deref=
erence --preserve=3Dmode,links ${LOCALETREESRC}/${localedir}/* ${D}${locale=
dir}<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp;fi<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; install -d ${D}${bindir}<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; find "${LOCALETREESRC}/${bindir}" -m=
axdepth 1 -type f \<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; -exec install -m 0755 -t "${D}${bind=
ir}" {} \;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; for d in . $(find "${LOCALETREESRC}/=
${localedir}" -type d -printf '%P ') ; do<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; install =
-d "${D}${localedir}/$d"<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; find "${=
LOCALETREESRC}/${localedir}/$d" -maxdepth 1 -type f \<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -exec in=
stall -m 0644 -t "${D}${localedir}/$d" {} \;<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; done<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp;if [ ${@d.getVar('PACKAGE_NO_GCONV')} -=
eq 0 ]; then<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mkdir -p ${D}${l=
ibdir}<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if [ -e ${LOCALE=
TREESRC}/${libdir}/gconv ]; then<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;cp -R --no-dereference --preserve=3Dmode,links ${LOCALETREESRC}=
/${libdir}/gconv ${D}${libdir}<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fi<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if [ -e ${LOCALE=
TREESRC}/${datadir}/i18n ]; then<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;cp -R --no-dereference --preserve=3Dmode,links ${LOCALETREESRC}=
/${datadir}/i18n ${D}${datadir}<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fi<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp;fi<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp;if [ -e ${LOCALETREESRC}/${datadir}/locale ]=
; then<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cp -R --no-deref=
erence --preserve=3Dmode,links ${LOCALETREESRC}/${datadir}/locale ${D}${dat=
adir}<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; for d in=
 . $(find "${LOCALETREESRC}/${libdir}/gconv" -type d -printf '%P ') ; do<br=
>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; install -d "${D}${libdir}/gconv/$d"<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; find "${LOCALETREESRC}/${libdir}/gconv/$d" -maxdepth 1 =
-type f \<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; -exec install -m 0755 -t "${D}${libdir}/gconv/$d" {} \;=
<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; done<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; for d in=
 . $(find "${LOCALETREESRC}/${datadir}/i18n" -type d -printf '%P ') ; do<br=
>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; install -d "${D}${datadir}/i18n/$d"<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; find "${LOCALETREESRC}/${datadir}/i18n/$d" -maxdepth 1 =
-type f \<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; -exec install -m 0644 -t "${D}${datadir}/i18n/$d" {} \;=
<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; done<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp;fi<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp;cp -R --no-dereference --preserve=3Dmode,lin=
ks ${LOCALETREESRC}/SUPPORTED ${WORKDIR}<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; for d in . $(find "${LOCALETREESRC}/=
${datadir}/locale" -type d -printf '%P ') ; do<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; install =
-d "${D}${datadir}/locale/$d"<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; find "${=
LOCALETREESRC}/${datadir}/locale/$d" -maxdepth 1 -type f \<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -exec in=
stall -m 0644 -t "${D}${datadir}/locale/$d" {} \;<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; done<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp;install -m 0644 ${LOCALETREESRC}/SUPPORTED $=
{WORKDIR}/SUPPORTED<br>
&gt; &gt;&nbsp; }<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; inherit libc-package<br>
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
</blockquote></div></blockquote><div><span><pre>-- <br></pre>Joshua Watt &l=
t;<a href=3D"mailto:JPEWhacker@gmail.com">JPEWhacker@gmail.com</a>&gt;</spa=
n></div></body></html>

--=-4wlwvi1pi/CweJdKfyLf--
