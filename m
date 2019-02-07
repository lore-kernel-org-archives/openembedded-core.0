Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB4836BD08
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 17:11:12 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v16so620359wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 09:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/pYKC7zLZzeEfHmrbxOfxOSZqtP7Oo7F/ZndpQfgtX0=;
	b=VCz/U03ta+tk4DlgKqgeAp3WcMk1hrI4wrrI90zHigQz5y/KA09+g1R0wo1BHgrSGK
	RAT8kyMMHJA2qXm7PV6KkxYSE7WYO3hTzjlV3jMu/CDXp+j9xDpPAtnz1CBAUg2ZVAhK
	lFe8AHefsoR3RB2prfrQi87RYgSWg+TNN1MjxD4M7RZrtHjvSalPpOR5RMaBRxlBz4cO
	QLIIxhNbX670PhmN28tOf40eUZn+jNWhB/maHtfRKXVxgjyYaauz8wp5f7unWy2goRqg
	RIhodi4IxBzAnFT/XlJKiFkh4lKi+1sx0RHrACvNGCH+BGA7T9kbIOQuBMkvmkjfy+t9
	WYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/pYKC7zLZzeEfHmrbxOfxOSZqtP7Oo7F/ZndpQfgtX0=;
	b=ZwXlTGjxZOWtOm5wTxYUXxSW504tf2GClO9WQWdELTf0noRjdlmpF3zhoBkvoGiAOA
	hLX42OQpzZYcAyEKUMqimqrLx0h3iV+8eXj0MoG3kPzjYI4vPzo3SLQ5akQ6MNhzH5Sv
	F0bvOBPhmNspWBv/PZSkAj8PQ5X1db6dFYZdpB6fsYJzndQxtNLTJjHOmu2bb9uDC9P/
	5SJjRDePa7pvC+aaTrQNZRRWON7KLcvcMwZEHjzvVwM2/9bWsIcVy2mVq2R3xWeNYpHm
	4v4ZPKOOKjxqVL6+4IZvoLjq787ne+An1BYpGO1Bygq8HzwrVy67uuGDF4jLmTD8l0NW
	bo5Q==
X-Gm-Message-State: AHQUAubRTDNLbb0XFFT8sqsOBECAO2j3Sgsa0wzd9/oNzC/JDXtg5kSd
	AzqtKp76Hc3EZbQ0mCmM7Ko=
X-Google-Smtp-Source: AHgI3IYtZfT+F0BeMNp2q9xlMq9m5Eqa7Pp0kdR/jSPI85Qio5NiQYWBCK3mkdzCc61O4inw9jFOXQ==
X-Received: by 2002:a5d:4a4b:: with SMTP id v11mr1632037wrs.186.1549559473155; 
	Thu, 07 Feb 2019 09:11:13 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	126sm19061529wmd.1.2019.02.07.09.11.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Feb 2019 09:11:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 7 Feb 2019 18:11:11 +0100
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20190207171111.GA2059@jama>
References: <20190207003537.7135-1-raj.khem@gmail.com>
	<88a02e81ed831ed4fba8adbd9e18f1a35dbf098d.camel@linuxfoundation.org>
	<CAMKF1sr9DyoaDpbz0O=1kur3-WRS=8FEuaq70YSfuSj71S_VkA@mail.gmail.com>
	<CA+chaQcx9tecJLN1jytyn41DGrEyJVHYPDRREXYUbtjFzD5EJg@mail.gmail.com>
	<118388284a74868c06bf5205a2268aea605d24e3.camel@gmail.com>
	<CAJdd5Gbg4hCkVUKopz5qXcqxEjmJsM-XP83rHKiqz3bHYUka_w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJdd5Gbg4hCkVUKopz5qXcqxEjmJsM-XP83rHKiqz3bHYUka_w@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
X-List-Received-Date: Thu, 07 Feb 2019 17:11:13 -0000
X-Groupsio-MsgNum: 120936
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline

--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 07, 2019 at 10:59:18AM -0600, Joshua Watt wrote:
> On Thu, Feb 7, 2019 at 10:44 AM Joshua Watt <jpewhacker@gmail.com> wrote:
> >
> > Martin,
> >
> > Do you by any chance build in Docker (or some other transient container=
)? We recently found an issue with building in docker where when the primar=
y container command would exit, causing the container to terminate. When th=
e container terminates, the kernel unceremoniously sends SIGKILL to all its=
 processes. This plays *very* poorly with pseudo because pseudo keeps it's =
