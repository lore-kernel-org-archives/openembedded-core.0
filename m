Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD8479343
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 08:38:29 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id 93-v6so5220980qks.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 01:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Cibg2Z5o5dg86+PVY8fsQxDcYIases9S3ZDdii7EnMs=;
	b=nKyIZBuQ8bpq/ebEqWgNKK4KOqntuYZzRT4PYPnzfAtZI0cZXPG3k1D+ljICfkFZpq
	gpkNmcVakhgD2Tg3yfp/OOknAzpFUqJp/4vU7vgduMfuxXpWUuq9pqSq7rJMIcat7bMx
	uwNzA5srdXjpCBDBs7HW/7Q2jnSyDXyIswzX0EXLkwyJt7/GiBNPjgO3q74AA5IQLqFK
	DdEJY5BmS8nznPvJS9raEKqPENWYzL0InLXe6OsGXyJBn5J8JL2G/fEo8zjYPT3NbZlw
	9hwjCM5dOhDWkQvjspNDi87zABbaqqdltleszqyVOAmeI0PyueTkFUJ8OIIjIjU4Z2sL
	fuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Cibg2Z5o5dg86+PVY8fsQxDcYIases9S3ZDdii7EnMs=;
	b=MAysaemCGFT69NHSl+3Ql+hvBWhVLufwwi6oboSHL+GAaQr1lDO3VumDk999F62Atc
	Z/511Vk1BCS+wrpw7WT9mWhKufKb+3PjqfAwdj91RRwxFVknrdHHYLcquGh3vuDWIQAx
	SQGKKhokjpfKh1EjIc3Gruh7PdI+TCn4epCXey51g337eQeP/btTMlVQ8JDCXRExGMUZ
	WGv/kKnqd78/eKxMBs+a7JmV0EeP9UESUN5MGtcoEbJ8FQRGTE6W3iwuZDU/BG2xnhB4
	Uu0yqFyLd4GT/45qUW95gWz4e3WTv63nxFsVjxLoVKuCKiSBo6Ig0ylPB9ZEvfZXbT4W
	LnDw==
X-Gm-Message-State: APzg51CW45d1FzckNlapsyRZAi41tJG9oxJWmrSsTlc6uSfFYV1mu18u
	b8scE1lLASAPhaL5tfjNvzWBvOqsL32YOSv+h7k=
X-Google-Smtp-Source: ANB0VdbgIMptIaz32cIsW917RJLFDfd3lx+z/qKP9FambsF8Bl++u5NmzqsLxWD8kca0T3alpLfloYqhmvofJ8iAZks=
X-Received: by 2002:a37:c04f:: with SMTP id
	o76-v6mr10187100qki.315.1535618310750; 
	Thu, 30 Aug 2018 01:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <1534553964-16157-1-git-send-email-ankur.tyagi85@gmail.com>
	<1534553964-16157-2-git-send-email-ankur.tyagi85@gmail.com>
	<CAMKF1spvcJfbdET14z+cjR9P-rCyWtXnb87G9wg=GC3zxDbiYg@mail.gmail.com>
	<CADySD0E8tuTywaRGN_-Nqe7OTFGxLmwZzc-J0gtWz2+53QUu5w@mail.gmail.com>
	<CADySD0EdZByuMw3bN_oQ8uwzMPMM+rf5effef8bqA0OkZKzfPQ@mail.gmail.com>
In-Reply-To: <CADySD0EdZByuMw3bN_oQ8uwzMPMM+rf5effef8bqA0OkZKzfPQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Aug 2018 01:38:04 -0700
Message-ID: <CAMKF1sorN3Tmn6dAzNKu0oGrYgPWc_VSHdnY00nUnMPoQ7fncg@mail.gmail.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 30 Aug 2018 08:38:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 30, 2018 at 1:34 AM Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
>
> Hi Khem,
>
> Is this patch being accepted ?
>

I am not convinced if we need this patch as we can do this using volatile binds.
or base-files changes if needed.

> regards
> Ankur
>
> On Tue, Aug 28, 2018 at 7:45 AM Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> >
> > On Sat, Aug 25, 2018 at 12:17 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Fri, Aug 17, 2018 at 6:00 PM Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> > > >
> > > > Respect PERSISTENT_LOG_DIR variable. In this way, if the user overrides
> > > > this variable to be e.g "/home/root/log", /var/log on the final image would
> > > > be a link pointing to /home/root/log on persistent storage.
> > > >
> > >
> > > I would suggest to stick with VOLATILE_BINDS
> >
> > But this won't help with VOLATILE_LOG_DIR set as "no".
> > I think it is a common requirement to have persistent logging mounted
> > in a separate partition.
> > This patch makes it easy (hopefully) for the user to achieve the above
> > without any additional recipe.
> >
> > >
> > > > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > > > ---
> > > >  meta/recipes-core/base-files/base-files_3.0.14.bb | 6 +++++-
> > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
> > > > index 1c0863b..597fdaa 100644
> > > > --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> > > > +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> > > > @@ -42,7 +42,7 @@ dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
> > > >             ${localstatedir}/backups ${localstatedir}/lib \
> > > >             /sys ${localstatedir}/lib/misc ${localstatedir}/spool \
> > > >             ${localstatedir}/volatile \
> > > > -           ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''}log \
> > > > +           ${@'${localstatedir}/volatile/log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else '${PERSISTENT_LOG_DIR}' if d.getVar('PERSISTENT_LOG_DIR') else '${localstatedir}/log' } \
> > > >             /home ${prefix}/src ${localstatedir}/local \
> > > >             /media"
> > > >
> > > > @@ -106,6 +106,10 @@ do_install () {
> > > >                 ln -sf volatile/$d ${D}${localstatedir}/$d
> > > >         done
> > > >
> > > > +       if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = False -a ! -z ${PERSISTENT_LOG_DIR} ]; then
> > > > +               ln -sf ${PERSISTENT_LOG_DIR} ${D}/${localstatedir}/log
> > > > +       fi
> > > > +
> > > >         ln -snf ../run ${D}${localstatedir}/run
> > > >         ln -snf ../run/lock ${D}${localstatedir}/lock
> > > >
> > > > --
> > > > 2.7.4
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

