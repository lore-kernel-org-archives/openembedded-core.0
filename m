Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.137.1589225061194767805
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 12:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hVni3LR1;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id h17so3542102wrc.8
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 12:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dpihJ4pBB/2cJ8Yhwgg9FztFFXoZ8e4j23QU35eJoJE=;
        b=hVni3LR1ssMzYYMXNUoXPmDLpRhiyrSFMOmz5ZusdJoRMGHgj2tRrN80e7KWEmJt99
         /Nb3KhxqHNB0H/fdmqYp1wHmD2l+Eg0VNliqIsmK58R94VdQ/DnbKHrBwkFrEJp8oHOH
         zatVyodwEznLXgZYhX8zbQ6w+Mer870wENVDfyBBg6FllQgJG27m8HOcOl5IICvPETgB
         qbUGVp4qle/8Jc9w0MQ1klbjQTaJR/kzUBVbcRayRPH0Ht2iRuk//0H+1D8QxinWzQm4
         kyd6WJsjLaQvFHp453GDWHK1lGWJLTZMoDpiv2oP3E+66IhhILfpkwQbqzRlkuoHyhzt
         ZzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dpihJ4pBB/2cJ8Yhwgg9FztFFXoZ8e4j23QU35eJoJE=;
        b=nJz0NMOStgjxi/AMRbSSlGzW2ABrVvCJQfKCbga85ktl2HwaeNn4K/4SLJ4Y/M2tuv
         X7qGRlyv4HYsvp+3I+OKTKnXEPT3vgjTIWmi7dHk0D7J1vdf54Xx4/Iaa/TAfc5iLLMh
         2JaJYhqb793JMhr1qjSMKug7gcNpvfwPTAT05JCgpfUk7wE9ITHzuRKLD+mN9rEEh2tI
         SJKkjsXolhx/pbMZgLPrNy35CnSH/OJYBXuYndRbHww8HCDMWRifV7xZRBr1gthwCF+e
         gn3S84NSrS89otfOOmYj50DpQeLRuEzPvA/br7JN9WqYZorO7W7QtnSpNKkYH750H+ib
         mw2g==
X-Gm-Message-State: AGi0PubZVj+5P1Y1BAog6Hwg5JKjdC0fd39PmllJyRbH0CRLtAienEbW
	C72SL+xdXvUcH7ti6qu49KH8hdWFoRyGhDpDOHM=
X-Google-Smtp-Source: APiQypIAZDjP+Up83zPFLg42oul4pxTBnOLUkmNeBezm85K0EAYF4XCC6ThFMRKVl26UE3CzacqRtSYfz3uAVYibzLY=
X-Received: by 2002:a5d:5445:: with SMTP id w5mr20236246wrv.422.1589225059715;
 Mon, 11 May 2020 12:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200504162043.1137-1-pkj@axis.com> <CAGDS+nmJAJ4cU_P4YgyHpkj4sXsfwzudJQWxHqpHk0CO1B_zfA@mail.gmail.com>
 <341d7c4755da4be0b8b7bb6212f3a790@XBOX03.axis.com>
In-Reply-To: <341d7c4755da4be0b8b7bb6212f3a790@XBOX03.axis.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Mon, 11 May 2020 09:24:07 -1000
Message-ID: <CAGDS+nm+spMQ19nPN_6jG4q0WQpYqrg+TSzC5tUHUE3moV1p0g@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2] libdnf: Use single-quotes around string literals used in SQL statements
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 11, 2020 at 9:02 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> Yes, I believe it is. If you cherry-pick it from master, then you should
> change the Upstream-Status as per below to Accepted.

I just noticed the version of libdnf on the patch!  Dunfell is still
at 0.28.1 and I'm not going to do a version bump to 0.47.0 without a
really good reason.

Sorry I didn't notice that on my first review.

Steve