entire database in a in-memory sqlite database and only flushes it out to d=
isk on a periodic interval, or when it get SIGTERM (maybe SIGQUIT?) or exit=
s normally. By default the pseudo daemon will also hang around for 20(?) se=
conds waiting for a new connection from a pseudo client, meaning that when =
our docker container was exiting, there were potentially several pseudo dam=
eons sitting around waiting for a client with unflushed databases in memory=
 that suddenly got a SIGKILL and all their data was lost. This was particul=
arly bad if you aborted a build while it was running, or some build failure=
 occurred. Since the pseudo database was lost, the only way to correct thes=
e errors was to clean and rebuild.
> >
> > I think pseudo could handle this better and keep the database on disk i=
nstead of in memory, but in the short term you can hack bitbake to pass the=
 -S flag when invoking the pseudo client which will make it tell the dameon=
 to shutdown (and thus flush the database) if it is the last connection.
>=20
> FWIW, this patch makes it much easier to do that
> http://lists.openembedded.org/pipermail/bitbake-devel/2019-February/01981=
3.html
> Just add
>  FAKEROOTCMD +=3D "-S"
> in local.conf

Hi Joshua,

most of the build failures caused by this weren't from the builds in
Docker (or any other container), just plain Ubuntu (various versions
14.04 - 18.04) with just the prerequisites installed.

When I get access to some bigger build farm (probably in few months) I
can run that for loop reproducer from the ticket again with
FAKEROOTCMD +=3D "-S"
to see if it makes any difference.

Regards,

> > On Thu, 2019-02-07 at 17:17 +0100, Martin Jansa wrote:
> >
> > There are other rare reproducers which don't involve cp/install (e.g. o=
lder qmake was triggering it quite often as well), I've mentioned some in:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12434
> >
> > glibc-locale is the most common one for sure as pretty much everybody i=
s building that one, I don't have objection converting this from cp to inst=
all to prevent this random error (very rare random failure doesn't really h=
elp with #12434 reproducer and whoever work on it, can either revert this c=
hange or try to reproduce with something else) - I've included few hundreds=
 of INSANE_SKIPs to ignore _random_ host-user-contaminated QAs in LG layers=
 to prevent our builds failing randomly and the one for glibc-locale is the=
 longest part:
