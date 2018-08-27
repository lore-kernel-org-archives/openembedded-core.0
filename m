Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 80AF6789FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 19:46:07 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id l82-v6so232124oih.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 12:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ubFdSRLg1iTO0Cz3wXr91/W80eRIbbrZTOa/AufebtQ=;
	b=R407S+UP0DZeLBy6GmcDuXQTd55/w5gjc0E4inH8oImVb5B6p9ZE2WeCd/bLC+kAGj
	hQMa+7wMl54njJQHKbCGOu3rR4DmBeJRYTMOpjHyXxNCn/nLucOp79IBhaOEqMl64XvH
	sXq/SB9XuOKTACkveY+Zr/JjhbeR47sNmOcNUFuVWkOotyzON68QaVeSs3G1PApDioLX
	hEG3XSk4SqNUjtZ944XnpcMYEG5lEcv+xVY2eHOnvfFi17V8Pp4b2MV/FQly6z6ZJqBw
	ic0yTFG6b5xf7baw0qn7f46/00Y1uS6MSZpe3M8A20k77/YMTlsVMZN7cDdvGEnxJHgn
	HVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ubFdSRLg1iTO0Cz3wXr91/W80eRIbbrZTOa/AufebtQ=;
	b=cZO0hpwvkJLYZKAWrbmyUT+s6ncLhl1PRysBWF8bsPiU9Y4zUeOmicSDiRG/Uj9Jal
	3C74O9FvDFrDQzkH54v0mPuvxr+6qiYTVIthdVELeqiWpMk9JsUo1yOsV5mzgm6J8R2t
	n9154BkB9fsgptcFLBSQF/B2H2JbjUWeO3YpP4rUh76Lq4HypJ9DI42PRx33gG+1eMg6
	OfMy3S65cWU5/qTvcg5pTAdFszqzIS1Iqf8GhG8QCXyzMncuUbfOmEFLiad7VE0fmXQR
	xMp5PZNFZR5yz/GPxNy/bM1Y3OFDHMDXpHNd3SuO4KkKYJPk1u5r0veT6SDMD0vbv3T2
	nmCg==
X-Gm-Message-State: APzg51A/PA1CHDwJ767ZdsaJYv0g3MVdmQq/XuJLjBea99KJP8Jj7Nm2
	QSijoU4Acwv8sdBnZMvYdFf2qWPHbo9g4M9Xhro=
X-Google-Smtp-Source: ANB0VdYrEQnAaWxRpSdOjlJbwklG+NGcHpnKNF3LRjy286wihfdsdoho8JNI0+7QSBp4zD8mKvKlot+F7G0I0Tm9qpA=
X-Received: by 2002:a54:4d9d:: with SMTP id y29-v6mr55954oix.273.1535399168557;
	Mon, 27 Aug 2018 12:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <1534553964-16157-1-git-send-email-ankur.tyagi85@gmail.com>
	<1534553964-16157-2-git-send-email-ankur.tyagi85@gmail.com>
	<CAMKF1spvcJfbdET14z+cjR9P-rCyWtXnb87G9wg=GC3zxDbiYg@mail.gmail.com>
In-Reply-To: <CAMKF1spvcJfbdET14z+cjR9P-rCyWtXnb87G9wg=GC3zxDbiYg@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 28 Aug 2018 07:45:59 +1200
Message-ID: <CADySD0E8tuTywaRGN_-Nqe7OTFGxLmwZzc-J0gtWz2+53QUu5w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][sumo][master][PATCH 2/2] base-files: respect PERSISTENT_LOG_DIR
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
X-List-Received-Date: Mon, 27 Aug 2018 19:46:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 25, 2018 at 12:17 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Aug 17, 2018 at 6:00 PM Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> >
> > Respect PERSISTENT_LOG_DIR variable. In this way, if the user overrides
> > this variable to be e.g "/home/root/log", /var/log on the final image would
> > be a link pointing to /home/root/log on persistent storage.
> >
>
> I would suggest to stick with VOLATILE_BINDS

But this won't help with VOLATILE_LOG_DIR set as "no".
I think it is a common requirement to have persistent logging mounted
in a separate partition.
This patch makes it easy (hopefully) for the user to achieve the above
without any additional recipe.

>
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  meta/recipes-core/base-files/base-files_3.0.14.bb | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
> > index 1c0863b..597fdaa 100644
> > --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> > +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> > @@ -42,7 +42,7 @@ dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
> >             ${localstatedir}/backups ${localstatedir}/lib \
> >             /sys ${localstatedir}/lib/misc ${localstatedir}/spool \
> >             ${localstatedir}/volatile \
> > -           ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''}log \
> > +           ${@'${localstatedir}/volatile/log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else '${PERSISTENT_LOG_DIR}' if d.getVar('PERSISTENT_LOG_DIR') else '${localstatedir}/log' } \
> >             /home ${prefix}/src ${localstatedir}/local \
> >             /media"
> >
> > @@ -106,6 +106,10 @@ do_install () {
> >                 ln -sf volatile/$d ${D}${localstatedir}/$d
> >         done
> >
> > +       if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = False -a ! -z ${PERSISTENT_LOG_DIR} ]; then
> > +               ln -sf ${PERSISTENT_LOG_DIR} ${D}/${localstatedir}/log
> > +       fi
> > +
> >         ln -snf ../run ${D}${localstatedir}/run
> >         ln -snf ../run/lock ${D}${localstatedir}/lock
> >
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

