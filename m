Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 254C9607DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 08:34:56 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id c190-v6so14026225oig.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 01:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=c3EA8GZikbhvNYFQPqwgFat/zQ5WkyM+v5x78emoJrA=;
	b=Q3PGxhmIL0HIE6a/+DuI4RBmMWoUMcHOrLkGbeL8aAZO+ggc7CfQcLKYE1aSk7HvBe
	O443wgFSAUXPDJw21RBUKFCMMXbrtdZbawBTj7PkRbvy/15usayAZPYQUcynu8yX53SK
	cugw1er7TDIGxyONmUCokm+tGh1Om0cy5phHWxggW/NTqAkQZOn640hBrvt/Mo72tIXh
	npQ1duC9LnZQtC1zLZxkUj+jInsfzrztxw+1e55DpNjLFztEz4N38jXDHVqfar18S1GT
	mlQxpoBg+jzLTg3cI/mkmz/tpI7Wl2bvXaBvAxurqRp2cXUEzDbJmZ0E1GMUacEfNbW8
	zkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=c3EA8GZikbhvNYFQPqwgFat/zQ5WkyM+v5x78emoJrA=;
	b=fcq05Z11PNCvyGtHjb/NuLtyNuNI6OAdgT0AlUXSeinQFWIXKj6cFa/bE2gQY438/5
	TSdvalFsbEXIfPRtHdjUgoneqSxrgOg1ieVvfDGLIFvsXzxH+xBiYcK154RmyfVf6nYF
	VohvbnkeNFOARiTrdtsfwGPJLGXk/V+mfvZBWPuGfTFGm+KuvM31XumSdfRg5V29P/ZL
	q0tHOOKQ43+kPbvczpCMgYIW2gKnP5nvT92V4aH8/d7r7TDvugtTxH2OlOno+u/FYd6Q
	PKekUHnFjF/FLZhrFPg0gqpRY1+WSXd1PTRAqQXeoEHvvxwU37AgagOmNnf+bn6io17Y
	FmQQ==
X-Gm-Message-State: APzg51AjK2rhlHIoF/Nq0NvYDIQHrQgOXFEQdBm7Ug4lHTOloz1JFtxK
	6f8t9Gb6krnhZ8IU5bmZ1uLvSFY08m4WoocNdnE=
X-Google-Smtp-Source: ANB0Vdb+w9tCtN7E9nr3hEA/NktSIriiYtFz7ngA3fTZ3Alc9dwNxgRlaYyPdUV+oAjdMZM8jTzn99wUC2miBAHLh/s=
X-Received: by 2002:aca:d7c1:: with SMTP id
	o184-v6mr1548265oig.347.1535618097968; 
	Thu, 30 Aug 2018 01:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <1534553964-16157-1-git-send-email-ankur.tyagi85@gmail.com>
	<1534553964-16157-2-git-send-email-ankur.tyagi85@gmail.com>
	<CAMKF1spvcJfbdET14z+cjR9P-rCyWtXnb87G9wg=GC3zxDbiYg@mail.gmail.com>
	<CADySD0E8tuTywaRGN_-Nqe7OTFGxLmwZzc-J0gtWz2+53QUu5w@mail.gmail.com>
In-Reply-To: <CADySD0E8tuTywaRGN_-Nqe7OTFGxLmwZzc-J0gtWz2+53QUu5w@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 30 Aug 2018 20:34:51 +1200
Message-ID: <CADySD0EdZByuMw3bN_oQ8uwzMPMM+rf5effef8bqA0OkZKzfPQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 30 Aug 2018 08:34:57 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

Is this patch being accepted ?

regards
Ankur

On Tue, Aug 28, 2018 at 7:45 AM Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
>
> On Sat, Aug 25, 2018 at 12:17 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Fri, Aug 17, 2018 at 6:00 PM Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> > >
> > > Respect PERSISTENT_LOG_DIR variable. In this way, if the user overrides
> > > this variable to be e.g "/home/root/log", /var/log on the final image would
> > > be a link pointing to /home/root/log on persistent storage.
> > >
> >
> > I would suggest to stick with VOLATILE_BINDS
>
> But this won't help with VOLATILE_LOG_DIR set as "no".
> I think it is a common requirement to have persistent logging mounted
> in a separate partition.
> This patch makes it easy (hopefully) for the user to achieve the above
> without any additional recipe.
>
> >
> > > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > > ---
> > >  meta/recipes-core/base-files/base-files_3.0.14.bb | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
> > > index 1c0863b..597fdaa 100644
> > > --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> > > +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> > > @@ -42,7 +42,7 @@ dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
> > >             ${localstatedir}/backups ${localstatedir}/lib \
> > >             /sys ${localstatedir}/lib/misc ${localstatedir}/spool \
> > >             ${localstatedir}/volatile \
> > > -           ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''}log \
> > > +           ${@'${localstatedir}/volatile/log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else '${PERSISTENT_LOG_DIR}' if d.getVar('PERSISTENT_LOG_DIR') else '${localstatedir}/log' } \
> > >             /home ${prefix}/src ${localstatedir}/local \
> > >             /media"
> > >
> > > @@ -106,6 +106,10 @@ do_install () {
> > >                 ln -sf volatile/$d ${D}${localstatedir}/$d
> > >         done
> > >
> > > +       if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = False -a ! -z ${PERSISTENT_LOG_DIR} ]; then
> > > +               ln -sf ${PERSISTENT_LOG_DIR} ${D}/${localstatedir}/log
> > > +       fi
> > > +
> > >         ln -snf ../run ${D}${localstatedir}/run
> > >         ln -snf ../run/lock ${D}${localstatedir}/lock
> > >
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

