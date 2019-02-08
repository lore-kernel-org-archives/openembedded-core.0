Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 61F2F65CE9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 15:21:28 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id b8so4236165qtr.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 07:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0OtzkgV03K3lh1ofLWp+EcksCI7xI/MfwgQz2GhEPTM=;
	b=LATVLZZPBq237BtjOd5ZEMSubTG83IHaC84jMYNRRyPJZJPiPCDlIP24tB8/JlyzHQ
	Ku3GNWuagHLvZ2vNqHYMbPHlFGeHbziP9wMdAm4nTiQzj3hKtCa1IrDvHXmHRG7XXxAJ
	U0HTgdZrt+BJVwYYJkROcWvC/emwIM3f5qPbYIpueYY+94gceMl5Y+AYjrLA+SsTGq+C
	PEatnl95dLWjOu5M+R9qMLzoFoZ8aADaUskRuK2IEQipsCfBeqrdrlYwkTy7uTgQedPr
	ZXUsFunGwxbLa1dHM+boAeVbg1mqTWeO4OXBVJ8b8oWaX8Ugm30Qa5x7/JN6jlW7uNek
	PTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0OtzkgV03K3lh1ofLWp+EcksCI7xI/MfwgQz2GhEPTM=;
	b=RJhwjsKiMUDHMzuuJ97SvjId+tx8ZBJSM56UxlSmxOndlsfQofzGeLEwKt33+9FndA
	ifIFcndplYNWopyhrpPVNrxYZ1WFP2LrmQBYLYyE7k9HRLgVnGNRUlQcBCLOWzYUL1vR
	eU6UveEWrMKMQsvrRRTo/DYcdEkf2pGcpH9s22btMI/GDLvVsE5a0KzO8CM7c0ktH3Zk
	qJjNlL5PxAHBw8MK1cNsQ6fZR3pEKDdW9GDicv/LHj0Q2PbkMdEO7SHiZF0OziICp0yU
	VFbEJLDb5gBebHnlDvBpctfbPwN7zMuLThiL6dzg/uG7nHBAB76m+zrKOgjtTyMvtrR3
	CT0Q==
X-Gm-Message-State: AHQUAuZxvSGJ1xavqWzZWH7IJ8XnyG5VaPCtgIgNYPPA45t7L7+Mz47K
	6X42O8ipUtsjPUg+oR7fdTeSRelK7sA3gBAmLiw=
X-Google-Smtp-Source: AHgI3IZQP9V6aB/s66n9H5hxKZ5uBX/UM0aF0NTiAe/eTSd8puLTdDs7Glx6FFWvyBA/P8hBB/EvrqlgRxZPvcQirJg=
X-Received: by 2002:a0c:c103:: with SMTP id f3mr14949828qvh.194.1549639288904; 
	Fri, 08 Feb 2019 07:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20190208005611.8039-1-raj.khem@gmail.com>
	<2b5d0361200b48969cbbb269ca2272ee@XBOX04.axis.com>
In-Reply-To: <2b5d0361200b48969cbbb269ca2272ee@XBOX04.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Feb 2019 07:21:02 -0800
Message-ID: <CAMKF1sr-s=7m1-0kajeNYesLZ9qpmHhNu7mS1-bEfjunvfPigQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Fri, 08 Feb 2019 15:21:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 8, 2019 at 12:44 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> > core-bounces@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: den 8 februari 2019 01:56
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH] glibc-locale: Rewrite do_install using
> > install utility instead of cp
> >
> > This has been a constant source of trouble for build failures due to
> > host-user-contaminated QA errors of sort
> >
> > ERROR: QA Issue: glibc-locale: /glibc-binary-localedata-ca-
> > es+valencia/usr/lib/locale/ca_ES@valencia/LC_MONETARY is owned by uid
> > 3004, which is the same as the user running bitbake. This may be due to
> > host contamination [host-user-contaminated]
> >
> > So far we have tried to mould cp command into not carrying the build
> > user permissions into install area but it is never entirely fixed since
> > the issue keeps popping up in various scenes
> >
> > This patch replaces use of cp with install utility and specifies install
> > mode for files explcitly
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/glibc/glibc-locale.inc | 41 ++++++++++++------------
> >  1 file changed, 20 insertions(+), 21 deletions(-)
> >
> > diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
> > index 6384f9cbf1..9cce61bf0b 100644
> > --- a/meta/recipes-core/glibc/glibc-locale.inc
> > +++ b/meta/recipes-core/glibc/glibc-locale.inc
> > @@ -71,28 +71,27 @@ FILES_localedef = "${bindir}/localedef"
> >
> >  LOCALETREESRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
> >
> > -do_install () {
> > -     mkdir -p ${D}${bindir} ${D}${datadir}
> > -     if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
> > -             cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
> > -     fi
> > -     if [ -n "$(ls ${LOCALETREESRC}/${localedir})" ]; then
> > -             mkdir -p ${D}${localedir}
> > -             cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${localedir}/* ${D}${localedir}
> > -     fi
> > -     if [ ${@d.getVar('PACKAGE_NO_GCONV')} -eq 0 ]; then
> > -             mkdir -p ${D}${libdir}
> > -             if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
> > -                     cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
> > -             fi
> > -             if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
> > -                     cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
> > -             fi
> > -     fi
> > -     if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
> > -             cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
> > +copy_locale_files() {
> > +     local dir=$1 mode=$2
> > +
> > +     [ -e "${LOCALETREESRC}$dir" ] || return 0
> > +
> > +     for d in . $(find "${LOCALETREESRC}$dir" -type d -printf '%P '); do
> > +             install -d ${D}$dir/$d
> > +             find "${LOCALETREESRC}$dir/$d" -maxdepth 1 -type f \
> > +             -exec install -m $mode -t "${D}$dir/$d" {} \;
>
> I know I am a sucker for details, but please align the broken find line so
> that it is more obvious that the second line is a continuation, i.e.:
>
>                 find "${LOCALETREESRC}$dir/$d" -maxdepth 1 -type f \
>                      -exec install -m $mode -t "${D}$dir/$d" {} \;
>

You are doing good here, I really appreciate the feedback. Do you
think aligning it
under beginning of quote is more readable or aligning where find cmd
begins is better ?
I will make this as a followup patch and send it with next lot of
minor changes that I have in
queue.

> > +     done
> > +}
> > +
> > +do_install() {
> > +     copy_locale_files ${bindir} 0755
> > +     copy_locale_files ${localedir} 0644
> > +     if [ ${PACKAGE_NO_GCONV} -eq 0 ]; then
> > +             copy_locale_files ${libdir}/gconv 0755
> > +             copy_locale_files ${datadir}/i18n 0644
> >       fi
> > -     cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
> > +     copy_locale_files ${datadir}/locale 0644
> > +     install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTED
> >  }
> >
> >  inherit libc-package
> > --
> > 2.20.1
>
> //Peter
>

