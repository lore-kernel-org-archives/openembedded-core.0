Return-Path: <jacob.kroon@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id E5B4A6DA25
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 10:36:34 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id p197so5323604itp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 02:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=k4ltUaDAEwcz6P+JaiblY0+navUhCMbPyHSfRKQjaZU=;
	b=rQCmXtLTOQhSFmZNUYA7gtj5/4gayvEq8lT7RcD70Ifr/wgRNVpSLQcciopUv2cceh
	vwTgm4httOBGWzlAxKtbK41xUunNtwteW90CAGYSQ7rhfPKMYWe7WpP2eHZAV1BxkQLW
	g08kUSuwOkiOQE/S9EVmVzdQJc7joIybWXfcHvy997/u4o3/gZgH7LmZ0vJ+hCdf/InW
	jRyPggI+PzB4+qLOS8sBqRELY1Jjc4ijR8UjhIWfTnVx9H4I6F1SZHas+mtKyjcrvV4L
	EFcYbSSJUNj+SriaoDs6bJnXRh8jylv+A2pJWp+S3GF9s8uU++CS57zAGMFGdtd26yjn
	gkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k4ltUaDAEwcz6P+JaiblY0+navUhCMbPyHSfRKQjaZU=;
	b=LBtH7ymGjvtEZIYp3kst7SW/H30r9G9rzz7ApvnddLS/IsJqN6OxdqiLA+tIhUvCjs
	/iMzn3hcejDGrhEb9LYiz2ulCZ4lmcJNgdNP+S+U8Clmc0Ynj77RIiBY+kILuHYZVgnJ
	jN0/eeBSI/fDdIsn350yFtzZLVJEJ15SSaB9bZ5G+rAe4KNsodOeKofHGLs0tTLHvXyF
	DIgrMih8auP85/MxkldQqEzmvJERt0uKAKgoHMchLKs5ottK5RILeKxwjZ1ClsS+jcfM
	RT5C2esOPKk3XR7yXG88O+c25NZ1Qq2sepOoIPi/Qen6RuA+AwygG9qmm/k9+iv3+Yd1
	/MTA==
X-Gm-Message-State: AJcUukdtNCu/oJOqCKeh/UUSqljp+nnHFioVwGoYOXOpJc+gfJuNhJh2
	4j/hF8CUw1xgX7QGsp+5zKCHgAsKO6wCohFEAT+RTeOH+NZqPQ==
X-Google-Smtp-Source: ALg8bN6fRgfdeH0wJU8d8xfftzuSPY/qwwnN1+tHgf9anRyoSF5mM5Wo3RZ+/oosVDDQYYvlYZCry0sVFP3+C64MnrQ=
X-Received: by 2002:a24:1dce:: with SMTP id 197mr995630itj.154.1546943795939; 
	Tue, 08 Jan 2019 02:36:35 -0800 (PST)
MIME-Version: 1.0
References: <20190106181350.25386-1-jacob.kroon@gmail.com>
	<20190106181350.25386-2-jacob.kroon@gmail.com>
	<CAPbeDCm=0X_8cN6_WCexaLBNcYrVv3zT_27g8uXW_eh-iGc=TA@mail.gmail.com>
	<20190108103232.GS7349@hiutale>
In-Reply-To: <20190108103232.GS7349@hiutale>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Tue, 8 Jan 2019 11:36:24 +0100
Message-ID: <CAPbeDC=Nk0MD1Z+q0ss5TKGibPcrK335FiTr_V9qr_E_6e7OCA@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 2/2] buildhistory: support generating md5sum of files
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
X-List-Received-Date: Tue, 08 Jan 2019 10:36:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 8, 2019 at 11:32 AM <Mikko.Rapeli@bmw.de> wrote:
>
> On Mon, Jan 07, 2019 at 03:17:00PM +0100, Jacob Kroon wrote:
> > On Sun, Jan 6, 2019 at 7:14 PM Jacob Kroon <jacob.kroon@gmail.com> wrote:
> > >
> > > Introduce 'md5' in BUILDHISTORY_FEATURES and enable it by default
> > > when doing reproducible builds.
> > >
> > > When enabled this will additionally create:
> > >
> > >   files-in-package-md5.txt
> > >   files-in-image-md5.txt
> > >   files-in-sdk-md5.txt
> > >
> > > containing the md5 checksums of regular files.
> > >
> > > Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> > > ---
> > >  meta/classes/buildhistory.bbclass | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> > > index 33eb1b00f6..00f0701dec 100644
> > > --- a/meta/classes/buildhistory.bbclass
> > > +++ b/meta/classes/buildhistory.bbclass
> > > @@ -7,7 +7,8 @@
> > >  # Copyright (C) 2007-2011 Koen Kooi <koen@openembedded.org>
> > >  #
> > >
> > > -BUILDHISTORY_FEATURES ?= "image package sdk"
> > > +BUILDHISTORY_FEATURES ?= "image package sdk \
> > > +  ${@ "md5" if bb.utils.to_boolean(d.getVar('BUILD_REPRODUCIBLE_BINARIES')) else ""}"
> > >  BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
> > >  BUILDHISTORY_DIR_IMAGE = "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
> > >  BUILDHISTORY_DIR_PACKAGE = "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
> > > @@ -526,7 +527,12 @@ buildhistory_list_files() {
> > >                 eval ${FAKEROOTENV} ${FAKEROOTCMD} $find_cmd
> > >         else
> > >                 eval $find_cmd
> > > -       fi | sort -k5 | sed 's/ * -> $//' > $2 )
> > > +       fi | sort -k5 | sed 's/ * -> $//' > $2
> > > +       if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'md5', '1', '0', d)}" = "1" ] ; then
> > > +               md5filename=$(echo $2 | sed 's/\.txt$/-md5.txt/')
> > > +               find -type f | xargs -I{} -n1 md5sum {} | sort -k2 > $md5filename
> > > +               [ -s $md5filename ] || rm $md5filename # remove result if empty
> >
> > I added this remove because I thought it didn't make sense to keep
> > empty files around, but I now realize that the "files-in-package.txt"
> > file is kept around, even if empty. Is there a preference on what to
> > do here ?
>
> FWIW, I'm wiping the all buildhistory data with external scripts before doing a
> clean build. Basically a "git rm -rf *" in buildhistory directory. Otherwise
> stale data about images, packages etc which are no longer built remain in
> buildhistory.

I think one can also do:

BB_ENV_EXTRAWHITE=BUILDHISTORY_RESET BUILDHISTORY_RESET=1 bitbake <build>

(see buildhistory.bbclass)

> -Mikko