> > https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipe=
s-core/glibc/glibc-locale_%25.bbappend
> >
> > Regards,
> >
> > On Thu, Feb 7, 2019 at 3:50 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Feb 7, 2019 at 1:00 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Wed, 2019-02-06 at 16:35 -0800, Khem Raj wrote:
> > > > This has been a constant source of trouble for build failures due t=
o host-user-contaminated QA
> > > > errors of sort
> > > >
> > > > ERROR: QA Issue: glibc-locale: /glibc-binary-localedata-ca-es+valen=
cia/usr/lib/locale/ca_ES@valencia/LC_MONETARY is owned by uid 3004, which i=
s the same as the user running bitbake. This may be due to host contaminati=
on [host-user-contaminated]
> > > >
> > > > So far we have tried to mould cp command into not carrying the build
> > > > user permissions into install area but it is never entirely fixed s=
ince
> > > > the issue keeps popping up in various scenes
> > > >
> > > > This patch replaces use of cp with install utility and specifies in=
stall
> > > > mode for files explcitly
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/recipes-core/glibc/glibc-locale.inc | 44 ++++++++++++++------=
----
> > > >  1 file changed, 25 insertions(+), 19 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipe=
s-core/glibc/glibc-locale.inc
> > > > index 6384f9cbf1..9b256a5108 100644
> > > > --- a/meta/recipes-core/glibc/glibc-locale.inc
> > > > +++ b/meta/recipes-core/glibc/glibc-locale.inc
> > > > @@ -72,27 +72,33 @@ FILES_localedef =3D "${bindir}/localedef"
> > > >  LOCALETREESRC =3D "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-l=
ocale"
> > > >
> > > >  do_install () {
> > > > -     mkdir -p ${D}${bindir} ${D}${datadir}
> > > > -     if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
> > > > -             cp -R --no-dereference --preserve=3Dmode,links ${LOCA=
LETREESRC}/${bindir}/* ${D}${bindir}
> > > > -     fi
> > > > -     if [ -n "$(ls ${LOCALETREESRC}/${localedir})" ]; then
> > > > -             mkdir -p ${D}${localedir}
> > > > -             cp -R --no-dereference --preserve=3Dmode,links ${LOCA=
LETREESRC}/${localedir}/* ${D}${localedir}
> > > > -     fi
> > > > +        install -d ${D}${bindir}
> > > > +        find "${LOCALETREESRC}/${bindir}" -maxdepth 1 -type f \
> > > > +        -exec install -m 0755 -t "${D}${bindir}" {} \;
> > > > +
> > > > +        for d in . $(find "${LOCALETREESRC}/${localedir}" -type d =
-printf '%P ') ; do
> > > > +                install -d "${D}${localedir}/$d"
> > > > +                find "${LOCALETREESRC}/${localedir}/$d" -maxdepth =
1 -type f \
> > > > +                -exec install -m 0644 -t "${D}${localedir}/$d" {} =
\;
> > > > +        done
> > > >       if [ ${@d.getVar('PACKAGE_NO_GCONV')} -eq 0 ]; then
> > > > -             mkdir -p ${D}${libdir}
> > > > -             if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
> > > > -                     cp -R --no-dereference --preserve=3Dmode,link=
s ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
> > > > -             fi
> > > > -             if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
> > > > -                     cp -R --no-dereference --preserve=3Dmode,link=
s ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
> > > > -             fi
> > > > -     fi
> > > > -     if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
> > > > -             cp -R --no-dereference --preserve=3Dmode,links ${LOCA=
LETREESRC}/${datadir}/locale ${D}${datadir}
> > > > +                for d in . $(find "${LOCALETREESRC}/${libdir}/gcon=
v" -type d -printf '%P ') ; do
> > > > +                        install -d "${D}${libdir}/gconv/$d"
> > > > +                        find "${LOCALETREESRC}/${libdir}/gconv/$d"=
 -maxdepth 1 -type f \
> > > > +                        -exec install -m 0755 -t "${D}${libdir}/gc=
onv/$d" {} \;
> > > > +                done
> > > > +                for d in . $(find "${LOCALETREESRC}/${datadir}/i18=
n" -type d -printf '%P ') ; do
> > > > +                        install -d "${D}${datadir}/i18n/$d"
> > > > +                        find "${LOCALETREESRC}/${datadir}/i18n/$d"=
 -maxdepth 1 -type f \
> > > > +                        -exec install -m 0644 -t "${D}${datadir}/i=
18n/$d" {} \;
> > > > +                done
> > > >       fi
> > > > -     cp -R --no-dereference --preserve=3Dmode,links ${LOCALETREESR=
C}/SUPPORTED ${WORKDIR}
> > > > +        for d in . $(find "${LOCALETREESRC}/${datadir}/locale" -ty=
pe d -printf '%P ') ; do
> > > > +                install -d "${D}${datadir}/locale/$d"
> > > > +                find "${LOCALETREESRC}/${datadir}/locale/$d" -maxd=
epth 1 -type f \
> > > > +                -exec install -m 0644 -t "${D}${datadir}/locale/$d=
" {} \;
> > > > +        done
> > > > +     install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORT=
ED
> > > >  }
> > > >
> > > >  inherit libc-package
> > >
> > > The trouble is this is a workaround. The cp commands should work and
> > > there is some underlying issue in pseudo causing this. We really need
> > > to figure out what that is since this will likely just mean we see the
> > > problem somewhere else :(
> >
> > so far this is the only place where it shows in world builds that
> > meta-oe does which includes many layers.
> >
> > >
> > > I still suspect some kind of inode number reuse problem which these cp
> > > commands trigger...
> >
> > cp and install are not same when it comes to how they operate
> > underneath. install is better when it comes to what we are doing here
> > it also gives better control of permissions and mods,as a recipe writer
> > someone would prefer then to let the tool ( cp ) assume it.
> >
> > So there might be a pseudo issue, I dont disagree but not obvious and
> > I believe using cp is subpar anyway.
> >
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> >
> > --
> >
> > Joshua Watt <JPEWhacker@gmail.com>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXFxmrgAKCRA3VSO3ZXaA
HF6SAJ0c9Kw9NnXw4GyLLQQdGN3kuczomQCZASUdwKaklCGIVZy5yKOW9n0//LE=
=q7eQ
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
