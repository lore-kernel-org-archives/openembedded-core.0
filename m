Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5348C6BD08
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 16:59:29 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id h22so4837744wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 08:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UcIJenX5BI1BfzMocUMjX0vWzbR7QsfZkJxRInzsytw=;
	b=A3TFVeejN9QN4zKsCYDgMqrVejn3v6C2Xq/mksgQwDPhb8mRMzEKLbZBFcINkxDwY/
	aCKGpn/DbVz4B5+zA7H1p8UXW3DNNTp7dKVYBSx+Wf449GHav04xPfbuK2QltL/f6Hfp
	Qt3h3vntxjwaNc21uYvuD9lRC/rIoxCZJDGb1UqLN0gvXWiBb99lRtZuf/9VA0P++VPZ
	lACN8K5Z2HZMZdZKinlIc/ukwFE1o4RxLXHelG+AFDGfsM65K+nqwnOtA/5bNxAaGf0/
	mlXbMs+a2cESuIiWcEotSNUWixouDJCUvzzQ9QRJ9OeLnb6Bc+dKZb+iW8b5cs18Ks0r
	KIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UcIJenX5BI1BfzMocUMjX0vWzbR7QsfZkJxRInzsytw=;
	b=lOG7XKIxhCDtRTW+QUqoCuMY/hlvyUKqzwM+QLorlfyvNXiNrrDnM7tQpAbeZTamSr
	M/6qQI3WO5jT9oj4AYtK034JvHtYTIWaHZFpn4qBOxlI/aojLBsNDprIj3eIqh8oqDl0
	263cuTn6TcAdX/CQzLzceWkaxuYynCiJviILss7CudbfZO1R3F5RBPwEFmKmhAKdSrZj
	IIlfN7/iJpoON/Lb6nV2wBypy6SNz2t6Sa9zdDqg6aGh4e2oUkWtATGIReF1QkAzoHVe
	b24doP5ILlse8OJ9EFbqg/9i3+u+jPkSInL3tkEZ8pWZAXbvOVlZ/rZyjv3xNdLqF5xK
	q8Ww==
X-Gm-Message-State: AHQUAuayqc7V26jPTOPeshQ7Sn6SSz2QBECeV00NtE4qf1m55XVtEHc/
	bo2D6+lzS12Ih/gfYh7fgbVHi1bzI8y6UqwkKXI=
X-Google-Smtp-Source: AHgI3IYtas0Wbv1xMJBIRWb1/DeKPxFiUZmTGzwmGkpfzegUGqvZ0GM5l4EpL4SJwuL0geJ/wmxVXsFSJNfdHCn/L+s=
X-Received: by 2002:a7b:c937:: with SMTP id h23mr7410236wml.76.1549558769655; 
	Thu, 07 Feb 2019 08:59:29 -0800 (PST)
MIME-Version: 1.0
References: <20190207003537.7135-1-raj.khem@gmail.com>
	<88a02e81ed831ed4fba8adbd9e18f1a35dbf098d.camel@linuxfoundation.org>
	<CAMKF1sr9DyoaDpbz0O=1kur3-WRS=8FEuaq70YSfuSj71S_VkA@mail.gmail.com>
	<CA+chaQcx9tecJLN1jytyn41DGrEyJVHYPDRREXYUbtjFzD5EJg@mail.gmail.com>
	<118388284a74868c06bf5205a2268aea605d24e3.camel@gmail.com>
In-Reply-To: <118388284a74868c06bf5205a2268aea605d24e3.camel@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 7 Feb 2019 10:59:18 -0600
Message-ID: <CAJdd5Gbg4hCkVUKopz5qXcqxEjmJsM-XP83rHKiqz3bHYUka_w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 07 Feb 2019 16:59:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 7, 2019 at 10:44 AM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> Martin,
>
> Do you by any chance build in Docker (or some other transient container)?=
 We recently found an issue with building in docker where when the primary =
container command would exit, causing the container to terminate. When the =
container terminates, the kernel unceremoniously sends SIGKILL to all its p=
rocesses. This plays *very* poorly with pseudo because pseudo keeps it's en=
tire database in a in-memory sqlite database and only flushes it out to dis=
k on a periodic interval, or when it get SIGTERM (maybe SIGQUIT?) or exits =
normally. By default the pseudo daemon will also hang around for 20(?) seco=
nds waiting for a new connection from a pseudo client, meaning that when ou=
r docker container was exiting, there were potentially several pseudo dameo=
ns sitting around waiting for a client with unflushed databases in memory t=
hat suddenly got a SIGKILL and all their data was lost. This was particular=
ly bad if you aborted a build while it was running, or some build failure o=
ccurred. Since the pseudo database was lost, the only way to correct these =
errors was to clean and rebuild.
>
> I think pseudo could handle this better and keep the database on disk ins=
tead of in memory, but in the short term you can hack bitbake to pass the -=
S flag when invoking the pseudo client which will make it tell the dameon t=
o shutdown (and thus flush the database) if it is the last connection.

FWIW, this patch makes it much easier to do that
http://lists.openembedded.org/pipermail/bitbake-devel/2019-February/019813.=
html
Just add
 FAKEROOTCMD +=3D "-S"
in local.conf

