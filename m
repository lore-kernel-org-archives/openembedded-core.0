Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 08AE07937D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 08:42:28 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id k81-v6so7939904oib.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 01:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+6RIXWbVlYi7YKWiqM1wHXiLOnG6djZ5MEuuPE6Mtzk=;
	b=VNqmsw1+PqwoNsUHEgdHpkY6QPb8IEIzz4Q3UUvfzT9k6r+RoAI+gaJwDSNiwevuTJ
	AXxQh7xUiSswcH9nsc/TWcyJGjTVTaQSiNYt+ZYbl8wlT2VTQxD092hrwow1V53w/uAG
	pJe99MXUAm6HkgdOnhVXNoBwGnOxxvjTAvZvIAlM+qw2zvnxrdHqvpVKjX6+ZYzPrznG
	cMyNve3Q06pWn7BiL9TUPNvOyRg9RA3WbHNgIPzNr8CfhD3YPzoOucuYtKkwVcrvW4rq
	9NJR/w9Zz3QkzMLEnk54kCNmBNofK8o5ukAApRzJr0Y2ihLFa1ykJoEDFKOKVaifN/Am
	8qOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+6RIXWbVlYi7YKWiqM1wHXiLOnG6djZ5MEuuPE6Mtzk=;
	b=HVTtWON/K7m2/piOhl9LTaQ1QRMEp8RfzT25VBuoeDvGn5oSIDvyz1WT56M4CYMGqA
	xQXwy9zvKzYdUWEtmvK0G8cE1V7w2bF81zh+w6kd4+edUZ+2u6pMI3RDyJVegbonUEg3
	rNXVqgyMeJfWsBp3w8rADslJTsKLfhC6G65qB+bJDK/W+R1I+C+n9G2sHB+QsBxexMzS
	T2EVX9buKDj8HvjTqkb1F5YJ3ImX+kn7ebjvn6Er2Z3yLt/k06w0NkStGYUK0e3y7w1c
	S8vSiKm/bfuTcbakmjyNS95zQzeo7Dlj2VeXE80OXWv+XCv+j6qqISYiSRd5ct71hymk
	Jtdw==
X-Gm-Message-State: APzg51Ah/DcYKKNQooOG9LhqU2ypZZJqfta/xKKx4cq2Dk7weQjEurlu
	Ezb/F/9cOXj6P8h/ZRoAFGmnhPFxHRaoI+lLK2Y=
X-Google-Smtp-Source: ANB0VdYgh6zPcRE0y4MWfN/irvq1zW9yBlRO6bctihqVWLh1eJs5EJBIeZu5pMrDlYTDrGljsudD0VCtr4Nm0wbUIXA=
X-Received: by 2002:aca:3e56:: with SMTP id
	l83-v6mr1415255oia.170.1535618549910; 
	Thu, 30 Aug 2018 01:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <1534553964-16157-1-git-send-email-ankur.tyagi85@gmail.com>
	<1534553964-16157-2-git-send-email-ankur.tyagi85@gmail.com>
	<CAMKF1spvcJfbdET14z+cjR9P-rCyWtXnb87G9wg=GC3zxDbiYg@mail.gmail.com>
	<CADySD0E8tuTywaRGN_-Nqe7OTFGxLmwZzc-J0gtWz2+53QUu5w@mail.gmail.com>
	<CADySD0EdZByuMw3bN_oQ8uwzMPMM+rf5effef8bqA0OkZKzfPQ@mail.gmail.com>
	<CAMKF1sorN3Tmn6dAzNKu0oGrYgPWc_VSHdnY00nUnMPoQ7fncg@mail.gmail.com>
In-Reply-To: <CAMKF1sorN3Tmn6dAzNKu0oGrYgPWc_VSHdnY00nUnMPoQ7fncg@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 30 Aug 2018 20:42:22 +1200
Message-ID: <CADySD0GgcgW3fEz+9C9VnNGxLY-MMv9fiY58CJkrOfhp3m_7Uw@mail.gmail.com>
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
X-List-Received-Date: Thu, 30 Aug 2018 08:42:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 30, 2018 at 8:38 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Aug 30, 2018 at 1:34 AM Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> >
> > Hi Khem,
> >
> > Is this patch being accepted ?
> >
>
> I am not convinced if we need this patch as we can do this using volatile binds.
> or base-files changes if needed.
>

How volatile binds will help with VOLATILE_LOG_DIR set as "no" ?
This patch is modifying base-files so that users can simply set a
variable in conf file instead of modifying base-files.

> > regards
> > Ankur
> >
> > On Tue, Aug 28, 2018 at 7:45 AM Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> > >
> > > On Sat, Aug 25, 2018 at 12:17 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Fri, Aug 17, 2018 at 6:00 PM Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> > > > >
> > > > > Respect PERSISTENT_LOG_DIR variable. In this way, if the user overrides
> > > > > this variable to be e.g "/home/root/log", /var/log on the final image would
> > > > > be a link pointing to /home/root/log on persistent storage.
> > > > >
> > > >
> > > > I would suggest to stick with VOLATILE_BINDS
> > >
> > > But this won't help with VOLATILE_LOG_DIR set as "no".
> > > I think it is a common requirement to have persistent logging mounted
> > > in a separate partition.
> > > This patch makes it easy (hopefully) for the user to achieve the above
> > > without any additional recipe.
> > >
> > > >
> > > > > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > > > > ---
> > > > >  meta/recipes-core/base-files/base-files_3.0.14.bb | 6 +++++-
> > > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
> > > > > index 1c0863b..597fdaa 100644
> > > > > --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> > > > > +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> > > > > @@ -42,7 +42,7 @@ dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
> > > > >             ${localstatedir}/backups ${localstatedir}/lib \
> > > > >             /sys ${localstatedir}/lib/misc ${localstatedir}/spool \
> > > > >             ${localstatedir}/volatile \
> > > > > -           ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''}log \
> > > > > +           ${@'${localstatedir}/volatile/log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else '${PERSISTENT_LOG_DIR}' if d.getVar('PERSISTENT_LOG_DIR') else '${localstatedir}/log' } \
> > > > >             /home ${prefix}/src ${localstatedir}/local \
> > > > >             /media"
> > > > >
> > > > > @@ -106,6 +106,10 @@ do_install () {
> > > > >                 ln -sf volatile/$d ${D}${localstatedir}/$d
> > > > >         done
> > > > >
> > > > > +       if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = False -a ! -z ${PERSISTENT_LOG_DIR} ]; then
> > > > > +               ln -sf ${PERSISTENT_LOG_DIR} ${D}/${localstatedir}/log
> > > > > +       fi
> > > > > +
> > > > >         ln -snf ../run ${D}${localstatedir}/run
> > > > >         ln -snf ../run/lock ${D}${localstatedir}/lock
> > > > >
> > > > > --
> > > > > 2.7.4
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-core mailing list
> > > > > Openembedded-core@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