> > -----Original Message-----
> > From: Steve Sakoman <sakoman@gmail.com>
> > Sent: den 11 maj 2020 16:21
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: Patches and discussions about the oe-core layer <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: [OE-core] [meta-oe][PATCH v2] libdnf: Use single-quotes
> > around string literals used in SQL statements
> >
> > Hi Peter,
> >
> > Is this patch suitable for inclusion in dunfell lts?
> >
> > Thanks,
> >
> > Steve
> >
> > On Mon, May 4, 2020 at 6:20 AM Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> > >
> > > If sqlite is built with -DSQLITE_DQS=0 in accordance with
> > > https://sqlite.org/quirks.html#dblquote, migration to version 1.2 of
> > the
> > > history database would fail with:
> > >
> > >   History database cannot be created: .../var/lib/dnf/history.sqlite.
> > >   Error: SQLite error on ":memory:": Executing an SQL statement failed:
> > >   no such column: 1.2
> > >
> > > Signed-off-by: Peter Kjellerstedt <pkj@axis.com>
> > > ---
> > >
> > > PATCH v2: Updated the Upstream-Status to Accepted.
> > >
> > >  ...s-around-string-literals-used-in-SQL.patch | 36 +++++++++++++++++++
> > >  meta/recipes-devtools/libdnf/libdnf_0.47.0.bb |  1 +
> > >  2 files changed, 37 insertions(+)
> > >  create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Use-
> > single-quotes-around-string-literals-used-in-SQL.patch
> > >
> > > diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Use-single-
> > quotes-around-string-literals-used-in-SQL.patch b/meta/recipes-
> > devtools/libdnf/libdnf/0001-Use-single-quotes-around-string-literals-
> > used-in-SQL.patch
> > > new file mode 100644
> > > index 0000000000..293bdcdd24
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/libdnf/libdnf/0001-Use-single-quotes-
> > around-string-literals-used-in-SQL.patch
> > > @@ -0,0 +1,36 @@
> > > +From 96ca7d0049461df2293dd0000edcbc69b64255e0 Mon Sep 17 00:00:00 2001
> > > +From: Peter Kjellerstedt <pkj@axis.com>
> > > +Date: Sun, 3 May 2020 22:40:39 +0200
> > > +Subject: [PATCH] Use single-quotes around string literals used in SQL
> > > + statements
> > > +
> > > +If sqlite is built with -DSQLITE_DQS=0 in accordance with
> > > +https://sqlite.org/quirks.html#dblquote, migration to version 1.2 of
> > the
> > > +history database would fail with:
> > > +
> > > +  History database cannot be created: /var/lib/dnf/history.sqlite.
> > > +  Error: SQLite error on ":memory:": Executing an SQL statement
> > failed:
> > > +  no such column: 1.2
> > > +
> > > +Upstream-Status: Accepted [https://github.com/rpm-software-
> > management/libdnf/pull/951]
> > > +Signed-off-by: Peter Kjellerstedt <pkj@axis.com>
> > > +---
> > > + libdnf/transaction/sql/migrate_tables_1_2.sql | 4 ++--
> > > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > > +
> > > +diff --git a/libdnf/transaction/sql/migrate_tables_1_2.sql
> > b/libdnf/transaction/sql/migrate_tables_1_2.sql
> > > +index 49b75315..f80ad1c4 100644
> > > +--- a/libdnf/transaction/sql/migrate_tables_1_2.sql
> > > ++++ b/libdnf/transaction/sql/migrate_tables_1_2.sql
> > > +@@ -1,9 +1,9 @@
> > > + R"**(
> > > + BEGIN TRANSACTION;
> > > +     ALTER TABLE trans
> > > +-        ADD comment TEXT DEFAULT "";
> > > ++        ADD comment TEXT DEFAULT '';
> > > +     UPDATE config
> > > +-        SET value = "1.2"
> > > ++        SET value = '1.2'
> > > +         WHERE key = 'version';
> > > + COMMIT;
> > > + )**"
> > > diff --git a/meta/recipes-devtools/libdnf/libdnf_0.47.0.bb
> > b/meta/recipes-devtools/libdnf/libdnf_0.47.0.bb
> > > index 1b4b7e4233..1b06d66b19 100644
> > > --- a/meta/recipes-devtools/libdnf/libdnf_0.47.0.bb
> > > +++ b/meta/recipes-devtools/libdnf/libdnf_0.47.0.bb
> > > @@ -8,6 +8,7 @@ SRC_URI = "git://github.com/rpm-software-
> > management/libdnf;branch=dnf-4-master \
> > >             file://0001-Get-parameters-for-both-libsolv-and-libsolvext-
> > libdn.patch \
> > >             file://0001-Add-WITH_TESTS-option.patch \
> > >             file://0001-Look-fo-sphinx-only-if-documentation-is-
> > actually-ena.patch \
> > > +           file://0001-Use-single-quotes-around-string-literals-used-
> > in-SQL.patch \
> > >             "
> > >
> > >  SRCREV = "8330eea6985c4e4b53796f858de5b6b38b1ddf5c"
> > > --
> > > 2.21.1
> > >
> > > 