>
>
> On Thu, 2019-02-07 at 17:17 +0100, Martin Jansa wrote:
>
> There are other rare reproducers which don't involve cp/install (e.g. old=
er qmake was triggering it quite often as well), I've mentioned some in:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12434
>
> glibc-locale is the most common one for sure as pretty much everybody is =
building that one, I don't have objection converting this from cp to instal=
l to prevent this random error (very rare random failure doesn't really hel=
p with #12434 reproducer and whoever work on it, can either revert this cha=
nge or try to reproduce with something else) - I've included few hundreds o=
f INSANE_SKIPs to ignore _random_ host-user-contaminated QAs in LG layers t=
o prevent our builds failing randomly and the one for glibc-locale is the l=
ongest part:
> https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-=
core/glibc/glibc-locale_%25.bbappend
>
> Regards,
>
> On Thu, Feb 7, 2019 at 3:50 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Feb 7, 2019 at 1:00 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2019-02-06 at 16:35 -0800, Khem Raj wrote:
> > > This has been a constant source of trouble for build failures due to =
host-user-contaminated QA
> > > errors of sort
> > >
> > > ERROR: QA Issue: glibc-locale: /glibc-binary-localedata-ca-es+valenci=
a/usr/lib/locale/ca_ES@valencia/LC_MONETARY is owned by uid 3004, which is =
the same as the user running bitbake. This may be due to host contamination=
 [host-user-contaminated]
> > >
> > > So far we have tried to mould cp command into not carrying the build
> > > user permissions into install area but it is never entirely fixed sin=
ce
> > > the issue keeps popping up in various scenes
> > >
> > > This patch replaces use of cp with install utility and specifies inst=
all
> > > mode for files explcitly
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-core/glibc/glibc-locale.inc | 44 ++++++++++++++--------=
--
> > >  1 file changed, 25 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-=
core/glibc/glibc-locale.inc
> > > index 6384f9cbf1..9b256a5108 100644
> > > --- a/meta/recipes-core/glibc/glibc-locale.inc
> > > +++ b/meta/recipes-core/glibc/glibc-locale.inc
> > > @@ -72,27 +72,33 @@ FILES_localedef =3D "${bindir}/localedef"
> > >  LOCALETREESRC =3D "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-loc=
ale"
> > >
> > >  do_install () {
> > > -     mkdir -p ${D}${bindir} ${D}${datadir}
> > > -     if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
> > > -             cp -R --no-dereference --preserve=3Dmode,links ${LOCALE=
TREESRC}/${bindir}/* ${D}${bindir}
> > > -     fi
> > > -     if [ -n "$(ls ${LOCALETREESRC}/${localedir})" ]; then
> > > -             mkdir -p ${D}${localedir}
> > > -             cp -R --no-dereference --preserve=3Dmode,links ${LOCALE=
TREESRC}/${localedir}/* ${D}${localedir}
> > > -     fi
> > > +        install -d ${D}${bindir}
> > > +        find "${LOCALETREESRC}/${bindir}" -maxdepth 1 -type f \
> > > +        -exec install -m 0755 -t "${D}${bindir}" {} \;
> > > +
> > > +        for d in . $(find "${LOCALETREESRC}/${localedir}" -type d -p=
rintf '%P ') ; do
> > > +                install -d "${D}${localedir}/$d"
> > > +                find "${LOCALETREESRC}/${localedir}/$d" -maxdepth 1 =
-type f \
> > > +                -exec install -m 0644 -t "${D}${localedir}/$d" {} \;
> > > +        done
> > >       if [ ${@d.getVar('PACKAGE_NO_GCONV')} -eq 0 ]; then
> > > -             mkdir -p ${D}${libdir}
> > > -             if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
> > > -                     cp -R --no-dereference --preserve=3Dmode,links =
${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
> > > -             fi
> > > -             if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
> > > -                     cp -R --no-dereference --preserve=3Dmode,links =
${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
> > > -             fi
> > > -     fi
> > > -     if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
> > > -             cp -R --no-dereference --preserve=3Dmode,links ${LOCALE=
TREESRC}/${datadir}/locale ${D}${datadir}
> > > +                for d in . $(find "${LOCALETREESRC}/${libdir}/gconv"=
 -type d -printf '%P ') ; do
> > > +                        install -d "${D}${libdir}/gconv/$d"
> > > +                        find "${LOCALETREESRC}/${libdir}/gconv/$d" -=
maxdepth 1 -type f \
> > > +                        -exec install -m 0755 -t "${D}${libdir}/gcon=
v/$d" {} \;
> > > +                done
> > > +                for d in . $(find "${LOCALETREESRC}/${datadir}/i18n"=
 -type d -printf '%P ') ; do
> > > +                        install -d "${D}${datadir}/i18n/$d"
> > > +                        find "${LOCALETREESRC}/${datadir}/i18n/$d" -=
maxdepth 1 -type f \
> > > +                        -exec install -m 0644 -t "${D}${datadir}/i18=
n/$d" {} \;
> > > +                done
> > >       fi
> > > -     cp -R --no-dereference --preserve=3Dmode,links ${LOCALETREESRC}=
/SUPPORTED ${WORKDIR}
> > > +        for d in . $(find "${LOCALETREESRC}/${datadir}/locale" -type=
 d -printf '%P ') ; do
> > > +                install -d "${D}${datadir}/locale/$d"
> > > +                find "${LOCALETREESRC}/${datadir}/locale/$d" -maxdep=
th 1 -type f \
> > > +                -exec install -m 0644 -t "${D}${datadir}/locale/$d" =
{} \;
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
>
> --
>
> Joshua Watt <JPEWhacker@gmail.com>

